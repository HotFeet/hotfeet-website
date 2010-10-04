using System;
using System.Collections.Generic;

namespace HotFeet.Website {
	public class NewsItem : IComparable<NewsItem> {
		DateTime date = DateTime.Today;
		string title, text;
		List<string> tags = new List<string>();

		public string Title {
			get { return title; }
			set { title = value; }
		}

		public string Text {
			get { return text; }
			set { text = value; }
		}
		
		public DateTime Date {
			get { return date; }
			set { date = value; }
		}
		
		public List<string> Tags { get { return tags; } }

#region IComparable
		public int CompareTo(NewsItem other) {
			return DateTime.Compare(date, other.date);
		}
#endregion			
	}
}