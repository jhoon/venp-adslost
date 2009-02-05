<%@ include file="/includes/taglibs.inc.jsp" %>
<jsp:useBean id="Elector" type="venp.web.forms.ElectorForm" scope="request" />
<script type="text/javascript">
function doConfirm(typeConfirm) {
	with(document.cedulaForm) {
		mode.value = typeConfirm;
		if(mode.value == "print") {
			var queryString = "";
			for(var i=0; i<elements.length; i++) {
				if(queryString != "") {
					queryString += "&";
				}
				queryString += elements[i].name + "=" + elements[i].value;
			}
			Popup.open({url:"votacion.do?" + queryString});
			//alert(queryString);
			return;
		} else if (mode.value == "pdf"){
			document.cedulaForm.target = "_blank";
		}else {
			document.cedulaForm.target = "_self";
		}
		submit();
	}
}

function doExit() {
	with(document.cedulaForm) {
		document.cedulaForm.action="login.do";
		document.cedulaForm.cmd.value="salir";
		alert('<bean:message key="elector.confirm.logout"/>');
		submit();
	}
}
</script>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
    <table border="0" cellspacing="0" cellpadding="0">
      <html:form action="votacion.do">
      <input type="hidden" name="cmd" value="confirm" />
      <input type="hidden" name="mode" value="confirm" />
      <input type="hidden" name="elector" value="<jsp:getProperty name="Elector" property="dni" />" />
      <input type="hidden" name="fecha" value="<jsp:getProperty name="Elector" property="fechaSufragio" />" />
      <input type="hidden" name="hora" value="<jsp:getProperty name="Elector" property="horaSufragio" />" />
      <input type="hidden" name="gmt" value="<jsp:getProperty name="Elector" property="gmtSufragio" />" />
      <tr>
        <td colspan="2" height="10" align="center"><html:errors/></td>
      </tr>
      <tr>
        <td colspan="2" class="confirmTitle"><bean:message key="elector.confirm.title" /></td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2" class="confirmText" align="center"><bean:message key="elector.confirm.text"/></td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        	<table cellpadding="0" cellspacing="0">
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.nombre" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="nombre" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.paterno" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="paterno" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.materno" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="materno" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.dni" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="dni" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.email" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="email" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.fecha" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="fechaSufragio" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.hora" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="horaSufragio" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.gmt" />:</div></td>
        	  <td align="left" class="confirmText"><jsp:getProperty name="Elector" property="gmtSufragio" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	</table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      <tr>
        <td colspan="2">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
	        <td align="center">
	        <html:link href="javascript:doConfirm('print');" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.print"/></div>
	   	    </html:link>
	        </td>
	        <td align="center">
	        <html:link href="javascript:doConfirm('pdf');" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.aspdf"/></div>
	   	    </html:link>
	        </td>
	        <td align="center">
	        <html:link href="javascript:doConfirm('mail');" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.sendmail"/></div>
	   	    </html:link>
	        </td>
        </tr>
        <tr>
        	<td align="center" colspan="3">
	        <html:link href="javascript:doExit();" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.exit"/></div>
	   	    </html:link>
	        </td>
        </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      </html:form>
    </table>
    </td>
  </tr>
</table>