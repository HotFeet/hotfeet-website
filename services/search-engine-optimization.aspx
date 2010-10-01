<%@ Page masterPageFile="~/global.master" %>
<script runat="server">

	void SendSeoFriendlyRequest(object o, EventArgs e) {
		string sender = ContactEmail.Text;		
		string receiver = @"info@hotfeet.ch";
		string subject = @"Request for SEO-Friendly Website Check";
		string body = String.Format("Requst from {0} to check website {1} for SEO-Friendlyness", sender, Webaddress.Text);
		
		App.SendEmail(sender, receiver, subject, body);		
	}
	
</script>

<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">
		Besser gefunden werden
	</h1>
	
	<div class="block">
		<div class="section">
			<h2>Werden Sie besser gefunden dank Suchmaschinenoptimierung (SEO)</h2>
			<p>
				Zuwenige Besucher auf Ihrer Website?<br /> 
				Sie werden von <a href="http://www.google.com" target="_blank" class="links">Google</a>, 
				<a href="http://www.bing.com" target="_blank" class="links">Bing</a> und Co. nicht aufgelistet oder 
				nur weit unten?<br /> 
				HotFeet analysiert die G�te Ihrer Website/Webapplikation f�r Suchmaschinen und erarbeitet einen 
				Katalog mit Verbesserungsvorschl�gen. 
			</p>
		</div>

		<div class="section">
			<h2>Angebot</h2>
			<p>
				Zwei Angebote zur Suchmaschinenoptimierung (SEO) stehen unseren Kunden zur 
				Verf�gung
			</p>
			<p>
				HotFeet offeriert ein <strong>SEO-Friendly Paket</strong> und ein <strong>Professional SEO Paket</strong>
				f�r unsere Kunden mit einer Website oder Webapplikation. Das Professional SEO Paket ist komplement�r 
				zum SEO-Friendly Paket da es keinen Sinn macht auf eine nicht SEO-Friendly (Suchmaschinen-Freundlich) 
				Website/Webapplikation das Professional SEO Paket anzuwenden. 
			</p>

			<h3>SEO-Friendly Paket</h3>
			<p>
				Dieses Angebot ist vor allem ausgerichtet auf Websites, die 
				bei Ihrer Programmierung nicht explizit auf Suchmaschinen-Freundlichkeit 
				optimiert wurden.
			</p>
			<ul>
				<li>Analyse des Optimierungspotential</li>
				<li>Passende Titel und Meta Tags auf jeder Seite</li>					
				<li>Vollst�ndige Sitemap</li>
				<li>Kennzeichnung von Titeln und Untertiteln</li>
				<li>Optimierung der Ladegeschwindigkeit</li>
				<li>Sinnvolle Umleitung ung�ltiger Seitenaufrufe</li>
				<li>Aussagekr�ftige Verzeichnisstruktur und Dateinamen</li>
				<li>Standardkonformer Code</li> 
			</ul> 

			<div class="section">
				<h2>Professional SEO Paket</h2>
				<p>				
					Dieses Paket richtet sich an unsere Kunden mit einer SEO-Friendly Website/Webapplikation.
					Das Professional SEO Paket hat das Ziel eine geeignete Menge an Keywords (Stichw�rtern)
					f�r jede Seite zu bestimmen. Dabei spielen Faktoren wie Sprache, Region oder Konkurrenzangebote
					eine Rolle.
				</p> 
				<ul>
					<li>Keyword-Analyse</li>
					<li>Anpassen der Titel und Meta Tags</li>
					<li>Gegebenenfalls Empfehlungen an den Kunden zur Verfassung von Texten</li>
				</ul>
			</div>

			
	
			<div class="section">
				<h2>Was Sie erwarten k�nnen:</h2>
				<ul>
					<li>Termingerechte Lieferung Ihrer Webl�sung zum vereinbarten Preis und mit der spezifizierten Funktionalit�t</li>
					<li>Professionelles Management Ihres Projekts durch einen unserer Projekt Manager</li>
					<li>�bereinstimmung mit der firmenweiten Richtlinie zu den Rechten unserer Kunden</li>
				</ul>
			</div>

			<h3>Bitte beachten Sie:</h3>
			<ul>
				<li>Dieses Angebot bezieht sich ausschliesslich auf Kunden mit einer bestehenden Website/Webapplikation 
				von HotFeet, da wir in diesem Fall bereits �ber den Source Code verf�gen.</li>
				<li>HotFeet kann keine Garantien geben, ob und in welchem Umfang sich das Ranking (d.h. die Positionierung in
				Suchresultaten) Ihrer Website verbessert.
				Gewichtige Faktoren wie z.B. die Anzahl und Qualit�t von externen Links oder das Ranking von Websites 
				der Konkurrenz k�nnen von HotFeet nicht beeinflusst werden.</li>
			</ul> 
		</div>

		<ul class="links">
			<li><a href="#">Was genau ist Suchmaschinenoptimierung oder SEO (FAQ)</a></li>
			<li><a href="#">Offertanfrage</a></li>
			<li><a href="#">Referenzen</a></li>
			<li><a href="#"></a></li>
		</ul>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox highlight">
		<h2>SEO-Friendly Check</h2>
		<asp:TextBox id="Webaddress" cssclass="textbox" runat="server" />
		<ajaxToolkit:TextBoxWatermarkExtender id="WM1" targetControlID="Webaddress" watermarkCssClass="textbox watermark" watermarkText="Adresse der Website" runat="server" />
		<asp:RequiredFieldValidator controlToValidate="Webaddress" display="Dynamic" errorMessage="Bitte ausf�llen." runat="server" />
		
		<asp:TextBox id="ContactEmail" cssclass="textbox" runat="server" />
		<ajaxToolkit:TextBoxWatermarkExtender id="WM2" targetControlID="ContactEmail" watermarkCssClass="textbox watermark" watermarkText="Ihre Kontakt-E-Mail" runat="server" />
		<asp:RegularExpressionValidator text="E-Mail Format falsch." ControlToValidate="ContactEmail" 
			ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
		<asp:RequiredFieldValidator controlToValidate="ContactEmail" display="Dynamic" errorMessage="Bitte ausf�llen." runat="server" />
		
		<asp:Button class="button" text="Anfragen" onclick="SendSeoFriendlyRequest" runat="server" />		
	</div>


	<div class="sidebox">
		<h2>Komplement�r zu den L�sungen</h2>
		<ul class="links">
			<li><a href="~/web-solutions/website.aspx" runat="server">Website/Homepage</a></li>
			<li><a href="~/web-solutions/mobile-website.aspx" runat="server">Mobile Website</a></li>
			<li><a href="~/web-solutions/webapplication.aspx" runat="server">Webapplikation</a></li>
		</ul>
	</div>

	<div class="sidebox">
		<h2>Interessantes zum Thema</h2>
		Wikipedia:
		<ul class="links">
			<li><a href="http://de.wikipedia.org/wiki/Suchmaschinenoptimierung" target="_blank">Suchmaschinenoptimierung</a></li>
			<li><a href="http://en.wikipedia.org/wiki/Search_engine_optimization" target="_blank">SEO (English)</a></li>
		</ul>
	</div>
	
</asp:Content>

