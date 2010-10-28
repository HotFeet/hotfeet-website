<%@ Page masterPageFile="~/request.master" %>
<script runat="server">
// TODO: re-enable this code after the watermark problem is solved.
void SendSeoFriendlyRequest(object o, EventArgs e) {
	if(!IsValid)
		return;

	string sender = "website@hotfeet.ch"; //ContactEmail.Text;		
	string subject = "Request for SEO-Friendly Website Check";
	string body = String.Format("Request from {0} with email address {1} to check website {2} for SEO-Friendlyness.", Name.Text, ContactEmail.Text, Webaddress.Text);
	
	App.SendEmailToHfInfo(sender, subject, body);	
	
	// Display the notification
	SendButton.Visible = false;
	Webaddress.Enabled = false;
	ContactEmail.Enabled = false;	
	Notification.Visible = true;
}
</script>

<asp:Content contentPlaceHolderID="StyleSheets" runat="server">
	<link href="css/seo-request.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>

<asp:Content contentPlaceHolderID="Content" runat="server">
	<div>
		<h1>SEO-Friendly Check</h1>
		
		<div class="blockRight">
			<p>
				Wir werden Ihre Homepage/Website auf <em>Suchmaschinen-Freundlichkeit überprüfen.</em>
			</p>
			<p>
				Sie erhalten einen </em>Bericht mit den Ergebnissen der Analyse.</em> Der Inhalt umfasst:
			</p>
			<ol>
				<li>Kurze Zusammenfassung mit Empfehlungen</li>
				<li>Erklärung der Analyse</li>
				<li>Ergebnisse der Analyse</li>
			</ol>
			<p>
				Dieses Angebot ist <em>kostenlos und unverbindlich.</em>
			</p>
			
			<h2>Anfrage zur Überprüfung</h2>
			<asp:TextBox id="Name" cssclass="textbox required" title="Vorname, Name *" runat="server" />
			<asp:RequiredFieldValidator controlToValidate="Name" display="Dynamic" errorMessage="*" runat="server" />
			<ajaxToolkit:TextBoxWatermarkExtender id="WmName" targetControlID="Name" watermarkCssClass="textbox required watermark" watermarkText="Vorname, Name *" runat="server" />						
			
			<asp:TextBox id="Webaddress" cssclass="textbox required" title="Adresse Ihrer Homepage *" runat="server" />
			<asp:RequiredFieldValidator controlToValidate="Webaddress" display="Dynamic" errorMessage="*" runat="server" />
			<ajaxToolkit:TextBoxWatermarkExtender id="WmAddress" targetControlID="Webaddress" watermarkCssClass="textbox required watermark" watermarkText="Adresse Ihrer Homepage *" runat="server" />			
	
			<asp:TextBox id="ContactEmail" cssclass="textbox required email" title="Ihre Kontakt-E-Mail *" runat="server" />
			<asp:RequiredFieldValidator controlToValidate="ContactEmail" display="Dynamic" errorMessage="*" runat="server" />
			<asp:RegularExpressionValidator text="*" ControlToValidate="ContactEmail" 
				ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
			<ajaxToolkit:TextBoxWatermarkExtender id="WmContact" targetControlID="ContactEmail" watermarkCssClass="textbox required email watermark" watermarkText="Ihre Kontakt-E-Mail *" runat="server" />
	
			<div id="SendButton" runat="server">
				<asp:Button class="button" text="Anfragen" onclick="SendSeoFriendlyRequest" runat="server" />
				<span id="Required">* benötigt</span>
				<script type="text/javascript">
					$(document).ready(function() {
						$.validator.messages.required = "*";
						$.validator.messages.email = "*";
						$("form").validate({ignoreTitle: true});
					});
				</script>
			</div>
			<div id="Notification" class="systemNotification" visible="false" runat="server">
				Ihre Anfrage wurde abgeschickt. Wir werden in Kürze auf Sie zurückkommen.
			</div>
		</div>
		
		<div class="blockLeft">
			<img src="~/images/seo-teaser-speed-analysis.png" alt="SEO-Geschwindigkeits-Analyse" runat="server" />
			<span class="caption">Geschwindigkeits-Analyse: Ladezeiten der einzelnen Elemente in Google Chrome</span>
		</div>
			
	</div>
</asp:Content>
