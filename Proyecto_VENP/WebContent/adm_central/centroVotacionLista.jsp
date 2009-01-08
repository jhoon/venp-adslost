<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="637">
              <tr>
                <td align="center" class="boxError"><html:errors property="mensaje" /></td>
              </tr>
              <tr>
                <td align="left">
                  <table class="tableHead" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tableHeader" colspan="8"><bean:message key="cv.titulo" /></td>
                    </tr>
                    <tr>
                      <td class="tableColumn" width="39"><bean:message key="cv.header.codigo" /></td>
                      <td class="tableColumn" width="120"><bean:message key="cv.header.pais" /></td>
                      <td class="tableColumn" width="187"><bean:message key="cv.header.nombre" /></td>
                      <td class="tableColumn" width="80"><bean:message key="cv.header.hora" /></td>
                      <td class="tableColumn" width="150"><bean:message key="cv.header.codigoPostal" /></td>
                      <td class="tableColumn" width="37"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                      <td class="tableColumn" width="16"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <logic:empty name="centrovotacionListaForm" property="lista">
                  <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                    <tr><td><bean:message key="cv.lista.nohay" /></td></tr>
                  </table>
                  </logic:empty>
                  <logic:notEmpty name="centrovotacionListaForm" property="lista">
                  <div class="blockData">
                    <html:form action="centrovotacionLista.do">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <nested:iterate id="cv" property="lista">
                      <tr>
                        <td class="dataRow dataCenter" width="40">
                          <nested:link paramId="codigo" paramProperty="codigo" href="centrovotacionDatos.do?cmd=editar">
                            <nested:write property="codigo" />
                          </nested:link>
                        </td>
                        <td class="dataRow dataLeft" width="120">&nbsp;${cv.pais.nombre}</td>
                        <td class="dataRow dataLeft" width="187">&nbsp;<nested:write property="nombre" /></td>
                        <td class="dataRow dataCenter" width="80">&nbsp;${cv.zonaHoraria.nombre}</td>
                        <td class="dataRow dataLeft" width="150">&nbsp;<nested:write property="codigoPostal" /><br />&nbsp;<nested:write property="direccion" /></td>
                        <td class="dataRow dataCenter" width="37">
                          <nested:link paramId="codigo" paramProperty="codigo" href="centrovotacionLista.do?cmd=borrar">
                            <img src="adm_central/images/delete.gif" border="0" alt="<bean:message key="cv.lista.borrar" />" />
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
                        <html:link href="centrovotacionDatos.do?cmd=nuevo" styleClass="btnAny">
                          <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
                        </html:link>
                      </td>
                      <td align="right">
                        <html:link href="centrovotacionAsignar.do?cmd=nuevo" styleClass="btnAny">
        	              <div style="top: 11px;"><bean:message key="general.opcion.asignar" /></div>
        	            </html:link>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>