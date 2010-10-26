<%@ Page masterPageFile="~/global.master" %>
<%@ Register tagPrefix="hf" tagName="SidebarNavigation" src="~/SidebarNavigation.ascx" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	SiteMapNodeCollection mainChildren = SiteMap.RootNode.ChildNodes[0].ChildNodes;
	//TODO: use key-based node lookup
	SiteMapNode[] serviceNodes = new SiteMapNode[] { mainChildren[1] };
	SideNav.DataSource = (IList<SiteMapNode>)serviceNodes;
	SideNav.DataBind();
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Mehrwert durch mehr Service</h1>
	
	<div class="block">
		<!--<h2>Ergänzender Service</h2>-->
		<p>
			HotFeet bietet verschiedene <em>Services als Ergänzung zu den Web-Lösungen</em>.
			<!--Das schafft einen <em>Mehrwert bei gleichbleibendem Budget</em>.--> 
		</p>
	</div>
	
	<div class="block">
		<h2>Individuelle Bedürfnisse</h2>
		<p>
			Wir bieten mehrere spezielle Services an, die den individuellen Bedürfnissen unserer Kunden gerecht werden.
			Jeder Service unterliegt denselben strengen Qualitätskontrollen, die wir auch bei Web-Lösungen anwenden.
		</p>
	</div>
	
	<div class="block">	
		<h2>Kreative Lösungsansätze</h2>
		<p>
			Stehen Sie vor einer Herausforderung, für die Ihnen einfach keine praktikable Lösung einfallen will?
			Gerne liefern wir <em>kreative Inputs und diskutieren mit Ihnen mögliche Umsetzungen</em>. 
			Wir freuen uns auf Ihre Kontaktaufnahme.
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<hf:SidebarNavigation id="SideNav" runat="server" />	
	</div>
</asp:Content>