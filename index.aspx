<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>
	Webl�sungen von HotFeet<br />
	Inspirierend 	
	</h1>
	
	<div class="box">
		<h1>Individuelle<br />L�sungen</h1>
		<h3>Websites/Homepages &#183; Webapplikationen</h3>
		<ul class="links">
			<li><a href="services.aspx">Unsere Dienstleistungen</a></li>
			<li><a href="services.aspx">Unser Referenzen</a></li>
		</ul>
	</div>
	<div class="box even">
		<h1>Professionelles<br />Design</h1>
		<h3>Identit�t &#183; Form &#183; �sthetik</h3>
		<ul class="links">
			<li><a href="partners.aspx">Unsere Grafikdesigner</a></li>
			<li><a href="#">Arbeiten unserer Grafikdesigner</a></li>
		</ul>
	</div>
	<div class="box">
		<h1>Transparente<br />Arbeitsweise</h1>
		<h3>Effizienz &#183; Qualit�t</h3>
		<ul class="links">
			<li><a href="about_us.aspx#customers-bill-of-rights">Die Rechte unserer Kunden</a></li>
			<li><a href="#">Typischer Projektablauf</a></li>
		</ul>
	</div>
	<div class="box even">
		<h1>Zuverl�ssiges<br />Team</h1>
		<h3>Pers�nlichkeit &#183; Excellence</h3>
		<ul class="links">
			<li><a href="#">Zahlen und Fakten zu HotFeet</a></li>
			<li><a href="#">Unser Management Team</a></li>
		</ul>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("div.box").backgroundBorder();
		});
	</script>

<!--	
	<p>
		HotFeet ist eine etablierte Firma im Technopark Z�rich. Unsere St�rke liegt in der 
		Erstellung technisch ausgereifter Websites. Alle Projekte werden den Kundenw�nschen 
		entsprechend nach Mass erstellt.
	</p>
-->

</asp:Content>

<asp:Content contentPlaceHolderId="Sidebar1" runat="server">
	<div class="sidebar">
		<h2>Referenzen</h2>
		<img class="box-element" src="images/reference_sample.png" title="www.sictech.ch" alt="Screenshot SicTech" />
		<h3>Website</h3>
		<ul class="links">
			<li><a href="http://www.sictech.ch" target="_blank">SicTech 2008</a></li>
		</ul>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="Sidebar2" runat="server">
	<h2>HotFeet News</h2>
	<ul>
		<li>3. Sept: Modifications on the text</li>
		<li>Another news clips</li>
	</ul>
	<ul class="links">
		<li><a href="#">Weitere</a></li>
	</ul>
</asp:Content>

