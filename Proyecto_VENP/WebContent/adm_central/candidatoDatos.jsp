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
            <div style="width: 630px;">
              <html:form action="candidatoDatos.do" focus="nombre">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <logic:equal name="candidatoDatosForm" property="nuevo" value="true"><bean:message key="candidato.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="candidatoDatosForm" property="nuevo" value="true"><bean:message key="candidato.titulo.editar" /></logic:notEqual>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: center; height: auto;">
                    <html:errors property="mensaje" />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="candidato.datos.nombre"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="nombre" maxlength="30" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="candidato.datos.paterno"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="paterno" maxlength="30" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="candidato.datos.materno"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="materno" maxlength="30" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="candidato.datos.dni"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="dni" maxlength="8" style="width: 250px;" /><br />
                  </td>
                </tr>
                <logic:notEmpty name="candidatoDatosForm" property="foto">  
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="candidato.datos.imagen"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <img src='files/<nested:write property="foto"/>'width="74" height="74" border="0" />    
                  </td>
                </tr>
                </logic:notEmpty>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="candidato.datos.foto"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:file property="theFile" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr style="height: 60px;">
                  <td valign="bottom" align="right">
                    <html:link href="javascript:sendUsuarioForm();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="candidato.opcion.guardar" /></div>
        	        </html:link>
        	      </td>
        	      <td width="2">&nbsp;</td>
        	      <td valign="bottom" align="left">
                    <html:link href="javascript:cancelar();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="candidato.opcion.cancelar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
              </html:form>
            </div>