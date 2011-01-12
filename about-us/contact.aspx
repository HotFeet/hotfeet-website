<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Herzlich willkommen bei HotFeet</h1>
	
	<div class="block">
		<h2>Kontaktformulare</h2>
		<ul class="links">
			<li><a class="popup" href="~/offer-request.aspx" runat="server">Unverbindliche Offertanfrage</a></li>
			<li><a class="popup" href="~/general-request.aspx" runat="server">Allgemeine Anfrage</a></li>
		</ul>
	</div>
	
	<div class="block">
		<h2>Koordinaten</h2>

		<a class="popup Map" title="Klick für interaktive Karte" href="http://maps.google.de/maps?f=q&amp;source=s_q&amp;hl=de&amp;geocode=&amp;q=Technoparkstrasse+1,+Z%C3%BCrich,+Schweiz&amp;sll=47.38991,8.516051&amp;sspn=0.002586,0.008256&amp;ie=UTF8&amp;hq=&amp;hnear=Technoparkstrasse+1,+8005+Z%C3%BCrich,+Schweiz&amp;ll=47.389909,8.516049&amp;spn=0.020338,0.036478&amp;z=14&amp;iwloc=A&amp;output=embed#w900" runat="server">
			<img class="spin" src="http://maps.google.com/maps/api/staticmap?center=Technoparkstrasse+1,+8004+Zurich&zoom=13&size=250x209&markers=size:mid|color:blue|Technoparkstrasse+1,8005+Zurich&sensor=false" alt="Unser Standort auf der Karte" runat="server" />
		</a>

		<p class="vcard">
			<span>HotFeet GmbH</span>
			<a class="fn org url" href="http://www.hotfeet.ch">HotFeet GmbH</a>
			<span class="adr work">
				<span class="street-address">Technoparkstrasse 1</span>
				<span class="postal-code">8005</span>
				<span class="locality">Z&uuml;rich</span>
				<span class="region">Z&uuml;rich</span>
				<span class="country-name">Schweiz</span>
			</span>
			<abbr class="geo" title="47.389934;8.516312">Office</abbr>
			<br />
			T <span class="tel"><span class="type">Work</span>+41 44 445 34 44</span><br />
			F <span class="tel"><span class="type">Fax</span>+41 44 445 34 40</span><br />
			<br />
			<a class="links email" href="mailto:info@hotfeet.ch">info@hotfeet.ch</a><br />
			<img class="logo" src="http://www.hotfeet.ch/images/logo_hotfeet_gmbh.png" alt="Logo HotFeet GmbH" />
			<br />
			<a class="links" href="https://www.xing.com/companies/hotfeetgmbh">Xing Profil</a><br />
			<a class="links" href="http://www.linkedin.com/company/hotfeet-gmbh">LinkedIn Profil</a>
		</p>
	</div>

	<div class="block">
		<h2>Anreise</h2>
		
		<h3>Anreise mit dem Tram</h3>
		<p>
			Ab Zürich Hauptbahnhof mit dem Tram Nr. 4 (Richtung Werdhölzli) bis Haltestelle Förrlibuckstrasse. 
			Von dort weiter auf der Technoparkstrasse.
		</p>

		<h3>Anreise mit der S-Bahn</h3>
		<p>	
			Vom Hauptbahnhof mit der S-Bahn auf Gleis 21/22 bis Station Hardbrücke. Richtung Escher-Wyss-Platz bis 
			Pfingstweidstrasse [100m], dort links weiter bis zum Technopark [300m].
		</p>

		<h3>Anreise mit privatem Verkehrsmittel</h3>
		<p>
			Der Technopark liegt an der Ausfallstrasse Richtung Bern/Basel.
			Eine sehr limitierte Anzahl Parkplätze gibt es in näherer Umgebung in den Accor- und ETAP-Hotels sowie im Parkhaus Puls 5.
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Unsere Koordinaten</h2>
		<a class="links" href="http://maps.google.ch/maps?f=q&source=s_q&hl=de&geocode=&q=Hot+Feet+Gmbh,+technoparkstrasse+1,+8005+Z%C3%BCrich&sll=46.362093,9.036255&sspn=5.368,16.907959&ie=UTF8&cd=1&hq=Hot+Feet+Gmbh,&hnear=Technoparkstrasse+1,+8005+Z%C3%BCrich&z=16" runat="server">Anzeigen in Google Maps</a>
	</div>
</asp:Content>
