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
	<p>
		HotFeet ist eine Spezialistin im dynamischen Web-Umfeld. Wenn Sie mit Ihrer Erfahrung und 
		Ihrem Einsatz zu unseren L�sungen beitragen k�nnen, sollten Sie uns kontaktieren.
	</p>
	
	<!--<p>Selbst wenn Sie kein passendes Stellenangebot finden, k�nnen Sie uns gerne Ihr Dossier zusenden.</p>-->

	<div class="block">
		<h2>Offene Stellen</h2>
		<ul class="links">
			<li><a href="~/about-us/jobs/software-engineer-asp-net-csharp.aspx" runat="server">Software Engineer (ASP.NET/C#)</a></li>
		</ul>
	</div>
	<!--
	<div class="block">		
		<h2>Spontane Bewerbung</h2>
		<p>
			F�r eine Spontanbewerbung senden Sie bitte Ihr Dossier an 
			<a class="links" href='mailto:jobs@hotfeet.ch?subject=Bewerbung'>jobs@hotfeet.ch</a>.
		</p>
	</div>
	-->
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox highlight">
		<hf:SidebarNavigation id="SideNav" title="Offene Stellen" runat="server" />
	</div>
</asp:Content>
