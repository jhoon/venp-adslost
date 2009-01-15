<%@ include file="/includes/taglibs.inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
<link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/contactenos.css" />" />
</head>

<body>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <jsp:include page="/includes/header.inc.jsp"></jsp:include>
  <tr>
    <td align="center" valign="top" class="introbg">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" align="center" valign="top">
        
        <h2 class="contact"><bean:message key="global.contact.title" /></h2>
        
        <p class="contact"><bean:message key="global.contact.parrafo" /></p>
        
        <p class="contact"><bean:message key="global.contact.subtitle" /></p>
        
        <ul>
        <li class="contact">Omar Carpio Carpio (DP, QSW, DAWI, LPIV y DAWII) - <a href="mailto:i610584@cibertec.edu.pe">i610584@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Rudy Capatinta Aucca (DP, QSW, DAWI, LPIV y DAWII) - <a href="mailto:i611058@cibertec.edu.pe">i611058@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Marco Cristóbal Salazar (LPIV y DAWII) - <a href="mailto:i520263@cibertec.edu.pe">i520263@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Renzo Portocarrero Heredia (DP, QSW, DAWI, LPIV y DAWII) - <a href="mailto:i611065@cibertec.edu.pe">i611065@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Aaron Ramirez Tafur (DP y DAWI) - <a href="mailto:i611186@cibertec.edu.pe">i611186@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Jhoon Saravia Tasayco (LPIV y DAWII) - <a href="mailto:i610001@cibertec.edu.pe">i610001@cibertec.edu.pe</a><br />&nbsp;</li>
        </ul>
        
        </td>
      </tr>
      <tr>
        <td colspan="2" height="40"></td>
      </tr>
      <jsp:include page="/includes/footer.inc.jsp"></jsp:include>
    </table>
    </td>
  </tr>
</table>
</body>

</html>