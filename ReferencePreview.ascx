<%@ Control className="ReferencePreview" %>
<script runat="server">
Reference r;
public Reference DataSource {
	set { /*Response.Write("datasource was set.");*/ r = value; }
	get { return r; } 
}

public override void DataBind() {
	if(r == null) {
		//FIXME: find out, why this is hit on references.aspx
		//Response.Write("null");
		return;
	}

	RefLink.HRef = String.Format(RefLink.HRef, DataStore.GetID(r));

	Screenshot.Src = String.Format("ref_imgs_test/new_references_{0}_small.png", r.MigrationID);
	Screenshot.Alt = String.Format(Screenshot.Alt, r.Name);

	SiteName.InnerText = r.Name;

	if(!String.IsNullOrEmpty(r.Url)) {
		SiteLink.HRef = r.Url;
		SiteLink.InnerText = r.Url.Replace("http://", String.Empty);
	} else
		SiteLink.Visible = false;
}
</script>
<a id="RefLink" class="ref-link" href="references.aspx#ref-{0}" title="Zur Detailansicht" runat="server">
	<img id="Screenshot" class="box-element" alt="Screenshot {0}" runat="server" />
</a>
<span id="SiteName" runat="server" />
<a id="SiteLink" class="links" title="Zur Website" rel="nofollow" runat="server" />