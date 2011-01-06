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
	RefLink.InnerHtml = String.Format(RefLink.InnerHtml, r.Name, r.MigrationID);
	SiteName.InnerHtml = r.Name;

	if(!String.IsNullOrEmpty(r.Url)) {
		SiteLink.HRef = r.Url;
		SiteLink.InnerText = r.Url.Replace("http://", String.Empty);
	} else
		SiteLink.Visible = false;
}
</script>
<a id="RefLink" class="ref-link" href="references.aspx#ref-{0}" title="Zur Detailansicht" runat="server">
	<span>Webseite {0} [{1}]</span>
</a>
<span id="SiteName" runat="server" />
<a id="SiteLink" class="links" title="Zur Website" rel="nofollow" runat="server" />