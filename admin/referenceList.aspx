<%@ Page masterPageFile="list.master" EnableEventValidation="false"  %>
<script runat="server">
IList list;

void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		foreach(ProjectCategory cat in App.DB.ProjectCategories)
			categories.Items.Add(new ListItem(cat.Name, DataStore.GetID(cat).ToString()));
		categories.SelectedIndex = 0;

		if(Request["catid"] != null)
			categories.SelectedValue = Request["catid"];
	}

	list = ((ProjectCategory)DataStore.Get(categories.SelectedValue)).Projects;

	if(!IsPostBack)
		dbBind(null, null);
}

void Edit(object o, EventArgs e) {
	object obj;
	if(((Control)o).ID == "InsertButton")
		obj = new Project();
	else
		obj = list[RepeaterHelper.IndexOf(o, 0)];
	
	Response.Redirect(String.Format("projectEditor.aspx?catid={0}&oid={1}", 
		categories.SelectedValue, DataStore.GetID(obj)));
}

void dbBind(object o, EventArgs e) {
	dbBind();
}

string FeaturedOnEntry(Project p) {
	return p.FeaturedOnEntry? "auf Einstiegssite" : "";
}

void SetupLink(object o, RepeaterItemEventArgs e) {
	DataObject dataObj = (DataObject)e.Item.FindControl("Obj");
	if(dataObj != null)  {
		Project project = (Project)dataObj.Object;
		int OID = DataStore.GetID(project);
		string partialLink = String.Format("backTo={0}&catid={1}&presentationoid={2}",
			"projectList.aspx",
			categories.SelectedValue,
			OID
		);

		HtmlAnchor editPages = (HtmlAnchor)e.Item.FindControl("EditPages");
		editPages.HRef = "pageList.aspx?" + partialLink;
		editPages.InnerHtml = "Seiten editieren (" + project.Pages.Count + ")";
	}
}

// methods below this point are general
void dbBind() {
	List.DataSource = list;
	List.DataBind();
	
	if(List.Items.Count > 0) {
		List.Items[0].FindControl("UpButton").Visible = false;
		List.Items[0].FindControl("UpToStartButton").Visible = false;
		List.Items[List.Items.Count - 1].FindControl("DownButton").Visible = false;
		List.Items[List.Items.Count - 1].FindControl("DownToEndButton").Visible = false;
	}		
}

void Delete(object o, EventArgs e) {
	int pos = RepeaterHelper.IndexOf(o, 0);
	list.RemoveAt(pos);
	DataStore.MarkChanged();
	dbBind();
}

void MovePos (object sender, ImageClickEventArgs e){
	int pos = RepeaterHelper.IndexOf(sender, 0);
	object obj = list[pos];
	list.RemoveAt(pos);
	switch(((Control)sender).ID) {
		case "UpButton": pos -= 1; break;
		case "DownButton": pos += 1; break;
		case "UpToStartButton": pos = 0; break;
		case "DownToEndButton": pos = list.Count; break;
	}
	list.Insert(pos, obj);
	DataStore.MarkChanged();
	dbBind();
}
</script>
<asp:Content contentPlaceHolderID="Content" runat="server">
	<div class="title">Projekte</div>
	<div>
		<label>Kategorie</label>
		<asp:DropDownList id='categories' autoPostBack="true" onSelectedIndexChanged="dbBind" runat='server' />
	</div><br /><br />
	<asp:Button id='InsertButton' onclick='Edit' text='Neuen Eintrag erstellen...' runat='server'  /><br /><br />
	<asp:Repeater id='List' onItemDataBound="SetupLink" runat='server'>
		<HeaderTemplate><table></HeaderTemplate>
		<ItemTemplate>	
			<hf:DataObject id="Obj" object="<%# Container.DataItem %>" runat="server">		
			<tr>			
				<td>
					<%# ((Project)Container.DataItem).Title %>
				</td>	
				<td>
					<%# FeaturedOnEntry((Project)Container.DataItem) %>
				</td>		
				<td>
					<a id='EditPages' runat='server' />
				</td>								
				<td class="actions">
					<asp:ImageButton cssClass="delButton" id="DeleteButton" onclick="Delete" ImageUrl='images/delete.png' ToolTip='löschen' runat='server' />
					<asp:ImageButton onclick='Edit' ImageUrl='images/edit.png' ToolTip='bearbeiten' runat='server' />
					<ajaxToolkit:ConfirmButtonExtender TargetControlID="DeleteButton" ConfirmText="Wollen Sie diesen Eintrag wirklich löschen?" runat="server" />	
					<asp:ImageButton id='UpToStartButton' onclick='MovePos' ImageUrl='images/up_start.png' ToolTip='Ganz nach nach oben verschieben' runat='server' />
					<asp:ImageButton id='UpButton' onclick='MovePos' ImageUrl='images/up.png' ToolTip='hinaufschieben' runat='server' />
	  				<asp:ImageButton id='DownButton' onclick='MovePos' ImageUrl='images/down.png' ToolTip='hinunterschieben' runat='server' />
			  		<asp:ImageButton id='DownToEndButton' onclick='MovePos' ImageUrl='images/down_end.png' ToolTip='Ganz nach nach unten verschieben' runat='server' />																	
				</td>
			</tr>	
		</hf:DataObject>
		</Itemtemplate>
		<FooterTemplate></table></FooterTemplate>	
	</asp:Repeater>
</asp:Content>	
