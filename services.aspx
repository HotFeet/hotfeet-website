<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">
		Unsere Dienstleistungen<br />
		Individuell, effizient und transparent
	</h1>

	<div id="Cloud" class="box">
		<div id="Desktop" class="box">
			<label>
				<span class="area">Desktop Pr�senz</span>
				<span class="service">Homepage Website<br />f�r Desktops</span>
			</label>
		</div>

		<div id="Mobile" class="box">
			<label class="right">
				<span class="area">Mobile Pr�senz</span>
				<span class="service">Homepage Website<br />f�r Mobile Ger�te</span>
			</label>
		</div>

		<div id="EBusiness" class="box">
			<label>
				<span class="area">E-Business</span>
				<span class="service">Webapplikation (Desktop)</span>
				<span class="service">Mobile Applikation (iPhone, Android etc.)</span>
			</label>
		</div>
		
		<div id="SEO" class="box">
			<label>
				<span class="area">Suchmaschinen-Optimierung</span>
				<span class="service">f�r Google, Bing, Yahoo etc.</span>
			</label>
		</div>

		<label>
			<span class="area">Internet/Web</span>
			<span class="service">Hosting SLA</span>
		</label>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			beautifyBorder($("div.box"));
		});
	</script>

	<div class="block">
		<h2>Ihre Pr�senz im Internet</h2>
		<p>
			St�rken Sie Ihren Marktauftritt mit einer individuellen und professionellen Website.<br />
			Mit mehr als 10 Jahren Erfahrung hat sich HotFeet einen Namen f�r qualitativ hochstehende und einzigartige Websites gemacht.			
		</p>
		<br />
		<a href="javascript:;" class="links more-info">Weitere Infos</a>
		<div class="details">
			<h3>Von HotFeet erstellte Websites zeichnen sich durch folgende Qualit�tsmerkmale aus</h3>
			<ul>
				<li>Ansprechendes, modernes Web-Design durch unsere <a href="partner.aspx" target="_blank" class="links">Partner</a></li>
				<li>Massgeschneidert auf Ihre Anforderungen</li>
				<li>�bereinstimmend mit Ihrer CI/CD (Corporate Identity/Corporate Design)</li>
				<li>Einfaches, selbst�ndiges Erstellen und �ndern von Inhalten dank des <a href="#" class="links">HotFeet Open Source CMS</a></li>
				<li>SEO/Suchmaschinen freundlich (Image tags, XHTML validations, designing without tables, etc.)</li>
				<li>Webstandard konform</li>
				<li>Erweiterungsf�hig</li>
				<li>Falls sinnvoll, In-/Export von Daten</li>			
			</ul>
	
			<h3>Was Sie von HotFeet erwarten k�nnen</h3>
			<ul>
				<li>Termingerechte Lieferung zum vereinbarten Preis und mit der spezifizierten Funktionalit�t</li>
				<li>Professionelles Management Ihres Projekts durch einen unserer Projekt Manager</li>
				<li>Respektierung der <a href="#" class="links">Deklaration zu den Rechten unserer Kunden</a></li>
			</ul>
		</div>
		<ul class="links">
			<li><a href="#">Offertanfrage</a></li>
			<li><a href="#">Projektablauf</a></li>
			<li><a href="#">Referenzen</a></li>
		</ul>
	</div>


	<div class="block">
		<h2>Ihre Pr�senz auf mobilen Ger�ten</h2>
		<p>
			Sprechen Sie die stark wachsende Gruppe der mobilen Internetbenutzer an.<br />
			Egal ob via iPhone, Google/Android phone or iPad, eine mobile Website
			garantiert Ihnen einen perfekten Webauftritt f�r Ihre Kunden "on the move".  
		</p>
		<br />
		<a href="javascript:;" class="links more-info">Weitere Infos</a>
		<div class="details">
			<h3>Von HotFeet erstellte mobile Websites zeichnen sich durch folgende Qualit�tsmerkmale aus</h3>
			<ul>
				<li>Angepasstes Design f�r eine optisch ansprechende mobile Website</li>
				<li>Ihre CI/CD (Corporate Identity/Corporate Design) umgesetzt und adaptiert "im kleinen Format"</li> 
				<li>Optimiert f�r mobile Browser (iPhone, Google/Android phone oder einem anderen mobilen Ger�t mit Webbrowser)</li>
				<li>Administration Ihrer Seite in gewohnter Weise via <a href="#" class="links">HotFeet Open Source CMS</a></li>
				<li>Keinen zus�tzlichen Verwaltungsaufwand</li>
			</ul>
	
			<h3>Was Sie von HotFeet erwarten k�nnen</h3>
			<ul>
				<li>Keine zus�tzlichen Kosten beim Hosting</li>
				<li>Termingerechte Lieferung Ihrer mobilen Website zum vereinbarten Preis</li>
				<li>Professionelles Management Ihres Projekts durch einen unserer Projekt Manager</li>
				<li>Respektierung der <a href="#" class="links">Deklaration zu den Rechten unserer Kunden</a></li>
			</ul>
	
			<h3>Bitte beachten Sie:</h3>
			<p>
				Dieses Angebot bezieht sich ausschliesslich auf Kunden mit einer bestehenden Website/Webapplikation 
				von HotFeet	da wir in diesem Fall bereits �ber den Source Code verf�gen.
			</p>
		</div>		
		<ul class="links">
			<li><a href="#">Offertanfrage</a></li>
			<li><a href="#">Typischer Projektablauf</a></li>
			<li><a href="#">Ausgew�hlte Referenzen</a></li>
		</ul>
	</div>


	<div class="block">
		<h2>Bringen Sie Ihr Business online (E-Business)</h2>
		<p>
			Unterst�tzen Sie Ihre Businessprozesse durch eine massgeschneiderte Webapplikation.<br /> 
			Benutzen Sie und Ihre Kunden die Applikation von �berall her und jederzeit. 
			Moderne Sicherheitstechniken garantieren Datensicherheit und Authorisierung.
		</p>
		<br />
		<a href="javascript:;" class="links more-info">Weitere Infos</a>
		<div class="details">
			<h3>Von HotFeet erstellte Webapplikationen zeichnen sich durch folgende Qualit�tsmerkmale aus</h3>
			<ul>
				<li>Optisch ansprechendes Design</li>
				<li>Verschl�sselte Kommunikation und gesicherte Bereiche (Unterst�tzung des HTTPS Protokolls und digitalen Zertifikaten)</li>
				<li>Sichere Speicherung und Archivierung Ihrer Daten</li>
				<li>Erweiterbarkeit Ihrer Webapplikation</li>
				<li>Wir offerieren dedizierte Service und Support Level Agreements (SLA)</li>
				<li>Integration mit Applikationen von Zweit- und Drittanbietern (Import/Export von Daten, funktionale Integration)</li>
			</ul>
	
			<h3>Vorteile einer Webapplikation im Gegensatz zu einem (Fat) Client</h3>
			<ul>
				<li>Gesicherter Zugriff mittels Webbrowser �bers Internet (anytime, anywhere)</li>
				<li>Keine Ausgaben f�r teure Server (Hosting in der Cloud)</li>
				<li>Desktopcomputer mittlerer Leistungsklasse sind ausreichend (Thin Clients)</li>			
			</ul>
	
			<h3>Was Sie erwarten k�nnen</h3>
			<ul>
				<li>Termingerechte Lieferung Ihrer Webl�sung zum vereinbarten Preis und mit der spezifizierten Funktionalit�t</li>
				<li>Professionelles Management Ihres Projekts durch einen unserer Projekt Manager</li>
				<li>�bereinstimmung mit der firmenweiten Richtlinie zu den Rechten unserer Kunden</li>
			</ul>
		</div>
		<ul class="links">
			<li><a href="#">Offertanfrage</a></li>
			<li><a href="#">Ausgew�hlte Referenzen</a></li>
			<li><a href="#">Unterschied Website und Webapplikation (FAQ)</a></li>
		</ul>
	</div>

	<div class="block">
		<h2>Werden Sie besser gefunden dank Suchmaschinenoptimierung (SEO)</h2>
		<p>
			Zuwenige Besucher auf Ihrer Website?<br /> 
			Sie werden von <a href="http://www.google.com" target="_blank" class="links">Google</a>, 
			<a href="http://www.bing.com" target="_blank" class="links">Bing</a> und Co. nicht aufgelistet oder 
			nur weit unten?<br /> 
			HotFeet analysiert die G�te Ihrer Website/Webapplikation f�r Suchmaschinen und erarbeitet einen 
			Katalog mit Verbesserungsvorschl�gen. 
		</p>
		<br />
		<a href="javascript:;" class="links more-info">Weitere Infos</a>
		<div class="details">
			<h3>Das Paket f�r Suchmaschinenoptimierung umfasst folgende Leistungen:</h3>
			<ul>
				<li>Textanalyse bez�glich Schl�sselbegriffen und Wiederholungen</li>
			</ul>
	
			<h3>Was genau ist Suchmaschinenoptimierung oder SEO (Search Engine Optimization)</h3>
			<p>
				
			</p>
			<p>
				Weiterf�hrende Links:
				<ul>
					<li>Wikipedia: <a href="http://de.wikipedia.org/wiki/Suchmaschinenoptimierung" target="_blank" class="links">Suchmaschinenoptimierung</a> 
					respektive <a href="http://en.wikipedia.org/wiki/Search_engine_optimization" target="_blank" class="links">SEO</a></li>
				</ul>
			</p>
	
			<h3>Was Sie erwarten k�nnen</h3>
			<ul>
				<li>Termingerechte Lieferung Ihrer Webl�sung zum vereinbarten Preis und mit der spezifizierten Funktionalit�t</li>
				<li>Professionelles Management Ihres Projekts durch einen unserer Projekt Manager</li>
				<li>�bereinstimmung mit der firmenweiten Richtlinie zu den Rechten unserer Kunden</li>
			</ul>
			<h3>Bitte beachten Sie:</h3>
			<ul>
				<li>Dieses Angebot bezieht sich ausschliesslich auf Kunden mit einer bestehenden Website/Webapplikation 
				von HotFeet	da wir in diesem Fall bereits �ber den Source Code verf�gen.</li>
				<li>HotFeet kann keine Garantien abgeben ob und in welchem Umfang sich die Suchergebnisse verbessern.
				Einige wichtige Faktoren wie z.B. das Verhalten der Benutzer oder der Konkurrenz k�nnen nicht beeinflusst werden.</li>
			</ul> 
		</div>
		<ul class="links">
			<li><a href="#">Offertanfrage</a></li>
			<li><a href="#">Ausgew�hlte Referenzen</a></li>
			<li><a href="#">Unterschied Website und Webapplikation (FAQ)</a></li>
		</ul>
	</div>

	<img src="images/services_sample.png" alt="HotFeet Dienstleistungen" />


	<script type="text/javascript">
		$(document).ready(function() {
			$("a.more-info").click(function() {
				$(this).next("div.details").fadeSliderToggle();
			});
			
			/*$("div#Cloud > div > div").hover(
				function() { $(this).fadeTo("fast", 1.0); },
				function() { $(this).fadeTo("fast", 0.8); }
			);*/
			
			$("div#Cloud, div#Cloud > div > div").hover(
				function() { $(this).css("background-image", "url('images/line_dark.png')"); },
				function() { $(this).css("background-image", "url('images/line.png')"); }
			);
		});
	</script>
</asp:Content>

<asp:Content contentPlaceHolderId="Sidebar1" runat="server">
	<h2>Ich m�chte mehr Infos bez�glich</h2>
	<ul class="links">
		<li><a href="#">Website/Homepage</a></li>
		<li><a href="#">Mobile Website</a></li>
		<li><a href="#">Webapplikation</a></li>
		<li><a href="#">Optimierung f�r Suchmaschinen</a></li>
	</ul>
</asp:Content>

<asp:Content contentPlaceHolderId="Sidebar2" runat="server">
	<h2>Ich weiss was ich will.<br />Ich brauche</h2>
	<ul class="links">
		<li><a href="#">Neue Website/Homepage</a></li>
	</ul>
</asp:Content>

