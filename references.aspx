<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		Categories.DataSource = App.DB.ReferenceCategories;
		Categories.DataBind();
	}
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<ul id="Sectors">
		<asp:Repeater id="Categories" runat="server">
			<ItemTemplate>
				<li>
					<h1><%# Eval("Name") %></h1>
					<ul class="customers">
						<asp:Repeater dataSource='<%# Eval("References") %>' runat="server">
							<ItemTemplate>
								<li>
									<a href="#"><%# Eval("Name") %></a>
								</li>
							</ItemTemplate>
						</asp:Repeater>
					</ul>			
				</li>
			</ItemTemplate>
		</asp:Repeater>
<!--
		<li>
			<h1>Kunst</h1>
			<ul class="customers">
				<li><a href="#">Ars et Aurum</a></li>
				<li><a href="#">Buch & Kunst Nievergelt</a></li>
				<li><a href="#">Lämmler & Mettler</a></li>
				<li><a href="#">Erny, Vetsch Kommunikation</a></li>
				<li><a href="#">Fischer Auktionen Luzern</a></li>
				<li><a href="#">Auktionshaus Dobiaschofsky</a></li>
				<li><a href="#">Schuler Auktionen</a></li>
				<li><a href="#">Howard Griffiths</a></li>
				<li><a href="#">Kevin Griffiths</a></li>
				<li><a href="#">Auktionshaus Germann</a></li>
				<li><a href="#">Themaposter</a></li>
				<li><a href="#">Glam Lash</a></li>
				<li><a href="#">Comité Michel Sima</a></li>
				<li><a href="#">Frauchiger Design</a></li>
				<li><a href="#">The Young Collectors Club</a></li>
			</ul>
		</li>
		<li>
			<h1>Medizin</h1>
			<ul class="customers">
				<li><a href="#">Ars et Aurum</a></li>
				<li><a href="#">Buch & Kunst Nievergelt</a></li>
				<li><a href="#">Lämmler & Mettler</a></li>
			</ul>
		</li>
		<li>
			<h1>Bildung</h1>
			<ul class="customers">
				<li><a href="#">Ars et Aurum</a></li>
				<li><a href="#">Buch & Kunst Nievergelt</a></li>
				<li><a href="#">Lämmler & Mettler</a></li>
			</ul>
		</li>
		<li>
			<h1>Immobilien</h1>
			<ul class="customers">
				<li><a href="#">Ars et Aurum</a></li>
				<li><a href="#">Buch & Kunst Nievergelt</a></li>
				<li><a href="#">Lämmler & Mettler</a></li>
			</ul>
		</li>
	</ul>
-->
</asp:Content>
<asp:Content contentPlaceHolderId="Sidebar" runat="server">
</asp:Content>