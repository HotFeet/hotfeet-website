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
	HtmlGenericControl listItem = (HtmlGenericControl)e.Item.FindControl("Item");
	listItem.InnerHtml = String.Format("{0}<br />{1}", FormatDate(ni.Date), ni.Title);
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
	Webl�sungen von HotFeet<br />
	Inspirierend 	
	</h1>
	
	<div class="box">
		<h1>Individuelle<br />L�sungen</h1>
		<em>Websites/Homepages &#183; Webapplikationen</em>
		<ul class="links">
			<li><a href="web-solutions/overview.aspx">Webl�sungen</a></li>
			<li><a href="references.aspx">Referenzen</a></li>
		</ul>
	</div>

	<div class="box even">
		<h1>Professionelles<br />Design</h1>
		<em>Identit�t &#183; Form &#183; �sthetik</em>
		<ul class="links">
			<li><a href="about-us/partner.aspx">Unsere Grafikdesigner</a></li>
			<li><a href="about-us/partner.aspx">Arbeiten unserer Grafikdesigner</a></li>
		</ul>
	</div>

	<div class="box">
		<h1>Zuverl�ssige<br />Services</h1>
		<em>Hosting &#183; Suchmachinenoptimierung &#183; Support</em>
		<ul class="links">
			<li><a href="services/overview.aspx">Komplement�ren Services</a></li>
			<li><a href="about-us/team.aspx">Unser Management Team</a></li>
		</ul>
	</div>
	
	<div class="box even">
		<h1>Transparente<br />Arbeitsweise</h1>
		<em>Pers�nlichkeit &#183; Effizienz &#183; Qualit�t</em>
		<ul class="links">
			<li><a href="about-us/how-we-work.aspx">Die Rechte unserer Kunden</a></li>
			<li><a href="about-us/how-we-work.aspx">Typischer Projektablauf</a></li>
		</ul>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() { $("div.box").backgroundBorder(); });
	</script>

	<p class="intro-text">
		HotFeet entwickelt individuelle, professionelle Webl�sungen. Dazu z�hlen Websites/Homepages, 
		Webapplikationen und mobile Websites.  Hosting und Suchmaschinenoptimierung (SEO) erg�nzen 
		unser Angebot. Wir sind seit �ber 10 Jahren im Technopark Z�rich angesiedelt.
	</p>
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
				<li id="Item" runat="server" />
			</ItemTemplate>
		</asp:Repeater>
		<a href="about-us/news.aspx" class="links">Weitere News</a>
	</div>
	<script type="text/javascript">
		//FIXME: we need to adjust the bg-color... in the plugin
		//$(document).ready(function() { $("div#News li").backgroundBorder(); });
	</script>

</asp:Content>