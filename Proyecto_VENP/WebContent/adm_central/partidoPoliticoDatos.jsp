<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    
    function sendAsignarForm() {
	  with(document.partidoPoliticoDatosForm) {
	    var v_href = "partidoPoliticoAsignar.do?cmd=nuevo&codigo=" + codigo.value;		
	  }
	  
	  document.location.href = v_href;
   }
  </script>
            <div class="blockForm">
              <html:form action="partidoPoliticoDatos.do" focus="nombre" enctype="multipart/form-data">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle">
                      <logic:equal name="partidoPoliticoDatosForm" property="nuevo" value="true"><bean:message key="partidoPolitico.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="partidoPoliticoDatosForm" property="nuevo" value="true"><bean:message key="partidoPolitico.titulo.editar" /></logic:notEqual>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="partidoPolitico.datos.nombre"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:text property="nombre" maxlength="40" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="partidoPolitico.datos.abreviatura"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:text property="abreviatura" maxlength="10" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <logic:notEmpty name="partidoPoliticoDatosForm" property="logo">
                <tr>
                  <td class="formLabel"><bean:message key="partidoPolitico.datos.imagen"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <img src='files/<nested:write property="logo"/>'width="74" height="74" border="0" />
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                </logic:notEmpty>
                <tr>
                  <td class="formLabel"><bean:message key="partidoPolitico.datos.logo"/></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:file property="theFile" style="width: 250px;" /><br />
                  </td>
                </tr>
                <logic:notEqual name="partidoPoliticoDatosForm" property="nuevo" value="true">
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="partidoPolitico.datos.candidatos" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <input type="button" value="..." OnClick="javascript:sendAsignarForm();">
                  </td>
                </tr>
                </logic:notEqual>
              </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right" style="height: 60px;">
                    <html:submit style="height: 30px; width: 100px;"><bean:message key="general.opcion.guardar" /></html:submit>
				  </td>
                  <td width="10">&nbsp;</td>
                  <td align="left">
			        <html:submit style="height: 30px; width: 100px;" onclick="this.form.cmd.value = 'cancelar';"><bean:message key="general.opcion.cancelar" /></html:submit>
                  </td>
                </tr>
              </table>
              </html:form>
            </div>