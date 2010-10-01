using System;
using System.Net.Mail;
using System.Text;

namespace HotFeet.Website {
	public class AppManager {
		Database db;
		
		public Database DB {
			get { return db; }
			set { db = value; }
		}
		
		public void SendEmail(string from, string to, string subject, string body) {
			
			MailMessage msg = new MailMessage(from, to, subject, body) {
				BodyEncoding = Encoding.GetEncoding("ISO-8859-1"),
				SubjectEncoding = Encoding.GetEncoding("ISO-8859-1")
			};
			
			SmtpClient client = new SmtpClient("localhost");
			client.Send(msg);
		}
	}
}