<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">
		Effiziente und transparente Arbeitsweise
	</h1>
		
	<a name="customers-bill-of-rights">
		<div class="block">
			<h2>Deklaration zu den Rechten unserer Kunden</h2>
			<p>
				Als Kunde haben Sie das Recht...
			</p>
			<ol>
			   <li>Ziele f�r Ihr Projekt zu definieren und zu erwarten, dass diese Ziele von uns verfolgt werden</li>
			   <li>zu wissen wie lange das Projekt dauert und wie viel es kosten wird</li>
			   <li>zu entscheiden welche Funktionalit�t Sie haben wollen und welche nicht</li>
			   <li>noch w�hrend des Projekts kleinere �nderungen an den Anforderungen vorzunehmen und dabei zu wissen welche zus�tzlichen Kosten (Aufwand und Zeit) dabei entstehen</li>
			   <li>den Status des Projekts jederzeit klar und zuverl�ssig zu kennen</li>
			   <li>informiert zu sein �ber potentielle Probleme die den Kostenrahmen, den Zeitplan oder die Qualit�t des Projekts gef�hrden k�nnten und Vorschl�ge zu erhalten wie diese Risiken einged�mmt werden k�nnten</li>
			   <li>Zugriff zu haben auf Projektdokumente (Offerte, Technische Spezifikation, etc.)</li>
			</ol>
			<p>
				Diese Deklaration wurde von <em>Steve McConnell's "Customer's Bill of Rights"</em> �bernommen (Steve McConnell: 
				Software Project Survival Guide, 1998).
			</p>			
		</div>
	</a>

	<div class="block">
		<h2>Unsere Arbeitsmethoden</h2>
		<p>
			HotFeets Gesch�ftsprozesse sind in Anlehnung an geeignete bekannte Methoden definiert worden.
		</p>
		<ul>
			<li>Zur Organisation von Aufgaben: Getting Things Done (von David Allen)</li>
			<li>Zur Entwicklung: Scrum, Agile Development</li>
		</ul>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">

	<div class="sidebox">
		<h2>Interessantes zum Thema</h2>
		Steve McConnell:
		<ul class="links">
			<li><a href="http://www.stevemcconnell.com/" target="_blank">His Website</a></li>
			<li><a href="http://www.stevemcconnell.com/sg.htm" target="_blank">Software Project Survival Guide</a></li>
		</ul>
		<br />
		Wikipedia:
		<ul class="links">
			<li><a href="http://de.wikipedia.org/wiki/Getting_Things_Done" target="_blank">Getting Things Done</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Scrum" target="_blank">Scrum</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Agile_Softwareentwicklung" target="_blank">Agile Development</a></li>
		</ul>
	</div>

</asp:Content>
