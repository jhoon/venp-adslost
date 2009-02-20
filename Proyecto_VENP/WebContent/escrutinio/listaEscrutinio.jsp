<%@ include file="/includes/taglibs.inc.jsp" %>

<html:form action="listaEscrutinio.do">
  <table border="0" cellpadding="0" cellspacing="0" class="tableParent">
    <tr>
      <td></td>
    </tr>
    <logic:empty name="listaEscrutinioForm" property="listaEscrutinio">
    <tr>
      <td class="errorMessage"><bean:message key="listaEscrutinio.nohaydatos" /></td>
    </tr>
	</logic:empty>
	<logic:notEmpty name="listaEscrutinioForm" property="listaEscrutinio">
	<tr><td style="height: 50px;"></td></tr>
	<nested:iterate id="locaciones" property="listaEscrutinio">
	<tr>
	  <td align="center">
	    <nested:equal property="mensaje" value="faltaVotacion">
	    <table border="0" cellpadding="0" cellspacing="0" class="tableSinConcluir">
	      <tr>
	        <td width="45%" style="font-size: 16px;"><nested:write property="nombrePais" /></td>
			<td width="55%">- &nbsp;<bean:message key="listaEscrutinio.mensaje.faltaConcluir" /></td>
		  </tr>
		</table>
		</nested:equal>
		<nested:equal property="mensaje" value="escrutinio">
		<table border="0" cellpadding="0" cellspacing="0" class="tableConcluido">
		  <tr>
		    <td width="45%" style="font-size: 16px; height: 50px;"><nested:write property="nombrePais" /></td>
		    <td width="55%" style="background-color: #195093;" align="center">
		      <nested:equal property="locacionCerrada" value="true">
		        <nested:link styleClass="sendBtn" href="listaEscrutinio.do?cmd=listarDetalleLocacion" paramId="keyValue" paramProperty="codigo">
		        <div class="div12"><bean:message key="listaEscrutinio.boton.generarEscrutinio" /></div>
		        </nested:link>
		      </nested:equal>
		    </td>
		  </tr>
		  <nested:notEmpty property="listaEscrutinioDetalle">
		  <tr>
		    <td>
		      <table border="0" cellpadding="0" cellspacing="0" class="tableResultado">
		        <tr>
		          <td class="rowHead"><bean:message key="listaEscrutinio.locacion" /></td>
		          <td class="rowHead"><bean:message key="listaEscrutinio.TotalVotos" /></td>
		          <td class="rowHead"><bean:message key="listaEscrutinio.VotosValidos" /></td>
		          <td class="rowHead"><bean:message key="listaEscrutinio.VotosBlanco" /></td>
		        </tr>
		        <nested:iterate id="detalle" property="listaEscrutinioDetalle">
		        <tr>
		          <td class="rowData" align="left">&nbsp;&nbsp;&nbsp;-&nbsp;<nested:write property="nombreLocacion" /></td>
		          <td class="rowData"><nested:write property="totalVotos" /></td>
		          <td class="rowData"><nested:write property="votosValidos" /></td>
		          <td class="rowData"><nested:write property="votosBlanco" /></td>
		        </tr>
		        </nested:iterate>
		      </table>
		    </td>
		  </tr>
		  <tr><td style="height: 10px;"></td></tr>
		  </nested:notEmpty>
		</table>
		</nested:equal>
	  </td>
	</tr>
	<tr><td style="height: 50px;"></td></tr>
	</nested:iterate>
	</logic:notEmpty>
	<tr>
	  <td style="height: 100px;" align="center">
	    <html:link styleClass="sendBtn" action="/centralMenu.do">
	      <div style="top: 10px;"><bean:message key="listaEscrutinio.boton.regresar" /></div>
	    </html:link>
	  </td>
	</tr>
  </table>
</html:form>
