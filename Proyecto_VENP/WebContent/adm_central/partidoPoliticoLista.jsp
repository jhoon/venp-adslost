<%@ include file="/includes/taglibs.inc.jsp" %>
            <div style="width: 630px;">
              <html:errors property="mensaje" />
            </div>
            <div style="width: 630px; text-align: left;">
              <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="630">
                <tr align="center">
                  <td class="thead" colspan="6"><bean:message key="partidoPolitico.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="thead" width="5">&nbsp;</td>
                  <td class="thead" align="center" width="80"><bean:message key="partidoPolitico.header.codigo" /></td>
                  <td class="thead" align="center" width="285"><bean:message key="partidoPolitico.header.nombre" /></td>
                  <td class="thead" align="center" width="285"><bean:message key="partidoPolitico.header.abreviatura" /></td>
                  <td class="thead" align="center" width="335"><bean:message key="partidoPolitico.header.logo" /></td>
                  <td class="thead" width="53">&nbsp;</td>
                </tr>
              </table>
            </div>
            <div style="width: 630px; text-align: left; height: 350px; overflow: auto;">
              <html:form action="partidoPoliticoLista.do">
                <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="613" style="margin: 0px 0px 0px 0px">
                <logic:empty name="partidoPoliticoListaForm" property="lista">
                  <tr>
                    <td colspan="5" align="center" valign="middle" style="height: 100px;">
                      <strong><bean:message key="partidoPolitico.lista.nohay" /></strong>
                    </td>
                  </tr>
                </logic:empty>
                <logic:notEmpty name="partidoPoliticoListaForm" property="lista">
                <nested:iterate id="partido" property="lista">
                  <tr style="height: 27px;">
				    <td>&nbsp;</td>
				    <td class="alt01" valign="middle" align="center">
				      <nested:link paramId="codigo" paramProperty="codigo" href="partidoPoliticoDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
				    </td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombre" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="abreviatura" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="logo" /></td>
				    <td class="alt01" valign="middle" align="center">
                      <nested:link paramId="codigo" paramProperty="codigo" href="partidoPoliticoLista.do?cmd=borrar"><img src="images/delete.gif" border="0" /></nested:link>
                    </td>
				  </tr>
				</nested:iterate>
				</logic:notEmpty>
				</table>
              </html:form>
            </div>
            <div style="width: 630px;">
              <html:link href="partidoPoliticoDatos.do?cmd=nuevo" styleClass="btnAny">
        	    <div style="top: 11px;"><bean:message key="partidoPolitico.opcion.nuevo" /></div>
        	  </html:link>
            </div>