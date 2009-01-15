<%@ include file="/includes/taglibs.inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title><bean:message key="global.application.title" /></title>
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/includes/css/globals.css" />" />
    <link rel="stylesheet" type="text/css" href="<html:rewrite page="/adm_locacion/css/locacion.css" />" />
  </head>

  <body>
    <table width="800" border="0" cellspacing="0" cellpadding="0">
      <jsp:include page="/includes/header.inc.jsp"></jsp:include>
      <tr>
        <td align="center" valign="top" class="introbg">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="150" colspan="2" align="center" valign="top">
                <html:img page="/media/cibertec.jpg" width="166" height="116" border="0" /><br />
                <p class="footer" style="font-size: 20px; font-weight: bold;"><bean:message key="locacion.administracion.titulo" /></p><br />
              </td>
            </tr>
            <tr>
              <td align="center" height="120">
                <html:link page="/locacionPuestaCero.do?cmd=listar" styleClass="mainMenuBtn">
   	              <div style="top: 42px;"><bean:message key="locacion.administracion.btn1" /></div>
   	            </html:link>
              </td>
              <td align="center">
                <html:link page="/locacionCerrarVotacion.do?cmd=listar" styleClass="mainMenuBtn">
   	              <div style="top: 42px;"><bean:message key="locacion.administracion.btn2" /></div>
   	            </html:link>
              </td>
            </tr>
            <tr>
              <td align="center" colspan="2" height="120">
                <html:link page="/locacionMonitoreo.do?cmd=listar" styleClass="mainMenuBtn">
   	              <div style="top: 35px;"><bean:message key="locacion.administracion.btn3" /></div>
   	            </html:link>
              </td>
            </tr>
            <tr><td colspan="2" height="20"></td></tr>
            <tr>
              <td colspan="2" height="20" align="center">
                <br />
        	    <html:link page="/login.do?cmd=salir" styleClass="btnAny">
        	      <div style="top: 11px;"><bean:message key="locacion.administracion.regresar" /></div>
        	    </html:link>
                <br />&nbsp;
              </td>
            </tr>
            <jsp:include page="/includes/footer.inc.jsp"></jsp:include>
          </table>
        </td>
      </tr>
    </table>
  </body>

</html>