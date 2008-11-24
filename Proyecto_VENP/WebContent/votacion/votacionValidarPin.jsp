<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<html>
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="css/globals.css" />
<link rel="stylesheet" type="text/css" href="css/votacion.css" />
</head>
<script type="text/javascript">
function doValidaPIN() {
	with(document.electorForm) {
		if(pin.value == "") {
			alert("Ingrese el PIN de acceso proporcionado.");
			pin.focus();
			return;
		}
		submit();
	}
}
</script>
<body>

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
        <html:form action="elector.do">
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
</body>

</html>