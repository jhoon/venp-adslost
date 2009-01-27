<%@ include file="/includes/taglibs.inc.jsp"%>
<logic:notEmpty name="listaMonitor" scope="request">
	<logic:iterate id="locacion" name="listaMonitor">
		<b><bean:message key="locacion.monitoreo.resumen" />:</b>
		<table width="100%" class="graph" border="0" cellspacing="8"
			cellpadding="0">
			<tr>
				<td align="right" width="225"><bean:message
					key="locacion.monitoreo.header7" />:&nbsp;</td>
				<td align="left" colspan="2"><nested:write name="locacion"
					property="puestaCero" format="dd/MM/yyyy HH:mm" /></td>
			</tr>
			<tr>
				<td align="right" width="225"><bean:message
					key="locacion.monitoreo.header8" />:&nbsp;</td>
				<td align="left" colspan="2"><nested:write name="locacion"
					property="cierreVotacion" format="dd/MM/yyyy HH:mm" /></td>
			</tr>
			<tr>
				<td align="right" width="225"><bean:message
					key="locacion.monitoreo.electores" />:&nbsp;</td>
				<td align="left" colspan="2"><nested:write name="locacion"
					property="nroElectores" /></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td width="225" style="height: 26px;" align="right"><bean:message
					key="locacion.monitoreo.votos" /></td>
				<td width="525" class="bar">
				<div style="width: ${locacion.nroVotosPorcentaje}%"></div>
				<nested:write name="locacion" property="nroVotos" />/<nested:write
					name="locacion" property="nroElectores" /></td>
				<td width="50" align="right"><nested:write name="locacion"
					property="nroVotosPorcentaje" />%</td>
			</tr>
			<tr>
				<td align="right" style="height: 26px;"><bean:message
					key="locacion.monitoreo.sesion" /></td>
				<td class="bar">
				<div style="width: ${locacion.nroElectorSesionPorcentaje}%"></div>
				<nested:write name="locacion" property="nroElectorSesion" />/<nested:write
					name="locacion" property="nroElectores" /></td>
				<td align="right"><nested:write name="locacion"
					property="nroElectorSesionPorcentaje" />%</td>
			</tr>
			<tr>
				<td align="right" style="height: 26px;"><bean:message
					key="locacion.monitoreo.porVotar" /></td>
				<td class="bar">
				<div style="width: ${locacion.nroVotosRestantesPorcentaje}%"></div>
				<nested:write name="locacion" property="nroVotosRestantes" />/<nested:write
					name="locacion" property="nroElectores" /></td>
				<td align="right"><nested:write name="locacion"
					property="nroVotosRestantesPorcentaje" />%</td>
			</tr>
		</table>
		[#############]
	</logic:iterate>
</logic:notEmpty>