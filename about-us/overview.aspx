<%@ Page masterPageFile="~/global.master" %>
<%@ Register tagPrefix="hf" tagName="SidebarNavigation" src="~/SidebarNavigation.ascx" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	SiteMapNodeCollection mainChildren = SiteMap.RootNode.ChildNodes[0].ChildNodes;
	//TODO: use key-based node lookup
	SiteMapNode[] serviceNodes = new SiteMapNode[] {
		mainChildren[1],
		mainChildren[2]
	};
	SideNav.DataSource = (IList<SiteMapNode>)serviceNodes;
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
			Wir entwickeln <em>qualitativ hochstehende Web-Lösungen nach Mass</em>.
			Ausserdem halten wir uns stets an die neusten gültigen <em>Industriestandards</em>
			und verwenden <em>"State of the Art"-Technologien</em>,
			um den hohen Ansprüchen unserer Kunden gerecht zu werden.
		</p>
	</div>

	<div class="block">
		<h2>Facts &amp; Figures</h2>

		<h3>Kunden und Projekte</h3>
		<ul>
			<li>Kundenstamm: 60+</li>
			<li>Gehostete Web-Lösungen: 85</li>
			<li>Gehostete Domains: 141</li>
		</ul>

		<h3>Wachstum (im Vergleich zum Vorjahr)</h3>
		<table class="striped" summary="Zahlen zu Kundenzuwachs und Umsatzsteigerung in den Jahren 2007-2009">
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
			<li><a href="http://www.technopark.ch">Technopark Zürich</a></li>
		</ul>
	</div>
	
	<div class="sidebox">
		<hf:SidebarNavigation id="SideNav" runat="server" />
	</div>
</asp:Content>
