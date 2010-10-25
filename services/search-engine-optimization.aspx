<%@ Page masterPageFile="~/global.master" %>

<script runat="server">
void SendSeoFriendlyRequest(object o, EventArgs e) {
	string sender = ContactEmail.Text;		
	string subject = @"Request for SEO-Friendly Website Check";
	string body = String.Format("Requst from {0} to check website {1} for SEO-Friendlyness.", sender, Webaddress.Text);
	
	App.SendEmailToHfInfo(sender, subject, body);	
	
	// Display the notification
	SendButton.Visible = false;
	Webaddress.Enabled = false;
	ContactEmail.Enabled = false;	
	Notification.Visible = true;
}
</script>

<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Schneller gefunden werden</h1>
	
	<div class="block">
		<p>
			Leidet Ihre Homepage unter zu wenig Besuchern?
			Ein Hauptgrund daf�r ist, dass die Seite von <a href="http://www.google.com" target="_blank" class="links">Google</a>,
			<a href="http://www.bing.com" target="_blank" class="links">Bing</a> und Co.
			nicht aufgelistet wird oder aber erst weit hinten in der Trefferliste erscheint. 
		</p>
		<p>
			<em>Wir von HotFeet wissen, wie wir Ihre Website oder Ihre Web-Applikation f�r Suchmaschinen optimieren, damit man Sie schneller findet.</em> 
		</p>
	</div>

	<div class="block">
		<h2>Unsere Angebote</h2>
		<h3>Suchmaschinen-freundlich: SEO-Friendly-Paket</h3>
		<p>
			Dieses Angebot ist auf Websites und Web-Applikationen ausgerichtet,
			bei deren Programmierung nicht explizit auf Suchmaschinen-Freundlichkeit geachtet wurde.
			Wir bauen die f�r Ihre Seite geeigneten Keywords (Stichw�rter) ein, nach Absprache mit Ihnen.
		</p>
	
		<h3>Professional-SEO-Paket</h3>
		<p>
			Wir �bernehmen f�r Sie die Suche nach geeigneten Keywords, 
			damit Ihre Homepage von Suchmaschinen schneller gefunden und prominenter gelistet wird.
			Diese Keywords spielen bei der Suche via Google und Co. eine zentrale Rolle.
			Das SEO-Friendly-Paket ist Voraussetzung f�r die Umsetzung des Professional-SEO-Pakets.
		</p>
		<br />
		<p>
			Mit dem <em>SEO-Friendly-Check</em> auf der rechten Seite k�nnen Sie <em>gratis und unverbindlich</em> 
			Ihre Website/Web-Applikation durch HotFeet auf deren SEO-Freundlichkeit �berpr�fen lassen.
		</p>
	</div>

	<div class="block">
		<h2>Details zum SEO-Friendly-Paket</h2>
		<p>
			Der erste Schritt Richtung Suchmaschinenoptimierung ist eine Analyse Ihrer Website/Web-Applikation.
			Darauf basierend erstellen wir einen Katalog mit Arbeiten, die ausgef�hrt werden sollen.
		</p>

		<ul>
			<li>Analyse des Optimierungspotenzials</li>
			<li>Einbau passender Titel, Keywords und Beschreibungen auf jeder Seite</li>					
			<li>Erstellen/Vervollst�nden der <a class="links" href="http://en.wikipedia.org/wiki/Sitemaps" target="_blank">"Google Sitemap"</a></li>
			<li>Kennzeichnen von Titeln und Untertiteln</li>
			<li>Optimieren der Ladegeschwindigkeit</li>
			<li>Umleiten ung�ltiger Seitenaufrufe</li>
			<li>Einsatz aussagekr�ftiger Verzeichnis- und Dateinamen</li>
			<li>Umprogrammieren des Codes, um h�chste Standard-Konformit�t zu erreichen</li> 
		</ul> 
	</div>

	<div class="block">
		<h2>Details zum Professional-SEO-Paket</h2>
		<p>				
			<em>F�r die Keyword-Analyse sind Faktoren wie Sprache, Region oder Konkurrenzangebote relevant.</em> 
			Wir werden Sie daher bitten uns einen kurzen Fragenkatalog zu beantworten.
			Danach gehts wie folgt weiter:
		</p> 

		<ul>
			<li>Mittels Keyword-Analyse popul�re und relevante Stichw�rter definieren</li>
			<li>Anpassen der Titel, Keywords und Seitenbeschreibungen</li>
			<li>Tipps f�rs Texten Ihrer Inhalte</li>
		</ul>
	</div>

	<div class="block">
		<h2>Bitte beachten Sie</h2>
		<ul>
			<li>
				Dieses Angebot bezieht sich auf Kunden mit einer bestehenden Website/Web-Applikation von HotFeet.
				Grund: Nur in diesem Fall kennt HotFeet den technischen Aufbau der angewendeten Web-L�sung und verf�gt �ber den Source-Code.
			</li>
			<li>
				HotFeet kann keine Garantien geben, ob und in welchem Umfang sich das Ranking (d.h. die Positionierung in
				Suchresultaten) Ihrer Website verbessert.
				Wichtige Faktoren wie z.B. die Anzahl und Qualit�t von externen Links oder das Ranking von Websites 
				der Konkurrenz k�nnen von HotFeet nicht beeinflusst werden.
			</li>
			<li>
				Suchmaschinenoptimierung ist ein Prozess, der Wochen oder Monate dauern kann. Der Grund 
				liegt darin, dass bei jedem Optimierungsschritt abgewartet und beobachtet werden muss, wie sich dieser
				auswirkt. Ob ein besseres Ranking erreicht wurde, zeigt sich erst nach einigen Monaten.
			</li>
		</ul>
	</div> 
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox highlight">
		<h2>SEO-Friendly Check</h2>
		<div class="extSubblock">
			<asp:TextBox id="Webaddress" cssclass="textbox" title="Adresse der Website *" runat="server" />
			<asp:RequiredFieldValidator controlToValidate="Webaddress" display="Dynamic" errorMessage="*" runat="server" />
		</div>
		<div class="extSubblock">
			<asp:TextBox id="ContactEmail" cssclass="textbox" title="Ihre Kontakt-E-Mail *" runat="server" />
			<asp:RegularExpressionValidator text="*" ControlToValidate="ContactEmail" 
				ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
			<asp:RequiredFieldValidator controlToValidate="ContactEmail" display="Dynamic" errorMessage="*" runat="server" />
		</div>
		<div id="SendButton" class="extSubblock" runat="server">
			<span id="Required">* ben�tigt</span>
			<asp:Button class="button" text="Anfragen" onclick="SendSeoFriendlyRequest" runat="server" />
		</div>
		<div id="Notification" class="systemNotification" visible="false" runat="server">
			Ihre Anfrage wurde abgeschickt. Wir werden in K�rze auf Sie zur�ckkommen.
		</div>		
	</div>


	<div class="sidebox">
		<h2>Erg�nzend zu den L�sungen</h2>
		<ul class="links">
			<li><a href="~/web-solutions/website.aspx" runat="server">Website/Homepage</a></li>
			<li><a href="~/web-solutions/mobile-website.aspx" runat="server">Smartphone-Website</a></li>
			<li><a href="~/web-solutions/webapplication.aspx" runat="server">Web-Applikation</a></li>
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
