<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	SiteMapNodeCollection mainChildren = SiteMap.RootNode.ChildNodes[0].ChildNodes;
	SiteMapNode[] serviceNodes = new SiteMapNode[] {
		mainChildren[1],
		mainChildren[2]
	};
	SideNav.DataSource = serviceNodes;
	SideNav.DataBind();
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Ein effizientes Team von Experten</h1>
	<div class="block">
		<h2>Eine kurze Geschichte über HotFeet</h2>
		<p>
			HotFeet wurde 1998 im Technopark Zürich als GmbH gegründet.
			Wir sind ein schlankes Team von ausgebildeten und gut aufeinander eingespielten Experten.
		</p>
		<p> 
			Um den Ursprung des Namen HotFeet ranken sich die verschiedensten Geschichten. Sicher ist, dass wir von HotFeet 
			alles andere als kalte Füsse bekommen, wenn es ums Finden ausgefeilter Web-Lösungen für unsere Kunden geht.
		</p>
	</div>

	<div class="block">
		<h2>Vision</h2>
		<p>
			Wir entwickeln <em>qualitativ hochstehende Web-Lösungen</em>.
			Ausserdem halten wir uns stets an die neusten gültigen <em>Industriestandards</em>
			und verwenden <em>"State of the Art"-Technologien</em>,
			um den hohen Ansprüchen unserer Kunden gerecht zu werden.
		</p>
	</div>

	<div class="block">
		<h2>Facts &amp; Figures</h2>
		<h3>Inhaber</h3>
		<ul>
			<li>Juraj Skripsky</li>
			<li>Paris De Belder</li>
			<li>Patrick La Barre</li>
		</ul>

		<h3>Kunden und Projekte</h3>
		<ul>
			<li>Kundenstamm: 60+</li>
			<li>Gehostete Web-Lösungen: 85</li>
			<li>Gehostete Domains: 141</li>
		</ul>

		<h3>Wachstum (im Vergleich zum Vorjahr)</h3>
		<table class="striped">
			<tr>
				<th />
				<th>Kundenzuwachs</th>
				<th>Umsatzsteigerung</th>
			</tr>
			<tr>
				<td>2009</td>
				<td>+11%</td>
				<td>+10%</td>
			</tr>
			<tr>
				<td>2008</td>
				<td>+13%</td>
				<td>+20%</td>
			</tr>
			<tr>
				<td>2007</td>
				<td>+26%</td>
				<td>+25%</td>
			</tr>
		</table>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<ul class="links">
			<li><a href="http://www.technopark.ch" target="_blank">Technopark Zürich</a></li>
		</ul>
	</div>
	
	<div class="sidebox">
		<asp:Repeater id="SideNav" runat="server">
			<ItemTemplate>
				<h2><%# Eval("Title") %></h2>
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
	</div>
</asp:Content>
