<%@ include file="/includes/taglibs.inc.jsp" %>
  <script type="text/javascript">
    function cancelar() {
      with(document.partidoPoliticoAsignarForm) {
        cmd.value = "cancelar";
        submit();
      }
    }
    
    function asignar() {
      with(document.partidoPoliticoAsignarForm) {
        if(cvOrigen.value == "") {
          alert("<bean:message key="partidoPolitico.origen.empty" />");
          return;
        }
		
        cmd.value = "asignar";
        submit();
      }
    }
    
    function retirar() {
      with(document.partidoPoliticoAsignarForm) {
        if(cvDestino.value == "") {
          alert("<bean:message key="partidoPolitico.destino.empty" />");
          return;
        }
		
        cmd.value = "retirar";
        submit();
      }
    }
  </script>
            <div class="blockForm">
              <html:form action="partidoPoliticoAsignar.do">
              <input type="hidden" name="cmd" value="" />
              <html:hidden property="codigo" />
              <table class="tableForm" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="3" class="tableFormTitle">
                      <bean:message key="partidoPolitico.asignar.titulo" />
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="formErrorGeneral"><html:errors property="mensaje" /></td>
                </tr>
                <tr>
                  <td colspan="3" align="center" style="height: 30px;">
                    <span class="asignHeader"><bean:write name="partidoPoliticoAsignarForm" property="nombre" /></span>
                  </td>
                </tr>   
                <tr>
                  <td class="formError" colspan="3"><img src="adm_central/images/nothing.gif" border="0" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td colspan="3">
                    <table width="100%" border="0">
                      <tr>
                        <td align="center"><span class="asignHeader"><bean:message key="partidoPolitico.asignar.sLocacion" /></span></td>
                        <td>&nbsp;</td>
                        <td align="center"><span class="asignHeader"><bean:message key="partidoPolitico.asignar.cLocacion" /></span></td>
                      </tr>
                      <tr>
                        <td align="right">
                          <html:select size="10" property="cvOrigen" styleClass="empField" style="width: 250px; height: 200px;">
                            <logic:notEmpty name="partidoPoliticoAsignarForm" property="sinCandidato">
                              <html:optionsCollection property="sinCandidato" value="codigo" label="nombreCompleto" />
                            </logic:notEmpty>
                          </html:select>
                        </td>
                        <td width="150" align="center">
                          <input type="button" onclick="asignar()" value="<bean:message key="general.opcion.asignar" /> >>>" />
        	              <br>
        	              <br>
        	              <input type="button" onclick="retirar()" value="<<< <bean:message key="general.opcion.retirar" />" />
                        </td>
                        <td align="left">
                          <html:select size="10" property="cvDestino" styleClass="empField" style="width: 250px; height: 200px;">
                            <logic:notEmpty name="partidoPoliticoAsignarForm" property="conCandidato">
                              <html:optionsCollection property="conCandidato" value="codigo" label="nombreCompleto" />
                            </logic:notEmpty>
                          </html:select>
                        </td>                      
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              </html:form>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="center" style="height: 60px;">
                    <html:link href="javascript:cancelar();" styleClass="btnAny">
                      <div style="top: 11px;"><bean:message key="general.opcion.cancelar" /></div>
                    </html:link>
                  </td>
                </tr>
              </table>
            </div>