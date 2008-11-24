<%@ include file="/includes/taglibs.inc.jsp" %>
<html>

  <head>
    <title><bean:message key="global.application.title" /></title>
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/adm_locacion/css/locacion.css" />" />
  </head>

  <body>

    <table width="800" border="0" cellspacing="0" cellpadding="0">
      <tiles:insert attribute="header"></tiles:insert>
      <tr>
        <td align="center" valign="top">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr><td colspan="2" height="20"></td></tr>
            <tr>
              <td colspan="2" align="center" valign="middle">
                <span class="footer" style="font-size: 20px; font-weight: bold;">
                <tiles:importAttribute name="titulo" scope="page" />
                <bean:message key="${titulo}"/>
                </span>
              </td>
            </tr>
            <tr><td colspan="2" height="40"></td></tr>
            <tiles:insert attribute="body"></tiles:insert>
            <tiles:insert attribute="footer"></tiles:insert>
          </table>
        </td>
      </tr>
    </table>
    
  </body>

</html>