using System;

namespace HotFeet.Website {
	public class AppManager {
		Database db;
		
		public Database DB {
			get { return db; }
			set { db = value; }
		}
	}
}