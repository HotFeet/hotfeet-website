<%@ Page masterPageFile="~/global.master" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	if(!IsPostBack) {
		Categories.DataSource = App.DB.ReferenceCategories;
		Categories.DataBind();
	}
}

void BindReference(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	Reference @ref = (Reference)e.Item.DataItem;	
}
</script>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Referenzen</h1>
	<ul id="Sectors">
		<asp:Repeater id="Categories" runat="server">
			<ItemTemplate>
				<li>
					<h2><%# Eval("Name") %></h2>
					<ul class="projects">
						<asp:Repeater dataSource='<%# Eval("References") %>' onItemDataBound="BindReference" runat="server">
							<ItemTemplate>
								<li>
									<a href="javascript:;" onclick="showDetails(this)"><%# Eval("Name") %></a>
									<div class="ref-info">
										<a class="url" href="<%# Eval("Url") %>" target="_blank"><%# Eval("Name") %></a>
										<a class="screenshot" href="ref_imgs_test/new_references_<%# Eval("MigrationID") %>.png">Screenshot</a>
										<span class="year"><%# Eval("WentLiveOn.Year") %></span>
										<div class="description">
											<p>
												<%# Eval("Description") %>
											</p>
											<p>
												Lorem ipsum dolor sit amet, consectetur
												adipiscing elit. Integer fermentum
												orci nec justo mollis id bibendum elit
												ullamcorper. Aliquam quis pulvinar nisi.
												Praesent eget justo a risus aliquam
												sodales.
											</p>
										</div>
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
			<a id="PrevProj" href="#">
				<img src="images/arrow.png" alt="Pfeil links" title="Vorhergehendes Projekt" />
			</a>
			<a id="NextProj" href="#">
				<img src="images/arrow.png" alt="Preil rechts" title="Nächstes Projekt" />
			</a>

			<div id="ReferenceDetails">
				<a id="ScreenshotLink" href="#" title="Zur Website" target="_blank">
					<img src="images/empty.gif" alt="Screenshot" />
				</a>
				<span id="Name"></span>
				<span id="Year"></span>
				<a id="UrlLink" href="#" title="Zur Website" target="_blank"></a>
				<div id="Description"></div>
			</div>
		</div>
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="Sidebar1" runat="server">
	<a id="ThumbnailLink" href="#">
		<div id="ThumbnailWrapper" class="box-element">
			<img id="Thumbnail" src="images/empty.gif" title="" alt="Screenshot" />
		</div>
		<span>Sictech</span>
		<span>www.sictech.ch</span>
	</a>
</asp:Content>
