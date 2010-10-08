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
	<h1>In guten Händen</h1>
	<p>
		
	</p>
	<p>
		Seit 2000 arbeiten wir sehr erfolgreich mit dem Grafikbüro Lämmler&Mettler zusammen.
		Lämmler&Mettler sind <em>Spezialistinnen im grafischen Design für Online Medien</em>.
		Unser gemeinsames Ziel für jede Weblösung: ein <em>ästhetisches und benutzerfreundliches Design technisch sauber umgesetzt.</em>  
	</p>
	
	Lämmler&Mettler GmbH<br />
	<span class="address">
		Rötelstrasse 15<br />
		CH - 8006 Zürich<br />
	</span>
	<span class="phone">T +41 44 422 59 80</span><br />
	
	<a class="website links" href="http://www.laemmlermettler.ch">www.laemmlermettler.ch</a><br />
	<a class="mail links" href="mailto:info@laemmlermettler.ch">info@laemmlermettler.ch</a>		
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Designed by L&amp;M</h2>
		<hf:ReferencesSlideshow id="References" runat="server" />
	</div>
</asp:Content>