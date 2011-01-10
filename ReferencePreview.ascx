<%@ Control className="ReferencePreview" %>
<script runat="server">
Reference r;
public Reference DataSource {
	set { /*Response.Write("datasource was set.");*/ r = value; }
	get { return r; } 
}

bool linked = true;
public bool Linked {
	get { return linked; }
	set { linked = value; }
}

public override void DataBind() {
	if(r == null) {
		//FIXME: find out, why this is hit on references.aspx
		//Response.Write("null");
		return;
	}

	RefLink.HRef = String.Format(RefLink.HRef, DataStore.GetID(r));
	if(Request.Path.EndsWith("/references.aspx"))
		RefLink.HRef = RefLink.HRef.Replace("references.aspx", String.Empty);

	Name.InnerText = String.Format(Name.InnerHtml, r.Name, r.MigrationID);
	SiteName.InnerText = r.Name;

	if(!String.IsNullOrEmpty(r.Url)) {
		SiteLink.HRef = (linked ? r.Url : String.Format("#ref-{0}", DataStore.GetID(r)));
		SiteLink.InnerText = r.Url.Replace("http://", String.Empty);
	} else
		SiteLink.Visible = false;
}
</script>
<a id="RefLink" class="ref-link" href="references.aspx#ref-{0}" title="Zur Detailansicht" runat="server">
	<span id="Name" runat="server">Website {0} [{1}]</span>
</a>
<span id="SiteName" runat="server" />
<a id="SiteLink" class="links external" title="Zur Website" rel="nofollow" runat="server" />
