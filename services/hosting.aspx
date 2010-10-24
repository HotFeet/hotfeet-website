<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Hosting: Das Heim Ihrer Homepage</h1>
	
	<div class="block">
		<p>
			<em>Exklusiv für unsere Kunden</em> bieten wir das Hosting von Websites und Webapplikation. 
			Unser Server steht im Rechenzentrum der <a class="links" href="http://www.hetzner.de/" target="_blank">Hetzner Online AG</a>.
		</p>
	</div>
		
	<div class="block">
		<h2>Exclusive Angebote</h2>
		<p>
			HotFeet bietet ihren Kunden folgende <em>"Standard Service Level Agreements" (SLA):</em>
		</p>
		
		<table class="striped">
			<tr>
				<th></th>
				<th>Standard Hosting</th>
				<th>Professional Hosting</th>
				<th>Enterprise Hosting</th>
			</tr>
			<tr>
				<td>Anzahl E-Mail Adressen</td>
				<td>30</td>
				<td>100</td>
				<td>500</td>
			</tr>
			<tr>
				<td>Speicherplatz</td>
				<td>1 GB</td>
				<td>2 GB</td>
				<td>5 GB</td>
			</tr>
			<tr>
				<td>Garantierte Verfügbarkeit (pro Jahr)</td>
				<td>99%</td>
				<td>99%</td>
				<td>99%</td>
			</tr>
		</table>
		
		<p>
			Im Hosting inbegriffen ist die <em>Überwachung Ihrer Web-Lösung</em>.
			Dadurch werden Fehler frühzeitig erkannt und schnell behoben.
			Setzen Sie sich mit uns in Verbindung, wenn Sie ein <em>spezielles SLA</em> benötigen. 
		</p>
	</div>

	<div class="block">
		<h2>HotFeet-Kunden profitieren exklusiv</h2>
		<p>
			Wir von der HotFeet GmbH sind stets darum bemüht, unseren Kunden den besten Service zu liefern.
			Darum richtet sich unser Hosting-Angebot exklusiv an Kunden mit einer HotFeet-Web-Lösung.
			Wir hosten keine Zweit- und Drittanbieter-Applikationen. 
		</p>
		<h3>Kundennutzen und Sicherheit gehen vor:</h3>
		<ul>
			<li>
				"Single Point of Contact": Sie haben <em>einen einzigen Ansprechpartner</em>,
				der für Ihre Web-Lösung zuständig ist.
			</li>
			<li>
				Wir können Risiken durch fremde Web-Lösungen oder fremdes Hosting ausschliessen.
			</li>
			<li>
				Wir kennen sowohl unsere Weblösungen als auch unsere Infrastruktur perfekt.
				Das garantiert Ihnen den bestmöglichen Service.
			</li> 		 
		</ul>			
	</div>
	
	<div class="block">
		<h2>Über den HotFeet-Server</h2>
		<p>
			Der HotFeet-Server steht in einem der grössten Rechenzentren Deutschlands. Betrieben wird das 
			Rechenzentrum von der <a class="links" href="http://www.hetzner.de/" target="_blank">Hetzner Online AG</a>, 
			ein weltweit tätiges Hosting Unternehmen.
		</p>
		<p>
			Deshalb vertrauen wir auf die Hetzner Online AG: Sie...
		</p>
		<ul>
			<li>... bietet eine <em>ausserordentlich hohe Verfügbarkeit</em> der Infrastruktur.</li>
			<li>... ist eine <em>technisch sehr kompetente Partnerin</em>.</li>
			<li>... bezieht ihren <em>Strom zu 100% aus Wasserkraft</em>.</li>
		</ul>
		<br />
		<p>
			Mehr Details zur redundanten Internetanbindung und Stromversorgung finden Sie auf der 
			<a class="links" href="http://www.hetzner.de/de/hosting/unternehmen/rechenzentrum/" target="_blank">Hetzner-Seite</a>.			
		</p>
		<p>
			Der HotFeet Server wird <em>ständig von unserem Nagios System überwacht.</em>
			Bei Problemen wird eine Warnung inklusive Diagnose-Informationen per SMS und E-Mail verschickt -
			das garantiert eine <em>schnelle Reaktionszeit</em>.
		</p>
	</div>		
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Interessantes zum Thema</h2>
		Wikipedia:
		<ul class="links">
			<li><a href="http://de.wikipedia.org/wiki/Verf%C3%BCgbarkeit" target="_blank">Verfügbarkeit von technischen Systemen</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Service-Level-Agreement" target="_blank">SLA</a></li>
			<li><a href="http://de.wikipedia.org/wiki/Nagios" target="_blank">Nagios</a></li>
		</ul>
		<br />
		Hetzner Online AG:
		<ul class="links">
			<li><a href="http://www.hetzner.de/de/hosting/unternehmen/rechenzentrum/" target="_blank">Rechenzentrum</a></li>
		</ul>
	</div>
</asp:Content>
