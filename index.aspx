<%@ Page masterPageFile="~/global.master" enableViewState="false" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		//FIXME: debugging only:
		References.DataSource = App.DB.ReferenceCategories[0].References;
		References.DataBind();
	} 
}

void BindReference(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;

	Reference r = (Reference)e.Item.DataItem;

	// build nice url ("www.hotfeet.ch")
	string niceUrl = r.Url;
	if(niceUrl != null)
		niceUrl = niceUrl.Replace("http://", String.Empty);

	// build full url ("http://www.hotfeet.ch")
	string fullUrl = r.Url;
	if(!String.IsNullOrEmpty(fullUrl) && !fullUrl.StartsWith("http://"))
		fullUrl = "http://" + fullUrl;

	HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("RefLink");
	//FIXME: set anchor part in RefLink

	HtmlImage screenshot = (HtmlImage)link.FindControl("Screenshot");
	screenshot.Src = String.Format("ref_imgs_test/new_references_{0}_small.png", r.MigrationID);
	screenshot.Alt = String.Format(screenshot.Alt, r.Name);

	HtmlGenericControl ctrl = (HtmlGenericControl)e.Item.FindControl("SiteName");
	ctrl.InnerText = r.Name;

	link = (HtmlAnchor)e.Item.FindControl("SiteLink");
	link.InnerText = niceUrl;
	link.HRef = fullUrl;
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
		$(document).ready(function() {
			$("div.box").backgroundBorder();
		});
	</script>

	<p>
		HotFeet entwickelt individuelle, professionelle  Weblösungen. Dazu zählen Websites/Homepages, 
		Webapplikationen und mobile Websites.  Hosting und Suchmaschinenoptimierung (SEO) ergänzen 
		unser Angebot. Wir sind seit über 10 Jahren im Technopark Zürich angesiedelt.
	</p>

</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Referenzen</h2>
		<ul id="ReferencesSlideshow">
			<asp:Repeater id="References" onItemDataBound="BindReference" runat="server">
				<ItemTemplate>
					<li>
						<a id="RefLink" href="references.aspx#ref{0}" title="Zu den Details" runat="server">
							<img id="Screenshot" class="box-element" alt="Screenshot {0}" runat="server" />
						</a>
						<span id="SiteName" runat="server" />
						<a id="SiteLink" target="_blank" title="Zur Website" runat="server" />
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
		<script type="text/javascript">
			$(document).ready(function() {
				var slideshow = $("#ReferencesSlideshow");
				slideshow.cycle({
					fx: "scrollHorz",
					prev: "#PreviousReference",
					next: "#NextReference"
				});

				slideshow.hover(
					function() { slideshow.cycle("pause"); $(".prev-next").fadeIn(); },
					function() { slideshow.cycle("resume"); $(".prev-next").fadeOut(); }
				);
			});
		</script>
		<a id="PreviousReference" class="prev-next" href="javascript:;"><img src="images/big_arrow_left.png" /></a>
		<a id="NextReference" class="prev-next" href="javascript:;"><img src="images/big_arrow_right.png" /></a>
	</div>

	<div class="sidebox">
		<h2>HotFeet News</h2>
		<ul>
			<li>3. Sept: Modifications on the text</li>
			<li>Another news clips</li>
		</ul>
		<ul class="links">
			<li><a href="#">Weitere</a></li>
		</ul>
	</div>
</asp:Content>