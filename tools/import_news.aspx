<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Linq" %>
<script runat="server">
void Page_Load(object o, EventArgs e) {
	// just for safety
	if(App.DB.News.Count > 0 && Request["go"] != "true")
		return;
 
	DataTable news = SqlDataLoader.ExecuteQuery(
		"select * from news order by Date"
	); 
 
	App.DB.News.Clear();
	foreach(DataRow r in news.Rows) {
		var item = new NewsItem() {
			Date = GetTime(r["Date"]),
			Title = (string)r["Title_D"],
			Text = (string)r["Text_D"]
		};
		if((string)r["Website"] == "true")
			item.Tags.Add("Website");
		
		App.DB.News.Add(item);
	}
	DataStore.MarkChanged();
}

DateTime GetTime(object o) {
	try {
		return ((IConvertible)o).ToDateTime(null);
	} catch {
		return DateTime.MinValue;
	}
}
</script>
