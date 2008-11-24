<%@ include file="/includes/taglibs.inc.jsp"%>
    <script>
		function imprimir() {
			alert("imprimiendo....");
		}
		</script><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2" class="empTitle"><bean:message key="emp.form.title" /></td>
      </tr>
      <tr>
        <td colspan="2" height="40"></td>
      </tr>
      <html:form action="consulado.do" onsubmit="return false();">
      <tr>
        <td colspan="2" align="center">
        
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.nombre" />:</div></td>
            <td><html:text property="nombre" styleClass="empField" style="width:200px;" maxlength="20" disabled="true"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.paterno" />:</div></td>
            <td><html:text property="paterno" styleClass="empField" style="width:200px;" maxlength="20" disabled="true"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.materno" />:</div></td>
            <td><html:text property="materno" styleClass="empField" style="width:200px;" maxlength="20" disabled="true"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.dni" />:</div></td>
            <td><html:text property="dni" styleClass="empField" style="width:100px;" maxlength="8" disabled="true"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.email" />:</div></td>
            <td><html:text property="email" styleClass="empField" style="width:200px;" maxlength="50" disabled="true"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.pais" />:</div></td>
            <td><html:select property="paisId" disabled="true" styleClass="empField" style="width:200px;">
            <html:option value="0"><bean:message key="emp.form.escogepais" /></html:option>
            <html:optionsCollection property="paises" value="key" label="value"/>
            </html:select></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.location" />:</div></td>
            <td><html:select property="locationId" disabled="true" styleClass="empField" style="width:200px;">
            <html:option value="0"><bean:message key="emp.form.escogeconsulado" /></html:option>
            <html:optionsCollection property="consulados" value="key" label="value"/>
            </html:select></td>
          </tr>
          <tr><td colspan="2" height="15"></td></tr>
          <tr>
            <td colspan="2"><html:errors /></td>
          </tr>
          <tr><td colspan="2" height="15"></td></tr>
          <tr>
       	    <td colspan="2" align="center">
       	    <table>
       	    <tr>
       	    <td>
       	    <html:link href="javascript:imprimir();" styleClass="sendBtn">
       	    <div style="top: 11px;"><bean:message key="consulado.btn.imprimir" /></div>
       	    </html:link>
       	    </td>
       	    <td>
       	    <html:link href="consulado.do?cmd=empadronar" styleClass="sendBtn">
       	    <div style="top: 11px;"><bean:message key="consulado.btn.editar" /></div>
       	    </html:link>
       	    </td>
       	    </tr>
       	    <tr>
       	    <td colspan="2" align="center">
       	    <html:link href="consulado.do" styleClass="sendBtn">
       	    <div style="top: 11px;"><bean:message key="consulado.btn.cancel" /></div>
       	    </html:link>
       	    </td>
       	    </tr>
       	    </table>
       	    </td>
       	  </tr>
        </table>
        </td>
      </tr>
      </html:form>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      
    </table>
