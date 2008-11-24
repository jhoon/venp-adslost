<%@ include file="/includes/taglibs.inc.jsp"%>
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="150" colspan="2" align="center" valign="top">
        <img src="media/cibertec.jpg" width="166" height="116" border="0">
        </td>
      </tr>
      <tr>
        <td colspan="2" height="50"></td>
      </tr>
      <tr>
        <td align="center" height="120">
        <html:link href="empadronamiento.do" styleClass="mainMenuBtn">
   	    <div style="top: 35px;"><bean:message key="global.empmenu.btn1" /></div>
   	    </html:link>
        </td>
        <td align="center">
        <html:link href="consulado.do" styleClass="mainMenuBtn">
   	    <div style="top: 35px;"><bean:message key="global.empmenu.btn2" /></div>
   	    </html:link>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2"><html:errors property="error" /></td>
      </tr>
      <tr>
        <td colspan="2" height="70"></td>
      </tr>
    </table>
    