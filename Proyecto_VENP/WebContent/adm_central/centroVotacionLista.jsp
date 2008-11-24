<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:errors property="mensaje" />
            </div>
            <div style="width: 630px; text-align: left;">
              <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="630">
                <tr align="center">
                  <td class="thead" colspan="8"><bean:message key="cv.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="thead" width="5">&nbsp;</td>
                  <td class="thead" align="center" width="45"><bean:message key="cv.header.codigo" /></td>
                  <td class="thead" align="center" width="120"><bean:message key="cv.header.pais" /></td>
                  <td class="thead" align="center" width="150"><bean:message key="cv.header.nombre" /></td>
                  <td class="thead" align="center" width="80"><bean:message key="cv.header.hora" /></td>
                  <td class="thead" align="center" width="150"><bean:message key="cv.header.codigoPostal" /></td>
                  <td class="thead" width="53">&nbsp;</td>
                </tr>
              </table>
            </div>
            <div style="width: 630px; text-align: left; height: 350px; overflow: auto;">
              <html:form action="centrovotacionLista.do">
                <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="613" style="margin: 0px 0px 0px 0px">
                <logic:empty name="centrovotacionListaForm" property="lista">
                  <tr>
                    <td colspan="5" align="center" valign="middle" style="height: 100px;">
                      <strong><bean:message key="cv.lista.nohay" /></strong>
                    </td>
                  </tr>
                </logic:empty>
                <logic:notEmpty name="centrovotacionListaForm" property="lista">
                <nested:iterate id="user" property="lista">
                  <tr style="height: 27px;">
                    <td width="5">&nbsp;</td>
				    <td class="alt01" valign="middle" align="center">
				      <nested:link paramId="codigo" paramProperty="codigo" href="centrovotacionDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
				    </td>
				    <td class="alt01" valign="middle" align="left">${cv.pais.nombre}</td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombre" /></td>
				    <td class="alt01" valign="middle" align="center">${cv.zonaHoraria.nombre}</td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="codigoPostal" /><br /><nested:write property="direccion" /></td>
				    <td class="alt01" valign="middle" align="center">
                      <nested:link paramId="codigo" paramProperty="codigo" href="centrovotacionLista.do?cmd=borrar"><img src="images/delete.gif" border="0" /></nested:link>
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
                    <html:link href="centrovotacionDatos.do?cmd=nuevo" styleClass="btnAny">
                      <div style="top: 11px;"><bean:message key="cv.opcion.nuevo" /></div>
                    </html:link>
                  </td>
                  <td align="left">
                    <html:link href="centrovotacionAsignar.do?cmd=nuevo" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="cv.opcion.asignar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
            </div>