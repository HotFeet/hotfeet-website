<%@ Page masterPageFile="~/global.master" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		var list = new List<Reference>();
		foreach(var rc in App.DB.ReferenceCategories)
			list.AddRange(rc.References.FindAll(r => !r.Hidden && r.DesignerUrl == "http://www.laemmlermettler.ch"));
		References.DataSource = list;
		References.DataBind();		
	} 
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>In guten Händen</h1>
	<p>
		Seit 2000 arbeiten wir sehr eng mit dem Grafikbüro Lämmler &amp; Mettler zusammen.
		Fabienne Lämmler und Nicole Mettler und ihr Team sind <em>Spezialistinnen für grafisches Design</em>.
		Unser gemeinsames Ziel für jede Web-Lösung ist ein <em>ästhetisches und benutzerfreundliches Design, technisch sauber umgesetzt.</em>  
	</p>

	<div class="block">
		<h2>Lämmler &amp; Mettler GmbH</h2>
		<div class="portrait">
			<img src="~/images/designer-laemmer-mettler.jpg" alt="Inhaberinnen des Grafikbüro Lämmler & Mettler" runat="server" /><br />
			<span class="caption">
				Fabienne Lämmler und Nicole Mettler<br />
				Inhaberinnen von L&amp;M
			</span>
		</div>
	
		<h3>Koordinaten</h3>
		<span class="address">
			Rötelstrasse 15<br />
			CH - 8006 Zürich<br />
		</span>
		<span class="phone">T +41 44 422 59 80</span><br />
		<span class="phone">F +41 44 422 59 81</span><br />
	
		<br />
	
		<a class="website links" href="http://www.laemmlermettler.ch" title="Zur Website">www.laemmlermettler.ch</a><br />
		<a class="mail links" href="mailto:info@laemmlermettler.ch" title="E-Mail senden">info@laemmlermettler.ch</a>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Designed by L&amp;M</h2>
		<hf:ReferencesSlideshow id="References" runat="server" />
	</div>
</asp:Content>