<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ page import="venp.beans.*"%>
<% UsuarioBean usuario =(UsuarioBean)session.getAttribute("usuarioBean"); %>

<html>
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="css/globals.css" />
<link rel="stylesheet" type="text/css" href="css/dhtmlgoodies_menu.css" />
<script type="text/javascript" src="js/color_functions.js"></script>
<script type="text/javascript" src="js/dhtmlgoodies_menu.js"></script>
</head>

<body>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <jsp:include page="/includes/header.inc.jsp"></jsp:include>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" align="left">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
            <span class="footer" style="font-size: 20px; font-weight: bold;"><bean:message key="global.mainmenu.btn3" /></span>
          </td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="color: #ffffff; font: bold 12px tahoma, verdana, arial;">
            <br /><br /><br />&nbsp;&nbsp;&nbsp;<bean:message key="auth.login.user" />:&nbsp;<%= usuario.getNombre() %>&nbsp;<%= usuario.getApePaterno() %>&nbsp;<%= usuario.getApeMaterno() %>&nbsp;<br /><br />
          </td>
        </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="left">
        <table cellpadding="0" cellspacing="0" border="0">
        <tr>
        <td>
	        <ul id="dhtmlgoodies_menu">
			<li>
			  <html:link href="listaProcesoElectoral.do?cmd=listar"><bean:message key="central.procesoElectoral" /></html:link>
			</li>
			<li>
			  <html:link href="menuMantenimiento.jsp"><bean:message key="central.mantenimiento" /></html:link>
			</li>
			<li>
			  <html:link href="#"><bean:message key="central.cedula" /></html:link>
			</li>
			<li>
			  <html:link href="listaEscrutinio.do?cmd=listarEscrutinio"><bean:message key="central.escrutinio" /></html:link>
			</li>
			<li>
			  <html:link href="listaConsolidacion.do?cmd=listarConsolidacion"><bean:message key="central.consolidacion" /></html:link>
			</li>
			<li>
			  <html:link href="login.do?cmd=salir"><bean:message key="central.cerrar" /></html:link>
			</li>
			</ul> 
        </td>
        <td valign="top" align="left">
			&nbsp;
        </td>
        </tr>
        </table>
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