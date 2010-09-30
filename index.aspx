<%@ Page masterPageFile="~/global.master" %>
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
		<img class="box-element" src="images/reference_sample.png" title="www.sictech.ch" alt="Screenshot SicTech" />
		Website
		<ul class="links">
			<li><a href="http://www.sictech.ch" target="_blank">SicTech 2008</a></li>
		</ul>
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

