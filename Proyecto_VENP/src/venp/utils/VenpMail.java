package venp.utils;

import java.security.Security;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.struts.util.MessageResources;
import com.sun.net.ssl.internal.ssl.Provider;

public class VenpMail {
	private String from;
	private String to;
	private String subject;
	private String text;
	private MessageResources res = MessageResources
			.getMessageResources("venp.langs.ApplicationResources");

	public VenpMail(String to, String text) {
		this.to = to;
		this.text = text;
		this.subject = res.getMessage("venp.mail.subject");
		this.from = res.getMessage("venp.mail.from");
	}

	/**
	 * 
	 * @throws Exception
	 */
	public synchronized void sendMail() throws Exception {

		Security.addProvider(new Provider());

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");

		Session session = Session.getDefaultInstance(props,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from,
								res.getMessage("venp.mail.pwd"));
					}
				});

		MimeMessage message = new MimeMessage(session);
		message.setSender(new InternetAddress(from));
		message.setSubject(subject);
		message.setContent(text, "text/plain");
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

		Transport.send(message);
		System.out.println("finished!");
	}
}