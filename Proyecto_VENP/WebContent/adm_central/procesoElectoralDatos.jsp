<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
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
            <div style="width: 630px;">
              <html:form action="procesoElectoralDatos.do" focus="nombre">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <bean:message key="procesoElectoral.datos" />
                    </span>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: center; height: auto;">
                    <html:errors property="mensaje" />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.nombre" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="nombre" />
				    <html:errors property="nombre" />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.fechavotacion" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <table cellpadding="0" cellspacing="0">
				      <tr>
					    <td>
					      <html:text property="fecha_votacion" styleId="fechaVotacion" readonly="true" />&nbsp;
					      <html:errors property="fecha_votacion" />
					    </td>
					    <td>
					      <img src="media/calendar.gif" style="cursor:pointer;" onclick="displayCalendar($('fechaVotacion'), 'yyyy-mm-dd', this)" />
					    </td>
				      </tr>
			        </table>	
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.horainicio" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <table cellpadding="0" cellspacing="0">
					  <tr>
						<td>
						  <html:select property="hora_inicial"><html:optionsCollection property="listaHoras" value="key" label="value" /></html:select>
						</td>
						<td>&nbsp;:&nbsp;</td>
						<td>
						  <html:select property="minuto_inicial"><html:optionsCollection property="listaMinutos" value="key" label="value" /></html:select>
						</td>
                      </tr>
				    </table>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.horafinal" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <table cellpadding="0" cellspacing="0">
					  <tr>
						<td>
						  <html:select property="hora_final"><html:optionsCollection property="listaHoras" value="key" label="value" /></html:select>
						</td>
						<td>&nbsp;:&nbsp;</td>
						<td>
						  <html:select property="minuto_final"><html:optionsCollection property="listaMinutos" value="key" label="value" /></html:select>
					    </td>
					  </tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.fechaempinicio" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <table cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
                          <html:text property="fecha_emp_inicio" styleId="fechaEmpInicio" readonly="true" />&nbsp;
                          <html:errors property="fecha_emp_inicio" />
                        </td>
                        <td>
                          <img src="media/calendar.gif" style="cursor:pointer;" onclick="displayCalendar($('fechaEmpInicio'), 'yyyy-mm-dd', this)" />
					    </td>
				      </tr>
				    </table>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.fechaempfinal" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <table cellpadding="0" cellspacing="0">
				      <tr>
					    <td>
						  <html:text property="fecha_emp_final" styleId="fechaEmpFinal" readonly="true"/>&nbsp;
						  <html:errors property="fecha_emp_final" />
					    </td>
					    <td>
					      <img src="media/calendar.gif" style="cursor:pointer;" onclick="displayCalendar($('fechaEmpFinal'), 'yyyy-mm-dd', this)" />
					    </td>
				      </tr>
			        </table>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="procesoElectoral.tiemposesion" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:select property="tiempo_sesion">
                      <html:optionsCollection property="listaTiempo" value="key" label="value" />
                    </html:select>
                  </td>
                </tr>
                <tr style="height: 60px;">
                  <td valign="bottom" align="right">
                    <html:link href="javascript:guardar();" styleClass="btnAny">
					  <div style="top: 11px;">Guardar</div>
				    </html:link>
		          </td>
		          <td style="width: 2px;">&nbsp;</td>
		          <td valign="bottom" align="left">
			        <html:link href="javascript:cancelar();" styleClass="btnAny">
					  <div style="top: 11px;">Cancelar</div>
					</html:link>
		          </td>
                </tr>
              </table>
              </html:form>
            </div>