<%@ Page masterPageFile="~/global.master" enableViewState="false" %>
<%@ Register tagPrefix="hf" tagName="ReferencePreview" src="~/ReferencePreview.ascx" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		Categories.DataSource = App.DB.ReferenceCategories;
		Categories.DataBind();
		
		var allRefs = new List<Reference>();
		foreach(var cat in App.DB.ReferenceCategories)
			allRefs.AddRange(cat.References.FindAll(r => !r.Hidden));

		// Note: the list of all references must be identical to
		// the merged lists from above 
		ReferencePreviews.DataSource = allRefs;
		ReferencePreviews.DataBind();
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
	// NameLink
	HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("NameLink");
	link.InnerText = r.Name;
	
	HtmlInputHidden hidden = (HtmlInputHidden)e.Item.FindControl("ID");
	hidden.Value = DataStore.GetID(r).ToString();

	// SiteLink
	link = (HtmlAnchor)e.Item.FindControl("SiteLink");
	link.HRef = r.Url;
	link.InnerText = r.Name;

	// ScreenshotLink
	link = (HtmlAnchor)e.Item.FindControl("ScreenshotLink");
	//TODO: this is only temporary
	link.HRef = String.Format("ref_imgs_test/new_references_{0}.png", r.MigrationID);
	
	HtmlGenericControl ctrl = (HtmlGenericControl)e.Item.FindControl("Year");
	if(r.WentLiveOn != DateTime.MinValue)
		ctrl.InnerText = String.Format(ctrl.InnerText, r.WentLiveOn.Year);
	else
		ctrl.Visible = false;
		
	ctrl = (HtmlGenericControl)e.Item.FindControl("Description");
	ctrl.InnerText = r.Description; 
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
	<ul id="Sectors">
		<asp:Repeater id="Categories" onItemDataBound="BindCategory" runat="server">
			<ItemTemplate>
				<li>
					<h2 id="Name" runat="server"></h2>
					<ul class="projects">
						<asp:Repeater id="References" onItemDataBound="BindReference" runat="server">
							<ItemTemplate>
								<li>
									<a id="NameLink" class="name-link" href="javascript:;" runat="server" />
									<div class="ref-info">
										<input type="hidden" id="ID" class="id" runat="server" />
										<a id="SiteLink" class="url" target="_blank" runat="server" />
										<a id="ScreenshotLink" class="screenshot" runat="server">Screenshot</a>
										<span id="Year" class="year" runat="server">({0})</span>
										<div id="Description" class="description" runat="server" />
									</div>
								</li>
							</ItemTemplate>
						</asp:Repeater>
					</ul>
				</li>
			</ItemTemplate>
		</asp:Repeater>
	</ul>

	<div id="HtmlTemplates">
		<div id="ReferencePanel">
			<a id="PrevProj" href="javascript:;">
				<img src="images/arrow_left.png" alt="Pfeil links" title="Vorhergehendes Projekt" />
			</a>
			<a id="NextProj" href="javascript:;">
				<img src="images/arrow.png" alt="Preil rechts" title="Nächstes Projekt" />
			</a>

			<div id="ReferenceSlider">
				<div class="reference-details">
					<a class="screenshot-link" href="#" title="Zur Website" target="_blank">
						<img src="images/empty.gif" alt="Screenshot" />
					</a>
					<span class="name"></span>
					<span class="year"></span>
					<a class="url-link" href="#" title="Zur Website" target="_blank"></a>
					<div class="description"></div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<div id="SlideshowContainer">
			<ul id="ReferencesSlideshow">
				<asp:Repeater id="ReferencePreviews" onItemDataBound="BindPreview" runat="server">
					<ItemTemplate>
						<li>
							<hf:ReferencePreview id="RP" runat="server" />
						</li>
					</ItemTemplate>
				</asp:Repeater>
			</ul>
		</div>
	</div>
</asp:Content>
