<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    
    function sendAsignarForm() {
	  with(document.partidoPoliticoDatosForm) {
	    var v_href = "partidoPoliticoAsignar.do?cmd=nuevo&codigo=" + codigo.value;		
	  }
	  
	  document.location.href = v_href;
   }
  </script>
            <div style="width: 630px;">
              <html:form action="partidoPoliticoDatos.do" focus="nombre" enctype="multipart/form-data">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <logic:equal name="partidoPoliticoDatosForm" property="nuevo" value="true"><bean:message key="partidoPolitico.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="partidoPoliticoDatosForm" property="nuevo" value="true"><bean:message key="partidoPolitico.titulo.editar" /></logic:notEqual>
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
                    <span class="label"><bean:message key="partidoPolitico.datos.nombre"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="nombre" maxlength="40" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="partidoPolitico.datos.abreviatura"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="abreviatura" maxlength="10" style="width: 250px;" /><br />
                  </td>
                </tr>
                <logic:notEmpty name="partidoPoliticoDatosForm" property="logo">
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="partidoPolitico.datos.imagen"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <img src='files/<nested:write property="logo"/>'width="74" height="74" border="0" />
                  </td>
                </tr>
                </logic:notEmpty>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="partidoPolitico.datos.logo"/></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:file property="theFile" style="width: 250px;" /><br />
                  </td>
                </tr>
                <logic:notEqual name="partidoPoliticoDatosForm" property="nuevo" value="true">
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="partidoPolitico.datos.candidatos" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <input type="button" value="..." OnClick="javascript:sendAsignarForm();">
                  </td>
                </tr>
                </logic:notEqual>
                <tr style="height: 60px;">
                  <td colspan="3" valign="bottom" align="center">
                    <html:submit value="Guardar" style="height: 30px; width: 100px;" />&nbsp;&nbsp;
                    <html:submit value="Cancelar" style="height: 30px; width: 100px;" onclick="this.form.cmd.value = 'cancelar';" />
                  </td>
                </tr>
              </table>
              </html:form>
            </div>