<%@ include file="/includes/taglibs.inc.jsp" %>

            <html:form action="locacionPuestaCero.do">
            <tr>
              <td colspan="2" align="center">
                <table border="0" width="100%">
                  <tr>
                    <td align="left" valign="middle" style="color: #ffffff; font: bold 12px tahoma, verdana, arial;">
                      <bean:message key="locacion.administracion.usuario" />
                      <nested:write property="usuario" />
                    </td>
                  </tr>
                  <tr><td align="center" valign="middle"><br /><html:errors property="mensaje" /><br /></td></tr>
                </table>
                <table class="tborder" cellspacing="1" cellpadding="6" align="center" border="0" width="100%">
                  <tr align="center">
                    <td class="thead">&nbsp;</td>
                    <td class="thead" align="center" width="150"><bean:message key="locacion.puestaCero.header1" /></td>
                    <td class="thead" align="center" width="200"><bean:message key="locacion.puestaCero.header2" /></td>
                    <td class="thead" align="center" width="90"><bean:message key="locacion.puestaCero.header3" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.puestaCero.header4" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.puestaCero.header5" /></td>
                    <td class="thead" align="center" width="56"><bean:message key="locacion.puestaCero.header6" /></td>
                    <td class="thead" width="30">&nbsp;</td>
                  </tr>
                  <logic:empty name="locacionPuestaCeroForm" property="listaLocaciones">
                  <tr><td colspan="8" align="center" valign="middle"><br /><br /><br /><bean:message key="locacion.puestaCero.nohaydatos" /><br /><br /><br /><br /></td></tr>
                  </logic:empty>
                  <logic:notEmpty name="locacionPuestaCeroForm" property="listaLocaciones">
                  <nested:iterate id="locacion" property="listaLocaciones" >
				  <tr style="height: 27px;">
				    <td>&nbsp;</td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombrePais" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombreCentroVotacion" /></td>
				    <td class="alt01" valign="middle" align="center">GMT <nested:write property="tiempoGMT" />:00</td>
				    <td class="alt01" valign="middle" align="center"><nested:write property="horaLocal" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" align="center"><nested:write property="horaVotacionInicio" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" align="center">
				      <nested:lessEqual property="diferenciaInicio" value="0">0</nested:lessEqual>
				      <nested:greaterThan property="diferenciaInicio" value="0"><nested:write property="diferenciaInicio" /></nested:greaterThan>
				    </td>
				    <td class="alt01" valign="middle" class="gridField" align="center">
				      <nested:link href="locacionPuestaCero.do?cmd=puestaCero" paramId="keyValue" paramProperty="codigo"><img src="media/icoPuestaCero.gif" width="25" height="25" border="0" /></nested:link>
				    </td>
				  </tr>
				  </nested:iterate>
				  </logic:notEmpty>
				</table>
              </td>
            </tr>
            <logic:equal name="locacionPuestaCeroForm" property="ok" value="ok">
              <tr>
                <td colspan="2" align="center">
                  <br /><br />
                  <table class="tborder" width="400" cellspacing="1" cellpadding="6" border="0">
                    <tr>
                      <td class="thead" colspan="2" align="center"><bean:message key="locacion.puestaCero.locacion" />: <bean:write name="locacionPuestaCeroForm" property="nombreLocacion" /></td>
                    </tr>
                    <tr>
                      <td width="200" class="alt01" align="right"><bean:message key="locacion.puestaCero.totalVoto" />: </td>
                      <td class="alt01" align="left">0</td>
                    </tr>
                    <tr>
                      <td class="alt02" align="right"><bean:message key="locacion.puestaCero.totalUsuario" />: </td>
                      <td class="alt02" align="left">0</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </logic:equal> 
            </html:form>
            <tr>
              <td align="left">
                <br />
        	    <html:link href="locacionPuestaCero.do?cmd=listar" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.puestaCero.actualizar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
              <td height="20" align="right">
                <br />
        	    <html:link forward="locacion-menu" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.puestaCero.regresar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
            </tr>
            