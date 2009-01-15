<%@ include file="/includes/taglibs.inc.jsp" %>
			<script language="javascript" type="text/javascript">
			function confirmDelete() {
				return confirm('<bean:message key="cedula.lista.confirm" />');
			}
			</script>
			<table border="0" cellpadding="0" cellspacing="0" width="637">
              <tr>
                <td align="center" class="boxError"><html:errors property="errors" /></td>
              </tr>
              <tr>
                <td align="left">
                  <table class="tableHead" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tableHeader" colspan="5"><bean:message key="cedula.lista.titulo" /></td>
                    </tr>
                    <tr>
                      <td class="tableColumn" width="50"><bean:message key="cedula.lista.codigo" /></td>
                      <td class="tableColumn" width="317"><bean:message key="cedula.lista.proceso" /></td>
                      <td class="tableColumn" width="100"><bean:message key="cedula.lista.tipo" /></td>
                      <td class="tableColumn" width="150"><bean:message key="cedula.lista.acciones" /></td>
                      <td class="tableColumn" width="15"><img src="adm_central/images/nothing.gif" border="0" width="1" /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="left">
                  <logic:empty name="listaCedulas">
                  <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                    <tr><td><bean:message key="cedula.lista.nohay" /></td></tr>
                  </table>
                  </logic:empty>
                  <logic:notEmpty name="listaCedulas">
                  <div class="blockData">
                    
                    <table border="0" cellspacing="0" cellpadding="0">
                      <logic:iterate id="cedula" name="listaCedulas">
                      <tr>
                        <td class="dataRow dataCenter" width="50">
                          <bean:write name="cedula" property="codigo" />
                        </td>
                        <td class="dataRow dataLeft" width="317">&nbsp;<bean:write name="cedula" property="procesoNombre" /></td>
                        <td class="dataRow dataLeft" width="100">&nbsp;
                        <logic:equal name="cedula" property="tipo" value="P">
                        	<bean:message key="cedula.tipo.presidencial" />
                        </logic:equal>
                        </td>
                        <td class="dataRow dataCenter" width="150">
                        <logic:equal name="cedula" property="estado" value="A">
	                        <nested:link name="cedula" paramId="id" paramProperty="codigo" styleClass="cedulaAction" href="cedula.do?cmd=editar">
	                            <bean:message key="cedula.lista.editar" />
	                        </nested:link>
	                        <nested:link name="cedula" paramId="id" paramProperty="codigo" styleClass="cedulaAction" href="cedula.do?cmd=borrar" onclick="return confirmDelete()">
	                            <bean:message key="cedula.lista.borrar" />
	                        </nested:link>
                        </logic:equal>
                        <logic:notEqual name="cedula" property="estado" value="A">
	                        <html:link styleClass="cedulaActionDisabled" href="#">
	                            <bean:message key="cedula.lista.editar" />
	                        </html:link>
	                        <html:link styleClass="cedulaActionDisabled" href="#">
	                            <bean:message key="cedula.lista.borrar" />
	                        </html:link>
                        </logic:notEqual>
                        <nested:link name="cedula" paramId="id" paramProperty="codigo" styleClass="cedulaAction" href="cedula.do?cmd=mostrar">
                            <bean:message key="cedula.lista.preview" />
                        </nested:link>
                        </td>
                      </tr>
                      </logic:iterate>
                    </table>

                  </div>
                  </logic:notEmpty>
                </td>
              </tr>
              <tr>
                <td align="left">
                  <html:link href="cedula.do?cmd=crear" styleClass="btnAny">
                    <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
        	      </html:link>
                </td>
              </tr>
            </table>