using System;

namespace HotFeet.Website {
	public class Reference {
		string url, name, description;
		string features, jiraKey, languages;
		string designerName, designerUrl;
		int? migrationID;
		DateTime wentLiveOn;
		bool isHighlight, hidden;

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

		// comma-separated list of ISO 631-1 (e.g. de, en, es,...) or CultureInfo codes (RFC 1766, e.g. de-CH, en-US)
		// (languages which are set up but not online are given in parentheses) 
		// see also: http://msdn.microsoft.com/library/System.Globalization.CultureInfo:
		//   "<languagecode2>-<country/regioncode2>",
		//   <languagecode2>: lowercase two-letter code derived from ISO 639-1 (http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
		//   <country/regioncode2>: uppercase two-letter code derived from ISO 3166
		public string Languages {
			get { return languages; }
			set { languages = value; }
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
		
		public bool IsHighlight {
			get { return isHighlight; }
			set { isHighlight = value; }
		} 
	}
}