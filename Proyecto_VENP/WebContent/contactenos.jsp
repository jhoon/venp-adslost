<%@ page language="java" 
         contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title><bean:message key="global.application.title" /></title>
<link rel="stylesheet" type="text/css" href="css/globals.css" />
<link rel="stylesheet" type="text/css" href="css/contactenos.css" />
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
        <li class="contact">Omar Carpio Carpio (DP, QSW y DAWI) - <a href="mailto:i610584@cibertec.edu.pe">i610584@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Rudy Capatinta Aucca (DP, QSW y DAWI) - <a href="mailto:i611058@cibertec.edu.pe">i611058@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Renzo Portocarrero Heredia (DP, QSW y DAWI) - <a href="mailto:i611065@cibertec.edu.pe">i611065@cibertec.edu.pe</a><br />&nbsp;</li>
        <li class="contact">Aaron Ramirez Tafur (DP y DAWI) - <a href="mailto:i611186@cibertec.edu.pe">i611186@cibertec.edu.pe</a><br />&nbsp;</li>
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