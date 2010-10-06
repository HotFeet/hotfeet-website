<%@ Control %>
<%@ Register tagPrefix="hf" tagName="ReferencePreview" src="~/ReferencePreview.ascx" %>
<script runat="server">
public List<Reference> DataSource {
	get { return (List<Reference>)References.DataSource; }
	set { References.DataSource = value; }
} 

void BindReference(object o, RepeaterItemEventArgs e) {
	if(e.Item.DataItem == null)
		return;
	
	ReferencePreview rp = (ReferencePreview)e.Item.FindControl("RP");
	rp.DataSource = (Reference)e.Item.DataItem;
	rp.DataBind();
}
</script>
<div id="ReferencesSlideshowContainer">
	<ul id="ReferencesSlideshow">
		<asp:Repeater id="References" onItemDataBound="BindReference" runat="server">
			<ItemTemplate>
				<li>
					<hf:ReferencePreview id="RP" runat="server" />
				</li>
			</ItemTemplate>
		</asp:Repeater>
	</ul>
	<a id="PreviousReference" class="prev-next" href="javascript:;"><img src="~/images/big_arrow_left.png" runat="server" /></a>
	<a id="NextReference" class="prev-next" href="javascript:;"><img src="~/images/big_arrow_right.png" runat="server" /></a>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		var slideshow = $("#ReferencesSlideshow");
		var container = $("#ReferencesSlideshowContainer");
		var arrows = $(".prev-next");

		slideshow.cycle({
			fx: "scrollHorz",
			prev: "#PreviousReference",
			next: "#NextReference",
			random: true
		});

		/* references.aspx
		var slideshow = $("#ReferencesSlideshow");
		slideshow.cycle({
			prev: "#PreviousReference",
			next: "#NextReference",
			random: true,
			speed: 400
		});
		*/

		
		container.hover(
			function() { slideshow.cycle("pause"); arrows.fadeIn(); },
			function() {
				clearSlideshowTimeout();
				slideshowTimeout = window.setTimeout(function() {
					arrows.fadeOut(); slideshow.cycle("resume");
				}, 200);
			}
		);
	});

	var slideshowTimeout;	
	function clearSlideshowTimeout() {
		if(!slideshowTimeout)
			return;
		
		window.clearTimeout(slideshowTimeout);
		slideshowTimeout = null;
	}
</script>
