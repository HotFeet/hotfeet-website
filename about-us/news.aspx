<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
static readonly int[][] navOptions = new int[][] {
	new int[] {}, // current news
	new int[] {2005, 2009},
	new int[] {1998, 2004}
};

int yearStart, yearEnd;

void Page_Load(object o, EventArgs e) {
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
			yearStart = int.Parse(fromUntil[0]);
			yearEnd = int.Parse(fromUntil[1]);			
		}
		PageTitle.InnerText += String.Format(" ({0})", Request["year"]);
	}

	var list = news.FindAll(ni => (yearStart <= ni.Date.Year && ni.Date.Year <= yearEnd));
	list.Reverse();
	NewsList.DataSource = list;
	NewsList.DataBind();
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
		<ItemTemplate>
			<h3><%# FormatDate((DateTime)Eval("Date")) %> - <%# Eval("Title") %></h3>
			<p>
				<%# Eval("Text") %>
			</p>
			<br />
		</ItemTemplate>
	</asp:Repeater>
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
</asp:Content>