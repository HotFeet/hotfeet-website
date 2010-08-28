using System;

namespace HotFeet.Website {
	public class Reference {
		string url, name, description;
		int? migrationID;
		DateTime wentLiveOn;
		bool hidden;

		public int? MigrationID {
			get { return migrationID; }
			set { migrationID = value; }
		}

		public string Url {
			get { return url; }
			set { url = value; }
		}
		
		//TODO: add ShortName (for listing in sector)?
		//TODO: add FeaturedOnIndexPage?

		public string Name {
			get { return name; }
			set { name = value; }
		}
		
		public string Description {
			get { return description; }
			set { description = value; }
		}

		public DateTime WentLiveOn {
			get { return wentLiveOn; }
			set { wentLiveOn = value; }
		}
		
		public bool Hidden {
			get { return hidden; }
			set { hidden = value; }
		} 
	}
}