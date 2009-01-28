<%@ include file="/includes/taglibs.inc.jsp" %>
<script type="text/javascript">
function doValidaPIN() {
	with(document.electorForm) {
		if(pin.value == "") {
			alert("<bean:message key='elector.validapin.alert' />");
			pin.focus();
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
        <html:form action="elector.do" focus="pin">
        <input type="hidden" name="cmd" value="validar" />
        <tr>
          <td><div class="txtWelcome"><bean:message key="elector.validapin.indicacion" /></div></td>
        </tr>
        <tr><td height="20"></td></tr>
        <tr>
          <td align="center"><html:password property="pin" styleClass="inputtext" maxlength="8"></html:password><html:errors property="pin" /></td>
        </tr>
        <tr><td height="20"></td></tr>
        <tr>
          <td align="center">
          <html:link href="javascript:doValidaPIN();" styleClass="grisBtn">
   	      <div style="top: 11px;"><bean:message key="elector.validapin.btnsiguiente" /></div>
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