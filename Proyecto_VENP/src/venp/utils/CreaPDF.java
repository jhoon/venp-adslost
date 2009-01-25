package venp.utils;

import java.io.ByteArrayInputStream;
import java.io.OutputStream;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.Globals;
import org.apache.struts.util.MessageResources;
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;

import venp.web.forms.ElectorForm;

public class CreaPDF {
	// Logging support
	private static final Log m_log = LogFactory.getLog(CreaPDF.class);
	
	private MessageResources res;
	private ElectorForm bean;
	private Locale loc;
	private HttpServletResponse response;
	
	public CreaPDF(ElectorForm bean, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated constructor stub
		this.bean = bean;
		this.res = (org.apache.struts.util.MessageResources)request.getAttribute(Globals.MESSAGES_KEY);
		this.loc = (java.util.Locale)request.getSession().getAttribute(Globals.LOCALE_KEY);
		this.response = response;
	}
	
	public void generatePDF(){
		
		
		
		//String strFormatTitle = "<tr><td align=\"right\">%1s&nbsp;:</td>";
		//String strFormatValue = "<td>&nbsp;%1s</td></tr>";
		
		String strFormatTitle = "<tr><td align=\"right\">%1s:</td>";
		String strFormatValue = "<td>%1s</td></tr>";
		
		StringBuffer buffer = new StringBuffer();
		buffer
			.append("<html><body><center>")
			.append(res.getMessage(loc,"elector.confirm.text")).append("<br /><br />")
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
			.append("</table></center></body></html>");
		System.out.println(buffer.toString());
		
		try {
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            //Document doc = (Document)builder.parse(new StringBufferInputStream(buffer.toString()));
            Document doc = (Document)builder.parse(new ByteArrayInputStream(buffer.toString().getBytes("UTF-8")));
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocument(doc, null);
            renderer.layout();
            OutputStream os = response.getOutputStream();
            renderer.createPDF(os);
            os.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

		//return buffer.toString();
	}


}
