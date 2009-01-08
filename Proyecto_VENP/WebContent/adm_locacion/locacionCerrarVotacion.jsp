<%@ include file="/includes/taglibs.inc.jsp" %>

            <html:form action="locacionCerrarVotacion.do">
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
                    <td class="thead" align="center" width="150"><bean:message key="locacion.cerrarVotacion.header1" /></td>
                    <td class="thead" align="center" width="200"><bean:message key="locacion.cerrarVotacion.header2" /></td>
                    <td class="thead" align="center" width="70"><bean:message key="locacion.cerrarVotacion.header3" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.cerrarVotacion.header4" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.cerrarVotacion.header5" /></td>
                    <td class="thead" align="center" width="56"><bean:message key="locacion.cerrarVotacion.header6" /></td>
                    <td class="thead" width="30">&nbsp;</td>
                  </tr>
                  <logic:empty name="locacionCerrarVotacionForm" property="lista">
                  <tr><td colspan="8" align="center" valign="middle"><br /><br /><br /><bean:message key="locacion.cerrarVotacion.nohaydatos" /><br /><br /><br /><br /></td></tr>
                  </logic:empty>
                  <logic:notEmpty name="locacionCerrarVotacionForm" property="lista">
                  <nested:iterate id="locacion" property="lista" >
				  <tr style="height: 27px;">
				    <td>&nbsp;</td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombrePais" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombreCentroVotacion" /></td>
				    <td class="alt01" valign="middle" align="center">GMT <nested:write property="tiempoGMT" />:00</td>
				    <td class="alt01" valign="middle" align="center"><nested:write property="horaLocal" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" align="center"><nested:write property="horaVotacionInicio" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" align="center">
				      <nested:lessEqual property="diferenciaFin" value="0">0</nested:lessEqual>
				      <nested:greaterThan property="diferenciaFin" value="0"><nested:write property="diferenciaFin" /></nested:greaterThan>
				    </td>
				    <td class="alt01" valign="middle" class="gridField" align="center">
				      <nested:link href="locacionCerrarVotacion.do?cmd=cerrarVotacion" paramId="keyValue" paramProperty="codigo"><img src="media/icoCerrarVotacion.gif" width="25" height="25" border="0" /></nested:link>
				    </td>
				  </tr>
				  </nested:iterate>
				  </logic:notEmpty>
				</table>
              </td>
            </tr> 
            </html:form>
            <tr>
              <td align="left">
                <br />
        	    <html:link href="locacionCerrarVotacion.do?cmd=listar" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.cerrarVotacion.actualizar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
              <td height="20" align="right">
                <br />
        	    <html:link forward="locacion-menu" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.cerrarVotacion.regresar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
            </tr>
            