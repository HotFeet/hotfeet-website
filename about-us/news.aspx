<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
int yearStart, yearEnd;

void Page_Load(object o, EventArgs e) {
	List<NewsItem> news = App.DB.News;
	if(news.Count == 0)
		return; 

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
		<h2>Archiv</h2>
		<ul class="links">
			<li><a href="?year=2005-2009">2005-2009</a></li>
			<li><a href="?year=1998-2004">1998-2004</a></li>
		</ul>
	</div>
</asp:Content>