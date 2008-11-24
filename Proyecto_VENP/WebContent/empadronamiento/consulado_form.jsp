<%@ include file="/includes/taglibs.inc.jsp"%>
<script type="text/javascript">
function sendEmpForm() {
	var v_dni = /[0-9]{8}/; 
	var v_email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/i;
	
	with(document.electorForm) {
		if(nombre.value == "") {
			alert("<bean:message key="emp.valida.nombre" />");
			nombre.focus();
			return;
		}
		if(paterno.value == "") {
			alert("<bean:message key="emp.valida.apepat" />");
			paterno.focus();
			return;
		}
		if(materno.value == "") {
			alert("<bean:message key="emp.valida.apemat" />");
			materno.focus();
			return;
		}
		if(!v_dni.test(dni.value)) {
			alert("<bean:message key="emp.valida.dni" />");
			dni.focus();
			return;
		}
		if(email.value == "" || !v_email.test(email.value)) {
			alert("<bean:message key="emp.valida.email" />");
			email.focus();
			return;
		}
		if(paisId.value == "0") {
			alert("<bean:message key="emp.form.escogepais" />");
			materno.focus();
			return;
		}
		if(locationId.value == "0") {
			alert("<bean:message key="emp.form.escogeconsulado" />");
			materno.focus();
			return;
		}
		cmd.value = "registrar";
		submit();
	}
}

function cambiaPais(frm) {
	frm.cmd.value = "pais";
	frm.submit();
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
      <html:form action="consulado.do">
      <input type="hidden" name="cmd" value="">
      <tr>
        <td colspan="2" align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.nombre" />:</div></td>
            <td><html:text property="nombre" styleClass="empField" style="width:200px;" maxlength="20"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.paterno" />:</div></td>
            <td><html:text property="paterno" styleClass="empField" style="width:200px;" maxlength="20"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.materno" />:</div></td>
            <td><html:text property="materno" styleClass="empField" style="width:200px;" maxlength="20"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.dni" />:</div></td>
            <td><html:text property="dni" styleClass="empField" style="width:100px;" maxlength="8"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.email" />:</div></td>
            <td><html:text property="email" styleClass="empField" style="width:200px;" maxlength="50"></html:text></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.pais" />:</div></td>
            <td><html:select property="paisId" onchange="cambiaPais(this.form)" styleClass="empField" style="width:200px;">
            <html:option value="0"><bean:message key="emp.form.escogepais" /></html:option>
            <html:optionsCollection property="paises" value="key" label="value" />
            </html:select></td>
          </tr>
          <tr><td colspan="2" height="10"></td></tr>
          <tr>
            <td><div class="empLabel"><bean:message key="emp.form.location" />:</div></td>
            <td><html:select property="locationId" styleClass="empField" style="width:200px;">
            <html:option value="0"><bean:message key="emp.form.escogeconsulado" /></html:option>
            <html:optionsCollection property="consulados" value="key" label="value" />
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
       	    <html:link href="javascript:sendEmpForm();" styleClass="sendBtn">
       	    <div style="top: 11px;"><bean:message key="emp.form.btn.send" /></div>
       	    </html:link>
       	    </td>
       	    <td>
       	    <html:link href="consulado.do" styleClass="sendBtn">
       	    <div style="top: 11px;"><bean:message key="emp.form.btn.cancel" /></div>
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