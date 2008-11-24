package venp.web.actions;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import venp.beans.CandidatoBean;
import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;
import venp.services.CandidatoService;
import venp.services.PartidoPoliticoService;
import venp.services.PerfilService;
import venp.web.forms.CandidatoDatosForm;
import venp.web.forms.PartidoPoliticoDatosForm;
import venp.web.forms.PerfilDatosForm;

public class CandidatoDatosAction extends DispatchAction {

	 
	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
 
	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String codigo = request.getParameter("codigo");

		CandidatoBean bean = findByPrimaryKey(codigo);

		CandidatoDatosForm frm = (CandidatoDatosForm) form;

		frm.setNuevo(false);
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setPaterno(bean.getPaterno());
		frm.setMaterno(bean.getMaterno());
		frm.setDni(bean.getDni());
		frm.setFoto(bean.getFoto());
		
		

		return mapping.findForward("inicio");
	}
	
	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CandidatoDatosForm frm = (CandidatoDatosForm) form;

		frm.setNuevo(true);
		frm.setCodigo("");
		frm.setNombre("");
		frm.setPaterno("");
		frm.setMaterno("");
		frm.setDni("");
		frm.setFoto("");
		System.out.println("aca");

		return mapping.findForward("inicio");
	}
	
	private CandidatoBean findByPrimaryKey(String codigo) throws Exception {
		CandidatoService service = new CandidatoService();
		CandidatoBean bean = service.findByPrimaryKey(Integer.parseInt(codigo));

		return bean;
	}
	
	
	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		 
		
		CandidatoDatosForm frm = (CandidatoDatosForm) form;
	     
		CandidatoBean  bean = new CandidatoBean();
	    
	    bean.setNombre(frm.getNombre());
	    bean.setPaterno(frm.getPaterno());
	    bean.setMaterno(frm.getMaterno());
	    bean.setDni(frm.getDni());
            
	    
		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.nombre.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else if (bean.getPaterno().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.paterno.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else if (bean.getMaterno().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.materno.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
			
		}
		else if (bean.getDni().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.dni.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
			
		}
		  else {
			if (frm.isNuevo()) {
				 
				FormFile myFile = frm.getTheFile();
			    String fileName    = myFile.getFileName();
			    
			    String ext= extension(fileName);
			    bean.setFoto(ext);
			    
				if (bean.getFoto()==null ) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("candidato.foto.null"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				else if (bean.getFoto().equals("")) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("candidato.foto.empty"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				
				}
			    
			    
			    grabar(bean,myFile,"insertar");
			    		 	    
			}
		    else {
		    	System.out.println("EDICION " );
		    	bean.setCodigo(Integer.parseInt(frm.getCodigo()));
		    	int tamano= frm.getTheFile().getFileSize();
		    	if (tamano==0){
		    		  
	  		         bean.setFoto("");
	  		         editar(bean);
		    	}else{
		    		FormFile myFile = frm.getTheFile();
				    String fileName    = myFile.getFileName();
				    
				    String ext= extension(fileName);
				    bean.setFoto(ext);
				    editar(bean);
				    grabar(bean,myFile,"update");
		    	}
		     
		    }

			return mapping.findForward("listado");
		}
	}
	
	private String insertar(CandidatoBean bean) throws Exception {
		String resultado;
		CandidatoService service = new CandidatoService();
		resultado = service.insertar(bean);
		return resultado;
	}
	
	private String editar(CandidatoBean bean) throws Exception {
		String resultado;
		CandidatoService service = new CandidatoService();
		resultado = service.editar(bean);
		return resultado; 
	}
	 
	private String extension(String fileName){
		String resultado ="";
		
		for(int i=fileName.length()-1;i>0;i--){
			  String a = String.valueOf(fileName.charAt(i));
			    if(!a.equals(".")){
			    	resultado = a+resultado;
			    }else{
			    	return resultado;
			    }
			
		}
		
		return null;
		
	}
 
	private void grabar(CandidatoBean bean,FormFile myFile,String operacion){
		
		String resultado;
		try {
			if(operacion.equals("insertar")){
				resultado = insertar(bean);
				 
			}else{
				resultado = editar(bean);
				 
			}
			
		if(!resultado.equals("")){
			
		
			 
	    	InputStream is = myFile.getInputStream();
	
	 	    String url = this.getServlet().getServletContext().getRealPath("/files");
	
	 	    System.out.println("\n\n#######\n" + url + "\n#######\n\n");
	
	 	    FileOutputStream os = new FileOutputStream(new File(url+"/"+resultado));	    
	 	    
	 	    int bytesRead = 0;
	 	    byte[] buffer = new byte[8192];
	 	    while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
	 	          os.write(buffer, 0, bytesRead);
	 	    }
	 	    os.close();
		}
		} catch (Exception e) {
			 
			e.printStackTrace();
		}	
	}
	
}