<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<html>
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="includes/css/globals.css" />
</head>

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
        <td align="center" height="120">
        <html:link href="empadronamiento.do?cmd=menu" styleClass="mainMenuBtn">
   	    <div style="top: 42px;"><bean:message key="global.mainmenu.btn1" /></div>
   	    </html:link>
        </td>
        <td align="center">
        <html:link href="votacion.do" styleClass="mainMenuBtn">
   	    <div style="top: 42px;"><bean:message key="global.mainmenu.btn2" /></div>
   	    </html:link>
        </td>
      </tr>
      <tr>
        <td align="center" height="120">
        <html:link href="login.do?acceso=admin" styleClass="mainMenuBtn">
   	    <div style="top: 35px;"><bean:message key="global.mainmenu.btn3" /></div>
   	    </html:link>
        </td>
        <td align="center">
        <html:link href="login.do?acceso=location" styleClass="mainMenuBtn">
   	    <div style="top: 35px;"><bean:message key="global.mainmenu.btn4" /></div>
   	    </html:link>
        </td>
      </tr>
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