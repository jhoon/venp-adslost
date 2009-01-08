<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.centrovotacionDatosForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function sendCVForm() {
	  with(document.centrovotacionDatosForm) {
		if(paisId.value == "0") {
			alert("<bean:message key="cv.pais.noseleccionado" />");
			return;
		}
		if(zonaHorariaId.value == "0") {
			alert("<bean:message key="cv.zh.noseleccionado" />");
			return;
		}
		if(codigoPostal.value == "") {
			alert("<bean:message key="cv.cp.empty" />");
			codigopostal.focus();
			return;
		}
		if(nombre.value == "") {
			alert("<bean:message key="cv.nombre.empty" />");
			nombre.focus();
			return;
		}
		if(region.value == "") {
			alert("<bean:message key="cv.region.empty" />");
			region.focus();
			return;
		}
		if(direccion.value == "") {
			alert("<bean:message key="cv.direccion.empty" />");
			direccion.focus();
			return;
		}
		
		cmd.value = "guardar";
		submit();
	  }
   }
  </script>
            <div class="blockForm">
              <html:form action="centrovotacionDatos.do" focus="paisId">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle">
                    <logic:equal name="centrovotacionDatosForm" property="nuevo" value="true"><bean:message key="cv.titulo.nuevo" /></logic:equal>
                    <logic:notEqual name="centrovotacionDatosForm" property="nuevo" value="true"><bean:message key="cv.titulo.editar" /></logic:notEqual>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="cv.pais.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="paisId" styleClass="empField" style="width: 220px;">
                      <html:option value="0">
                        <bean:message key="cv.pais.escoge" />
                      </html:option>
                      <html:optionsCollection property="pais" value="codigo" label="nombre" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="cv.zh.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="zonaHorariaId" styleClass="empField" style="width: 100px;">
                      <html:option value="0">
                        <bean:message key="cv.zh.escoge" />
                      </html:option>
                      <html:optionsCollection property="zonaHoraria" value="codigo" label="nombre" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="cv.cp.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="codigoPostal" maxlength="10" style="width: 100px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="cv.nombre.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="nombre" maxlength="50" style="width: 250px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="cv.region.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="region" maxlength="50" style="width: 200px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="cv.direccion.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="direccion" maxlength="100" style="width: 250px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
              </table>
              </html:form>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right">
                    <html:link href="javascript:sendCVForm();" styleClass="btnAny">
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