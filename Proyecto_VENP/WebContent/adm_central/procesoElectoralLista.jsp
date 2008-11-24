<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center"><html:errors property="mensaje" /></td>
              </tr>
              <tr>
                <td>
                  <table class="tborder" cellspacing="1" cellpadding="6" align="left" border="0" width="100%">
                    <tr align="center">
                      <td class="ttitle" colspan="11" style="height: 30px;"><bean:message key="procesoElectoral.title" /></td>
                    </tr>
                    <tr align="center">
                      <td class="thead">&nbsp;</td>
                      <td class="thead">&nbsp;</td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.descripcion" /></td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.estado" /></td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.inicioPadron" /><br /><bean:message key="procesoElectoral.lista.finPadron" /></td>
		              <td class="thead"><bean:message key="procesoElectoral.lista.fechaVotacion" /></td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.horaInicio" /><br /><bean:message key="procesoElectoral.lista.horaFin" /></td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.tiempoSesion" /></td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.activar" /></td>
                      <td class="thead"><bean:message key="procesoElectoral.lista.anular" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td style="height: 350px;">
                  <html:form action="listaProcesoElectoral.do">
                    <div class="tBody">
                      <table cellspacing="1" cellpadding="6" align="left" border="0" width="100%">
                        <logic:empty name="listaProcesoElectoralForm" property="lista">
                        <tr>
                          <td align="center" valign="middle" class="sinElementos"><bean:message key="pe.lista.nohay" /></td>
                        </tr>
                        </logic:empty>
                
                
                
                
                <logic:notEmpty name="listaProcesoElectoralForm" property="lista">
                <nested:iterate id="procesos" property="lista">
                  <tr style="height: 27px;">
				    <td class="thead" width="5">&nbsp;</td>
                    <td class="alt01" valign="middle" align="center">
                      <nested:link href="procesoElectoralDatos.do?cmd=editar" paramId="codigo" paramProperty="codigo">
                        <nested:write property="codigo" />
                      </nested:link>
                    </td>
                    <td class="alt01" valign="middle" align="left"><nested:write property="descripcion" /></td>
                    <td class="alt01" valign="middle" align="center">
                      <nested:equal property="estado" value="A"><bean:message key="procesoElectoral.table.activo" /></nested:equal>                                 
                      <nested:equal property="estado" value="C"><bean:message key="procesoElectoral.table.creado" /></nested:equal>
                      <nested:equal property="estado" value="F"><bean:message key="procesoElectoral.table.cerrado" /></nested:equal>
                      <nested:equal property="estado" value="X"><bean:message key="procesoElectoral.table.anulado" /></nested:equal>
                    </td>
                    <td class="alt01" valign="middle" align="center"><nested:write property="fecha_padron_inicial" /><br /><nested:write property="fecha_padron_final" /></td>
                    <td class="alt01" valign="middle" align="center"><nested:write property="fecha_votacion" /></td>
                    <td class="alt01" valign="middle" align="center"><nested:write property="start_time" /><br /><nested:write property="final_time" /></td>
                    <td class="alt01" valign="middle" align="center"><nested:write property="tiempo_sesion" /></td>                                     
                    <td class="alt01" valign="middle" align="center">
                      <nested:link href="listaProcesoElectoral.do?cmd=activar" paramId="keyValue" paramProperty="codigo">
                        <bean:message key="procesoElectoral.table.activar"/>
                      </nested:link>                                      
                    </td>
                    <td class="alt01" valign="middle" align="center">
                      <nested:link href="listaProcesoElectoral.do?cmd=anular" 
                                   paramId="keyValue" 
                                   paramProperty="codigo">
                        <bean:message key="procesoElectoral.table.anular"/>
                      </nested:link>
                    </td>
				  </tr>
				</nested:iterate>
				</logic:notEmpty>
				</table>
            </div>
            
            
                  </html:form>
                </td>
              </tr>
              <tr>
                <td align="left">
                  <html:link href="procesoElectoralDatos.do?cmd=nuevo" styleClass="btnAny">
        	        <div style="top: 11px;"><bean:message key="perfil.opcion.nuevo" /></div>
        	      </html:link>
                </td>
              </tr>
            </table>