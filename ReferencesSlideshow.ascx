<%@ Control %>
<%@ Register tagPrefix="hf" tagName="ReferencePreview" src="~/ReferencePreview.ascx" %>
<script runat="server">
string effect = "scrollHorz";
int speed = 1000;
bool random = true;

public List<Reference> DataSource {
	get { return (List<Reference>)References.DataSource; }
	set { References.DataSource = value; }
}

public string Effect {
	get { return effect; }
	set { effect = value; }
}

public int Speed {
	get { return speed; }
	set { speed = value; }
}

public bool Random {
	get { return random; }
	set { random = value; }
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
	<a id="PreviousReference" class="prev-next" href="javascript:;"><img src="~/images/big_arrow_left.png" alt="rückwärts" runat="server" /></a>
	<a id="NextReference" class="prev-next" href="javascript:;"><img src="~/images/big_arrow_right.png" alt="vorwärts" runat="server" /></a>
</div>
<script type="text/javascript">
//<![CDATA[
	$(document).ready(function() {
		var container = $("#ReferencesSlideshowContainer");
		var slideshow = $("#ReferencesSlideshow");
		var arrows = $(".prev-next");

		slideshow.cycle({
			fx: "<%# effect %>",
			prev: "#PreviousReference",
			next: "#NextReference",
			speed: <%# speed %>,
			random: <%# (random ? "true" : "false") %>
		});

		if(slideshow.children("li").length < 2) {
			return;
		}

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
//]]>
</script>
