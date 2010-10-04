using System;
using System.Collections.Generic;

namespace HotFeet.Website {
	public class Database {
		List<ReferenceCategory> referenceCategories = new List<ReferenceCategory>();
		List<NewsItem> news = new List<NewsItem>();
		
		public List<ReferenceCategory> ReferenceCategories { get { return referenceCategories; } }
		public List<NewsItem> News { get { return news ?? (news = new List<NewsItem>()); } }
	}
}