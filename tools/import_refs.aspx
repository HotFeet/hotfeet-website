<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Linq" %>
<script runat="server">
DataSet ds;

void Page_Load(object o, EventArgs e) {
	// just for safety
	if(App.DB.ReferenceCategories.Count > 0 && Request["go"] != "true")
		return;
 
	ds = SqlDataLoader.LoadAllTables();
	DataTable nav = ds.Tables["navigation"];
	DataTable refs = ds.Tables["reference_list"];
	//ShowCols(refs);
	//return;

	App.DB.ReferenceCategories.Clear();
	foreach(var cat in nav.Select("URL like 'referenzen.php?id=%'")) {
		var refCat = new ReferenceCategory() { Name = (string)cat["Name_D"] };
		
		foreach(var rf in refs.Select("Subnavigation_ID = " + cat["ID"].ToString())) {
			var r = new Reference() {
				MigrationID = (int)rf["ID"],
				Url = (string)rf["Url"],
				Name = (string)rf["Titel_D"],
				Description = rf["Description_D"].ToString(),
				Hidden = !(bool)rf["Online"],
				//WentLiveOn = Get(rf["WentOnline"]) 
			};
			refCat.References.Add(r);
		}
		App.DB.ReferenceCategories.Add(refCat);
	}
	DataStore.MarkChanged();
}

DateTime Get(object o) {
	return (o == null ? DateTime.MinValue : (DateTime)o);
}

void ShowCols(DataTable dt) {
	foreach(DataColumn dc in dt.Columns) {
		Response.Write(String.Format("{0} ({1})<br />", dc.ColumnName, dc.DataType));
	}
}
</script>
