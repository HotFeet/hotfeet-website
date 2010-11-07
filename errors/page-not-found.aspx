<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	Response.StatusCode = 404;
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Seite nicht gefunden</h1>

	<div class="block">
		<p>
			Die angeforderte Seite existiert leider nicht oder nicht mehr.<br />
			Wahrscheinlich wurde sie gelöscht oder umbenannt.
		</p>
		<p>
			Bei Fragen wenden Sie sich bitte an 
			<a class="links" href="mailto:webmaster@hotfeet.ch">webmaster@hotfeet.ch</a>. 
		</p>
	</div>
</asp:Content>