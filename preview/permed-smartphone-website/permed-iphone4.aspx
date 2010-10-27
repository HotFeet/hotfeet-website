<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Vorschau - Permed auf dem iPhone 4</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta name="copyright" content="&copy; Copyright 2010 HotFeet GmbH, Zurich, Switzerland" />
	<meta name="author" content="HotFeet Gmbh"/>
	<meta name="publisher" content="HotFeet GmbH" />
	<meta name="description" content="Permed auf dem iPhone 4" />
	<meta name="keywords" content="Permed, Smartphone-Website" />
	<meta name="email" content="info@hotfeet.ch" />
	<meta name="robots" content="" />
	<meta name="language" content="de" />
	<link href="../../css/global.css" type="text/css" rel="stylesheet" media="screen" />
	<link href="css/permed-iphone4.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/typeface.univers.js") %>' charset="UTF-8"></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery-1.4.2.min.js") %>'></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.plugins.min.js") %>'></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.custom-plugins.js") %>'></script>
</head>
<body>
<form runat="server">
	<ajaxToolkit:ToolkitScriptManager scriptMode="Release" EnableScriptGlobalization="false" EnableScriptLocalization="false" runat="server" />

	<h1>Vorschau:<br />Die neue Permed Smartphone-Website auf dem iPhone 4</h1>
	
	<div class="inline right">
		<h2 class="firstH2">Besonderes</h2>
		<ul>
			<li>grossz�gige Links f�r Touch-Screens (<em>grosse aktive Fl�che</em> f�r Navigation per Finger)</li>      	 
      	<li>Adressen sind direkt mit <em>Google Maps</em> verbunden</li> 
      	<li>E-Mail- und Web-Links im Text werden <em>speziell hervorgehoben</em></li> 
      	<li>nahtlose Unterst�tzung der Landscape/Querformat-Anzeige</li>
      	<li><em>stark optimiert</em> bez�glich Seitengr�sse und Ladegeschwindigkeit</li>
      	<li>eigenes Bookmark-Icon mit Permed-Logo</li>
      	<li><em>manuell retouchiertes Logo</em> f�r eine perfekte Anzeige auf Touch-Screens</li>
		</ul>
		<h2>Verf�gbarkeit</h2>
		Vor Jahresende. Zurzeit in der Testphase.	
	</div>
	<div class="inline left">
		<img src="~/preview/permed-smartphone-website/images/permed-iphone4-big.png" alt="Screenshot: Permed auf dem iPhone 4" runat="server" />
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