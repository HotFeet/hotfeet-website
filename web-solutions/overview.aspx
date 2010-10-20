<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Kundenanforderungen realisieren</h1>
	
	<div class="block">
		<h2>
			Kundenspezifische Lösungen
		</h2>	
		
		<img class="deco" src="~/images/web_solutions_requirements.png" alt="Technische Anforderungsbeschreibung" runat="server" />
		<p>
			Sie brauchen eine Softwarelösung? Standardprodukte helfen Ihnen nicht?
		</p>
		<p>			
			HotFeet erstellt <em>Weblösungen massgeschneidert auf Ihre Anforderungen.</em>
		</p>
		<p>
			Wir unterstützen Sie in der <em>Analyse, Gestaltung, Entwicklung und Einführung von
			web-basierten Lösungen</em>. Dabei verwenden wir modernste Entwicklungstools, etablierte 
			Technologien und halten uns an die neusten Standards.
		</p>
		<p>
			Jedes Webprojekt durchläuft mehrere Qualitätskontrollen um sicherzustellen, dass
			Sie die perfekte Lösung erhalten.
		</p>
	</div>
		
	<div class="block">	
		<h2>
			Open Source CMS (Content Management System)
		</h2>
		<img class="deco" src="~/images/web_solutions_cms.png" alt="HotFeet Open Source CMS Snippet" runat="server" />
		<p>
			Mehrere Stunden Schulung für ein CMS? Nicht mit dem HotFeet Open Source CMS!
		</p>
		<p>
			Die Stärken des HotFeet Open Source CMS: <em>Einfache, intuitive Bedienung und logischer
			Aufbau.</em> Dabei wird das HotFeet CMS auch komplexen Anforderungen gerecht.
		</p>
		<p>
			Das <em>HotFeet CMS ist zudem Open Source</em>! Sie wollen den Quellcode sehen? Schreiben
			Sie eine kurze E-Mail an <a class="links" href="mailto:info@hotfeet.ch">info@hotfeet.ch</a>.  
		</p>
	</div>

	<div class="block">
		<h2>
			SEO-Friendly
		</h2>
		<img class="deco" src="~/images/web_solutions_seofriendly.png" alt="HotFeet Weblösungen sind SEO-Friendly" runat="server" />
		<p>
			Weblösungen von HotFeet werden "Suchmaschinen-Freundlich" designt. Das heisst, dass
			sowohl Titel, Meta-Tags, Headings als auch eine Sitemap vorhanden sind. Zudem 
			optimieren wir die Geschwindigkeit Ihrer Weblösung. 
		</p>
		<p> 
			<em>Der Vorteil: Suchmaschinen bewerten Ihre Seite positiv</em> - und Ihre Kunden 
			übrigens auch.				
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Ergänzende Services</h2>
		<ul class="links">
			<li><a hef="~/services/hosting.aspx" runat="server">Hosting</a></li>
			<li><a hef="~/services/search-engine-optimization.aspx" runat="server">Suchmaschinenoptimierung (SEO)</a></li>
		</ul>
	</div>
	
	<div class="sidebox">
		<h2>Quick-Links</h2>
		<ul class="links">
			<li><a href="~/knowledge-base/faq.aspx" runat="server">Was ist ein CMS?</a></li>
			<li><a href="~/knowledge-base/faq.aspx" runat="server">Was ist SEO?</a></li>			
			<li><a hef="~/services/search-engine-optimization.aspx" runat="server">Ist meine Website SEO-Friendly?</a></li>
			<li><a hef="~/services/search-engine-optimization.aspx" runat="server">HotFeets SEO Angebot</a></li>
		</ul>
	</div>
</asp:Content>
