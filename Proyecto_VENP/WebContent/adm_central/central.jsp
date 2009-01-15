<%@ include file="/includes/taglibs.inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title><bean:message key="global.application.title" /></title>
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/adm_central/css/central.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/adm_central/css/cedula.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/dhtmlgoodies_menu.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/dhtmlgoodies_calendar.css" />" />
    <script type="text/javascript" src="<html:rewrite page="/includes/js/color_functions.js" />"></script>
    <script type="text/javascript" src="<html:rewrite page="/includes/js/dhtmlgoodies_menu.js" />"></script>
  	<script type="text/javascript" src="<html:rewrite page="/includes/js/prototype.js" />"></script>
  	<script type="text/javascript" src="<html:rewrite page="/includes/js/effects.js" />"></script>
  	<script type="text/javascript" src="<html:rewrite page="/includes/js/dragdrop.js" />"></script>
  	<script type="text/javascript" src="<html:rewrite page="/includes/js/controls.js" />"></script>
    <script type="text/javascript" src="<html:rewrite page="/includes/js/dhtmlgoodies_calendar.js" />"></script>    
  </head>
  
  <body>
    <table border="0" cellspacing="0" cellpadding="0" width="800">
      <tiles:insert attribute="header"></tiles:insert>
      <tr>
        <td class="userName">
          <strong><bean:message key="auth.login.user" />:&nbsp;</strong>
          <bean:write name="usuarioBean" property="nombre" scope="session" />&nbsp;
          <bean:write name="usuarioBean" property="apePaterno" scope="session" />&nbsp;
          <bean:write name="usuarioBean" property="apeMaterno" scope="session" />
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
      <tiles:insert attribute="footer"></tiles:insert>
    </table>
  </body>
  
</html>