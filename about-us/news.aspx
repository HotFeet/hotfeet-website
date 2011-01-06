<%@ Page masterPageFile="~/global.master" %>
<%@ OutputCache duration="3600" varyByParam="year" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<script runat="server">
static readonly int[][] navOptions = new int[][] {
	new int[] {}, // current news
	new int[] {2009, 2005},
	new int[] {2004, 1998}
};

int yearStart, yearEnd;

void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		List<NewsItem> news = App.DB.News;
		if(news.Count == 0)
			return;
	
		YearNav.DataSource = navOptions;
		YearNav.DataBind();
	
		if(String.IsNullOrEmpty(Request["year"])) {
			// take the year of the last news item
			yearStart = yearEnd = news[news.Count - 1].Date.Year;
		} else {
			if(Request["year"].IndexOf('-') == -1) {
				yearStart = yearEnd = int.Parse(Request["year"]);
			} else {
				string[] fromUntil = Request["year"].Split('-');
				yearEnd = int.Parse(fromUntil[0]);
				yearStart = int.Parse(fromUntil[1]);			
			}
			string yearRange = String.Format(" ({0})", Request["year"]);
			PageTitle.InnerText += yearRange;
			RefTitle.InnerText += yearRange;
		}
	
		var list = news.FindAll(ni => (yearStart <= ni.Date.Year && ni.Date.Year <= yearEnd));
		list.Reverse();
		NewsList.DataSource = list;
		NewsList.DataBind();

		var refList = new List<Reference>();
		foreach(var rc in App.DB.ReferenceCategories)
			refList.AddRange(rc.References.FindAll(r => !r.Hidden && yearStart <= r.WentLiveOn.Year && r.WentLiveOn.Year <= yearEnd));
		refList.Sort((r1, r2) => DateTime.Compare(r1.WentLiveOn, r2.WentLiveOn));
		refList.Reverse();
		if(refList.Count > 2) {
			References.DataSource = refList;
			References.DataBind();
		} else
			NewReferences.Visible = false; 
	}
}

void BindYearNavItem(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;

	HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("Link");
	int[] yearRange = (int[])e.Item.DataItem;

	if(yearRange.Length == 0) {
		if(String.IsNullOrEmpty(Request["year"]))
			link.Attributes["class"] += " selected";
		return;
	}

	string text = (yearRange.Length == 1 ?
		yearRange[0].ToString() :
		String.Format("{0}-{1}", yearRange[0], yearRange[1])
	);
	link.InnerText = text;
	link.HRef += "?year=" + text;
	if(Request["year"] == text)
		link.Attributes["class"] += " selected";
}

void BindNewsItem(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;

	NewsItem ni = (NewsItem)e.Item.DataItem;
	HtmlGenericControl ctrl = (HtmlGenericControl)e.Item.FindControl("Date");
	ctrl.InnerText = FormatDate(ni.Date);
	ctrl = (HtmlGenericControl)e.Item.FindControl("Title");
	ctrl.InnerText = ni.Title;

	if(!String.IsNullOrEmpty(ni.Text) && !ni.Tags.Contains("Website")) {
		ctrl = (HtmlGenericControl)e.Item.FindControl("Text");
		ctrl.InnerHtml = ni.Text.Replace("\n", "<br />");
		ctrl.Visible = true;
	}
}

static readonly string dateFormatNoYear = "d. MMMM";
static readonly string dateFormat = "d. MMMM yyyy";
static readonly CultureInfo de_CH = CultureInfo.GetCultureInfo("de-CH");

static string FormatDate(DateTime date) {
	string format = (date.Year == DateTime.Today.Year ? dateFormatNoYear : dateFormat);
	return date.ToString(format, de_CH);
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 id="PageTitle" runat="server">News</h1>
	<asp:Repeater id="NewsList" onItemDataBound="BindNewsItem" runat="server">
		<HeaderTemplate><ul class="news-list"></HeaderTemplate>
		<FooterTemplate></ul></FooterTemplate>
		<ItemTemplate>
			<li>
				<h3>
					<span id="Date" class="date" runat="server" />
					<span id="Title" class="title" runat="server" />
				</h3>
				<p id="Text" visible="false" runat="server" />
			</li>
		</ItemTemplate>
	</asp:Repeater>
	<script type="text/javascript">
		$(document).ready(function() {
			$("ul.news-list h3").backgroundBorder();
		});
	</script>
</asp:Content>
<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<ul class="links">
			<asp:Repeater id="YearNav" onItemDataBound="BindYearNavItem" runat="server">
				<ItemTemplate>
					<li><a id="Link" href="news.aspx" runat="server">Aktuelle News</a></li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>

	<div id="NewReferences" class="sidebox" runat="server">
		<h2 id="RefTitle" runat="server">Neue Referenzen</h2>
		<hf:ReferencesSlideshow id="References" random="false" runat="server" />
	</div>
</asp:Content>