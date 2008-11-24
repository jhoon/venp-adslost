<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.usuarioDatosForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function sendUsuarioForm() {
	  var v_dni = /[0-9]{8}/; 
      var v_email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/i;
	
	  with(document.usuarioDatosForm) {
		if(perfil_id.value == "0") {
			alert("<bean:message key="usuario.perfil.noseleccionado" />");
			nombre.focus();
			return;
		}
		if(nombre.value == "") {
			alert("<bean:message key="usuario.nombre.empty" />");
			nombre.focus();
			return;
		}
		if(paterno.value == "") {
			alert("<bean:message key="usuario.paterno.empty" />");
			paterno.focus();
			return;
		}
		if(materno.value == "") {
			alert("<bean:message key="usuario.materno.empty" />");
			materno.focus();
			return;
		}
		if(!v_dni.test(dni.value)) {
			alert("<bean:message key="usuario.dni.empty" />");
			dni.focus();
			return;
		}
		if(email.value == "" || !v_email.test(email.value)) {
			alert("<bean:message key="usuario.email.empty" />");
			email.focus();
			return;
		}
		if(username.value == "") {
			alert("<bean:message key="usuario.username.empty" />");
			username.focus();
			return;
		}
		if(password.value == "") {
			alert("<bean:message key="usuario.password.empty" />");
			password.focus();
			return;
		}
		if (repassword.value != password.value) {
			alert("<bean:message key="usuario.password.noigual" />");
			repassword.focus();
			return;
		}
		
		cmd.value = "guardar";
		submit();
	  }
   }
  </script>
            <div style="width: 630px;">
              <html:form action="usuarioDatos.do">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <logic:equal name="usuarioDatosForm" property="nuevo" value="true"><bean:message key="usuario.titulo.nuevo" /></logic:equal>
                      <logic:notEqual name="usuarioDatosForm" property="nuevo" value="true"><bean:message key="usuario.titulo.editar" /></logic:notEqual>
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
                    <span class="label"><bean:message key="usuario.perfil.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                      <html:select property="perfil_id" styleClass="empField" style="width: 250px;">
                        <html:option value="0">
                          <bean:message key="usuario.perfil.escoge" />
                        </html:option>
                        <html:optionsCollection property="perfil" value="codigo" label="nombre" />
                      </html:select>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.nombre.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="nombre" maxlength="20" style="width: 200px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.paterno.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="paterno" maxlength="20" style="width: 170px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.materno.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="materno" maxlength="20" style="width: 170px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.dni.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="dni" maxlength="8" style="width: 100px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.email.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="email" maxlength="50" style="width: 250px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.movil.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="movil" maxlength="15" style="width: 150px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.username.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:text property="username" maxlength="10" style="width: 120px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.password.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:password property="password" maxlength="10" style="width: 120px;" /><br />
                  </td>
                </tr>
                <tr>
                  <td style="text-align: right; width: 300px; height: 35px;">
                    <span class="label"><bean:message key="usuario.repassword.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:password property="repassword" maxlength="10" style="width: 120px;" /><br />
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