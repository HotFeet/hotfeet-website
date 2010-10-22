using System;
using System.Net.Mail;
using System.Text;

namespace HotFeet.Website {
	public class AppManager {
		const string hfInfoEmail = "info@hotfeet.ch"; 
		const string hfSupportEmail = "support@hotfeet.ch";
		Database db;
		
		public Database DB {
			get { return db; }
			set { db = value; }
		}
		
		public void SendEmailToHfInfo(string from, string subject, string body) {
			SendEmail(from, hfInfoEmail, subject, body);
		}
		
		public void SendEmailToHfSupport(string from, string subject, string body) {
			SendEmail(from, hfSupportEmail, subject, body);
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