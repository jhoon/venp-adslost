<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.usuarioDatosForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function sendUsuarioForm() {
	  with(document.usuarioDatosForm) {
	    var v_email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/i;
	      
		if(perfilId.value == "0") {
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
            <div class="blockForm">
              <html:form action="usuarioDatos.do" focus="nombre">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle">
                    <logic:equal name="usuarioDatosForm" property="nuevo" value="true"><bean:message key="usuario.titulo.nuevo" /></logic:equal>
                    <logic:notEqual name="usuarioDatosForm" property="nuevo" value="true"><bean:message key="usuario.titulo.editar" /></logic:notEqual>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.perfil.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="perfilId" style="width: 250px;">
                      <html:option value="0">
                        <bean:message key="usuario.perfil.escoge" />
                      </html:option>
                      <html:optionsCollection property="perfil" value="codigo" label="nombre" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.nombre.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="nombre" maxlength="20" style="width: 200px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.paterno.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="paterno" maxlength="20" style="width: 170px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.materno.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="materno" maxlength="20" style="width: 170px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.dni.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="dni" maxlength="8" style="width: 100px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.email.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="email" maxlength="50" style="width: 250px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.movil.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="movil" maxlength="10" style="width: 120px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.username.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="username" maxlength="8" style="width: 100px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.password.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:password property="password" maxlength="10" style="width: 120px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.repassword.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:password property="repassword" maxlength="10" style="width: 120px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
              </table>
              </html:form>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right">
                    <html:link href="javascript:sendUsuarioForm();" styleClass="btnAny">
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