<%@ Control className="ReferencePreview" %>
<script runat="server">
Reference r;
public Reference DataSource {
	set { /*Response.Write("datasource was set.");*/ r = value; }
	get { return r; } 
}

public override void DataBind() {
	if(r == null) {
		return;
	}

	// build nice url ("www.hotfeet.ch")
	string niceUrl = r.Url;
	if(niceUrl != null)
		niceUrl = niceUrl.Replace("http://", String.Empty);

	// build full url ("http://www.hotfeet.ch")
	string fullUrl = r.Url;
	if(!String.IsNullOrEmpty(fullUrl) && !fullUrl.StartsWith("http://"))
		fullUrl = "http://" + fullUrl;

	RefLink.HRef = String.Format(RefLink.HRef, DataStore.GetID(r));

	Screenshot.Src = String.Format("ref_imgs_test/new_references_{0}_small.png", r.MigrationID);
	Screenshot.Alt = String.Format(Screenshot.Alt, r.Name);

	SiteName.InnerText = r.Name;

	SiteLink.InnerText = niceUrl;
	SiteLink.HRef = fullUrl;
}
</script>
<a id="RefLink" class="ref-link" href="references.aspx#ref-{0}" title="Zu den Details" runat="server">
	<img id="Screenshot" class="box-element" alt="Screenshot {0}" runat="server" />
</a>
<span id="SiteName" runat="server" />
<a id="SiteLink" class="links" target="_blank" title="Zur Website" runat="server" />