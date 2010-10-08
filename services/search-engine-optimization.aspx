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
	<h1>Gefunden werden</h1>
	
	<div class="block">
		<p>
			Zuwenige Besucher auf Ihrer Website? Sie werden von <a href="http://www.google.com" target="_blank" class="links">Google</a>, 
			<a href="http://www.bing.com" target="_blank" class="links">Bing</a> und Co. nicht aufgelistet oder 
			erscheinen erst weit unten in der Liste der Suchresultate?
		</p>
		<p>
			<em>HotFeet optimiert Ihre Website/Webapplikation für Suchmaschinen.</em> 
		</p>
	</div>

	<div class="block">
		<h2>Angebote</h2>
		<h3>SEO-Friendly Paket</h3>
		<p>
			Dieses Angebot ist auf Websites und Webapplikationen ausgerichtet,
			die bei Ihrer Programmierung nicht explizit auf Suchmaschinen-Freundlichkeit 
			optimiert wurden. Wir bauen 
			Wir werden Sie nach geeigneten Keywords (Stichwörtern) für Ihre Seiten fragen und diese
			entsprechend einbauen.<br />
			Beim Professional SEO Paket übernehmen wir die Suche nach geeigneten Keywords.
		</p>
	
		<h3>Professional SEO Paket</h3>
		<p>
			Im Rahmen dieses Pakets ermittelt HotFeet eine geeignete Liste an Keywords (Stichwörtern) für jede Seite.
			Diese Keywords spielen bei der Suche via Google und Co. eine wichtige Rolle.<br />
			Das SEO-Friendly Paket ist eine Voraussetzung für die Umsetzung des Professional SEO Pakets.
		</p>
		<br />
		<p>
			Mit dem <em>SEO-Friendly Check</em> auf der rechten Seite können Sie <em>gratis und unverbindlich</em> 
			Ihre Website/Webapplikation durch HotFeet auf SEO-Freundlichkeit überprüfen lassen.
		</p>
	</div>

	<div class="block">
		<h2>Details zum SEO-Friendly Paket</h2>
		<p>
			Der erste Schritt zur Suchmaschinenoptimierung beginnt mit einer Analyse Ihrer Website/Webapplikation.
			Wir erstellen einen Katalog an Arbeiten, die ausgeführt werden sollen.
		</p>

		<ul>
			<li>Analyse des Optimierungspotentials</li>
			<li>Einbau passender Titel, Keywords und Beschreibungen auf jeder Seite</li>					
			<li>Erstellung/Vervollständigung der Google Sitemap</li>
			<li>Kennzeichnung von Titeln und Untertiteln</li>
			<li>Optimierung der Ladegeschwindigkeit</li>
			<li>Umleitung ungültiger Seitenaufrufe</li>
			<li>Einsatz aussagekräftiger Verzeichnis- und Dateinamen</li>
			<li>Umbau des Codes um höchste Standardkonformität zu erreichen</li> 
		</ul> 
	</div>

	<div class="block">
		<h2>Details zum Professional SEO Paket</h2>
		<p>				
			<em>Für die Keyword-Analyse sind Faktoren wie Sprache, Region oder Konkurrenzangebote relevant.</em> 
			Wir werden Sie daher bitten uns einen kurzen Fragenkatalog zu beantworten. 
		</p> 

		<ul>
			<li>Bestimmung populärer und relevanter Stichwörter mittels Keyword-Analyse</li>
			<li>Anpassen der Titel, Keywords und Seitenbeschreibungen</li>
			<li>Abgabe von Empfehlungen an den Kunden zur Verfassung von Texten</li>
		</ul>
	</div>

	<div class="block">
		<h2>Bitte beachten Sie</h2>
		<ul>
			<li>
				Dieses Angebot bezieht sich ausschliesslich auf Kunden mit einer bestehenden Website/Webapplikation 
				von HotFeet, da wir nur in diesem Fall den technischen Aufbau der Lösung kennen und bereits über den Source Code verfügen.
			</li>
			<li>
				HotFeet kann keine Garantien geben, ob und in welchem Umfang sich das Ranking (d.h. die Positionierung in
				Suchresultaten) Ihrer Website verbessert.
				Wichtige Faktoren wie z.B. die Anzahl und Qualität von externen Links oder das Ranking von Websites 
				der Konkurrenz können von HotFeet nicht beeinflusst werden.
			</li>
			<li>
				Suchmaschinenoptimierung ist ein längerer Prozess der Wochen und Monate dauern kann. Der Grund 
				liegt darin, dass bei jedem Optimierungsschritt abgewartet und beobachtet werden muss, ob und wie sich dieser
				auswirkt. Das Endresultat, d.h. ein besseres Ranking, kann erst nach einigen Monaten ersichtlich werden.
			</li>
		</ul>
	</div> 
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox highlight">
		<h2>SEO-Friendly Check</h2>
		<asp:TextBox id="Webaddress" cssclass="textbox" runat="server" />
		<ajaxToolkit:TextBoxWatermarkExtender id="WM1" targetControlID="Webaddress" watermarkCssClass="textbox watermark" watermarkText="Adresse der Website" runat="server" />
		<asp:RequiredFieldValidator controlToValidate="Webaddress" display="Dynamic" errorMessage="Bitte ausfüllen." runat="server" />
		
		<asp:TextBox id="ContactEmail" cssclass="textbox" runat="server" />
		<ajaxToolkit:TextBoxWatermarkExtender id="WM2" targetControlID="ContactEmail" watermarkCssClass="textbox watermark" watermarkText="Ihre Kontakt-E-Mail" runat="server" />
		<asp:RegularExpressionValidator text="E-Mail Format falsch." ControlToValidate="ContactEmail" 
			ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
		<asp:RequiredFieldValidator controlToValidate="ContactEmail" display="Dynamic" errorMessage="Bitte ausfüllen." runat="server" />
		
		<asp:Button class="button" text="Anfragen" onclick="SendSeoFriendlyRequest" runat="server" />		
	</div>

	<div class="sidebox">
		<h2>Ergänzend zu den Lösungen</h2>
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
