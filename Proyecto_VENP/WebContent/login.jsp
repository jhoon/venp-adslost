<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<html>
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="includes/css/globals.css" />
<link rel="stylesheet" type="text/css" href="includes/css/auth.css" />
</head>
<script type="text/javascript">
function doLogin() {
	with(document.loginForm) {
		if(userName.value == "") {
			alert('<bean:message key="auth.login.usererror" />');
			userName.focus();
			return;
		}
		if(password.value == "") {
			alert('<bean:message key="auth.login.passerror" />');
			password.focus();
			return;
		}
		submit();
	}
}
function setFirstTimeFocus() {
	document.loginForm.userName.focus();
}
</script>
<body>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <jsp:include page="/includes/header.inc.jsp"></jsp:include>
  <tr>
    <td align="center" valign="top" class="introbg">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="150" colspan="2" align="center" valign="top">
        <img src="media/cibertec.jpg" width="166" height="116" border="0">
        </td>
      </tr>
      <tr>
        <td colspan="2" height="30"><html:errors property="error" /></td>
      </tr>
      <html:form action="login.do">
      <input type="hidden" name="cmd" value="logueo" />
      <html:hidden property="acceso" />
      <tr>
        <td colspan="2" height="30" align="center">
        	<table border="0" cellspacing="0" cellpadding="0">
        	  <tr>
        	    <td colspan="2" class="authHeader"><bean:message key="auth.login.label" /></td>
        	  </tr>
        	  <tr>
        	    <td colspan="2" height="30"></td>
        	  </tr>
        	  <tr>
        	    <td><div class="authLabel"><bean:message key="auth.login.user" />:</div></td>
        	    <td><html:text property="userName" styleClass="authInput" /></td>
        	  </tr>
        	  <tr>
        	    <td colspan="2" height="10"></td>
        	  </tr>
        	  <tr>
        	    <td><div class="authLabel"><bean:message key="auth.login.pass" />:</div></td>
        	    <td><html:password property="password" styleClass="authInput" /></td>
        	  </tr>
        	  <tr>
        	    <td colspan="2" height="40"></td>
        	  </tr>
        	  <tr>
        	    <td colspan="2" align="center">
        	    <html:link href="javascript:doLogin();" styleClass="authBtn">
        	    <div style="top: 11px;"><bean:message key="auth.login.btn" /></div>
        	    </html:link>
        	    </td>
        	  </tr>
        	</table>
        </td>
      </tr>
      </html:form>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <jsp:include page="/includes/footer.inc.jsp"></jsp:include>
    </table>
    </td>
  </tr>
</table>
</body>

</html>