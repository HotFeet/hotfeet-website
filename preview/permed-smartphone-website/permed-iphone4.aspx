<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Vorschau - Permed auf dem iPhone 4</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta name="copyright" content="&copy; Copyright 2010 HotFeet GmbH, Zurich, Switzerland" />
	<meta name="author" content="HotFeet Gmbh"/>
	<meta name="publisher" content="HotFeet GmbH" />
	<meta name="description" content="Die mobile Variante der Permed Website, angepasst für das iPhone 4, Android Geräte und andere Smartphones." />
	<meta name="keywords" content="Permed, Smartphone-Website" />
	<meta name="robots" content="" />
	<meta name="language" content="de" />
	<link href="~/css/global.css" type="text/css" rel="stylesheet" media="screen" />
	<link href="css/permed-iphone4.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.min.js") %>'></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.plugins.min.js") %>'></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.custom-plugins.js") %>'></script>
</head>
<body>
<form runat="server">
	<ajaxToolkit:ToolkitScriptManager scriptMode="Release" EnableScriptGlobalization="false" EnableScriptLocalization="false" runat="server" />

	<h1>Die neue Permed Smartphone-Website auf dem iPhone 4</h1>
	
	<div class="inline right">
		<h2 class="firstH2">Besonderes</h2>
		<ul>
			<li>grosszügige Links für Touch-Screens (<em>grosse aktive Fläche</em> für Navigation per Finger)</li>      	 
      	<li>Adressen sind direkt mit <em>Google Maps</em> verbunden</li> 
      	<li>E-Mail- und Web-Links im Text werden <em>speziell hervorgehoben</em></li> 
      	<li>nahtlose Unterstützung der Landscape/Querformat-Anzeige</li>
      	<li><em>stark optimiert</em> bezüglich Seitengrösse und Ladegeschwindigkeit</li>
      	<li>eigenes Bookmark-Icon mit Permed-Logo</li>
      	<li><em>manuell retouchiertes Logo</em> für eine perfekte Anzeige auf Touch-Screens</li>
		</ul>
		<h2>Link</h2>
		<a class="links" href="http://m.permed.ch">m.permed.ch</a> (Smartphones)	
	</div>
	<div class="inline left">
		<img src="images/permed-iphone4-big.png" alt="Screenshot: Permed auf dem iPhone 4" />
		<span class="caption">Permeds Smartphone-Website auf dem iPhone 4 (Screenshot)</span>
	</div>	
	
	<script type="text/javascript">
		//<![CDATA[
		$(document).ready(function() {
			$("h2").backgroundBorder();
		});
		//]]>
	</script>
</form>
</body>
</html>
