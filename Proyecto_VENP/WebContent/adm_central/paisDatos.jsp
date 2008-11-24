<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:form action="paisDatos.do" focus="nombre">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <logic:equal name="paisDatosForm" property="nuevo" value="true"><bean:message key="pais.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="paisDatosForm" property="nuevo" value="true"><bean:message key="pais.titulo.editar" /></logic:notEqual>
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
                    <span class="label"><bean:message key="pais.nombre.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="nombre" maxlength="60" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="pais.abreviatura.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="abreviatura" maxlength="2" style="width: 100px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <html:submit value="Guardar" style="height: 30px; width: 100px;" />&nbsp;&nbsp;
                    <html:submit value="Cancelar" style="height: 30px; width: 100px;" onclick="this.form.cmd.value = 'cancelar';" />
                  </td>
                </tr>
              </table>
              </html:form>
            </div>