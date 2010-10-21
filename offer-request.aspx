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
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.backgroundBorder.js") %>'></script>	
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery-ui-1.8.4.custom.min.js") %>'></script>	
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/typeface-0.14.js") %>'></script>
	<script type="text/javascript">_typeface_js.configure({ disableSelection: true })</script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/univers_lt_std_45_light.typeface.js") %>' charset="UTF-8"></script>
</head>

<body>
<form runat="server">
	<ajaxToolkit:ToolkitScriptManager scriptMode="Release" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server" />
	<h1>Offertanfrage</h1>
	<img class="deco" src="~/images/paris.jpg" alt="Paris De Belder - Sales & Marketing Manager" runat="server" >
	<h3>
		Paris De Belder<br />
		Sales & Marketing Manager
	</h3>	
	<br /><br />
	<p>Kontaktieren Sie mich unverbindlich unter</p>
	<p>
		M +41 76 322 62 27<br />
		T +41 44 445 34 44<br />
		<a class="links" href="mailto:pdb@hotfeet.ch">pdb@hotfeet.ch</a><span>&nbsp; &nbsp; &nbsp;</span>
		<!-- <a class="links" href="javascript:;" onclick="$('#ContactForm').fadeIn('fast')">Webformular</a> -->
	</p>	
	
	<div class="block">
		<p>
			"Ich bin seit 10 Jahren erfolgreich im Webbusiness tätig.
			Ich spreche Deutsch, Französisch und Englisch.
			Sehr gerne bespreche ich mit Ihnen Ihr Anliegen und freue mich auf Ihre unverbindliche Kontaktanfrage." 
		</p>
	</div>

	<div id="ContactForm" class="block">
		<h2>Webformular</h2>
		<script type="text/javascript">
			$(document).ready(function() { $("h2").backgroundBorder(); });
		</script>
		
		<asp:PlaceHolder id="OfferRequestForm" runat="server">
		
			<div class="subblockLeft">
				<asp:TextBox id="MessageBox" cssClass="textbox" TextMode="multiline" Wrap="true" runat="server"/>
				<asp:RequiredFieldValidator controlToValidate="MessageBox" display="Dynamic" errorMessage="*" runat="server" />
				<ajaxToolkit:TextBoxWatermarkExtender id="WmMessage" targetControlID="MessageBox" watermarkCssClass="textbox watermark" watermarkText="Bitte beschreiben Sie Ihr Anliegen *" runat="server" />
			</div>
			
			<div class="subblockRight">
				<asp:RadioButtonList id="Gender" cssClass="subblockElement radio" repeatLayout="flow" repeatDirection="Horizontal" runat="server">
					<asp:ListItem text="Herr" value="Male" />
					<asp:ListItem text="Frau" value="Female" />
				</asp:RadioButtonList>
				<asp:RequiredFieldValidator controlToValidate="Gender" display="Dynamic" errorMessage="*" runat="server" />
				
				<asp:TextBox cssClass="subblockElement textbox" id="NameBox" runat="server" />
				<asp:RequiredFieldValidator controlToValidate="NameBox" display="Dynamic" errorMessage="*" runat="server" />
				<ajaxToolkit:TextBoxWatermarkExtender id="WmName" targetControlID="NameBox" watermarkCssClass="subblockElement textbox watermark" watermarkText="Vorname, Name *" runat="server" />
				
				<asp:TextBox cssClass="subblockElement textbox" id="EmailBox" runat="server" />
				<asp:RequiredFieldValidator controlToValidate="EmailBox" display="Dynamic" errorMessage="*" runat="server" />
				<ajaxToolkit:TextBoxWatermarkExtender id="WmEmail" targetControlID="EMailBox" watermarkCssClass="subblockElement textbox watermark" watermarkText="E-Mail *" runat="server" />

				<asp:TextBox cssClass="subblockElement textbox" id="PhoneBox" runat="server" />
				<ajaxToolkit:TextBoxWatermarkExtender id="WmPhone" targetControlID="PhoneBox" watermarkCssClass="subblockElement textbox watermark" watermarkText="Telefon" runat="server" />				
			</div>
			
			<div class="subblockLeft">
				<asp:Button id="SendRequest" class="button" text="Anfrage senden" runat="server" />
			</div>
			
			<div id="Remark" class="subblockRight">
				<span>* benötigt</span>
			</div>
			
		</asp:PlaceHolder>
	</div>

</form>
</body>
</html>
