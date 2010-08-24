using System;
using System.Collections.Generic;

namespace HotFeet.Website {
	public class ReferenceCategory {
		string name;
		List<Reference> references = new List<Reference>();

		public string Name {
			get { return name; }
			set { name = value; }
		}
		
		public List<Reference> References { get { return references; } }
	}
}