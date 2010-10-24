<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Kundenw�nsche analysieren und realisieren</h1>
	
	<div class="block">
		<h2>Kundenspezifische L�sungen</h2>	
		
		<img class="deco" src="~/images/web_solutions_requirements.png" alt="Technische Anforderungsbeschreibung" runat="server" />
		<p>
			Sie haben ein Bed�rfnis: F�r Ihre Homepage brauchen Sie eine neue oder eine bessere L�sung.
			Standardprodukte helfen Ihnen nicht weiter.
		</p>
		<p>			
			<em>Wir von HotFeet l�sen Ihre Web-Probleme - massgeschneidert auf Ihre Anforderungen.</em>
		</p>
		<p>
			Wir �bernehmen f�r Sie <em>Analyse, Gestaltung, Entwicklung und Einf�hrung 
			Web-basierter L�sungen</em>. Dabei verwenden wir modernste Entwicklungs-Tools und etablierte 
			Technologien.
		</p>
		<p>
			Jedes Projekt durchl�uft mehrere Qualit�tskontrollen, um sicherzustellen, dass
			Sie eine perfekt funktionierende Homepage erhalten.
		</p>
	</div>
		
	<div class="block">	
		<h2>Selbsterkl�rendes Content-Management-System (CMS)</h2>
		<img class="deco" src="~/images/web_solutions_cms.png" alt="HotFeet Open Source CMS Snippet" runat="server" />
		<p>
			Neue Software-Anwendungen bedingen meistens, dass das Personal umfangreich geschult wird.
			Das ist aufw�ndig und kostet viel Geld. Das Open-Source-CMS von HotFeet bietet eine andere L�sung:
			Der Aufbau ist logisch und die Anwendung <em>einfach und intuitiv. Eine Schulung ist nicht n�tig.</em>
		</p>
		<p>
			Trotz dieses Vorteils wird das HotFeet-CMS auch komplexen Anspr�chen gerecht und ist erst noch <em>"Open Source"</em>.
			Sie k�nnen jederzeit den Quellcode einsehen: Schreiben Sie uns ein kurze E-Mail an
			<a class="links" href="mailto:info@hotfeet.ch">info@hotfeet.ch</a>.
		</p>
	</div>

	<div class="block">
		<h2>Suchmaschinen finden Ihre Seite schneller</h2>
		<img class="deco" src="~/images/web_solutions_seofriendly.png" alt="HotFeet Webl�sungen sind SEO-Friendly" runat="server" />
		<p>
			Web-L�sungen sollen SEO (Search Engine Optimization) sein, d.h. sie werden von HotFeet "Suchmaschinen-freundlich" designt:
			Titel, Meta-Tags, Headings sowie eine Sitemap sind vorhanden. Zus�tzlich optimieren wir die Geschwindigkeit Ihrer Web-L�sung. 
			
			Webl�sungen von HotFeet werden "Suchmaschinen-Freundlich" designt. Das heisst, dass
			sowohl Titel, Meta-Tags, Headings als auch eine Sitemap vorhanden sind. Zudem 
			optimieren wir die Geschwindigkeit Ihrer Webl�sung. 
		</p>
		<p> 
			<em>Vorteil: Ihre Internetseite wird von Suchmaschinen positiver bewertet und deshalb von Ihren potenziellen Kunden schneller gefunden.</em>				
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Erg�nzende Services</h2>
		<ul class="links">
			<li><a href="~/services/hosting.aspx" runat="server">Hosting</a></li>
			<li><a href="~/services/search-engine-optimization.aspx" runat="server">Suchmaschinenoptimierung (SEO)</a></li>
		</ul>
	</div>
	
	<div class="sidebox">
		<h2>Quick-Links</h2>
		<ul class="links">
			<li><a href="~/knowledge-base/faq.aspx" runat="server">Was ist ein CMS?</a></li>
			<li><a href="~/knowledge-base/faq.aspx" runat="server">Was ist SEO?</a></li>			
			<li><a href="~/services/search-engine-optimization.aspx" runat="server">Ist meine Website SEO-Friendly?</a></li>
			<li><a href="~/services/search-engine-optimization.aspx" runat="server">HotFeets SEO Angebot</a></li>
		</ul>
	</div>
</asp:Content>
