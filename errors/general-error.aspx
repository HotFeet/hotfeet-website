<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	Response.StatusCode = 500;
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Fehler</h1>
	<div class="block">
		<p>
			Beim Laden der Seite ist ein Fehler aufgetreten.<br />
			Ein automatischer Fehler-Bericht wurde an den Webmaster gesandt. 
		</p>
	</div>
</asp:Content>
