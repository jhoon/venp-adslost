<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:errors property="mensaje" />
            </div>
            <div style="width: 630px; text-align: left;">
              <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="630">
                <tr align="center">
                  <td class="thead" colspan="8"><bean:message key="usuario.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="thead" width="5">&nbsp;</td>
                  <td class="thead" align="center" width="45"><bean:message key="usuario.header.codigo" /></td>
                  <td class="thead" align="center" width="100"><bean:message key="usuario.header.nombre" /></td>
                  <td class="thead" align="center" width="103"><bean:message key="usuario.header.dni" /></td>
                  <td class="thead" align="center" width="100"><bean:message key="usuario.header.email" /></td>
                  <td class="thead" align="center" width="100"><bean:message key="usuario.header.movil" /></td>
                  <td class="thead" align="center" width="114"><bean:message key="usuario.header.username" /></td>
                  <td class="thead" width="53">&nbsp;</td>
                </tr>
              </table>
            </div>
            <div style="width: 630px; text-align: left; height: 350px; overflow: auto;">
              <html:form action="usuarioLista.do">
                <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="613" style="margin: 0px 0px 0px 0px">
                <logic:empty name="usuarioListaForm" property="lista">
                  <tr>
                    <td colspan="5" align="center" valign="middle" style="height: 100px;">
                      <strong><bean:message key="usuario.lista.nohay" /></strong>
                    </td>
                  </tr>
                </logic:empty>
                <logic:notEmpty name="usuarioListaForm" property="lista">
                <nested:iterate id="user" property="lista">
                  <tr style="height: 27px;">
				    <td width="5">&nbsp;</td>
				    <td class="alt01" valign="middle" align="center" width="59">
				      <nested:link paramId="codigo" paramProperty="codigo" href="usuarioDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
				    </td>
				    <td class="alt01" valign="middle" align="left" width="100"><nested:write property="nombre" />&nbsp;<nested:write property="apePaterno" />&nbsp;<nested:write property="apeMaterno" /><br />${user.perfil.nombre}</td>
				    <td class="alt01" valign="middle" align="left" width="100"><nested:write property="dni" /></td>
				    <td class="alt01" valign="middle" align="left" width="100"><nested:write property="email" /></td>
				    <td class="alt01" valign="middle" align="left" width="100"><nested:write property="movil" /></td>
				    <td class="alt01" valign="middle" align="left" width="119"><nested:write property="userName" /></td>
				    <td class="alt01" valign="middle" align="center" width="30">
                      <nested:link paramId="codigo" paramProperty="codigo" href="usuarioLista.do?cmd=borrar"><img src="images/delete.gif" border="0" /></nested:link>
                    </td>
				  </tr>
				</nested:iterate>
				</logic:notEmpty>
				</table>
              </html:form>
            </div>
            <div style="width: 630px;">
              <table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="left">
                    <html:link href="usuarioDatos.do?cmd=nuevo" styleClass="btnAny">
                      <div style="top: 11px;"><bean:message key="usuario.opcion.nuevo" /></div>
                    </html:link>
                  </td>
                  <td align="left">
                    <html:link href="usuarioAsignar.do?cmd=nuevo" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="usuario.opcion.asignar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
            </div>