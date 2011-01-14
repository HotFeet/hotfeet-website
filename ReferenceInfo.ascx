<%@ Control className="ReferenceInfo" %>
<script runat="server">
static readonly Regex methodRegex = new Regex("https?://");
static readonly char[] featureSeparatorChars = {'\n'};

Reference r;
public Reference Reference { set { r = value; } }

public override void DataBind() {
	if(r == null) {
		//FIXME: find out, why this is hit on references.aspx
		//Response.Write("null");
		return;
	}

	Name.InnerText = r.Name;
	if(r.WentLiveOn.Year != 1)
		Name.InnerText += String.Format(" ({0})", r.WentLiveOn.Year);

	WebsiteLink.HRef = r.Url;
	string shortUrl = methodRegex.Replace(r.Url, String.Empty);
	WebsiteLink.InnerText = shortUrl;
	Screenshot.Alt = String.Format(Screenshot.Alt, shortUrl); 

	Description.InnerText = r.Description;

	string[] items = r.Features.Split(featureSeparatorChars, StringSplitOptions.RemoveEmptyEntries);
	if(items.Length > 0) {
		foreach(string item in items)
			FeatureList.Controls.Add(new HtmlGenericControl("li") {InnerText = item});
		Features.Visible = true;
	}

	if(!String.IsNullOrEmpty(r.DesignerName)) {
		Design.Visible = true;
		DesignerName.InnerText = r.DesignerName;
		if(String.IsNullOrEmpty(r.DesignerUrl)) {
			// unwrap designer name span 
			DesignerLink.Controls.Remove(DesignerName);
			ControlCollection parColl = DesignerLink.Parent.Controls;
			parColl.Remove(DesignerLink);
			parColl.Add(DesignerName);
		} else {
			string url = r.DesignerUrl;
			if(url == "http://www.laemmlermettler.ch")
				url = "~/about-us/partner.aspx";

			DesignerLink.HRef = url;
		}
	}

	MID.InnerHtml = r.MigrationID.ToString();
}
</script>
<div class="info">
	<span id="Name" class="name" runat="server" />
	<a id="WebsiteLink" class="website-link links external" title="Zur Website" rel="nofollow" runat="server" />
	<p id="Description" class="description" runat="server" />

	<div id="Features" class="features" visible="false" runat="server">
		<label>Besonderheiten:</label>
		<ul id="FeatureList" runat="server" />
	</div>

	<span id="Design" class="design" visible="false" runat="server">
		<label>Grafikdesign:</label>
		<a id="DesignerLink" class="links" runat="server">
			<span id="DesignerName" runat="server" />
		</a>
	</span>
	<span class="mid" id="MID" runat="server" /> 
</div>
<a class="screenshot-link external" href="javascript:;" title="Zur Website">
	<img id="Screenshot" class="screenshot spin" src="images/empty.gif" alt="Website/Webapplikation {0}" runat="server" />
</a>
