<%@ include file="/includes/taglibs.inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/votacion/css/votacion.css" />" />
<script type="text/javascript" src="<html:rewrite page="/includes/js/prototype.js" />"></script>
<script type="text/javascript" src="<html:rewrite page="/votacion/js/popup.js" />"></script>
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><tiles:insert attribute="header" /></td>
	</tr>
	<tr>
		<td><tiles:insert attribute="body" /></td>
	</tr>
	<tr>
		<td><tiles:insert attribute="footer" /></td>
	</tr>
</table>
</body>
</html>