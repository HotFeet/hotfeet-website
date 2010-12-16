<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>HotFeet - W3C Validation</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<link rel="stylesheet" type="text/css" href="css/global.css" />
</head>

<script runat="server">
	void Page_Load(object o, EventArgs e) {
		var allNodes = new List<SiteMapNode>();
		CollectAllNodes(SiteMap.RootNode, allNodes);
		HtmlFiles.DataSource = allNodes;
		HtmlFiles.DataBind();
		
		// Recursively check the project root dir for any *.css files
		string rootPath = MapPath("~");
		List<string> filelist = new List<string>();		
		FindFiles(rootPath, "*.css", filelist);	
		CssFiles.DataSource = filelist;
		CssFiles.DataBind();
	}
	
	void CollectAllNodes(SiteMapNode root, List<SiteMapNode> result) {
		if(!String.IsNullOrEmpty(root.Url))
			result.Add(root);
		
		foreach(SiteMapNode child in root.ChildNodes)
			CollectAllNodes(child, result);
	}
	
	void SetupHtmlLink(object o, RepeaterItemEventArgs e) {
		if(e.Item.DataItem == null)
			return;
		SiteMapNode node = (SiteMapNode)e.Item.DataItem;	
		HtmlAnchor a = (HtmlAnchor)e.Item.FindControl("PageLink");
		if(node.Url != String.Empty) {
			a.HRef = String.Format("http://validator.w3.org/check?uri=http%3A%2F%2F{0}{1}", Page.Request.Url.Host, node.Url);
			a.InnerText = node.Url;	
		} else
			a.InnerText = node.Title;				
	}
	
	// Goes recursively down the path to find all files with the given pattern
	void FindFiles(string path, string pattern, List<string> finalList) {
		// Check file in this dir and then look into sub-dirs
		string[] matches = Directory.GetFiles(path, pattern);
		finalList.AddRange(matches);
		string[] subdirs = Directory.GetDirectories(path);
		foreach(string subdir in subdirs) {
			FindFiles(subdir, pattern, finalList);
		}
	}	
	
	void SetupCssLink(object o, RepeaterItemEventArgs e) {
		if(e.Item.DataItem == null)
			return;
		string link = (string)e.Item.DataItem;
		string url = link.Remove(0, @"/var/www/html/".Length);
		HtmlAnchor a = (HtmlAnchor)e.Item.FindControl("CssLink");
		a.HRef = String.Format("http://validator.w3.org/check?uri=http%3A%2F%2F{0}", url);
		a.InnerText = url;
	}
	
</script>

<body>
	<h1>W3C Validation</h1>
	
	<h2>HTML</h2>
	<asp:Repeater id="HtmlFiles" onItemDataBound="SetupHtmlLink" runat="server">
		<HeaderTemplate><ul></HeaderTemplate>
		<ItemTemplate>
			<li><a id="PageLink" target="_blank" runat="server" /></li>
		</ItemTemplate>
		<FooterTemplate></ul></FooterTemplate>
	</asp:Repeater>	

	<h2>CSS</h2>
	<asp:Repeater id="CssFiles" onItemDataBound="SetupCssLink" runat="server">
		<HeaderTemplate><ul></HeaderTemplate>
		<ItemTemplate>
			<li><a id="CssLink" target="_blank" runat="server" /></li>
		</ItemTemplate>
		<FooterTemplate></ul></FooterTemplate>			
	</asp:Repeater>	
	
</body>
</html>
