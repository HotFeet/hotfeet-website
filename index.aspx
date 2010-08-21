<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<div class="box">
		<h1>Individuelle<br />L�sungen</h1>
		<ul class="links">
			<li><a href="#">Sehen Sie sich unser Portfolio an.</a></li>
		</ul>
	</div>
	<div class="box even">
		<h1>Transparente<br />Arbeitsweise</h1>
		<ul class="links">
			<li><a href="#">
				Lesen mehr �ber die Rechte unserer Kunden und wie wir diese implementieren
			</a></li>
		</ul>
	</div>
	<div class="box">
		<h1>Professionelles<br />Design</h1>
		<ul class="links">
			<li><a href="#">Lernen Sie unsere Grafikdesigner kennen.</a></li>
			<li><a href="#">Sehen Sie sich die Arbeiten der Designern an.</a></li>
		</ul>
	</div>
	<div class="box even">
		<h1>Zuverl�ssiges<br />Team</h1>
		<ul class="links">
			<li><a href="#">Einige Zahlen zu HotFeet.</a></li>
			<li><a href="#">Lernen Sie unser Management Team kennen.</a></li>
		</ul>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			beautifyBorder($("div.box"));
		});
	</script>

	
	<p>
		HotFeet ist eine etablierte Firma im Technopark Z�rich. Unsere St�rke liegt in der 
		Erstellung technisch ausgereifter Websites. Alle Projekte werden den Kundenw�nschen 
		entsprechend nach Mass erstellt.
	</p>
</asp:Content>
<asp:Content contentPlaceHolderId="Sidebar" runat="server">
	<h2>Referenzen</h2>
	<img class="box-element" src="images/reference_sample.png" title="www.sictech.ch" alt="Screenshot SicTech" />
	Sictech 2008<br />
	www.sictech.ch
</asp:Content>
