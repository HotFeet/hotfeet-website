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
<div id="RefSlidesContainer">
	<hf:IDRemover runat="server">
		<ul id="RefSlides">
			<asp:Repeater id="References" onItemDataBound="BindReference" runat="server">
				<ItemTemplate>
					<li>
						<hf:ReferencePreview id="RP" runat="server" />
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
		<a id="PreviousReference" class="prev-next" href="javascript:;" title="rückwärts blättern"><img src="~/images/big_arrows.png" alt="rückwärts" runat="server" /></a>
		<a id="NextReference" class="prev-next" href="javascript:;" title="vorwärts blättern"><img src="~/images/big_arrows.png" alt="vorwärts" runat="server" /></a>
	</hf:IDRemover>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		setupReferencesSlideshow("<%# effect %>", <%# speed %>, <%# (random ? "true" : "false") %>);
	});
</script>