<%@ include file="/includes/taglibs.inc.jsp" %>
			<table border="0" cellpadding="0" cellspacing="0" width="637">
	        <tr>
	          <td align="center" class="boxError"><html:errors property="mensaje" /></td>
	        </tr>
	        <tr>
              <td align="left">
              <table class="tableHead" cellspacing="0" cellpadding="0" border="0">
                <tr>
                  <td class="tableHeader" colspan="8"><bean:message key="candidato.titulo" /></td>
                </tr>
                <tr align="center">
                  <td class="tableColumn" width="41"><bean:message key="candidato.header.codigo" /></td>
                  <td class="tableColumn" width="120"><bean:message key="candidato.header.nombre" /></td>
                  <td class="tableColumn" width="120"><bean:message key="candidato.header.paterno" /></td>
                  <td class="tableColumn" width="120"><bean:message key="candidato.header.materno" /></td>
                  <td class="tableColumn" width="90"><bean:message key="candidato.header.dni" /></td>
                  <td class="tableColumn" width="90"><bean:message key="candidato.header.foto" /></td>
                  <td class="tableColumn" width="35"><img src="adm_central/images/nothing.gif" border="0" width="35" /></td>
                  <td class="tableColumn" width="15"><img src="adm_central/images/nothing.gif" border="0" width="15" /></td>
                </tr>
              </table>
              </td>
            </tr>
            <tr>
              <td align="left">
              <logic:empty name="candidatoListaForm" property="lista">
              <table class="tableEmpty" border="0" cellspacing="0" cellpadding="0">
                <tr><td><b><bean:message key="candidato.lista.nohay" /></b></td></tr>
              </table>
              </logic:empty>
              <logic:notEmpty name="candidatoListaForm" property="lista">
			  	<div class="blockData">
					<html:form action="candidatoLista.do">
					<table border="0" cellspacing="0" cellpadding="0">
					<nested:iterate id="candidato" property="lista">
					<tr>
					<td class="dataRow dataCenter" width="42">
					  <nested:link paramId="codigo" paramProperty="codigo" href="candidatoDatos.do?cmd=editar"><nested:write property="codigo" /></nested:link>
					</td>
					<td class="dataRow dataLeft" width="119">&nbsp;<nested:write property="nombre" /></td>
					<td class="dataRow dataLeft" width="120">&nbsp;<nested:write property="paterno" /></td>
					<td class="dataRow dataLeft" width="119">&nbsp;<nested:write property="materno" /></td>
					<td class="dataRow dataLeft" width="89">&nbsp;<nested:write property="dni" /></td>
					<td class="dataRow dataLeft" width="90">&nbsp;<nested:write property="foto" /></td>
					<td class="dataRow dataCenter" width="35">
	                <nested:link paramId="codigo" paramProperty="codigo" href="candidatoLista.do?cmd=borrar"><img src="adm_central/images/delete.gif" border="0" /></nested:link>
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
              <html:link href="candidatoDatos.do?cmd=nuevo" styleClass="btnAny">
        	    <div style="top: 11px;"><bean:message key="general.opcion.nuevo" /></div>
        	  </html:link>
              </td>
            </tr>
	        </table>