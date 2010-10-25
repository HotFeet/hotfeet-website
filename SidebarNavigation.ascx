<%@ Control %>
<script runat="server">
IList<SiteMapNode> nodes;
string title;

public IList<SiteMapNode> DataSource {
	get { return nodes; }
	set { nodes = value; } 
}

public string Title {
	get { return title; }
	set { title = value; }
}

public override void DataBind() {
	SideNav.DataSource = nodes;
	SideNav.DataBind();
}
</script>
<asp:Repeater id="SideNav" runat="server">
	<ItemTemplate>
		<h2><%# title ?? (string)Eval("Title") %></h2>
		<ul class="links">
			<asp:Repeater dataSource='<%# Eval("ChildNodes") %>' runat="server">
				<ItemTemplate>
					<li><a href='<%# Eval("Url") %>' runat="server"><%# Eval("Title") %></a></li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</ItemTemplate>
	<SeparatorTemplate><br /></SeparatorTemplate>
</asp:Repeater>