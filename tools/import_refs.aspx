<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Linq" %>
<script runat="server">
DataSet ds;

void Page_Load(object o, EventArgs e) {
	// just for safety
	if(App.DB.ReferenceCategories.Count > 0 && Request["go"] != "true")
		return;
 
	DataTable cats = SqlDataLoader.ExecuteQuery(
		"select * from navigation " +
		"where URL like 'referenzen.php?id=%' " +
		"order by Reihenfolge"
	); 
 
	App.DB.ReferenceCategories.Clear();
	foreach(DataRow cat in cats.Rows) {
		var refCat = new ReferenceCategory() { Name = (string)cat["Name_D"] };
		
		DataTable refs = SqlDataLoader.ExecuteQuery(
			"select * from reference_list " +
			String.Format("where Subnavigation_ID = {0} ", cat["ID"]) +
			"order by Reihenfolge"
		);

		foreach(DataRow rf in refs.Rows) {
			var r = new Reference() {
				MigrationID = (int)rf["ID"],
				Url = (string)rf["Url"],
				Name = (string)rf["Titel_D"],
				Description = rf["Description_D"].ToString(),
				Hidden = !(bool)rf["Online"],
				WentLiveOn = GetTime(rf["WentOnline"]) 
			};
			refCat.References.Add(r);
		}
		App.DB.ReferenceCategories.Add(refCat);
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

void ShowCols(DataTable dt) {
	foreach(DataColumn dc in dt.Columns) {
		Response.Write(String.Format("{0} ({1})<br />", dc.ColumnName, dc.DataType));
	}
}
</script>
