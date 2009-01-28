<%@ include file="/includes/taglibs.inc.jsp" %>
<script type="text/javascript">
function doValidaDNI() {
	var v_dni = /[0-9]{8}/; 
	with(document.electorForm) {
		if(!v_dni.test(dni.value)) {
			alert("<bean:message key='elector.valida.dni'/>");
			dni.focus();
			return;
		}
		submit();
	}
}
</script>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top" class="introbg">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="150" colspan="2" align="center" valign="top">
        <img src="media/cibertec.jpg" width="166" height="116" border="0">
        </td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2">
        <table>
        <html:form action="elector.do" focus="dni">
        <input type="hidden" name="cmd" value="buscar" />
        <tr>
          <td><div class="txtWelcome"><b><bean:message key="elector.validadni.welcome" /></b></div></td>
        </tr>
        <tr>
          <td><div class="txtWelcome"><bean:message key="elector.validadni.indicacion" /></div></td>
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
        </html:form>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="90"></td>
      </tr>
    </table>
    </td>
  </tr>
</table>