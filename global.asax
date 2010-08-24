<%@ Application %>
<object id="App" scope="application" class="HotFeet.Website.AppManager" runat="server" />
<script runat='server'>
void Application_Start(object o, EventArgs e) {
	DataStore.Open(
		typeof(UserStrings).GetProperty("Store"),
		typeof(Database)
	);
	
	App.DB = (Database)DataStore.Get(typeof(Database));
	((UserStrings)DataStore.Get(typeof(UserStrings))).InitLanguages();
	
	Text.CurrentLanguages = new Language[] { Language.de };	

	foreach(SiteMapProvider provider in SiteMap.Providers)
		provider.SiteMapResolve += ResolveWithQueryParts;
}

void Application_End(object o, EventArgs e) {
	DataStore.Close();
}

void Session_End(object o, EventArgs e) {
	DataStore.Update();
}

SiteMapNode ResolveWithQueryParts (object sender, SiteMapResolveEventArgs e) {
	string rawUrl = e.Context.Request.RawUrl;
	
	if (rawUrl == null)
		throw new ArgumentNullException ("rawUrl");
	
	SiteMapNode n = e.Provider.FindSiteMapNode(rawUrl);
	if(n != null)
		return n;
	
	int idx = rawUrl.IndexOf('?');
	
	if(idx == -1)
		return null;

	while(rawUrl.Length > idx) {
		if((n = e.Provider.FindSiteMapNode(rawUrl)) != null)
			return n;
		int lastIdx = rawUrl.LastIndexOf('&');
		rawUrl = rawUrl.Substring(0, (lastIdx != -1 ? lastIdx : idx));
	}
	return null;
}
</script>