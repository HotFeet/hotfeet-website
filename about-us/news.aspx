<%@ Page masterPageFile="~/global.master" %>
<%@ OutputCache duration="3600" varyByParam="year" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<script runat="server">
static readonly int[][] navOptions = new int[][] {
	new int[] {}, // current news
	new int[] {2010, 2005},
	new int[] {2004, 1998}
};

DateTime start, end;

void Page_Load(object o, EventArgs e) {
	List<NewsItem> news = App.DB.News;
	if(news.Count == 0)
		return;

	YearNav.DataSource = navOptions;
	YearNav.DataBind();

	bool curNews = String.IsNullOrEmpty(Request["year"]);
	if(curNews) {
		// last four months
		end = DateTime.Today;
		start = end.AddMonths(-4);
	} else {
		int yearStart;
		int yearEnd;
		if(Request["year"].IndexOf('-') == -1) {
			// single year
			yearStart = yearEnd = int.Parse(Request["year"]);
		} else {
			// year range
			string[] fromUntil = Request["year"].Split('-');
			yearStart = int.Parse(fromUntil[0]);
			yearEnd = int.Parse(fromUntil[1]);
			if(yearStart > yearEnd) {
				int tmp = yearStart;
				yearStart = yearEnd;
				yearEnd = tmp;
			}
		}
		start = new DateTime(yearStart, 1, 1);
		end = new DateTime(yearEnd, 12, 31);

		string yearRange = String.Format(" ({0})", Request["year"]);
		PageTitle.InnerText += yearRange;
		RefTitle.InnerText += yearRange;			
	}

	var list = news.FindAll(ni => (start <= ni.Date && ni.Date <= end));
	list.Reverse();
	NewsList.DataSource = list;
	NewsList.DataBind();

	var refs = GetReferences(start, end, (curNews ? (int?)4 : null));

	if(refs.Count > 2) {
		References.DataSource = refs;
		References.DataBind();
	} else
		NewReferences.Visible = false; 
}

List<Reference> GetReferences(DateTime start, DateTime end, int? minCount) {
	var openList = new List<Reference>();
	// collect all visible references up until 'end' 
	foreach(var rc in App.DB.ReferenceCategories)
		openList.AddRange(rc.References.FindAll(r => !r.Hidden && r.WentLiveOn.Date <= end));

	openList.Sort((r1, r2) => DateTime.Compare(r1.WentLiveOn, r2.WentLiveOn));
	openList.Reverse();

	var closedList = openList.FindAll(r => start <= r.WentLiveOn.Date);

	// make sure we have at least minCount refs
	if(minCount.HasValue && closedList.Count < minCount.Value && openList.Count >= minCount.Value)
		return openList.GetRange(0, minCount.Value);
	
	return closedList;
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
