<%@ Page masterPageFile="~/global.master" %>
<%@ OutputCache duration="3600" varyByParam="none" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<script runat="server">
const int numberOfNewsItems = 2;

void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		var list = new List<Reference>();
		foreach(var rc in App.DB.ReferenceCategories)
			list.AddRange(rc.References.FindAll(r => !r.Hidden && r.IsHighlight));
		References.DataSource = list;
		References.DataBind();
		
		var news = App.DB.News;
		int c = Math.Min(numberOfNewsItems, App.DB.News.Count);
		news = news.GetRange(news.Count - c, c);
		news.Reverse();
		NewsList.DataSource = news;
		NewsList.DataBind();
	} 
}

void BindNewsItem(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	NewsItem ni = (NewsItem)e.Item.DataItem;
	HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("DateLink");
	link.InnerText = FormatDate(ni.Date);
	link.Title = ni.Title;
	Literal lit = (Literal)e.Item.FindControl("Title");
	//TODO: html encode the title!
	lit.Text = ni.Title;
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
	<p class="intro-text">
		We are an integrated web development and online marketing agency in Zurich. Innovation is part of everything we do. Our expertise is in building world-class websites, smartphone websites and web applications - anything that requires registration or more functionality on your website. Opensource is an important part of our philosophy and our programming is of the highest calibre because we work in the toughest languages.
	</p>

	<p class="intro-text">
		We also offer our clients online marketing from search engine optimation to advising you on how to leverage social media for your company. Most of our clients are SMEs and we build strong working relationships with clients.  We can act as your online marketing gurus.
	</p>
	
	<div class="block">
		<a href="#" class="links">More about our work</a><br />
		<a href="#" class="links">Our current clients</a><br />
		<a href="#" class="links">About Us</a><br />
		<a href="#" class="links">Events</a><br />
		<a href="#" class="links">Contact</a>
	</div>

	<div class="block">
		<img src="images/tah.png" style="width: 100%" />
	</div>

</asp:Content>
<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>
			<a href="~/references.aspx" title="Zur Übersicht aller Referenzen" runat="server">Referenzen</a>
		</h2>
		<hf:ReferencesSlideshow id="References" runat="server" />
	</div>

	<div id="News" class="sidebox">
		<h2>
			<a href="~/about-us/news.aspx" title="Zur News-Seite" runat="server">News</a>
		</h2>
		<asp:Repeater id="NewsList" onItemDataBound="BindNewsItem" runat="server">
			<HeaderTemplate><ul class="links"></HeaderTemplate>
			<FooterTemplate></ul></FooterTemplate>
			<ItemTemplate>
				<li>
					<a id="DateLink" href="~/about-us/news.aspx" runat="server" />
					<asp:Literal id="Title" runat="server" />
					<hr />
				</li>
			</ItemTemplate>
		</asp:Repeater>
		<a href="about-us/news.aspx" title="Zur News-Seite" class="links">Weitere News</a>
	</div>
</asp:Content>
