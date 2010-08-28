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

	<script type="text/javascript">
		var refPanel;
		$(document).ready(function() { refPanel = $("#ReferencePanel"); });

		function showDetails(link) {
			// if the panel still hidden, populate and show it
			if(refPanel.css("display") == "none") {
				populateAndShowDetailsPanel(link);
				return;
			}
			
			// we know the panel is visible at this point

			// the active link was clicked again => hide
			if($(refPanel).data("link") == link) {
				refPanel.toggle("blind", null, "slow");
				return;
			}

			if($(link).closest("ul").get(0) == refPanel.prev("ul").get(0))
				populatePanel(link);
			else
				refPanel.toggle("blind", null, "slow", function() {populateAndShowDetailsPanel(link);});
		}
		
		function populateAndShowDetailsPanel(link) {
			populatePanel(link);
			$("#ReferencePanel").detach();
			$(link).closest("ul").after(refPanel);
			refPanel.toggle("blind", null, "slow");
		}

		function populatePanel(link) {
			if($(refPanel).data("link") == link)
				return;

			// connect panel to link
			$(refPanel).data("link", link);

			var info = $(link).next(".ref-info");
			var url = $(info).find("a.url");
			$("#Name").html($(url).html());
			$("#Year").html($(info).find(".year").html());

			var href = url.attr("href");
			//FIXME: remove this
			if(href.substring(7) != "http://")
				href = "http://" + href;

			$("#UrlLink").attr("href", href);
			$("#ScreenshotLink").attr("href", href);

			// remove "http://" or "https://"
			href = href.replace(/https?:\/\//, "");
			$("#UrlLink").html(href);

			$("#Description").html($(info).find(".description").html());
			
			$("#ScreenshotLink img").attr("src", $(info).find(".screenshot").attr("href"));
		}		
	</script>

	<div id="HtmlTemplates">
		<div id="ReferencePanel">
			<a id="PrevProj" href="#"><img src="images/arrow.png" alt="Pfeil links" title="Vorhergehendes Projekt" /></a>
			<a id="NextProj" href="#"><img src="images/arrow.png" alt="Preil rechts" title="Nächstes Projekt" />
			<div id="ReferenceDetails">
				<a id="ScreenshotLink" href="#" title="Zur Website" target="_blank">
					<img src="images/screenshot_sample.png" alt="Screenshot" />
				</a>
				<span id="Name"></span>
				<span id="Year"></span>
				<a id="UrlLink" href="#" title="Zur Website" target="_blank"></a>
				<div id="Description"></div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content contentPlaceHolderId="Sidebar" runat="server">
</asp:Content>