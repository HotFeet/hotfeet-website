<%@ Page masterPageFile="~/global.master" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<%@ Import namespace="Newtonsoft.Json" %>
<%@ Import namespace="Newtonsoft.Json.Converters" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		if(!String.IsNullOrEmpty(Request["catidx"])) {
			int catIdx = int.Parse(Request["catidx"]);
			var refCat = App.DB.ReferenceCategories[catIdx];
			var rf = refCat.References.Find(r => !r.Hidden);
			if(rf != null)
				Response.Redirect("~/references.aspx#ref-" + DataStore.GetID(rf));
		}

		Categories.DataSource = App.DB.ReferenceCategories;
		Categories.DataBind();
		
		var allRefs = new List<Reference>();
		foreach(var cat in App.DB.ReferenceCategories)
			allRefs.AddRange(cat.References.FindAll(r => !r.Hidden));

		// Note: the list of all references must be identical to
		// the merged lists from above 
		ReferencePreviews.DataSource = allRefs;
		ReferencePreviews.DataBind();
		
		var allRefsJS =
			from r in allRefs
			select new {
				Url = r.Url,
				Name = r.Name,
				Desc = r.Description,
				Year = r.WentLiveOn.Year,
				Feat = r.Features,
				Lang = r.Languages,
				DName = r.DesignerName,
				DUrl = r.DesignerUrl,
				MID = r.MigrationID // TODO: replace with DataStoreID 
			}; 
		string refData = JsonConvert.SerializeObject(allRefsJS, new JavaScriptDateTimeConverter());
		refData = refData.Substring(1, refData.Length - 2);
		ClientScript.RegisterArrayDeclaration("referenceData", refData);
		
		int[] refIDs = new int[allRefs.Count];
		for(int i = 0; i < refIDs.Length; i++)
			refIDs[i] = DataStore.GetID(allRefs[i]);
		
		refData = JsonConvert.SerializeObject(refIDs, new JavaScriptDateTimeConverter());
		refData = refData.Substring(1, refData.Length - 2);
		ClientScript.RegisterArrayDeclaration("referenceIDs", refData);
	}
}

void BindCategory(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	ReferenceCategory rc = (ReferenceCategory)e.Item.DataItem;
	
	HtmlGenericControl ctrl = (HtmlGenericControl)e.Item.FindControl("Name");
	ctrl.InnerText = rc.Name;

	Repeater refList = (Repeater)e.Item.FindControl("References");
	refList.DataSource = rc.References.FindAll(r => !r.Hidden);
	refList.DataBind();
}

void BindReference(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	Reference r = (Reference)e.Item.DataItem;
	HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("NameLink");
	link.InnerText = r.Name;
}

void BindPreview(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	ReferencePreview rp = (ReferencePreview)e.Item.FindControl("RP");
	rp.DataSource = (Reference)e.Item.DataItem;
	rp.DataBind();
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Referenzen</h1>
	<hf:IDRemover runat="server">
		<ul id="Sectors">
			<asp:Repeater id="Categories" onItemDataBound="BindCategory" runat="server">
				<ItemTemplate>
					<li class="sector">
						<h2 id="Name" runat="server"></h2>
						<ul class="projects">
							<asp:Repeater id="References" onItemDataBound="BindReference" runat="server">
								<ItemTemplate>
									<li><a id="NameLink" class="name-link" href="javascript:;" runat="server" /></li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</hf:IDRemover>

	<div id="HtmlTemplates">
		<div id="ReferencePanel">
			<a id="PrevProj" href="javascript:;">
				<img src="images/arrow_left.png" alt="Pfeil links" title="Vorhergehendes Projekt" />
			</a>
			<a id="NextProj" href="javascript:;">
				<img src="images/arrow.png" alt="Preil rechts" title="Nächstes Projekt" />
			</a>

			<div id="ReferenceSlider">
				<div class="reference-details"></div>
			</div>
		</div>
	</div>
	<!-- needed for ClientScriptManager.RegisterArrayDeclaration to work -->
	<form runat="server" />
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<hf:ReferencesSlideshow id="ReferencePreviews" effect="fade" speed="400" runat="server" />
	</div>
</asp:Content>
