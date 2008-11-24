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
		if(pais_id.value == "0") {
			alert("<bean:message key="cv.pais.noseleccionado" />");
			return;
		}
		if(zonahoraria_id.value == "0") {
			alert("<bean:message key="cv.zh.noseleccionado" />");
			return;
		}
		if(codigopostal.value == "") {
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
            <div style="width: 630px;">
              <html:form action="centrovotacionDatos.do">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <logic:equal name="centrovotacionDatosForm" property="nuevo" value="true"><bean:message key="cv.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="centrovotacionDatosForm" property="nuevo" value="true"><bean:message key="cv.titulo.editar" /></logic:notEqual>
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
                    <span class="label"><bean:message key="cv.pais.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:select property="pais_id" styleClass="empField" style="width: 220px;">
                      <html:option value="0">
                        <bean:message key="cv.pais.escoge" />
                      </html:option>
                      <html:optionsCollection property="pais" value="codigo" label="nombre" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="cv.zh.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:select property="zonahoraria_id" styleClass="empField" style="width: 100px;">
                      <html:option value="0">
                        <bean:message key="cv.zh.escoge" />
                      </html:option>
                      <html:optionsCollection property="zona_horaria" value="codigo" label="nombre" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="cv.cp.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="codigopostal" maxlength="10" style="width: 100px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="cv.nombre.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="nombre" maxlength="50" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="cv.region.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="region" maxlength="50" style="width: 200px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="cv.direccion.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="direccion" maxlength="100" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td valign="middle" style="text-align: right; width: 300px; height: 60px;">
                    <html:link href="javascript:sendUsuarioForm();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="usuario.opcion.guardar" /></div>
        	        </html:link>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td valign="middle" style="text-align: left; width: 300px;">
                    <html:link href="javascript:cancelar();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="usuario.opcion.cancelar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
              </html:form>
            </div>