<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:errors property="mensaje" />
            </div>
            <div style="width: 630px; text-align: left;">
              <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="630">
                <tr align="center">
                  <td class="thead" colspan="4"><bean:message key="pais.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="thead" width="5">&nbsp;</td>
                  <td class="thead" align="center" width="105"><bean:message key="pais.header.codigo" /></td>
                  <td class="thead" align="center" width="400"><bean:message key="pais.header.nombre" /></td>
                  <td class="thead" align="center" width="120"><bean:message key="pais.header.abreviatura" /></td>
                </tr>
              </table>
            </div>
            <div style="width: 630px; text-align: left; height: 350px; overflow: auto;">
              <html:form action="paisLista.do">
                <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="613">
                <logic:empty name="paisListaForm" property="lista">
                  <tr>
                    <td colspan="4" align="center" valign="middle" style="height: 100px;"><b><bean:message key="pais.lista.nohay" /></b></td>
                  </tr>
                </logic:empty>
                <logic:notEmpty name="paisListaForm" property="lista">
                <nested:iterate id="pais" property="lista">
                  <tr style="height: 27px;">
				    <td width="5">&nbsp;</td>
				    <td class="alt01" valign="middle" align="center" width="108">
				      <nested:link paramId="codigo" paramProperty="codigo" href="paisDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
				    </td>
				    <td class="alt01" valign="middle" align="left" width="391"><nested:write property="nombre" /></td>
				    <td class="alt01" valign="middle" align="center" width="109"><nested:write property="abreviatura" /></td>
				  </tr>
				</nested:iterate>
				</logic:notEmpty>
				</table>
              </html:form>
            </div>
            <div style="width: 630px;">
              <html:link href="paisDatos.do?cmd=nuevo" styleClass="btnAny">
                <div style="top: 11px;"><bean:message key="pais.opcion.nuevo" /></div>
              </html:link>
            </div>