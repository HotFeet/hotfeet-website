using System;
using System.Collections.Generic;

namespace HotFeet.Website {
	public class Database {
		List<ReferenceCategory> referenceCategories = new List<ReferenceCategory>();
		
		public List<ReferenceCategory> ReferenceCategories { get { return referenceCategories; } }
	}
}