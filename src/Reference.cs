using System;

namespace HotFeet.Website {
	public class Reference {
		string url, name, description;
		string features, jiraKey;
		string designerName, designerUrl;
		int? migrationID;
		DateTime wentLiveOn;
		bool featuredOnEntryPage, hidden;

		public int? MigrationID {
			get { return migrationID; }
			set { migrationID = value; }
		}

		public string Url {
			get { return url; }
			set { url = value; }
		}
		
		//TODO: add ShortName (for listing in sector)?

		public string Name {
			get { return name; }
			set { name = value; }
		}

		public DateTime WentLiveOn {
			get { return wentLiveOn; }
			set { wentLiveOn = value; }
		}
		
		public string Description {
			get { return description; }
			set { description = value; }
		}

		// list of features (separated by newline character)
		public string Features {
			get { return features; }
			set { features = value; }
		} 

		public string JiraKey {
			get { return jiraKey; }
			set { jiraKey = value; }
		}

		public string DesignerName {
			get { return designerName; }
			set { designerName = value; }
		} 

		public string DesignerUrl {
			get { return designerUrl; }
			set { designerUrl = value; }
		} 

		public bool Hidden {
			get { return hidden; }
			set { hidden = value; }
		}
		
		public bool FeaturedOnEntryPage {
			get { return featuredOnEntryPage; }
			set { featuredOnEntryPage = value; }
		} 
	}
}