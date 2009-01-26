<%@ include file="/includes/taglibs.inc.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="Elector" type="venp.web.forms.ElectorForm" scope="request" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/votacion/css/votacion.css" />" />
<title><bean:message key="global.application.title" /></title>
</head>
<body class="bodyPF" onload="print();">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top" >
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" style="height:50px;"></td>
      </tr>
      <tr>
        <td colspan="2" class="confirmTitlePF"><bean:message key="elector.confirm.title" /></td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2" class="confirmTextPF" align="center"><bean:message key="elector.confirm.text"/></td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        	<table cellpadding="0" cellspacing="0">
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="emp.form.nombre" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="nombre" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="emp.form.paterno" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="paterno" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="emp.form.materno" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="materno" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="emp.form.dni" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="dni" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="emp.form.email" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="email" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="elector.confirm.fecha" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="fechaSufragio" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="elector.confirm.hora" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="horaSufragio" /></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabelPF"><bean:message key="elector.confirm.gmt" />:</div></td>
        	  <td align="left" class="confirmTextPF"><jsp:getProperty name="Elector" property="gmtSufragio" /></td>
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