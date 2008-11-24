<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ page import="venp.web.forms.*" %>
<% ElectorForm elector =(ElectorForm)request.getAttribute("Elector"); %>
<html>
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="css/globals.css" />
<link rel="stylesheet" type="text/css" href="css/votacion.css" />
</head>

<body>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
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
        <td colspan="2" class="confirmText" align="center">Por medio del presente documento queda constancia que usted ha ejercido su derecho al sufragio<br>como cuidadano peruano, segun lo estable la Constitucion Politica del Peru.</td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        	<table cellpadding="0" cellspacing="0">
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.nombre" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getNombre() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.paterno" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getPaterno() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.materno" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getMaterno() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.dni" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getDni() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.email" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getEmail() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.fecha" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getFechaSufragio() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.hora" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getHoraSufragio() %></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.gmt" />:</div></td>
        	  <td align="left" class="confirmText"><%= elector.getGmtSufragio() %></td>
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
          <html:link href="#" styleClass="grisBtn">
   	      <div style="top: 11px;">Imprimir</div>
   	      </html:link>
          </td>
          <td align="center">
          <html:link href="#" styleClass="grisBtn">
   	      <div style="top: 11px;">Descargar</div>
   	      </html:link>
          </td>
          <td align="center">
          <html:link href="#" styleClass="grisBtn">
   	      <div style="top: 11px;">Mandar por correo</div>
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