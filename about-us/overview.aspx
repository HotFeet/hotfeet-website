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
		</p>
		<p> 
			Wir halten uns gültige <em>Industriestandards</em> und verwenden <em>State-Of-The-Art 
			(d.h. gebräuchliche) Technologien</em>, um den höchsten Ansprüchen unserer Kunden gerecht zu werden. 
		</p>
	</div>

	<div class="block">
		<h2>Facts and Figures</h2>
		<p>
			Total Kundenstamm: 60+
		</p>
		<p>
			Zuwachs an Kunden (im Vergleich zum Vorjahr):	
			<ul>
				<li>2009: +11%</li>
				<li>2008: +13%</li>
				<li>2007: +26%</li>
			</ul>
		</p>
		<p>
			Umsatzsteigerung (jeweils im Vergleich zum Vorjahr):
			<ul>
				<li>2009: +10%</li>
				<li>2008: +20%</li>
				<li>2007: +25%</li>
			</ul>
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>HotFeet</h2>
		<ul class="links">
			<li><a href="~/about-us/team.aspx" runat="server">Management Team</a></li>
		</ul>
		<br />	
		<h2>Trivia</h2>
		<ul class="links">
			<li><a href="http://en.wikipedia.org/wiki/Hot_Feet">Hot Feet</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Heisse_Fusion">Heisse Fusion</a></li>
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
