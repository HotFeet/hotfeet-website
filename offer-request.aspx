<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Offertanfrage</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta name="copyright" content="&copy; Copyright 2010 HotFeet GmbH, Zurich, Switzerland" />
	<meta name="author" content="HotFeet Gmbh"/>
	<meta name="publisher" content="HotFeet GmbH" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="email" content="info@hotfeet.ch" />
	<meta name="robots" content="" />
	<meta name="language" content="de" />
	<link href="css/global.css" type="text/css" rel="stylesheet" media="screen" />
	<link href="css/offer-request.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery-1.4.2.min.js") %>'></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery-ui-1.8.4.custom.min.js") %>'></script>	
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/typeface-0.14.js") %>'></script>
	<script type="text/javascript">_typeface_js.configure({ disableSelection: true })</script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/univers_lt_std_45_light.typeface.js") %>' charset="UTF-8"></script>
</head>

<body>
<form runat="server">
	<h1 class="typeface-js">Offertanfrage</h1>
	<img class="deco" src="~/images/paris.jpg" alt="Paris De Belder - Sales & Marketing Manager" runat="server" >
	<h3>
		Paris De Belder<br />
		Sales & Marketing Manager
	</h3>	
	<br /><br />
	<p>Kontaktieren Sie mich unverbindlich unter</p>
	<p>
		M +41 76 322 62 27<br />
		T +41 44 445 34 44<br/>
		<a class="links" href="mailto:pdb@hotfeet.ch">pdb@hotfeet.ch</a><span>&nbsp; &nbsp; &nbsp;</span>
		<a class="links" href="javascript:;" onclick="$('#ContactForm').fadeIn('fast')">Webformular</a>
	</p>	
	
	<div class="block">
		<p>
			"Ich bin seit 10 Jahren erfolgreich im Webbusiness tätig. Sehr gerne bespreche ich 
			mit Ihnen Ihr Anliege.
		</p>
		<p>
			Kontaktieren Sie mich unverbindlich. Ich spreche Deutsch, Französisch und English."
		</p>
	</div>

	<div id="ContactForm" class="block">
		<h2>Webform</h2>
	</div>

</form>
</body>
</html>
