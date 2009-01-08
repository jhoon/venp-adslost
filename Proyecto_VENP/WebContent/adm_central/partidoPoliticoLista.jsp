<%@ include file="/includes/taglibs.inc.jsp" %>
            <table border="0" cellpadding="0" cellspacing="0" width="637">
	        <tr>
	          <td align="center" class="boxError"><html:errors property="mensaje" /></td>
	        </tr>
	        <tr>
              <td align="left">
              <table class="tableHead" cellspacing="0" cellpadding="0" border="0">
                <tr>
                  <td class="tableHeader" colspan="6"><bean:message key="partidoPolitico.titulo" /></td>
                </tr>
                <tr>
                  <td class="tableColumn" width="41"><bean:message key="partidoPolitico.header.codigo" /></td>
                  <td class="tableColumn" width="250"><bean:message key="partidoPolitico.header.nombre" /></td>
                  <td class="tableColumn" width="109"><bean:message key="partidoPolitico.header.abreviatura" /></td>
                  <td class="tableColumn" width="180"><bean:message key="partidoPolitico.header.logo" /></td>
                  <td class="tableColumn" width="35"><img src="adm_central/images/nothing.gif" border="0" width="35" /></td>
                  <td class="tableColumn" width="15"><img src="adm_central/images/nothing.gif" border="0" width="15" /></td>
                </tr>
              </table>
              </td>
            </tr>
            <tr>
              <td align="left">
              <logic:empty name="partidoPoliticoListaForm" property="lista">
              <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                <tr><td><b><bean:message key="partidoPolitico.lista.nohay" /></b></td></tr>
              </table>
              </logic:empty>
              <logic:notEmpty name="partidoPoliticoListaForm" property="lista">
              <div class="blockData">
					<html:form action="partidoPoliticoLista.do">
					<table border="0" cellspacing="0" cellpadding="0">
	                <nested:iterate id="partido" property="lista">
	                  <tr>
					    <td class="dataRow dataCenter" width="42">
					      <nested:link paramId="codigo" paramProperty="codigo" href="partidoPoliticoDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
					    </td>
					    <td class="dataRow dataLeft" width="250">&nbsp;<nested:write property="nombre" /></td>
					    <td class="dataRow dataLeft" width="109">&nbsp;<nested:write property="abreviatura" /></td>
					    <td class="dataRow dataLeft" width="180">&nbsp;<nested:write property="logo" /></td>
					    <td class="dataRow dataCenter" width="35">
	                      <nested:link paramId="codigo" paramProperty="codigo" href="partidoPoliticoLista.do?cmd=borrar"><img src="adm_central/images/delete.gif" border="0" /></nested:link>
	                    </td>
					  </tr>
					</nested:iterate>
					</table>
					</html:form>
			  </div>
			  </logic:notEmpty>
              </td>
            </tr>
            <tr>
              <td align="left">
              <html:link href="partidoPoliticoDatos.do?cmd=nuevo" styleClass="btnAny">
        	    <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
        	  </html:link>
              </td>
            </tr>
            </table>