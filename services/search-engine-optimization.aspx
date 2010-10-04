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
		<p>
			Zuwenige Besucher auf Ihrer Website?
		</p>
		<p>
			Sie werden von <a href="http://www.google.com" target="_blank" class="links">Google</a>, 
			<a href="http://www.bing.com" target="_blank" class="links">Bing</a> und Co. nicht aufgelistet oder 
			nur weit unten?
		</p>
		<p>
			<em>HotFeet optimiert Ihre Website/Webapplikation für Suchmaschinen.</em> 
		</p>

		<div class="section">
			<h2>Angebot</h2>
			<p>
				Zwei Angebote zur Suchmaschinenoptimierung (SEO) stehen unseren Kunden zur 
				Verfügung:
				<ul>
					<li>
						<em>SEO-Friendly Paket:</em> Dieses Angebot ist ausgerichtet auf Websites und Webapplikationen,
						die bei Ihrer Programmierung nicht explizit auf Suchmaschinen-Freundlichkeit 
						optimiert wurden.<br />
						Wir werden Sie nach geeigneten Keywords (Stichwörtern) für Ihre Seiten fragen und diese
						entsprechend einbauen.<br />
						Beim Professional SEO Paket werden wir geeignete Keywords für Sie suchen.
					</li><br />
					<li>
						<em>Professional SEO Paket:</em> Im Rahmen dieses Pakets wird HotFeet eine geeignete 
						Menge an Keywords (Stichwörtern) für jede Seite bestimmen. Diese Keywords spielen bei der Suche
						via Google und Co. eine wichtige Rolle.<br />
						Das SEO-Friendly Paket ist eine Voraussetzung für die Umsetzung des Professional SEO Pakets.
					</li>
				</ul>
			</p>
			<br />
			<p>
				Mit dem <em>SEO-Friendly Check</em> auf der rechten Seite können Sie <em>gratis und unverbindlich</em> 
				Ihre Website/Webapplikation durch HotFeet auf SEO-Freundlichkeit überprüfen lassen.
			</p>
		</div>

		<div class="section">
			<h2>Details zum SEO-Friendly Paket</h2>
			<p>
				Der erste Schritt zur Suchmaschinenoptimierung beginnt mit einer Analyse Ihrer Website/Webapplikation.
				Wir werden einen Katalog erstellen zu den Arbeiten, die ausgeführt werden sollen.
			</p>
			<p>
				Grundsätzlich werden folgende Aufgaben analysiert und nach Bedarf ausgeführt: 
			</p>
			<ul>
				<li>Analyse des Optimierungspotential</li>
				<li>Passende Titel und Meta Tags auf jeder Seite</li>					
				<li>Sitemap erstellen/vervollständigen</li>
				<li>Kennzeichnung von Titeln und Untertiteln</li>
				<li>Optimierung der Ladegeschwindigkeit</li>
				<li>Sinnvolle Umleitung ungültiger Seitenaufrufe</li>
				<li>Aussagekräftige Verzeichnisstruktur und Dateinamen</li>
				<li>Standardkonformer Code</li> 
			</ul> 
		</div>

		<div class="section">
			<h2>Details zum Professional SEO Paket</h2>
			<p>				
				<em>Für die Keyword-Analyse sind Faktoren wie Sprache, Region oder Konkurrenzangebote relevant.</em> 
				Wir werden Sie daher bitten uns einen kurzen Fragenkatalog zu beantworten. 
			</p> 
			<p>
				Aufgrund Ihrer Antworten werden wir folgende Aufgaben ausführen:
			</p>
			<ul>
				<li>Keyword-Analyse</li>
				<li>Anpassen der Titel und Meta Tags</li>
				<li>Gegebenenfalls Empfehlungen an den Kunden zur Verfassung von Texten</li>
			</ul>
		</div>

		<div class="section">
			<h2>Was Sie erwarten können</h2>
			<ul>
				<li>Termingerechte Implementierung dieses Service zum vereinbarten Preis</li>
				<li>Professionelles Management Ihres Projekts durch einen unserer Projekt Manager</li>
				<li>Übereinstimmung mit der firmenweiten Richtlinie zu den Rechten unserer Kunden</li>
			</ul>
		</div>

		<div class="section">
			<h2>Bitte beachten Sie</h2>
			<ul>
				<li>Dieses Angebot bezieht sich ausschliesslich auf Kunden mit einer bestehenden Website/Webapplikation 
				von HotFeet, da wir in diesem Fall bereits über den Source Code verfügen.</li>
				<li>HotFeet kann keine Garantien geben, ob und in welchem Umfang sich das Ranking (d.h. die Positionierung in
				Suchresultaten) Ihrer Website verbessert.
				Gewichtige Faktoren wie z.B. die Anzahl und Qualität von externen Links oder das Ranking von Websites 
				der Konkurrenz können von HotFeet nicht beeinflusst werden.</li>
				<li>Suchmaschinenoptimierung ist ein längerer Prozess der Wochen und Monate dauern kann. Der Grund 
				liegt darin, dass bei jedem Optimierungsschritt abgewartet und beobachtet werden muss, ob und wie sich dieser
				auswirkt. Das Endresultat, d.h. ein besseres Ranking, kann erst nach einigen Monaten ersichtlich werden.
				</li>
			</ul>
		</div> 
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
		<h2>Komplementär zu den Lösungen</h2>
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

