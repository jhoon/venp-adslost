<%@ include file="/includes/taglibs.inc.jsp"%>
<link rel="stylesheet" type="text/css" href="empadronamiento/css/votacion.css" />
<table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" height="20"><html:errors /></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        <table>
        <html:form action="consulado.do">
        <input type="hidden" name="cmd" value="buscar">
        <tr>
          <td><div class="txtWelcome"><b><bean:message key="consulado.buscar.titulo" /></b></div></td>
        </tr>
        <tr>
          <td><div class="txtWelcome"><bean:message key="consulado.buscar.indicacion" /></div></td>
        </tr>
        <tr><td height="20"></td></tr>
        <tr>
          <td align="center"><html:text property="dni" styleClass="inputtext" maxlength="8"></html:text><html:errors property="dni" /></td>
        </tr>
        <tr><td height="20"></td></tr>
        <tr>
          <td align="center">
          <html:link href="javascript:doValidaDNI();" styleClass="grisBtn">
   	      <div style="top: 11px;"><bean:message key="elector.validadni.btnsiguiente" /></div>
   	      </html:link>
          </td>
        </tr>
        <tr><td height="100"></td></tr>
        <tr>
          <td align="center">
          <html:link href="login.do?cmd=salir" styleClass="grisBtn">
   	      <div style="top: 11px;"><bean:message key="consulado.btn.logout" /></div>
   	      </html:link>
          </td>
        </tr>
        </html:form>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="90"></td>
      </tr>
    </table><script type="text/javascript">
function doValidaDNI() {
	var v_dni = /[0-9]{8}/; 
	with(document.electorForm) {
		if(!v_dni.test(dni.value)) {
			alert("<bean:message key="consulado.valida.dni" />");
			dni.focus();
			return;
		}
		submit();
	}
}
</script>