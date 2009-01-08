<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="637">
              <tr>
                <td align="center" class="boxError"><html:errors property="mensaje" /></td>
              </tr>
              <tr>
                <td align="left">
                  <table class="tableHead" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tableHeader" colspan="8"><bean:message key="usuario.titulo" /></td>
                    </tr>
                    <tr>
                      <td class="tableColumn" width="39"><bean:message key="usuario.header.codigo" /></td>
                      <td class="tableColumn" width="140"><bean:message key="usuario.header.nombre" /></td>
                      <td class="tableColumn" width="90"><bean:message key="usuario.header.dni" /></td>
                      <td class="tableColumn" width="130"><bean:message key="usuario.header.email" /></td>
                      <td class="tableColumn" width="90"><bean:message key="usuario.header.movil" /></td>
                      <td class="tableColumn" width="90"><bean:message key="usuario.header.username" /></td>
                      <td class="tableColumn" width="37"><img src="adm_central/images/nothing.gif" border="0" width="27" /></td>
                      <td class="tableColumn" width="15"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <logic:empty name="usuarioListaForm" property="lista">
                  <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                    <tr><td><bean:message key="usuario.lista.nohay" /></td></tr>
                  </table>
                  </logic:empty>
                  <logic:notEmpty name="usuarioListaForm" property="lista">
                  <div class="blockData">
                    <html:form action="usuarioLista.do">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <nested:iterate id="procesos" property="lista">
                      <tr>
                        <td class="dataRow dataCenter" width="40">
                          <nested:link paramId="codigo" paramProperty="codigo" href="usuarioDatos.do?cmd=editar">
                            <nested:write property="codigo" />
                          </nested:link>
                        </td>
                        <td class="dataRow dataLeft" width="139">&nbsp;<nested:write property="nombre" />&nbsp;<nested:write property="apePaterno" />&nbsp;<nested:write property="apeMaterno" /><br />${user.perfil.nombre}</td>
                        <td class="dataRow dataLeft" width="89">&nbsp;<nested:write property="dni" /></td>
                        <td class="dataRow dataLeft" width="129">&nbsp;<nested:write property="email" /></td>
                        <td class="dataRow dataLeft" width="90">&nbsp;<nested:write property="movil" /></td>
                        <td class="dataRow dataLeft" width="90">&nbsp;<nested:write property="userName" /></td>
                        <td class="dataRow dataCenter" width="37">
                          <nested:link paramId="codigo" paramProperty="codigo" href="usuarioLista.do?cmd=borrar">
                            <img src="adm_central/images/delete.gif" border="0" alt="<bean:message key="usuario.lista.borrar" />" />
                          </nested:link>
                        </td>
                      </tr>
                      </nested:iterate>
                    </table>
                    </html:form>
                  </div>
                  </logic:notEmpty>
                </td>
              </tr>
              <tr>
                <td align="left">
                  <table border="0" width="100%" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left">
                        <html:link href="usuarioDatos.do?cmd=nuevo" styleClass="btnAny">
                          <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
                        </html:link>
                      </td>
                      <td align="right">
                        <html:link href="usuarioAsignar.do?cmd=nuevo" styleClass="btnAny">
        	              <div style="top: 11px;"><bean:message key="general.opcion.asignar" /></div>
        	            </html:link>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>