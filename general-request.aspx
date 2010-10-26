<%@ Page masterPageFile="~/request.master" %>
<script runat="server">
/* Sends out an email to HotFeet info with the information that has been entered. */
void Send(object o, EventArgs e) {
	if(!IsValid)
		return;
		
	string sender = "website@hotfeet.ch"; //EmailBox.Text.Trim();
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
<asp:Content contentPlaceHolderID="StyleSheets" runat="server">
	<link href="css/general-request.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content contentPlaceHolderID="Content" runat="server">
	<h1>Allgemeine Anfrage</h1>
	<p>Sie haben Fragen, Anregungen oder Kritik? Zögern Sie nicht, uns zu kontaktieren.</p>
	<p>
		T +41 44 445 34 44<br />
		<a class="links" href="mailto:info@hotfeet.ch">info@hotfeet.ch</a><span>&nbsp; &nbsp; &nbsp;</span>
	</p>	
	
	<div id="ContactForm" class="block">
		<h2>Anfrage</h2>
		<asp:PlaceHolder id="GeneralRequestForm" runat="server">
			<div id="EntryBlock" class="subblock">
				<div class="subblockLeft">
					<asp:TextBox id="MessageBox" cssClass="textbox MessageBox" TextMode="multiline" Wrap="true" title="Bitte beschreiben Sie Ihr Anliegen *" runat="server"/>
					<asp:RequiredFieldValidator controlToValidate="MessageBox" display="Dynamic" errorMessage="*" runat="server" />
					<ajaxToolkit:TextBoxWatermarkExtender id="WmMessage" targetControlID="MessageBox" watermarkCssClass="MessageBox textbox watermark" watermarkText="Bitte beschreiben Sie Ihr Anliegen *" runat="server" />
				</div>
				
				<div class="subblockRight">
					<asp:RadioButtonList id="Gender" cssClass="subblockElement radio" repeatLayout="flow" repeatDirection="Horizontal" runat="server">
						<asp:ListItem text="Herr " value="Male" />
						<asp:ListItem text="Frau" value="Female" />
					</asp:RadioButtonList>
					<asp:RequiredFieldValidator controlToValidate="Gender" display="Dynamic" errorMessage="*" runat="server" />
					
					<asp:TextBox cssClass="subblockElement textbox" id="NameBox" title="Vorname, Name *" runat="server" />
					<asp:RequiredFieldValidator controlToValidate="NameBox" display="Dynamic" errorMessage="*" runat="server" />
					<ajaxToolkit:TextBoxWatermarkExtender id="WmName" targetControlID="NameBox" watermarkCssClass="subblockElement textbox watermark" watermarkText="Vorname, Name *" runat="server" />
					
					<asp:TextBox cssClass="subblockElement textbox" id="EmailBox" title="E-Mail *" runat="server" />
					<asp:RequiredFieldValidator controlToValidate="EmailBox" display="Dynamic" errorMessage="*" runat="server" />
					<asp:RegularExpressionValidator text="*" ControlToValidate="EmailBox" 
						ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
					<ajaxToolkit:TextBoxWatermarkExtender id="WmEmail" targetControlID="EmailBox" watermarkCssClass="subblockElement textbox watermark" watermarkText="E-Mail *" runat="server" />
				
					<asp:TextBox cssClass="subblockElement textbox" id="PhoneBox" title="Telefon" runat="server" />
					<ajaxToolkit:TextBoxWatermarkExtender id="WmPhone" targetControlID="PhoneBox" watermarkCssClass="subblockElement textbox watermark" watermarkText="Telefon" runat="server" />
				</div>
			</div>
			
			<div id="SendButton" class="subblock SendButton" runat="server">
				<span>* benötigt</span>
				<asp:Button class="button" text="Anfrage senden" onclick="Send" runat="server" />
			</div>
			
			<div id="SentNotification" class="subblock systemNotification" visible="false" runat="server">
				Besten Dank für Ihre Anfrage.	Wir werden in Kürze mit Ihnen in Verbindung treten.
			</div>
		</asp:PlaceHolder>
	</div>
</asp:Content>