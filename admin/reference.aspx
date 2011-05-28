<%@ Page masterPageFile="admin.master"  %>
<%@ Import namespace="System.Drawing" %>
<asp:Content contentPlaceHolderId="Stylesheet" runat="server">
	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.Jcrop.min.js"></script>
	<script type="text/javascript" src="js/reference..js"></script>
	<link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
</asp:Content>
<script runat="server">
ReferenceCategory refCat;
Reference reference;
string backTo;

void Page_Load(object o, EventArgs e) {
	refCat = (ReferenceCategory)DataStore.Get(Request["rcid"]);
	reference = (Reference)DataStore.Get(Request["rid"]);
	backTo = Request["backTo"];
	
	if(!IsPostBack) {
		string src = UserImage.Get("FullScreenshot", DataStore.GetID(reference), 300, 300);
		if(src != null)
			CurrentImg.Src = "../" + src;
		else {
			CurrentImg.Visible = false;
			ShowCroppingDisabledMessage();
			return;
		}

		int w, h;
		UserImage.GetOriginalSize("FullScreenshot", DataStore.GetID(reference), out w, out h);
		if(w <= 545 || h <= 545) {
			ShowCroppingDisabledMessage();
			return;
		}

		ClientScript.RegisterArrayDeclaration("origImageDimensions", String.Format("{0},{1}", w, h));
		Rectangle rect = picturePage.CroppedArea;
		string dims = String.Format("{0},{1},{2},{3}", rect.Left, rect.Top, rect.Width, rect.Height);
		ClientScript.RegisterArrayDeclaration("curCropRectangle", dims);
	}
}

void ShowCroppingDisabledMessage() {
	SizeWarning.Visible = !(Instructions.Visible = false);
}

void SaveChanges(object o, EventArgs e) {
	if(!IsValid) 
		return;

	int rid = DataStore.GetID(reference);
	if(Upload_Image.HasFile) {
		Server.ScriptTimeout = 180;
		UserImage.Store(Upload_Image.PostedFile, "FullScreenshot", rid, 1920, 1200);
		UserImage.Delete("Screenshot", rid);
	}
	
	Rectangle area = Rectangle.Empty;
	string cropRect = Request.Form["CropCoordinates"];
	if(!String.IsNullOrEmpty(cropRect)) {
		string[] comps = cropRect.Split('/');
		area = new Rectangle(
			int.Parse(comps[0]), int.Parse(comps[1]),
			int.Parse(comps[2]), int.Parse(comps[3])
		);
	}
	if(area.Width == 0 || area.Height == 0)
		area = Rectangle.Empty;
	
	if(area != Rectangle.Empty)
		UserImage.Crop("FullScreenshot", "Screenshot", rid, area.Left, area.Top, area.Width, area.Height);
	else
		UserImage.Delete("Screenshot", rid);

	reference.CroppedArea = area;

	if(!refCat.References.Contains(reference))
		refCat.References.Add(reference);

	DataStore.MarkChanged();
	Redirect(null, null);
}

void Redirect(object o, EventArgs e) {
	//string s = String.Format("pageList.aspx?catid={0}&presentationoid={1}&backTo={2}", Request["catid"], Request["presentationoid"], backTo);
	//Response.Redirect(s);
}
</script>
<asp:Content contentPlaceHolderID="Content" runat="server">
	<div class="title">Referenz - Eintrag bearbeiten</div>
	<div id="Editor" class="editor" runat="server">
		<div id="Image">
			<label>Aktuelles Vollbild</label>
			<img id="CurrentImg" runat="server" />
			<input type="hidden" id="CropCoordinates" name="CropCoordinates" />
			<br /><br />
			<asp:Literal id="Instructions" runat="server">
				Ein quadratischer Ausschnitt (min. 545x545px, für die Einstiegsseite und die Übersicht<br />
				einer Projektkategorie) kann direkt im Bild markiert werden.
			</asp:Literal>
			<asp:Literal id="SizeWarning" visible="false" runat="server">
				(Um einen quadratischen Bereich von min. 545x545px ausschneiden zu können, <br />
				muss ein Vollbild	hochgeladen werden, welches grösser ist als 545x545px.) 
			</asp:Literal>
			<input type="button" id="ClearButton" value="Löschen" onclick="clearCropping()" style="display: none" />
		</div>
		<br />
		<div>
			<label>
				Neues Vollbild hochladen<br />
				(JPEG, Maximalgrösse 1000x1000px, Breite oder Höhe mindestens 545px)
			</label>
			<asp:FileUpload id='Upload_Image' runat='server' />
		</div>		
		<div class="buttons">
			<asp:Button onclick='SaveChanges' text="Speichern" runat='server' />
			<asp:Button onclick='Redirect' text="Abbrechen" causesValidation="false" runat="server" />
		</div>	
	</div>
</asp:Content>	
