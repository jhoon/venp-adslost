<%@ include file="/includes/taglibs.inc.jsp" %>
<%@ page import="venp.web.forms.*" %>
<% ElectorForm elector =(ElectorForm)request.getAttribute("Elector"); %>
<script type="text/javascript">
function doConfirm(typeConfirm) {
	with(document.cedulaForm) {
		mode.value=typeConfirm;
		if(mode.value == "print")
			document.cedulaForm.target = "_blank";
		else
			document.cedulaForm.target = "_self";
		submit();
		return;
	}
}
</script>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top" >
    <table border="0" cellspacing="0" cellpadding="0">
      <html:form action="votacion.do">
      <input type="hidden" name="cmd" value="confirm" />
      <input type="hidden" name="mode" value="confirm" />
      <input type="hidden" name="elector" value="<%=elector.getDni()%>" />
      <input type="hidden" name="fecha" value="<%=elector.getFechaSufragio()%>" />
      <input type="hidden" name="hora" value="<%=elector.getHoraSufragio()%>" />
      <input type="hidden" name="gmt" value="<%=elector.getGmtSufragio()%>" />
      <tr>
        <td colspan="2" height="10"></td>
      </tr>
      <tr>
        <td colspan="2" class="confirmTitle"><bean:message key="elector.confirm.title" /></td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2" class="confirmText" align="center"><bean:message key="elector.confirm.text"/></td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        	<table cellpadding="0" cellspacing="0">
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.nombre" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getNombre()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.paterno" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getPaterno()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.materno" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getMaterno()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.dni" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getDni()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="emp.form.email" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getEmail()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.fecha" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getFechaSufragio()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.hora" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getHoraSufragio()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	<tr>
        	  <td align="right"><div class="confirmLabel"><bean:message key="elector.confirm.gmt" />:</div></td>
        	  <td align="left" class="confirmText"><%=elector.getGmtSufragio()%></td>
        	</tr>
        	<tr><td colspan="2" height="10"></td></tr>
        	</table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      <tr>
        <td colspan="2">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
	        <td align="center">
	        <html:link href="javascript:doConfirm('print');" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.print"/></div>
	   	    </html:link>
	        </td>
	        <td align="center">
	        <html:link href="#" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.aspdf"/></div>
	   	    </html:link>
	        </td>
	        <td align="center">
	        <html:link href="javascript:doConfirm('mail');" styleClass="grisBtn">
	   	    <div style="top: 11px;"><bean:message key="elector.confirm.mail"/></div>
	   	    </html:link>
	        </td>
          
        </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="30"></td>
      </tr>
      </html:form>
    </table>
    </td>
  </tr>
</table>