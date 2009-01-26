package venp.utils;

import java.io.ByteArrayInputStream;
import java.io.OutputStream;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.struts.Globals;
import org.apache.struts.util.MessageResources;
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;

import venp.web.forms.ElectorForm;

public class CreaPDF {
	
	private MessageResources res;
	private ElectorForm bean;
	private Locale loc;
	private HttpServletResponse response;
	private HttpServletRequest request;
	
	public CreaPDF(ElectorForm bean, HttpServletRequest request, HttpServletResponse response) {
		this.bean = bean;
		this.res = (org.apache.struts.util.MessageResources)request.getAttribute(Globals.MESSAGES_KEY);
		this.loc = (java.util.Locale)request.getSession().getAttribute(Globals.LOCALE_KEY);
		this.response = response;
		this.request = request;
	}
	
	public void generatePDF() {
		String strFormatTitle = "<tr><td align='right' width='350px'><strong>%1s:</strong></td>";
		String strFormatValue = "<td align='left' width='350px'>%1s</td></tr>";
		
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("<html><body><center>")
			.append("<img src='http://")
			.append(request.getServerName()).append(":").append(request.getServerPort())
			.append(request.getContextPath()).append("/media/top_intro.jpg' width='700' />")
			.append("<table width='700px' border='0' cellspacing='0' cellpadding='15' align='center'>")
			.append("<tr><td colspan='2'><h1>")
			.append(res.getMessage(loc,"elector.confirm.title"))
			.append("</h1></td></tr>")
			.append("<tr><td colspan='2'>")
			.append(res.getMessage(loc,"elector.confirm.text"))
			.append("</td></tr>")
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
			.append("</table></center></body></html>");
		
		try {
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document doc = (Document)builder.parse(new ByteArrayInputStream(buffer.toString().getBytes("UTF-8")));
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocument(doc, null);
            renderer.layout();
            response.setHeader("Content-Type", "application/force-download");
			response.setHeader("Content-Disposition", "attachment; filename=ConstanciaVotacionDNI[" + bean.getDni() + "].pdf");
            OutputStream os = response.getOutputStream();
            renderer.createPDF(os);
            os.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
	}

}
