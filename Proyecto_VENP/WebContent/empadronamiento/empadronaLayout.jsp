<%@ include file="/includes/taglibs.inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/empadronamiento/css/empadronamiento.css" />" />
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tiles:insert attribute="header" ></tiles:insert>
  <tr>
    <td align="center" valign="top" class="introbg">
    	<tiles:insert attribute="body" ></tiles:insert>
    </td>
  </tr>
  <tr>
  	<tiles:insert attribute="footer" ></tiles:insert>
  </tr>
</table>
</body>
</html>