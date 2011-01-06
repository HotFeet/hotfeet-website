<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Effiziente und transparente Arbeitsweise</h1>
	<p>
		<em>Der Amerikaner Steve McConnell galt Ende der 1990er-Jahre als einer der drei einflussreichsten 
		Unternehmer in der Software-Industrie (neben Bill Gates und Linus Torvalds).</em> 
		Seine Aufz�hlung der <em>"Customer's Bill of Rights"</em> h�lt fest, welche Rechte Kunden haben.
		Diese Rechte gelten auch bei HotFeet.
	</p>
	<p> 
		Nachfolgend einige Ausz�ge aus Steve McConnells Buch
		<a class="links" href="http://www.stevemcconnell.com/sg.htm">Software Project Survival Guide</a> (1997). 
	</p>
		
	<div class="block">
		<h2>Deklaration zu den Rechten unserer Kunden</h2>

		Als Kunde haben Sie das Recht...
		<ol>
		   <li>... Ziele f�r Ihr Projekt zu definieren und zu erwarten, dass diese Ziele von uns verfolgt werden.</li>
		   <li>... zu wissen, wie lange das Projekt dauert und wie viel es kosten wird.</li>
		   <li>... zu entscheiden, welche Funktionalit�t Sie haben wollen und welche nicht.</li>
		   <li>
		   	... noch w�hrend des Projekts kleinere �nderungen an den Anforderungen vorzunehmen und 
		   	dabei transparent informiert zu werden, welche zus�tzlichen Kosten (Aufwand und Zeit) dabei entstehen.
		   </li>
		   <li>... jederzeit �ber den aktuellen Stand des Projekts im Bilde zu sein.</li>
		   <li>
		   	... unverz�glich �ber potenzielle Probleme in Kenntnis gesetzt zu werden, die den Kostenrahmen, 
		   	den Zeitplan oder die Qualit�t des Projekts gef�hrden k�nnten,
		   	und Vorschl�ge zu erhalten wie diese Risiken einged�mmt werden k�nnten.
		   </li>
		   <li>... Zugriff zu haben auf alle Projektdokumente (Offerte, technische Spezifikationen etc.).</li>
		</ol>
	</div>

	<div class="block">
		<h2>Unsere Arbeitsmethoden</h2>
		<p>
			Wir haben die HotFeet-Gesch�ftsprozesse in Anlehnung an geeignete und bekannte Methoden definiert.
		</p>
		<ul>
			<li>Zur Organisation von Aufgaben: <em>Getting Things Done (von David Allen)</em></li>
			<li>Zur Entwicklung: <em>Scrum, Agile Development</em></li>
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
			<li><a href="http://www.stevemcconnell.com/">Steve McConnells Website</a></li>
			<li><a href="http://www.stevemcconnell.com/sg.htm">Software Project Survival Guide</a></li>
		</ul>
		<br />
		Wikipedia:
		<ul class="links">
			<li><a href="http://de.wikipedia.org/wiki/Getting_Things_Done">Getting Things Done (GTD)</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Scrum">Scrum</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Agile_Softwareentwicklung">Agile Development</a></li>
		</ul>
	</div>

</asp:Content>
