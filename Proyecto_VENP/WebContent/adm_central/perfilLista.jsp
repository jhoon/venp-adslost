<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:errors property="mensaje" />
            </div>
            <div style="width: 630px; text-align: left;">
              <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="630">
                <tr align="center">
                  <td class="thead" colspan="5"><bean:message key="perfil.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="thead" width="5">&nbsp;</td>
                  <td class="thead" align="center" width="45"><bean:message key="perfil.header.codigo" /></td>
                  <td class="thead" align="center" width="203"><bean:message key="perfil.header.nombre" /></td>
                  <td class="thead" align="center" width="314"><bean:message key="perfil.header.descripcion" /></td>
                  <td class="thead" width="53">&nbsp;</td>
                </tr>
              </table>
            </div>
            <div style="width: 630px; text-align: left; height: 350px; overflow: auto;">
              <html:form action="perfilLista.do">
                <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="613" style="margin: 0px 0px 0px 0px">
                <logic:empty name="perfilListaForm" property="lista">
                  <tr>
                    <td colspan="5" align="center" valign="middle" style="height: 100px;">
                      <strong><bean:message key="perfil.lista.nohay" /></strong>
                    </td>
                  </tr>
                </logic:empty>
                <logic:notEmpty name="perfilListaForm" property="lista">
                <nested:iterate id="perfil" property="lista">
                  <tr style="height: 27px;">
				    <td width="5">&nbsp;</td>
				    <td class="alt01" valign="middle" align="center" width="59">
				      <nested:link paramId="codigo" paramProperty="codigo" href="perfilDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
				    </td>
				    <td class="alt01" valign="middle" align="left" width="200"><nested:write property="nombre" /></td>
				    <td class="alt01" valign="middle" align="left" width="319"><nested:write property="descripcion" /></td>
				    <td class="alt01" valign="middle" align="center" width="30">
                      <nested:link paramId="codigo" paramProperty="codigo" href="perfilLista.do?cmd=borrar"><img src="images/delete.gif" border="0" /></nested:link>
                    </td>
				  </tr>
				</nested:iterate>
				</logic:notEmpty>
				</table>
              </html:form>
            </div>
            <div style="width: 630px;">
              <html:link href="perfilDatos.do?cmd=nuevo" styleClass="btnAny">
                <div style="top: 11px;"><bean:message key="perfil.opcion.nuevo" /></div>
              </html:link>
            </div>