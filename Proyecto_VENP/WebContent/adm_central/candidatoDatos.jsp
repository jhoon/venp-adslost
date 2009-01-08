<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.candidatoDatosForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function sendUsuarioForm() {
	  var v_dni = /[0-9]{8}/; 
	  
	  with(document.candidatoDatosForm) {
	 			 if(nombre.value == "") {
					alert("<bean:message key="candidato.nombre.empty" />");
					nombre.focus();
					return;
				}
		
		          if(paterno.value == "") {
					alert("<bean:message key="candidato.paterno.empty" />");
					paterno.focus();
					return;
				}
				
				if(materno.value == "") {
					alert("<bean:message key="candidato.materno.empty" />");
					materno.focus();
					return;
				}
		
	  			if(!v_dni.test(dni.value)) {
					alert("<bean:message key="candidato.dni.numero"/>");
					dni.focus();
					return;
		         }
	  	
	  		cmd.value = "guardar";
		    submit();
	  	 }
	  }
  </script>  
            <div class="blockForm">
              <html:form action="candidatoDatos.do" focus="nombre" enctype="multipart/form-data">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3"  class="tableFormTitle">
                      <logic:equal name="candidatoDatosForm" property="nuevo" value="true"><bean:message key="candidato.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="candidatoDatosForm" property="nuevo" value="true"><bean:message key="candidato.titulo.editar" /></logic:notEqual>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="candidato.datos.nombre"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:text property="nombre" maxlength="30" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="candidato.datos.paterno"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:text property="paterno" maxlength="30" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="candidato.datos.materno"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:text property="materno" maxlength="30" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="candidato.datos.dni"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:text property="dni" maxlength="8" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <logic:notEmpty name="candidatoDatosForm" property="foto">  
                <tr>
                  <td class="formLabel"><bean:message key="candidato.datos.imagen"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <img src='files/<nested:write property="foto"/>' width="74" height="74" border="0" />    
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                </logic:notEmpty>
                <tr>
                  <td class="formLabel">
                    <bean:message key="candidato.datos.foto"/>
                    <html:hidden property="foto" />
                  </td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:file property="theFile" style="width: 250px;" /><br />
                  </td>
                </tr>
              </table>
              </html:form>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right">
                    <html:link href="javascript:sendUsuarioForm();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="general.opcion.guardar" /></div>
        	        </html:link>
				  </td>
                  <td width="10">&nbsp;</td>
                  <td align="left">
			        <html:link href="javascript:cancelar();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="general.opcion.cancelar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
            </div>