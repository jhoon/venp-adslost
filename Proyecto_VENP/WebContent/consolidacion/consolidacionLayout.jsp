<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ include file="/includes/taglibs.inc.jsp" %>
<html>
<head>
	<title><bean:message key="global.application.title" /></title>
	<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/consolidacion/css/consolidacion.css" />" />
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
                <tiles:importAttribute name="title" scope="page" />
                <bean:message key="${title}"/>
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