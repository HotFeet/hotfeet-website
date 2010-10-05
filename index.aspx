<%@ Page masterPageFile="~/global.master" enableViewState="false" %>
<%@ Register tagPrefix="hf" tagName="ReferencePreview" src="~/ReferencePreview.ascx" %>
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

void BindReference(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	ReferencePreview rp = (ReferencePreview)e.Item.FindControl("RP");
	rp.DataSource = (Reference)e.Item.DataItem;
	rp.DataBind();
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
	Weblösungen von HotFeet<br />
	Inspirierend 	
	</h1>
	
	<div class="box">
		<h1>Individuelle<br />Lösungen</h1>
		<em>Websites/Homepages &#183; Webapplikationen</em>
		<ul class="links">
			<li><a href="web-solutions/overview.aspx">Weblösungen</a></li>
			<li><a href="services.aspx">Referenzen</a></li>
		</ul>
	</div>

	<div class="box even">
		<h1>Professionelles<br />Design</h1>
		<em>Identität &#183; Form &#183; Ästhetik</em>
		<ul class="links">
			<li><a href="partners.aspx">Unsere Grafikdesigner</a></li>
			<li><a href="#">Arbeiten unserer Grafikdesigner</a></li>
		</ul>
	</div>

	<div class="box">
		<h1>Zuverlässige<br />Services</h1>
		<em>Hosting &#183; Suchmachinenoptimierung &#183; Support</em>
		<ul class="links">
			<li><a href="services/overview.aspx">Komplementären Services</a></li>
			<li><a href="#">Unser Management Team</a></li>
		</ul>
	</div>
	
	<div class="box even">
		<h1>Transparente<br />Arbeitsweise</h1>
		<em>Persönlichkeit &#183; Effizienz &#183; Qualität</em>
		<ul class="links">
			<li><a href="about_us.aspx#customers-bill-of-rights">Die Rechte unserer Kunden</a></li>
			<li><a href="#">Typischer Projektablauf</a></li>
		</ul>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() { $("div.box").backgroundBorder(); });
	</script>

	<p class="intro-text">
		HotFeet entwickelt individuelle, professionelle Weblösungen. Dazu zählen Websites/Homepages, 
		Webapplikationen und mobile Websites.  Hosting und Suchmaschinenoptimierung (SEO) ergänzen 
		unser Angebot. Wir sind seit über 10 Jahren im Technopark Zürich angesiedelt.
	</p>
</asp:Content>
<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Referenzen</h2>
		<div id="SlideshowContainer">
			<ul id="ReferencesSlideshow">
				<asp:Repeater id="References" onItemDataBound="BindReference" runat="server">
					<ItemTemplate>
						<li>
							<hf:ReferencePreview id="RP" runat="server" />
						</li>
					</ItemTemplate>
				</asp:Repeater>
			</ul>
			<a id="PreviousReference" class="prev-next" href="javascript:;"><img src="images/big_arrow_left.png" /></a>
			<a id="NextReference" class="prev-next" href="javascript:;"><img src="images/big_arrow_right.png" /></a>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				var slideshow = $("#ReferencesSlideshow");
				var container = $("#SlideshowContainer");
				var arrows = $(".prev-next");

				slideshow.cycle({
					fx: "scrollHorz",
					prev: "#PreviousReference",
					next: "#NextReference",
					random: true
				});
				
				container.hover(
					function() { slideshow.cycle("pause"); arrows.fadeIn(); },
					function() {
						clearSlideshowTimeout();
						slideshowTimeout = window.setTimeout(function() {
							arrows.fadeOut(); slideshow.cycle("resume");
						}, 200);
					}
				);
			});

			var slideshowTimeout;
			
			function clearSlideshowTimeout() {
				if(!slideshowTimeout)
					return;
				
				window.clearTimeout(slideshowTimeout);
				slideshowTimeout = null;
			}
		</script>
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