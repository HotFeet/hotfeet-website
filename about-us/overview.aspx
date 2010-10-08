<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">Über uns</h1>
	<div class="block">
		<h2>Eine kurze Geschichte zu HotFeet</h2>
		<p>
			HotFeet wurde 1998 im Technopark Zürich als GmbH gegründet.
		</p>
		<p> 
			Über den Ursprung des Names HotFeet ranken sich die verschiedensten Geschichten. Sicher ist, dass wir von HotFeet 
			alles andere als kalte Füsse bekommen wenn es um ausgefeilte Weblösungen für unsere Kunden geht.
		</p>
	</div>

	<div class="block">
		<h2>Mission</h2>
		<p>
			HotFeet hat die Ambition, <em>qualitativ hochstehende Weblösungen</em> für seine Kunden zu entwickeln.
			Wir halten uns an die neusten gültigen <em>Industriestandards</em> und verwenden
			<em>State-of-the-Art Technologien</em>, um den höchsten Ansprüchen unserer Kunden gerecht zu werden. 
		</p>
	</div>

	<div class="block">
		<h2>Facts and Figures</h2>
		<ul>
			<li>Kundenstamm: 60+</li>
			<li>Gehostete Weblösungen: 85</li>
			<li>Gehostete Domains: 141</li>
		</ul>

		<h3>Wachstum (alle Zahlen im Vergleich zum Vorjahr):</h3>
		<table>
			<th />
			<th class="first">Kundenzuwachs</th>
			<th class="second">Umsatzsteigerung</th>
			<tr>
				<td class="desc odd">2009</td>
				<td class="first odd">+11%</td>
				<td class="second odd">+10%</td>
			</tr>
			<tr>
				<td class="desc">2008</td>
				<td class="first even">+13%</td>
				<td class="second even">+20%</td>
			</tr>
			<tr>
				<td class="desc odd">2007</td>
				<td class="first odd">+26%</td>
				<td class="second odd">+25%</td>
			</tr>
		</table>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<ul class="links">
			<li><a href="http://www.technopark.ch" target="_blank">Technopark Zürich</a></li>
			<li><a href="http://zh.powernet.ch/webservices/inet/HRG/HRG.asmx/getHRGHTML?chnr=0204018693&amt=020&toBeModified=0&validOnly=0&lang=1&sort=0" target="_blank">Eintrag im Handelsregister</a></li>
		</ul>
	</div>
	
	<div class="sidebox">
		<h2>Weblösungen</h2>
		<ul class="links">
			<li><a href="~/web-solutions/website.aspx" runat="server">Websites</a></li>
			<li><a href="~/web-solutions/mobile-website.aspx" runat="server">Mobile Websites</a></li>
			<li><a href="~/web-solutions/webapplication.aspx" runat="server">Webapplikationen</a></li>
		</ul>
		<br />
		<h2>Services</h2>
		<ul class="links">
			<li><a href="~/services/search-engine-optimization.aspx" runat="server">Suchmaschinenoptimierung (SEO)</a></li>
			<li><a href="~/services/hosting.aspx" runat="server">Hosting</a></li>
		</ul>
	</div>
</asp:Content>
