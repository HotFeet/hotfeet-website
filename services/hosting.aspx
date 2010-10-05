<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">
		Hosting
	</h2>
	
	<div class="block">
		<p>
			<em>Exklusiv f�r unsere Kunden</em> bieten wir das Hosting von Websites und Webapplikation. 
			Der HotFeet Server steht im Rechenzentrum der <a class="links" href="http://www.hetzner.de/" target="_blank">Hetzner Online AG</a>.
		</p>
	</div>
		
	<div class="block">
		<h2>Unser Angebot</h2>
		<p>
			HotFeet bietet seinen Kunden folgende <em>Standard Service Level Agreements (SLA):</em>
		</p>
		
		<table>
			<th />
			<th class="filled first">Standard Hosting</th>
			<th class="filled second">Professional Hosting</th>
			<th class="filled third">Enterprise Hosting</th>
			<tr>
				<td class="desc odd">Anzahl E-Mail Adressen</td>
				<td class="value first odd">30</td>
				<td class="value second odd">100</td>
				<td class="value third odd">500</td>
			</tr>
			<tr>
				<td class="desc">Speicherplatz</td>
				<td class="value first even">1 GB</td>
				<td class="value second even">2 GB</td>
				<td class="value third even">5 GB</td>
			</tr>
			<tr>
				<td class="desc odd">Garantierte Verf�gbarkeit (pro Jahr)</td>
				<td class="value first odd">99%</td>
				<td class="value second odd">99%</td>
				<td class="value third odd">99%</td>
			</tr>
		</table>
		
		<p>
			Im Hosting inbegriffen ist die <em>�berwachung Ihrer Webl�sung</em>. Dadurch werden Fehler fr�hzeitig erkannt
			und k�nnen effizient behoben werden.
		</p>			
		<p>
			<em>Sie w�nschen ein spezielles SLA?</em>	Setzen Sie sich mit uns in Verbindung, damit wir Ihre genauen Anforderungen besprechen k�nnen. 
		</p>
	</div>

	<div class="block">
		<h2>�ber den HotFeet Server</h2>
		<p>
			Der HotFeet Server steht in einem der gr�ssten Rechenzentren Deutschlands. Betrieben wird das 
			Rechenzentrum von der <a class="links" href="http://www.hetzner.de/" target="_blank">Hetzner Online AG</a>, 
			ein weltweit t�tiges Hosting Unternehmen.   
		</p>
		<p>
			Wir z�hlen auf Hetzner aufgrund:
		</p>
		<ul>
			<li>Der <em>ausserordentlich hohen Verf�gbarkeit</em> der Infrastruktur</li>
			<li>Der Tatsache, dass Hetzner seinen <em>Strom zu 100% aus Wasserkraft</em> bezieht</li>
		</ul>
		<br />
		<p>
			Mehr Details zu der redundanten Internetanbindung oder der Stromversorgung	finden sie auf der 
			<a class="links" href="http://www.hetzner.de/de/hosting/unternehmen/rechenzentrum/" target="_blank">Hetzner Seite</a>.			
		</p>
		<p>
			Der HotFeet Server wird zudem <em>st�ndig von unserem Nagios System �berwacht.</em> Bei 
			Ungereimtheiten wird ein Alarm �ber mehrere Medien ausgel�st. Dies garantiert eine 
			<em>schnelle Reaktionszeit.</em>
		</p>
	</div>
	
	<div class="block">
		<h2>Exklusiv f�r HotFeet Kunden</h2>
		<p>
			HotFeet ist stehts bem�ht, den besten Service seinen Kunden zu liefern. Darum 
			richtet sich unser Hosting Angebot exklusiv an Kunden mit einer HotFeet Webl�sung. 
			Wir hosten keine Zweit- und Drittanbieterapplikationen.
		</p>
		<h3><em>Warum das so ist</em></h3>
		<ul>
			<li>
				Sie haben <em>einen Ansprechpartner</em>, HotFeet, der f�r Ihre Webl�sung zust�ndig ist (Single Point of Contact). 
			<li>
				 Wir schliessen Risiken durch fremde Webl�sungen oder fremdes Hosting aus.
			</li>
			<li>
				Wir kennen unsere Webl�sungen als auch unsere Infrastruktur in- und auswendig und 
				k�nnen nur so den besten Service garantieren.
			</li> 		 
		</ul>			
	</div>
		
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Interessantes zum Thema</h2>
		Wikipedia:
		<ul class="links">
			<li><a href="http://de.wikipedia.org/wiki/Verf%C3%BCgbarkeit" target="_blank">Verf�gbarkeit von technischen Systemen</a></li>
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
