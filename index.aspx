<%@ Page masterPageFile="~/global.master" enableViewState="false" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<script runat="server">
const int numberOfNewsItems = 2;

void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		var list = new List<Reference>();
		foreach(var rc in App.DB.ReferenceCategories)
			list.AddRange(rc.References.FindAll(r => r.IsHighlight));
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
	<h1>
	Web-Lösungen von HotFeet: effizient, stabil und smart
	</h1>

	<p class="intro-text">
		Unsere Stärke: Wir erstellen technisch ausgereifte Homepages, Web-Applikationen und Websites für Handys,
		Smartphones, Handhelds und andere Mobilgeräte.
		Sämtliche Projekte realisieren wir nach Mass - gemäss den Wünschen unserer Kunden sowie den Designvorgaben. 
		Wir legen grossen Wert auf eine effiziente, unkomplizierte Projektabwicklung und kommunizieren offen und transparent.
	</p>
	
	<div class="box">
		<h1>Individuelle<br />Lösungen</h1>
		<em>Websites/Homepages &#183; Web-Applikationen</em>
		<ul class="links">
			<li><a href="web-solutions/overview.aspx">Web-Lösungen</a></li>
			<li><a href="references.aspx">Referenzen</a></li>
		</ul>
	</div>

	<div class="box even">
		<h1>Professionelles<br />Design</h1>
		<em>Identität &#183; Form &#183; Ästhetik</em>
		<ul class="links">
			<li><a href="about-us/partner.aspx">Unsere Grafikpartner</a></li>
			<li><a href="about-us/partner.aspx">Arbeiten unserer Grafikpartner</a></li>
		</ul>
	</div>

	<div class="box">
		<h1>Zuverlässige<br />Services</h1>
		<em>Hosting &#183; Suchmachinenoptimierung &#183; Support</em>
		<ul class="links">
			<li><a href="services/overview.aspx">Ergänzende Services</a></li>
			<li><a href="services/search-engine-optimization.aspx">Suchmachinenoptimierung</a></li>
		</ul>
	</div>
	
	<div class="box even">
		<h1>Transparente<br />Arbeitsweise</h1>
		<em>Persönlichkeit &#183; Effizienz &#183; Qualität</em>
		<ul class="links">
			<li><a href="about-us/how-we-work.aspx">Rechte unserer Kunden</a></li>
			<li><a href="about-us/team.aspx">Das HotFeet-Team</a></li>
		</ul>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() { $("div.box").backgroundBorder(); });
	</script>
</asp:Content>
<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Referenzen</h2>
		<hf:ReferencesSlideshow id="References" runat="server" />
	</div>

	<div id="News" class="sidebox">
		<h2>News</h2>
		<asp:Repeater id="NewsList" onItemDataBound="BindNewsItem" runat="server">
			<HeaderTemplate><ul class="links"></HeaderTemplate>
			<FooterTemplate></ul></FooterTemplate>
			<ItemTemplate>
				<li>
					<a id="DateLink" href="~/about-us/news.aspx" runat="server" />
					<asp:Literal id="Title" runat="server" />
				</li>
			</ItemTemplate>
		</asp:Repeater>
		<a href="about-us/news.aspx" class="links">Weitere News</a>
	</div>
	<script type="text/javascript">
		//FIXME: we need to adjust the bg-color... in the plugin
		//FIXME: ...and we need a border png for gray backgrounds... 
		//$(document).ready(function() { $("div#News li").backgroundBorder(); });
	</script>

</asp:Content>
