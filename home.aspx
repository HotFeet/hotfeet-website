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
	}
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>
		Web-L�sungen von HotFeet:<br />
		effizient, sicher und elegant
	</h1>

	<p class="intro-text">
		Unsere St�rke: Wir erstellen technisch raffinierte Homepages, Web-Applikationen und Websites f�r Smartphones, Tablets und andere Mobilger�te.
		S�mtliche Projekte realisieren wir nach Mass - gem�ss den W�nschen unserer Kunden sowie den Designvorgaben. 
		Wir legen grossen Wert auf eine effiziente Projektabwicklung und kommunizieren offen und transparent.
	</p>
	
	<div class="box">
		<h2 class="custom big-title">Individuelle<br />L�sungen</h2>
		<h3>Homepages &#183; Websites &#183; Web-Applikationen</h3>
		<ul class="links">
			<li><a href="web-solutions/overview.aspx" title="Web-L�sungen">Web-L�sungen</a></li>
			<li><a href="references.aspx" title="Liste unserer Projekte und Kunden">Referenzen</a></li>
		</ul>
	</div>

	<div class="box even">
		<h2 class="custom big-title">Professionelles<br />Web-Design</h2>
		<h3>Identit�t &#183; Form &#183; �sthetik</h3>
		<ul class="links">
			<li><a href="about-us/partner.aspx" title="L&auml;mmler &amp; Mettler">Unsere Grafikpartner L&amp;M</a></li>
			<li><a href="http://www.laemmlermettler.ch/" title="Zur Homepage von L&auml;mmler &amp; Mettler">Homepage L&amp;M</a></li>
		</ul>
	</div>

	<div class="box">
		<h2 class="custom big-title">Zuverl�ssige<br />Services</h2>
		<h3>Suchmaschinenoptimierung &#183; Hosting &#183; Support</h3>
		<ul class="links">
			<li><a href="services/overview.aspx" title="Erg�nzende Services">Erg�nzende Services</a></li>
			<li><a href="services/search-engine-optimization.aspx" title="Suchmaschinenoptimierung">Suchmaschinenoptimierung</a></li>
		</ul>
	</div>
	
	<div class="box even">
		<h2 class="custom big-title">Transparente<br />Arbeitsweise</h2>
		<h3>Effizienz &#183; Qualit�t &#183; Pers�nlichkeit</h3>
		<ul class="links">
			<li><a href="about-us/how-we-work.aspx" title="Rechte unserer Kunden">Rechte unserer Kunden</a></li>
			<li><a href="about-us/team.aspx" title="Das HotFeet-Team">Das HotFeet-Team</a></li>
		</ul>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() { $("div.box").backgroundBorder(); });
	</script>
</asp:Content>
<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>
			<a href="~/references.aspx" title="Zur �bersicht aller Referenzen" runat="server">Referenzen</a>
		</h2>
		<hf:ReferencesSlideshow id="References" runat="server" />
	</div>
</asp:Content>
