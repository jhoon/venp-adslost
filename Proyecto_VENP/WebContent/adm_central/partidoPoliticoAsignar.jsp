<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.partidoPoliticoAsignarForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function buscar() {
      with(document.partidoPoliticoAsignarForm) {
		if(procesoElectoral_id.value == "0") {
			alert("<bean:message key="usuario.pe.noseleccionado" />");
			return;
		}
		if(usuario_id.value == "0") {
			alert("<bean:message key="usuario.user.noseleccionado" />");
			return;
		}
		
        cmd.value = "buscar";
        submit();
      }
    }
    
    function asignar() {
      with(document.partidoPoliticoAsignarForm) {
        if(cv_origen.value == "") {
          alert("<bean:message key="cv.origen.noseleccionado" />");
          return;
        }
		
        cmd.value = "asignar";
        submit();
      }
    }
    
    function retirar() {
      with(document.partidoPoliticoAsignarForm) {
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
              <html:form action="partidoPoliticoAsignar.do">
              <input type="hidden" name="cmd" value="" />
              <html:hidden property="codigo" />
              <table border="0" cellpadding="0" cellspacing="0" width="620" align="center">
                <tr>
                  <td colspan="3" style="text-align: center; height: 60px;" valign="middle">
                    <span class="title" style="font-size: 20px; font-weight: bold;">
                      <bean:message key="usuario.asignar.titulo" />
                    </span>
                  </td>
                </tr>
                <tr>
                  <td style="text-align: center; height: auto;">
                    <html:errors property="mensaje" />
                  </td>
                </tr>
                <tr>
                  <td colspan="3" align="center">
                    <span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:write name="partidoPoliticoAsignarForm" property="nombre" /></span>
                  </td>
                </tr>
                
                <tr>
                  <td colspan="3">
                    <table width="100%" border="0">
                      <tr>
                        <td align="center"><span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:message key="partidoPolitico.asignar.sLocacion" /></span></td>
                        <td>&nbsp;</td>
                        <td align="center"><span style="font: bold 13px tahoma, verdana, arial; color: #ffffff;"><bean:message key="partidoPolitico.asignar.cLocacion" /></span></td>
                      </tr>
                      <tr>
                        <td width="349" align="right">
                          <html:select size="10" property="cv_origen" styleClass="empField" style="width: 250px; height: 200px;">
                            <logic:notEmpty name="partidoPoliticoAsignarForm" property="sinCandidato">
                              <html:optionsCollection property="sinCandidato" value="codigo" label="nombreCompleto" />
                            </logic:notEmpty>
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
                            <logic:notEmpty name="partidoPoliticoAsignarForm" property="conCandidato">
                              <html:optionsCollection property="conCandidato" value="codigo" label="nombreCompleto" />
                            </logic:notEmpty>
                          </html:select>
                        </td>                      
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr style="height: 60px;">
                  <td valign="bottom" align="center" colspan="3">
                    <html:link href="javascript:cancelar();" styleClass="btnAny">
                      <div style="top: 11px;"><bean:message key="usuario.opcion.salir" /></div>
                    </html:link>
                  </td>
                </tr>
              </table>
              </html:form>
            </div>