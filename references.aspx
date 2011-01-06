<%@ Page masterPageFile="~/global.master" %>
<%@ OutputCache duration="3600" varyByParam="none" %>
<%@ Register tagPrefix="hf" tagName="ReferencesSlideshow" src="~/ReferencesSlideshow.ascx" %>
<%@ Register tagPrefix="hf" tagName="ReferenceInfo" src="~/ReferenceInfo.ascx" %>
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

static readonly char[] featureSeparatorChars = new char[1] {'\n'};

void BindReference(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	Reference r = (Reference)e.Item.DataItem;
	HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("NameLink");
	link.Name = String.Format(link.Name, DataStore.GetID(r));
	link.Title = String.Format(link.Title, r.Name);
	link.HRef = r.Url;
	link.InnerText = r.Name;

	ReferenceInfo ri = (ReferenceInfo)e.Item.FindControl("RefInfo");
	ri.Reference = r;
	ri.DataBind();
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
									<!-- don't put a space/newline between li and a! -->
									<li><a id="NameLink" name="ref-{0}" title="Website {0}" class="name-link" rel="nofollow internal" runat="server" />
										<hf:ReferenceInfo id="RefInfo" runat="server" />
									</li>
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
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<hf:ReferencesSlideshow id="ReferencePreviews" effect="fade" speed="400" runat="server" />
	</div>
</asp:Content>
