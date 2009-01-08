<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="637">
              <tr>
                <td align="center" class="boxError"><html:errors property="error" /></td>
              </tr>
              <tr>
                <td align="left">
                  <table class="tableHead" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tableHeader" colspan="10"><bean:message key="procesoElectoral.title" /></td>
                    </tr>
                    <tr>
                      <td class="tableColumn" width="20"><img src="adm_central/images/nothing.gif" border="0" width="9" /></td>
                      <td class="tableColumn" width="192"><bean:message key="procesoElectoral.lista.descripcion" /></td>
                      <td class="tableColumn" width="60"><bean:message key="procesoElectoral.lista.estado" /></td>
                      <td class="tableColumn" width="77"><bean:message key="procesoElectoral.lista.Padron" /><br /><bean:message key="procesoElectoral.lista.inicioPadron" />/<bean:message key="procesoElectoral.lista.finPadron" /></td>
                      <td class="tableColumn" width="77"><bean:message key="procesoElectoral.lista.fechaVotacion" /></td>
                      <td class="tableColumn" width="70"><bean:message key="procesoElectoral.lista.horaInicio" /><br /><bean:message key="procesoElectoral.lista.horaFin" /></td>
                      <td class="tableColumn" width="40"><bean:message key="procesoElectoral.lista.tiempoSesion" /></td>
                      <td class="tableColumn" width="37"><img src="adm_central/images/nothing.gif" border="0" width="27" /></td>
                      <td class="tableColumn" width="37"><img src="adm_central/images/nothing.gif" border="0" width="27" /></td>
                      <td class="tableColumn" width="16"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <logic:empty name="procesoElectoralListaForm" property="lista">
                  <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                    <tr><td><bean:message key="procesoElectoral.lista.nohay" /></td></tr>
                  </table>
                  </logic:empty>
                  <logic:notEmpty name="procesoElectoralListaForm" property="lista">
                  <div class="blockData">
                    <html:form action="procesoElectoralLista.do">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <nested:iterate id="procesos" property="lista">
                      <tr>
                        <td class="dataRow dataCenter" width="21">
                          <nested:link href="procesoElectoralDatos.do?cmd=editar" paramId="codigo" paramProperty="codigo">
                            <nested:write property="codigo" />
                          </nested:link>
                        </td>
                        <td class="dataRow dataLeft" width="192">&nbsp;<nested:write property="descripcion" /></td>
                        <td class="dataRow dataCenter" width="60">
                          <nested:equal property="estado" value="A"><bean:message key="procesoElectoral.table.activo" /></nested:equal>                                 
                          <nested:equal property="estado" value="C"><bean:message key="procesoElectoral.table.creado" /></nested:equal>
                          <nested:equal property="estado" value="F"><bean:message key="procesoElectoral.table.cerrado" /></nested:equal>
                          <nested:equal property="estado" value="X"><bean:message key="procesoElectoral.table.anulado" /></nested:equal>
                        </td>
                        <td class="dataRow dataCenter" width="77"><nested:write property="fechaPadronInicial" /><br /><nested:write property="fechaPadronFinal" /></td>
                        <td class="dataRow dataCenter" width="77"><nested:write property="fechaVotacion" /></td>
                        <td class="dataRow dataCenter" width="70"><nested:write property="startTime" /><br /><nested:write property="finalTime" /></td>
                        <td class="dataRow dataCenter" width="40"><nested:write property="tiempoSesion" /></td>                                     
                        <td class="dataRow dataCenter" width="37">
                          <nested:link href="procesoElectoralLista.do?cmd=activar" paramId="keyValue" paramProperty="codigo">
                            <img src="adm_central/images/activar.png" border="0" title="<bean:message key="procesoElectoral.table.activar" />" height="23" width="23" />
                          </nested:link>                                      
                        </td>
                        <td class="dataRow dataCenter" width="37">
                          <nested:link href="procesoElectoralLista.do?cmd=anular" paramId="keyValue" paramProperty="codigo">
                            <img src="adm_central/images/anular.png" border="0" title="<bean:message key="procesoElectoral.table.anular" />" height="23" width="23" />
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
                  <html:link href="procesoElectoralDatos.do?cmd=nuevo" styleClass="btnAny">
        	        <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
        	      </html:link>
                </td>
              </tr>
            </table>