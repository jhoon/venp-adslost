<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
	function guardar() {
		with(document.perfilDatosForm) {
			submit();
		}
	}
	function cancelar() {
		with(document.perfilDatosForm) {
			cmd.value = "cancelar";
			submit();
		}
	}
  </script>
            <div class="blockForm">
              <html:form action="perfilDatos.do" focus="nombre">
              <input type="hidden" name="cmd" value="guardar" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle">
                    <logic:equal name="perfilDatosForm" property="nuevo" value="true"><bean:message key="perfil.titulo.nuevo" /></logic:equal>
                    <logic:notEqual name="perfilDatosForm" property="nuevo" value="true"><bean:message key="perfil.titulo.editar" /></logic:notEqual>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="perfil.nombre.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="nombre" maxlength="50" style="width: 250px;" /></td>
                </tr>
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="perfil.descripcion.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData"><html:text property="descripcion" maxlength="100" style="width: 250px;" /></td>
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