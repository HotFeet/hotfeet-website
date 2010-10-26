<script runat="server">
// TODO: re-enable this code after the watermark problem is solved.
void SendSeoFriendlyRequest(object o, EventArgs e) {
	if(!IsValid)
		return;

	string sender = "website@hotfeet.ch"; //ContactEmail.Text;		
	string subject = "Request for SEO-Friendly Website Check";
	string body = String.Format("Request from {0} to check website {1} for SEO-Friendlyness.", sender, Webaddress.Text);
	
	App.SendEmailToHfInfo(sender, subject, body);	
	
	// Display the notification
	SendButton.Visible = false;
	Webaddress.Enabled = false;
	ContactEmail.Enabled = false;	
	Notification.Visible = true;
}
</script>

	<div class="sidebox highlight">
		<h2>SEO-Friendly Check</h2>
		<div class="extSubblock">
			<asp:TextBox id="Webaddress" cssclass="textbox required" title="Adresse der Website *" runat="server" />
			<!--<asp:RequiredFieldValidator controlToValidate="Webaddress" display="Dynamic" errorMessage="*" runat="server" />-->
		</div>
		<div class="extSubblock">
			<asp:TextBox id="ContactEmail" cssclass="textbox required email" title="Ihre Kontakt-E-Mail *" runat="server" />
			<!--<asp:RegularExpressionValidator text="*" ControlToValidate="ContactEmail" 
				ValidationExpression="^[a-zA-Z0-9_\-\.]+@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,4}))$" display="dynamic" runat="server" />
			<asp:RequiredFieldValidator controlToValidate="ContactEmail" display="Dynamic" errorMessage="*" runat="server" />-->
		</div>
		<div id="SendButton" class="extSubblock" runat="server">
			<span id="Required">* benötigt</span>
			<asp:Button class="button" text="Anfragen" onclick="SendSeoFriendlyRequest" runat="server" />
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