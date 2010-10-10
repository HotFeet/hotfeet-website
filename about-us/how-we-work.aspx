<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">
		Effiziente und transparente Arbeitsweise
	</h1>
		
	<a name="customers-bill-of-rights">
		<div class="block">
			<h2>Deklaration zu den Rechten unserer Kunden</h2>

			Als Kunde haben Sie das Recht...
			<ol>
			   <li>Ziele für Ihr Projekt zu definieren und zu erwarten, dass diese Ziele von uns verfolgt werden</li>
			   <li>zu wissen, wie lange das Projekt dauert und wie viel es kosten wird</li>
			   <li>zu entscheiden, welche Funktionalität Sie haben wollen und welche nicht</li>
			   <li>
			   	noch während des Projekts kleinere Änderungen an den Anforderungen vorzunehmen und 
			   	dabei transparent informiert zu werden, welche zusätzlichen Kosten (Aufwand und Zeit) dabei entstehen
			   </li>
			   <li>jederzeit über den aktuellen Stand des Projekts im Bilde zu sein</li>
			   <li>
			   	unverzüglich über potentielle Probleme in Kenntnis gesetzt zu werden, die den Kostenrahmen, 
			   	den Zeitplan oder die Qualität des Projekts gefährden könnten,
			   	und Vorschläge zu erhalten wie diese Risiken eingedämmt werden könnten
			   </li>
			   <li>Zugriff zu haben auf alle Projektdokumente (Offerte, Technische Spezifikation, etc.)</li>
			</ol>
			<p>
				Diese Deklaration wurde von <em>Steve McConnell's "Customer's Bill of Rights"</em> übernommen (Steve McConnell: 
				<a class="links" href="http://www.stevemcconnell.com/sg.htm" target="_blank">Software Project Survival Guide</a>, 1998).
			</p>			
		</div>
	</a>

	<div class="block">
		<h2>Unsere Arbeitsmethoden</h2>
		<p>
			HotFeets Geschäftsprozesse sind in Anlehnung an geeignete bekannte Methoden definiert worden.
		</p>
		<ul>
			<li>Zur Organisation von Aufgaben: <em>Getting Things Done (von David Allen)</em></li>
			<li>Zur Entwicklung: <em>SCRUM, Agile Development</em></li>
		</ul>
	</div>

<!--
	<div class="block">
		<h2>Eingesetzte Werkzeuge</h2>
		<ul>
			<li>Nozbe (Getting Things Done)</li>
			<li>Wiki (Wissensdatenbank)</li>
			<li>Jira (Ticketing System)</li>
			<li>Subversion (Code-Versionierung)</li>
		</ul>
	</div>
-->
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">

	<div class="sidebox">
		<h2>Interessantes zum Thema</h2>
		Steve McConnell:
		<ul class="links">
			<li><a href="http://www.stevemcconnell.com/" target="_blank">Steve McConnells Website</a></li>
			<li><a href="http://www.stevemcconnell.com/sg.htm" target="_blank">Software Project Survival Guide</a></li>
		</ul>
		<br />
		Wikipedia:
		<ul class="links">
			<li><a href="http://de.wikipedia.org/wiki/Getting_Things_Done" target="_blank">Getting Things Done (GTD)</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Scrum" target="_blank">Scrum</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Agile_Softwareentwicklung" target="_blank">Agile Development</a></li>
		</ul>
	</div>

</asp:Content>
