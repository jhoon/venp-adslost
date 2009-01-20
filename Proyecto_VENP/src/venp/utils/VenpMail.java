package venp.utils;

import java.security.Security;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.Globals;
import org.apache.struts.util.MessageResources;

import venp.web.forms.ElectorForm;

import com.sun.net.ssl.internal.ssl.Provider;

public class VenpMail implements Runnable{

	private MessageResources res;
	private ElectorForm bean;
	private Locale loc;

	public VenpMail(ElectorForm bean, HttpServletRequest req) {
		this.bean = bean;
		this.res = (org.apache.struts.util.MessageResources)req.getAttribute(Globals.MESSAGES_KEY);
		this.loc = (java.util.Locale)req.getSession().getAttribute(Globals.LOCALE_KEY);
	}
	
	private String generateMail(){
		String strFormatTitle = "<tr><td align=\"right\">%1s&nbsp;:</td>";
		String strFormatValue = "<td>&nbsp;%1s</td></tr>";
		StringBuffer buffer = new StringBuffer();
		buffer
			.append("<html><body><center>")
			.append(res.getMessage(loc,"elector.confirm.text")).append("<br/><br/>")
			.append("<table width='450px' border='0' cellspacing='0' cellpadding='0'>")
			.append(String.format(strFormatTitle,res.getMessage(loc,"emp.form.nombre")))
			.append(String.format(strFormatValue,bean.getNombre()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"emp.form.paterno")))
			.append(String.format(strFormatValue,bean.getPaterno()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"emp.form.materno")))
			.append(String.format(strFormatValue,bean.getMaterno()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"emp.form.dni")))
			.append(String.format(strFormatValue,bean.getDni()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"emp.form.email")))
			.append(String.format(strFormatValue,bean.getEmail()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"elector.confirm.fecha")))
			.append(String.format(strFormatValue,bean.getFechaSufragio()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"elector.confirm.hora")))
			.append(String.format(strFormatValue,bean.getHoraSufragio()))
			.append(String.format(strFormatTitle,res.getMessage(loc,"elector.confirm.gmt")))
			.append(String.format(strFormatValue,bean.getGmtSufragio()))
			.append("</center></table></body></html>");
		System.out.println(buffer.toString());
		return buffer.toString();
	}

	/**
	 * 
	 * @throws Exception
	 */
	private synchronized void sendConfirmationMail() throws Exception {
		// Preparar el contenido del mail
		final String strFrom = res.getMessage(loc,"venp.mail.from");
		String strTo = bean.getEmail();
		String strSubject =  res.getMessage(loc,"venp.mail.subject");
		String strText = generateMail();
		
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
						return new PasswordAuthentication(strFrom,
								res.getMessage(loc, "venp.mail.pwd"));
					}
				});

		MimeMessage message = new MimeMessage(session);
		message.setSender(new InternetAddress(strFrom));
		message.setSubject(strSubject);
		message.setContent(strText, "text/html");
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(strTo));

		Transport.send(message);
		System.out.println("finished!");
	}

	@Override
	public void run() {
		try {
			sendConfirmationMail();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}