<%@ include file="/includes/taglibs.inc.jsp" %>
<%@ page import="venp.beans.*" %>
<% UsuarioBean usuario =(UsuarioBean)session.getAttribute("usuarioBean"); %>

<html>

  <head>
    <title><bean:message key="global.application.title" /></title>
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/adm_central/css/central.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/dhtmlgoodies_menu.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/dhtmlgoodies_calendar.css" />" />
    <script type="text/javascript" src="<html:rewrite page="/includes/js/color_functions.js" />"></script>
    <script type="text/javascript" src="<html:rewrite page="/includes/js/dhtmlgoodies_menu.js" />"></script>
  	<script type="text/javascript" src="<html:rewrite page="/includes/js/prototype.js" />"></script>
    <script type="text/javascript" src="<html:rewrite page="/includes/js/dhtmlgoodies_calendar.js" />"></script>    
  </head>
  
  <body>
    <table border="0" cellspacing="0" cellpadding="0" width="800" style="margin: 0px 0px 0px 0px;">
      <tr>
        <td width="800">
          <tiles:insert attribute="header"></tiles:insert>
        </td>
      </tr>
      <tr>
        <td align="center" style="height: 30px;">
          <div class="title" style="padding: 5px; float: left; font-size: 12px;">
            <strong><bean:message key="auth.login.user" />:&nbsp;</strong><%= usuario.getNombre() %>&nbsp;<%= usuario.getApePaterno() %>&nbsp;<%= usuario.getApeMaterno() %>&nbsp;
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <div style="width: 162px; float: left; vertical-align: top;">
            <tiles:insert attribute="menu"></tiles:insert>
          </div>
          <div style="width: 637px; float: right; vertical-align: top;">
            <tiles:insert attribute="content"></tiles:insert>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <tiles:insert attribute="footer"></tiles:insert>
        </td>
      </tr>
    </table>
  </body>
  
</html>