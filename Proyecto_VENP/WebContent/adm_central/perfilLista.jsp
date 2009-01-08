<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="637">
              <tr>
                <td align="center" class="boxError"><html:errors property="mensaje" /></td>
              </tr>
              <tr>
                <td align="left">
                  <table class="tableHead" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tableHeader" colspan="5"><bean:message key="perfil.titulo" /></td>
                    </tr>
                    <tr>                    
                      <td class="tableColumn" width="49"><bean:message key="perfil.header.codigo" /></td>
                      <td class="tableColumn" width="230"><bean:message key="perfil.header.nombre" /></td>
                      <td class="tableColumn" width="300"><bean:message key="perfil.header.descripcion" /></td>
                      <td class="tableColumn" width="37"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                      <td class="tableColumn" width="15"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <logic:empty name="perfilListaForm" property="lista">
                  <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                    <tr><td><bean:message key="perfil.lista.nohay" /></td></tr>
                  </table>
                  </logic:empty>
                  <logic:notEmpty name="perfilListaForm" property="lista">
                  <div class="blockData">
                    <html:form action="perfilLista.do">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <nested:iterate id="perfil" property="lista">
                      <tr>
                        <td class="dataRow dataCenter" width="50">
                          <nested:link paramId="codigo" paramProperty="codigo" href="perfilDatos.do?cmd=editar">
                            <nested:write property="codigo" />
                          </nested:link>
                        </td>
                        <td class="dataRow dataLeft" width="230">&nbsp;<nested:write property="nombre" /></td>
                        <td class="dataRow dataLeft" width="300">&nbsp;<nested:write property="descripcion" /></td>
                        <td class="dataRow dataCenter" width="37">
                          <nested:link paramId="codigo" paramProperty="codigo" href="perfilLista.do?cmd=borrar">
                            <img src="adm_central/images/delete.gif" border="0" alt="<bean:message key="perfil.lista.borrar" />" />
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
                  <html:link href="perfilDatos.do?cmd=nuevo" styleClass="btnAny">
        	        <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
        	      </html:link>
                </td>
              </tr>
            </table>