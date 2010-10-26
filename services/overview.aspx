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
		<!--<h2>Erg�nzender Service</h2>-->
		<p>
			HotFeet bietet verschiedene <em>Services als Erg�nzung zu den Web-L�sungen</em>.
			<!--Das schafft einen <em>Mehrwert bei gleichbleibendem Budget</em>.--> 
		</p>
	</div>
	
	<div class="block">
		<h2>Individuelle Bed�rfnisse</h2>
		<p>
			Wir bieten mehrere spezielle Services an, die den individuellen Bed�rfnissen unserer Kunden gerecht werden.
			Jeder Service unterliegt denselben strengen Qualit�tskontrollen, die wir auch bei Web-L�sungen anwenden.
		</p>
	</div>
	
	<div class="block">	
		<h2>Kreative L�sungsans�tze</h2>
		<p>
			Stehen Sie vor einer Herausforderung, f�r die Ihnen einfach keine praktikable L�sung einfallen will?
			Gerne liefern wir <em>kreative Inputs und diskutieren mit Ihnen m�gliche Umsetzungen</em>. 
			Wir freuen uns auf Ihre Kontaktaufnahme.
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<hf:SidebarNavigation id="SideNav" runat="server" />	
	</div>
</asp:Content>