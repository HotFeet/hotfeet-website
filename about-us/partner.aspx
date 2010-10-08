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
		
	</p>
	<p>
		Seit 2000 arbeiten wir sehr erfolgreich mit dem Grafikb�ro L�mmler&Mettler zusammen.
		L�mmler&Mettler sind <em>Spezialistinnen im grafischen Design f�r Online Medien</em>.
		Unser gemeinsames Ziel f�r jede Webl�sung: ein <em>�sthetisches und benutzerfreundliches Design technisch sauber umgesetzt.</em>  
	</p>
	
	L�mmler&Mettler GmbH<br />
	<span class="address">
		R�telstrasse 15<br />
		CH - 8006 Z�rich<br />
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