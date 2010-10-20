<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Hosting</h2>
	
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
			Im Hosting inbegriffen ist die <em>�berwachung Ihrer Webl�sung</em>.
			Dadurch werden Fehler fr�hzeitig erkannt und schnell behoben.
			Setzen Sie sich mit uns in Verbindung, wenn Sie ein <em>spezielles SLA</em> ben�tigen. 
		</p>
	</div>

	<div class="block">
		<h2>Exklusiv f�r HotFeet Kunden</h2>
		<p>
			HotFeet ist bem�ht, seinen Kunden den besten Service zu liefern. Darum 
			richtet sich unser Hosting Angebot exklusiv an Kunden mit einer HotFeet Webl�sung. 
			Wir hosten keine Zweit- und Drittanbieterapplikationen.
		</p>
		<h3>Warum das so ist</h3>
		<ul>
			<li>
				Single Point of Contact: Sie haben <em>einen einzigen Ansprechpartner</em>,
				der f�r Ihre Webl�sung zust�ndig ist.
			<li>
				Wir schliessen Risiken durch fremde Webl�sungen oder fremdes Hosting aus.
			</li>
			<li>
				Wir kennen unsere Webl�sungen als auch unsere Infrastruktur in- und auswendig und 
				k�nnen so den besten Service garantieren.
			</li> 		 
		</ul>			
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
			<li>Hetzner bietet eine <em>ausserordentlich hohe Verf�gbarkeit</em> der Infrastruktur.</li>
			<li>Hetzner ist ein <em>technisch sehr kompetenter Partner</em>.</li>
			<li>Hetzner bezieht seinen <em>Strom zu 100% aus Wasserkraft</em>.</li>
		</ul>
		<br />
		<p>
			Mehr Details zur redundanten Internetanbindung und Stromversorgung finden Sie auf der 
			<a class="links" href="http://www.hetzner.de/de/hosting/unternehmen/rechenzentrum/" target="_blank">Hetzner Seite</a>.			
		</p>
		<p>
			Der HotFeet Server wird <em>st�ndig von unserem Nagios System �berwacht.</em>
			Bei Problemen wird eine Warnung inklusive Diagnose-Informationen per SMS und E-Mail verschickt,
			was eine <em>schnelle Reaktionszeit</em> garantiert.
		</p>
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
