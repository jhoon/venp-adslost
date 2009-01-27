<%@ include file="/includes/taglibs.inc.jsp" %>
            <html:form action="locacionMonitoreo.do">
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
                <table class="tborder" cellspacing="1" cellpadding="5" align="center" border="0" width="100%">
                  <tr align="center">
                    <td class="thead" width="10">&nbsp;</td>
                    <td class="thead" align="center" width="150"><bean:message key="locacion.monitoreo.header1" /></td>
                    <td class="thead" align="center" width="200"><bean:message key="locacion.monitoreo.header2" /></td>
                    <td class="thead" align="center" width="90"><bean:message key="locacion.monitoreo.header3" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.monitoreo.header4" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.monitoreo.header5" /></td>
                    <td class="thead" align="center" width="120"><bean:message key="locacion.monitoreo.header6" /></td>
                    <td class="thead" width="40">&nbsp;</td>
                  </tr>
                  <logic:empty name="locacionMonitoreoForm" property="lista">
                  <tr><td colspan="8" align="center" valign="middle"><br /><br /><br /><bean:message key="locacion.monitoreo.nohaydatos" /><br /><br /><br /><br /></td></tr>
                  </logic:empty>
                  <logic:notEmpty name="locacionMonitoreoForm" property="lista">
                  <nested:iterate id="locacion" property="lista" >
				  <tr style="height: 27px;">
				    <td>&nbsp;</td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombrePais" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="nombreCentroVotacion" /></td>
				    <td class="alt01" valign="middle" align="center">GMT <nested:write property="tiempoGMT" />:00</td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="horaLocal" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" align="left"><nested:write property="horaVotacionInicio" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" align="center"><nested:write property="horaVotacionFin" format="dd/MM/yyyy HH:mm" /></td>
				    <td class="alt01" valign="middle" class="gridField" align="center" style="cursor: pointer;">
				      <img src="media/icoMonitoreo.gif" width="25" height="25" border="0" onclick="showMonitoreo('detalle${locacion.codigo}')" title="<bean:message key="locacion.monitoreo.resumen" />" />
				    </td>
				  </tr>
				  <tr>
				    <td>&nbsp;</td>
				    <td colspan="8" class="alt02" align="left">
				      <div id="detalle${locacion.codigo}" style="display:none;" class="detalleMonitoreo">
				      <b><bean:message key="locacion.monitoreo.resumen" />:</b>
				      
  				      <table width="100%" class="graph" border="0" cellspacing="8" cellpadding="0">
				        <tr>
				          <td align="right" width="225"><bean:message key="locacion.monitoreo.header7" />:&nbsp;</td>
				          <td align="left" colspan="2"><nested:write property="puestaCero" format="dd/MM/yyyy HH:mm" /></td>
				        </tr>
				        <tr>
				          <td align="right" width="225"><bean:message key="locacion.monitoreo.header8" />:&nbsp;</td>
				          <td align="left" colspan="2"><nested:write property="cierreVotacion" format="dd/MM/yyyy HH:mm" /></td>
				        </tr>
				        <tr>
				          <td align="right" width="225"><bean:message key="locacion.monitoreo.electores" />:&nbsp;</td>
				          <td align="left" colspan="2"><nested:write property="nroElectores" /></td>
				        </tr>
				        <tr>
				          <td colspan="3">&nbsp;</td>
				        </tr>
                        <tr>
                          <td width="225" style="height: 26px;" align="right"><bean:message key="locacion.monitoreo.votos" /></td>
                          <td width="525" class="bar"><div style="width: ${locacion.nroVotosPorcentaje}%"></div><nested:write property="nroVotos" />/<nested:write property="nroElectores" /></td>
                          <td width="50" align="right"><nested:write property="nroVotosPorcentaje" />%</td>
                        </tr>
                        <tr>
                          <td align="right" style="height: 26px;"><bean:message key="locacion.monitoreo.sesion" /></td>
                          <td class="bar"><div style="width: ${locacion.nroElectorSesionPorcentaje}%"></div><nested:write property="nroElectorSesion" />/<nested:write property="nroElectores" /></td>
                          <td align="right"><nested:write property="nroElectorSesionPorcentaje" />%</td>
                        </tr>
                        <tr>
                          <td align="right" style="height: 26px;"><bean:message key="locacion.monitoreo.porVotar" /></td>
                          <td class="bar"><div style="width: ${locacion.nroVotosRestantesPorcentaje}%"></div><nested:write property="nroVotosRestantes" />/<nested:write property="nroElectores" /></td>
                          <td align="right"><nested:write property="nroVotosRestantesPorcentaje" />%</td>
                        </tr>
                      </table>
				      
				      </div>
				    </td>
				  </tr>
				  </nested:iterate>
				  </logic:notEmpty>
				</table>
              </td>
            </tr> 
            </html:form>
            <tr>
              <td height="20" align="left">
                <br />
        	    <html:link href="locacionMonitoreo.do?cmd=listar" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.monitoreo.actualizar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
              <td height="20" align="right">
                <br />
        	    <html:link forward="locacion-menu" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.monitoreo.regresar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
            </tr>
            