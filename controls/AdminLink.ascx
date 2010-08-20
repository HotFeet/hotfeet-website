<%@ Control className="AdminLink" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	Visible = (bool)Session["Admin"];
}

public string HRef {
	get { return Link.HRef; }
	set { Link.HRef = value; }
}

public int Width {
	get { return Link.Width; }
	set { Link.Width = value; }
}

public int Height {
	get { return Link.Height; }
	set { Link.Height = value; }
}

public string Text {
	get { return Titel.Text; }
	set { Titel.Text = value; }
}
</script>
<hf:WindowLink id='Link'  center='true' HasScrollBars='true' class='adminLink'
	IsResizable='true' width="800" height="670" WindowName='Administrierung' runat='server'>
	<asp:Literal id="Titel" runat="server" />
</hf:WindowLink>