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
										<a class="url" href="http://www.ars-et-aurum.ch" target="_blank">Art et Aurum</a>
										<a class="picture" href="ref-0001.png">Screenshot</a>
										<span class="year">2009</span>
										<div class="description">
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

	<script type="text/javascript">
		function showDetails(link) {
			var refPanel = $("#ReferencePanel").detach();
			$(link).closest("ul").after(refPanel);
		}
	</script>

	<div id="HtmlTemplates">
		<div id="ReferencePanel">
			<a id="PrevProj" href="#"><img src="images/arrow.png" alt="Pfeil links" title="Vorhergehendes Projekt" /></a>
			<a id="NextProj" href="#"><img src="images/arrow.png" alt="Preil rechts" title="Nächstes Projekt" />
			<div id="ReferenceDetails">
				<a id="ScreenshotLink" href="http://www.art-et-aurum.ch" title="Zur Website" target="_blank">
					<img src="images/screenshot_sample.png" alt="Screenshot" />
				</a>
				<span id="Name">Ars et Aurum</span>
				<span id="Year">2009</span>
				<a id="UrlLink" href="http://www.art-et-aurum.ch" title="Zur Website" target="_blank">www.art-et-aurum.ch</a>
				<div id="Description">
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
		</div>
	</div>
</asp:Content>
<asp:Content contentPlaceHolderId="Sidebar" runat="server">
</asp:Content>