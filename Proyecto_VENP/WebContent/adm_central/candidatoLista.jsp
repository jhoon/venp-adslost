<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:errors property="mensaje" />
            </div>
            <div style="width: 630px; text-align: left;">
              <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="630">
                <tr align="center">
                  <td class="thead" colspan="8"><bean:message key="candidato.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="thead" width="5">&nbsp;</td>
                  <td class="thead" align="center" width="80"><bean:message key="candidato.header.codigo" /></td>
                  <td class="thead" align="center" width="285"><bean:message key="candidato.header.nombre" /></td>
                  <td class="thead" align="center" width="285"><bean:message key="candidato.header.paterno" /></td>
                  <td class="thead" align="center" width="335"><bean:message key="candidato.header.materno" /></td>
                  <td class="thead" align="center" width="335"><bean:message key="candidato.header.dni" /></td>
                  <td class="thead" align="center" width="335"><bean:message key="candidato.header.foto" /></td>
                  <td class="thead" width="53">&nbsp;</td>
                </tr>
              </table>
            </div>
            <div style="width: 630px; text-align: left; height: 350px; overflow: auto;">
              <html:form action="candidatoLista.do">
                <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="613" style="margin: 0px 0px 0px 0px">
                <logic:empty name="candidatoListaForm" property="lista">
                  <tr>
                    <td colspan="8" align="center" valign="middle" style="height: 100px;">
                      <strong><bean:message key="candidato.lista.nohay" /></strong>
                    </td>
                  </tr>
                </logic:empty>
                <logic:notEmpty name="candidatoListaForm" property="lista">
                <nested:iterate id="candidato" property="lista">
                  <tr style="height: 27px;">
				    <td>&nbsp;</td>
				    <td class="alt01" valign="middle" align="center">
				      <nested:link paramId="codigo" paramProperty="codigo" href="candidatoDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
				    </td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombre" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="paterno" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="materno" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="dni" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="foto" /></td>
				    <td class="alt01" valign="middle" align="center">
                      <nested:link paramId="codigo" paramProperty="codigo" href="candidatoLista.do?cmd=borrar"><img src="images/delete.gif" border="0" /></nested:link>
                    </td>
				  </tr>
				</nested:iterate>
				</logic:notEmpty>
				</table>
              </html:form>
            </div>
            <div style="width: 630px;">
              <html:link href="candidatoDatos.do?cmd=nuevo" styleClass="btnAny">
        	    <div style="top: 11px;"><bean:message key="candidato.opcion.nuevo" /></div>
        	  </html:link>
            </div>