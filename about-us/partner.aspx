<%@ Page masterPageFile="~/global.master" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		var list = new List<Reference>();
		foreach(var rc in App.DB.ReferenceCategories)
			list.AddRange(rc.References.FindAll(r => r.DesignerUrl == "http://www.laemmlermettler.ch"));
		References.DataSource = list;
		References.DataBind();		
	} 
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>In guten H�nden</h1>
	<p>
		Seit 2000 arbeiten wir sehr eng mit dem Grafikb�ro L�mmler & Mettler zusammen.
		Fabienne L�mmler und Nicole Mettler und ihr Team sind <em>Spezialistinnen f�r grafisches Design</em>.
		Unser gemeinsames Ziel f�r jede Web-L�sung ist ein <em>�sthetisches und benutzerfreundliches Design, technisch sauber umgesetzt.</em>  
	</p>
	
	<div class="portrait">
		<img src="~/images/lm.jpg" alt="L�mmler&Mettler" runat="server" /><br />
		Fabienne L�mmler und Nicole Mettler<br />
		Inhaberinnen von L&amp;M
	</div>

	L�mmler & Mettler GmbH<br />
	<span class="address">
		R�telstrasse 15<br />
		CH - 8006 Z�rich<br />
	</span>
	<span class="phone">T +41 44 422 59 80</span><br />
	<span class="phone">F +41 44 422 59 81</span><br />

	<br />

	<a class="website links" href="http://www.laemmlermettler.ch">www.laemmlermettler.ch</a><br />
	<a class="mail links" href="mailto:info@laemmlermettler.ch">info@laemmlermettler.ch</a>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Designed by L&amp;M</h2>
		<hf:ReferencesSlideshow id="References" runat="server" />
	</div>
</asp:Content>