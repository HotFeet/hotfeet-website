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
	<link href="css/general-request.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery-1.4.2.min.js") %>'></script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.backgroundBorder.js") %>'></script>	
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/jquery.watermark.min.js") %>'></script>	
	<!--<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/global.js") %>'></script>-->	
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/typeface-0.14.js") %>'></script>
	<script type="text/javascript">_typeface_js.configure({ disableSelection: true })</script>
	<script type="text/javascript" src='<%= VirtualPathUtility.ToAbsolute("~/js/univers_lt_std_45_light.typeface.js") %>' charset="UTF-8"></script>
</head>

<script runat="server">

/* Sends out an email to HotFeet info with the information that has been entered. */
void Send(object o, EventArgs e) {
	if(!IsValid)
		return;
		
	string sender = EmailBox.Text.Trim();
	string subject = String.Format("Offer request from {0}", NameBox.Text); 
	string body = String.Format("Prefix: {0}", Gender.Text);	
	body += String.Format("\nName, Surname: {0}", NameBox.Text);
	body += String.Format("\nEmail: {0}", EmailBox.Text);
	body += String.Format("\nPhone: {0}", PhoneBox.Text);
	body += String.Format("\n\nRequest: {0}", MessageBox.Text);
	
	App.SendEmailToHfInfo(sender, subject, body);
	
	// Display the notification
	SendButton.Visible = false;
	MessageBox.Enabled = false;
	Gender.Enabled = false;
	NameBox.Enabled = false;
	EmailBox.Enabled = false;
	PhoneBox.Enabled = false;
	SentNotification.Visible = true;
}

</script>

<body>
<form runat="server">
	<h1>Generelle Anfrage</h1>
	<p>Sie haben Fragen, Anregungen oder Kritik? Z�gern Sie nicht, uns zu kontaktieren.</p>
	<p>
		T +41 44 445 34 44<br />
		<a class="links" href="mailto:info@hotfeet.ch">info@hotfeet.ch</a><span>&nbsp; &nbsp; &nbsp;</span>
	</p>	
	
	<div id="ContactForm" class="block">
		<h2>Anfrage</h2>
		<script type="text/javascript">
			//<![CDATA[
			// TODO: merge this with ~/js/global.js, create shared master file
			$(document).ready(function() {
				$("input[type='text'], textarea").each(function() {
					var title = $(this).attr("title");
					var carValue = $(this).val();
					if(title && (carValue == "" || carValue == title))
						$(this).watermark(title);
				});
				$("h2").backgroundBorder();
			});
			//]]>
		</script>
		
		<asp:PlaceHolder id="GeneralRequestForm" runat="server">
		
			<div id="EntryBlock" class="subblock">
				<div class="subblockLeft">
					<asp:TextBox id="MessageBox" cssClass="textbox" TextMode="multiline" Wrap="true" title="Bitte beschreiben Sie Ihr Anliegen *" runat="server"/>
					<asp:RequiredFieldValidator controlToValidate="MessageBox" display="Dynamic" errorMessage="*" runat="server" />
				</div>
				
				<div class="subblockRight">
					<asp:RadioButtonList id="Gender" cssClass="subblockElement radio" repeatLayout="flow" repeatDirection="Horizontal" runat="server">
						<asp:ListItem text="Herr " value="Male" />
						<asp:ListItem text="Frau" value="Female" />
					</asp:RadioButtonList>
					<asp:RequiredFieldValidator controlToValidate="Gender" display="Dynamic" errorMessage="*" runat="server" />
					
					<asp:TextBox cssClass="subblockElement textbox" id="NameBox" title="Vorname, Name *" runat="server" />
					<asp:RequiredFieldValidator controlToValidate="NameBox" display="Dynamic" errorMessage="*" runat="server" />
					
					<asp:TextBox cssClass="subblockElement textbox" id="EmailBox" title="E-Mail *" runat="server" />
					<asp:RequiredFieldValidator controlToValidate="EmailBox" display="Dynamic" errorMessage="*" runat="server" />
					<asp:RegularExpressionValidator text="*" ControlToValidate="EmailBox" 
						ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
				
					<asp:TextBox cssClass="subblockElement textbox" id="PhoneBox" title="Telefon" runat="server" />
				</div>
			</div>
			
			<div id="SendButton" class="subblock" runat="server">
				<span>* ben�tigt</span>
				<asp:Button class="button" text="Anfrage senden" onclick="Send" runat="server" />
			</div>
			
			<div id="SentNotification" class="subblock systemNotification" visible="false" runat="server">
				Besten Dank f�r Ihre Anfrage.	Wir werden in K�rze mit Ihnen in Verbindung treten.
			</div>
		</asp:PlaceHolder>
	</div>

</form>
</body>
</html>