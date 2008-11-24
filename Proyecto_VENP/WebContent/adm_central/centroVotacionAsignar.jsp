<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.centrovotacionAsignarForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function buscar() {
      with(document.centrovotacionAsignarForm) {
		if(procesoElectoral_id.value == "0") {
			alert("<bean:message key="cv.pe.noseleccionado" />");
			return;
		}
		if(pais_id.value == "0") {
			alert("<bean:message key="cv.pais.noseleccionado" />");
			return;
		}
		
        cmd.value = "buscar";
        submit();
      }
    }
    
    function asignar() {
      with(document.centrovotacionAsignarForm) {
        if(cv_origen.value == "") {
          alert("<bean:message key="cv.origen.noseleccionado" />");
          return;
        }
		
        cmd.value = "asignar";
        submit();
      }
    }
    
    function retirar() {
      with(document.centrovotacionAsignarForm) {
        if(cv_destino.value == "") {
          alert("<bean:message key="cv.destino.noseleccionado" />");
          return;
        }
		
        cmd.value = "retirar";
        submit();
      }
    }
  </script>
            <div style="width: 630px;">
              <html:form action="centrovotacionAsignar.do">
              <input type="hidden" name="cmd" value="" />
              <html:hidden property="s_pe_id" />
              <html:hidden property="s_pais_id" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <bean:message key="cv.asignar.titulo" />
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
                    <span class="label"><bean:message key="cv.pe.label" /></span>
                  </td>
                  <td style="width: 2px;">&nbsp;</td>
                  <td style="text-align: left; width: 300px;">
                    <html:select property="procesoElectoral_id" styleClass="empField" style="width: 280px;">
                      <html:option value="0">
                        <bean:message key="cv.pe.escoge" />
                      </html:option>
                      <html:optionsCollection property="procesoElectoral" value="codigo" label="descripcion" />
                    </html:select>
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
                <tr style="height: 60px;">
                  <td valign="bottom" align="center" colspan="3">
                    <html:link href="javascript:buscar();" styleClass="btnAny">
        	          <div style="top: 11px;"><bean:message key="cv.opcion.buscar" /></div>
        	        </html:link>
                  </td>
                </tr>
                <logic:notEqual name="centrovotacionAsignarForm" property="pais_id" value="">
                <logic:notEqual name="centrovotacionAsignarForm" property="procesoElectoral_id" value="">
                <tr>
                  <td colspan="3">
                    <table width="100%" border="0">
                      <tr>
                        <td colspan="3" align="center">
                          <br />
                          <span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:write name="centrovotacionAsignarForm" property="nombre_pe" /></span><br />
                          <span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:write name="centrovotacionAsignarForm" property="nombre_pais" /></span><br />
                          <br />
                        </td>
                      </tr>
                      <tr>
                        <td align="center"><span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:message key="cv.asignar.sLocacion" /></span></td>
                        <td>&nbsp;</td>
                        <td align="center"><span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:message key="cv.asignar.cLocacion" /></span></td>
                      </tr>
                      <tr>
                        <td width="349" align="right">
                          <html:select size="10" property="cv_origen" styleClass="empField" style="width: 250px; height: 200px;">
                            <html:optionsCollection property="cv_sLocacion" value="codigo" label="nombre" />
                          </html:select>
                        </td>
                        <td>
                          <html:link href="javascript:asignar();" styleClass="btnAny">
        	                <div style="top: 11px;"><bean:message key="cv.opcion.asignar" /></div>
        	              </html:link>
                          <html:link href="javascript:retirar();" styleClass="btnAny">
        	                <div style="top: 11px;"><bean:message key="cv.opcion.retirar" /></div>
        	              </html:link>
                        </td>
                        <td width="349" align="left">
                          <html:select size="10" property="cv_destino" styleClass="empField" style="width: 250px; height: 200px;">
                            <html:optionsCollection property="cv_cLocacion" value="codigo" label="nombre" />
                          </html:select>
                        </td>                      
                      </tr>
                    </table>
                  </td>
                </tr>              
                </logic:notEqual>
                </logic:notEqual>
                <tr style="height: 60px;">
                  <td valign="bottom" align="center" colspan="3">
                    <html:link href="javascript:cancelar();" styleClass="btnAny">
                      <div style="top: 11px;"><bean:message key="cv.opcion.salir" /></div>
                    </html:link>
                  </td>
                </tr>
              </table>
              </html:form>
            </div>