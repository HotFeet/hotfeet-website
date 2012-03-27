using System;
using System.Web;

namespace HotFeet.Web {
	public class DebugDiv: Control {
		public string ParamName {
		}
		
		public string ParamValue {
		}
	
		public override Render() {
			if(MatchParam()) {
				// open DIV
				// "ID"=ID				
			}
			
			// render children
			
			if(MatchParam()) {
				// close DIV
			}
		}
		
		bool MatchParam() {
			return true;
		}
	}
}