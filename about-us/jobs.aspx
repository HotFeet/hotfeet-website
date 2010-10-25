<%@ Page masterPageFile="~/global.master" %>
<%@ Register tagPrefix="hf" tagName="SidebarNavigation" src="~/SidebarNavigation.ascx" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	SiteMapNodeCollection mainChildren = SiteMap.RootNode.ChildNodes[0].ChildNodes[4].ChildNodes;
	//TODO: use key-based node lookup
	SiteMapNode[] serviceNodes = new SiteMapNode[] { mainChildren[4] };
	SideNav.DataSource = (IList<SiteMapNode>)serviceNodes;
	SideNav.DataBind();
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Arbeiten bei HotFeet</h1>
	<div class="block">
		<p>
			HotFeet ist eine Spezialistin im dynamischen Web-Umfeld. Wenn Sie durch Ihre Erfahrung und 
			Ihren Einsatz zu unseren Lösungen beitragen können, sollten Sie uns kontaktieren.
		</p>
		<p>
			Falls Sie kein passendes Stellenangebot finden, können Sie uns Ihr Dossiert trotzdem gerne zusenden.
		</p>
	</div>
	<div class="block">
		<h2>Offene Stellen</h2>
		<ul class="links">
			<li><a href="~/about-us/jobs/marketing-sales-manager.aspx" runat="server">Marketing & Sales Manager</a></li>
			<li><a href="~/about-us/jobs/software-engineer-asp-net-csharp.aspx" runat="server">Software Engineer ASP.NET/C#</a></li>
		</ul>
	</div>
	<div class="block">		
		<h2>Spontane Bewerbung</h2>
		<p>
			Für eine Spontanbewerbung senden Sie bitte Ihr Dossier per E-Mail an 
			<a class="links" href='mailto:jobs@hotfeet.ch?subject=Bewerbung'>jobs@hotfeet.ch</a>.
		</p>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox highlight">
		<hf:SidebarNavigation id="SideNav" title="Offene Stellen" runat="server" />
	</div>
</asp:Content>