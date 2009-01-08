<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.usuarioAsignarForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function buscar() {
      with(document.usuarioAsignarForm) {
		if(procesoElectoralId.value == "0") {
			alert("<bean:message key="usuario.pe.noseleccionado" />");
			return;
		}
		if(usuarioId.value == "0") {
			alert("<bean:message key="usuario.user.noseleccionado" />");
			return;
		}
		
        cmd.value = "buscar";
        submit();
      }
    }
    
    function asignar() {
      with(document.usuarioAsignarForm) {
        if(cvOrigen.value == "") {
          alert("<bean:message key="cv.origen.noseleccionado" />");
          return;
        }
		
        cmd.value = "asignar";
        submit();
      }
    }
    
    function retirar() {
      with(document.usuarioAsignarForm) {
        if(cvDestino.value == "") {
          alert("<bean:message key="cv.destino.noseleccionado" />");
          return;
        }
		
        cmd.value = "retirar";
        submit();
      }
    }
    
    function cambiaPais(frm) {
	  frm.cmd.value = "pais";
	  frm.submit();
	}
  </script>
            <div class="blockForm">
              <html:form action="usuarioAsignar.do" focus="procesoElectoral_id">
              <input type="hidden" name="cmd" value="" />
              <html:hidden property="selectedPeId" />
              <html:hidden property="selectedUserId" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle">
                    <bean:message key="usuario.asignar.titulo" />
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.pe.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="procesoElectoralId" style="width: 280px;">
                      <html:option value="0">
                        <bean:message key="usuario.pe.escoge" />
                      </html:option>
                      <html:optionsCollection property="procesoElectoral" value="codigo" label="descripcion" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.user.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="usuarioId" style="width: 280px;">
                      <html:option value="0">
                        <bean:message key="usuario.user.escoge" />
                      </html:option>
                      <html:optionsCollection property="usuario" value="codigo" label="nombreCompleto" />
                    </html:select>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center">
                    <html:link href="javascript:buscar();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="general.opcion.buscar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
              <logic:notEqual name="usuarioAsignarForm" property="procesoElectoralId" value="">
              <logic:notEqual name="usuarioAsignarForm" property="usuarioId" value="">
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3">
                    <bean:write name="usuarioAsignarForm" property="selectedPeNombre" /><br />
                    <bean:write name="usuarioAsignarForm" property="selectedUserNombre" />
                  </td>
                </tr>
                <tr>
                  <td class="formLabel"><bean:message key="usuario.pais.label" /></td>
                  <td class="formSpace"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                  <td class="formData">
                    <html:select property="paisId" onchange="cambiaPais(this.form)" styleClass="empField" style="width: 280px;">
                      <html:option value="0">
                        <bean:message key="usuario.pais.escoge" />
                      </html:option>
                      <html:optionsCollection property="pais" value="codigo" label="nombre" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td colspan="3">
                    <table>
                      <tr>
                        <td><bean:message key="usuario.asignar.sLocacion" /></td>
                        <td></td>
                        <td><bean:message key="usuario.asignar.cLocacion" /></td>
                      </tr>
                      <tr>
                        <td>
                          <html:select size="10" property="cvOrigen">
                            <logic:notEmpty name="usuarioAsignarForm" property="cvsLocacion">
                            <html:optionsCollection property="cvsLocacion" value="codigo" label="nombre" />
                            </logic:notEmpty>
                          </html:select>
                        </td>
                        <td>
                          <html:link href="javascript:asignar();" styleClass="btnAny">
        	                <div style="top: 11px;"><bean:message key="general.opcion.asignar" /></div>
        	              </html:link>
                          <html:link href="javascript:retirar();" styleClass="btnAny">
        	                <div style="top: 11px;"><bean:message key="general.opcion.retirar" /></div>
        	              </html:link>
                        </td>
                        <td>
                          <html:select size="10" property="cvDestino">
                            <logic:notEmpty name="usuarioAsignarForm" property="cvcLocacion">
                            <html:optionsCollection property="cvcLocacion" value="codigo" label="nombre" />
                            </logic:notEmpty>
                          </html:select>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              </logic:notEqual>
              </logic:notEqual>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center">
                    <html:link href="javascript:cancelar();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="general.opcion.regresar" /></div>
        	        </html:link>
                  </td>
                </tr>
              </table>
              </html:form>
            </div>