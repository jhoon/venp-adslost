<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="637">
              <tr>
                <td align="center" class="boxError"><html:errors property="mensaje" /></td>
              </tr>
              <tr>
                <td align="left">
                  <table class="tableHead" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tableHeader" colspan="10"><bean:message key="pais.titulo" /></td>
                    </tr>
                    <tr>
                      <td class="tableColumn" width="50"><bean:message key="pais.header.codigo" /></td>
                      <td class="tableColumn" width="467"><bean:message key="pais.header.nombre" /></td>
                      <td class="tableColumn" width="100"><bean:message key="pais.header.abreviatura" /></td>
                      <td class="tableColumn" width="15"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <logic:empty name="paisListaForm" property="lista">
                  <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                    <tr><td><bean:message key="pais.lista.nohay" /></td></tr>
                  </table>
                  </logic:empty>
                  <logic:notEmpty name="paisListaForm" property="lista">
                  <div class="blockData">
                    <html:form action="paisLista.do">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <nested:iterate id="pais" property="lista">
                      <tr>
                        <td class="dataRow dataCenter" width="51">
                          <nested:link paramId="codigo" paramProperty="codigo" href="paisDatos.do?cmd=editar">
                            <nested:write property="codigo" />
                          </nested:link>
                        </td>
                        <td class="dataRow dataLeft" width="467">&nbsp;<nested:write property="nombre" /></td>
                        <td class="dataRow dataCenter" width="99">&nbsp;<nested:write property="abreviatura" /></td>
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
                  <html:link href="paisDatos.do?cmd=nuevo" styleClass="btnAny">
                    <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
        	      </html:link>
                </td>
              </tr>
            </table>