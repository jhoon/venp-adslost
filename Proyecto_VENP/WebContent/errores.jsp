<%@ include file="/includes/taglibs.inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
</head>

<body>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <jsp:include page="/includes/header.inc.jsp"></jsp:include>
  <tr>
    <td align="center" valign="top" class="introbg">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="150" colspan="2" align="center" valign="top">
        <img src="media/cibertec.jpg" width="166" height="116" border="0" />
        </td>
      </tr>
      <tr>
        <td colspan="2" height="80"></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><html:errors /></td>
      </tr>
      <tr>
        <td colspan="2" height="80"></td>
      </tr>
      <jsp:include page="/includes/footer.inc.jsp"></jsp:include>
    </table>
    </td>
  </tr>
</table>
</body>

</html>