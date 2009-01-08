<%@ include file="/includes/taglibs.inc.jsp" %>
<script>
function guardar() {
	with(document.procesoElectoralDatosForm) {
		submit();
	}
}
function cancelar() {
	with(document.procesoElectoralDatosForm) {
		cmd.value = "cancelar";
		submit();
	}
}
</script>
            <div class="blockForm">
              <html:form action="procesoElectoralDatos.do" focus="nombre">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle"><bean:message key="procesoElectoral.datos" /></td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="error" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.nombre" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="nombre" style="width: 250px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="2"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formError"><html:errors property="nombre" /><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.fechavotacion" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <table cellpadding="0" cellspacing="0">
				      <tr>
					    <td><html:text property="fechaVotacion" styleId="fechaVotacion" readonly="true" style="width: 90px;" />&nbsp;</td>
					    <td><img src="media/calendar.gif" style="cursor:pointer;" onclick="displayCalendar($('fechaVotacion'), 'yyyy-mm-dd', this)" /></td>
				      </tr>
			        </table>	
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="2"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formError"><html:errors property="fechaVotacion" /><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.horainicio" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <table cellpadding="0" cellspacing="0">
					  <tr>
						<td>
						  <html:select property="horaInicial"><html:optionsCollection property="listaHoras" value="key" label="value" /></html:select>
						</td>
						<td>&nbsp;:&nbsp;</td>
						<td>
						  <html:select property="minutoInicial"><html:optionsCollection property="listaMinutos" value="key" label="value" /></html:select>
						</td>
                      </tr>
				    </table>
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.horafinal" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <table cellpadding="0" cellspacing="0">
					  <tr>
						<td>
						  <html:select property="horaFinal"><html:optionsCollection property="listaHoras" value="key" label="value" /></html:select>
						</td>
						<td>&nbsp;:&nbsp;</td>
						<td>
						  <html:select property="minutoFinal"><html:optionsCollection property="listaMinutos" value="key" label="value" /></html:select>
					    </td>
					  </tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.fechaempinicio" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <table cellpadding="0" cellspacing="0">
				      <tr>
					    <td><html:text property="fechaEmpInicio" styleId="fechaEmpInicio" readonly="true" style="width: 90px;" />&nbsp;</td>
					    <td><img src="media/calendar.gif" style="cursor:pointer;" onclick="displayCalendar($('fechaEmpInicio'), 'yyyy-mm-dd', this)" /></td>
				      </tr>
			        </table>	
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="2"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formError"><html:errors property="fechaEmpInicio" /><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.fechaempfinal" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <table cellpadding="0" cellspacing="0">
				      <tr>
					    <td><html:text property="fechaEmpFinal" styleId="fechaEmpFinal" readonly="true" style="width: 90px;" />&nbsp;</td>
					    <td><img src="media/calendar.gif" style="cursor:pointer;" onclick="displayCalendar($('fechaEmpFinal'), 'yyyy-mm-dd', this)" /></td>
				      </tr>
			        </table>	
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="2"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formError"><html:errors property="fechaEmpFinal" /><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="procesoElectoral.tiemposesion" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="tiempoSesion">
                      <html:optionsCollection property="listaTiempo" value="key" label="value" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
              </table>
              </html:form>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right">
                    <html:link href="javascript:guardar();" styleClass="btnAny">
					  <div style="top: 11px;"><bean:message key="general.opcion.guardar" /></div>
				    </html:link>
				  </td>
                  <td width="10">&nbsp;</td>
                  <td align="left">
			        <html:link href="javascript:cancelar();" styleClass="btnAny">
					  <div style="top: 11px;"><bean:message key="general.opcion.cancelar" /></div>
					</html:link>
                  </td>
                </tr>
              </table>
            </div>