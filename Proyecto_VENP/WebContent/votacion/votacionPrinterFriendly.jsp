<%@ include file="/includes/taglibs.inc.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% ElectorForm elector = (ElectorForm)request.getAttribute("Elector"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="venp.web.forms.ElectorForm"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="global.application.title" /></title>
</head>
<body onload="javascript:window.print();">
	<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top" >
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" height="10"></td>
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
        	  <td align="left" class="confirmText"><%=elector.getNombre()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.paterno" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getPaterno()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.materno" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getMaterno()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.dni" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getDni()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.email" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getEmail()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.fecha" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getFechaSufragio()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.hora" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getHoraSufragio()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.gmt" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getGmtSufragio()%></td>
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
	        <html:link href="#" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.aspdf"/></div>
	   	    </html:link>
	        </td>
	        <td align="center">
	        <html:link href="javascript:doConfirm('mail');" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.mail"/></div>
	   	    </html:link>
	        </td>
          
        </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>