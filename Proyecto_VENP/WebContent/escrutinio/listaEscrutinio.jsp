<%@ include file="/includes/taglibs.inc.jsp"%>

<html:form action="listaEscrutinio.do">
	<table class="tborder2">
		<tr>
			<td></td>
		</tr>

		<logic:empty name="listaEscrutinioForm" property="listaEscrutinio">
			<tr>
				<td class="errorMessage"><bean:message
					key="listaEscrutinio.nohaydatos" /></td>
			</tr>
		</logic:empty>

		<logic:notEmpty name="listaEscrutinioForm" property="listaEscrutinio">
			

			<nested:iterate id="locaciones" property="listaEscrutinio">
				<tr>
					<td><nested:equal property="mensaje" value="faltaVotacion">
						<table class="tborder">
							<tr>
								<td width="50%" ; class="alt01"><nested:write
									property="nombrePais" /></td>
								<td width="1%" class="alt04">-</td>
								<td width="49%" ; class="alt05"><bean:message
									key="listaEscrutinio.mensaje.faltaConcluir" /></td>
							</tr>
						</table>
					</nested:equal> <nested:equal property="mensaje" value="escrutinio">
						<table class="tborder" width="100%">
							<tr>
								<td class="alt02"><b><nested:write
									property="nombrePais" /></b></td>
								<td class="alt10"><nested:equal property="locacionCerrada"
									value="true">
									  
									<nested:link styleClass="sendBtn"
										href="listaEscrutinio.do?cmd=listarDetalleLocacion"
										paramId="keyValue" paramProperty="codigo">
										<div class="div12"><bean:message
											key="listaEscrutinio.boton.generarEscrutinio" /></div>
									</nested:link>
									 
								</nested:equal></td>
							</tr>

							<nested:notEmpty property="listaEscrutinioDetalle">
								<tr>
									<td class="td3">
									<table class="text">
										<tr>
											<td><b><bean:message key="listaEscrutinio.locacion" /></b></td>
											<td><b><bean:message
												key="listaEscrutinio.TotalVotos" /></b></td>
											<td><b><bean:message
												key="listaEscrutinio.VotosValidos" /></b></td>
											<td><b><bean:message
												key="listaEscrutinio.VotosBlanco" /></b></td>
										</tr>
										<nested:iterate id="detalle" property="listaEscrutinioDetalle">
											<tr>
												<td class="td26"><nested:write
													property="nombreLocacion" /></td>
												<td class="td25"><nested:write property="totalVotos" /></td>
												<td class="td25"><nested:write property="votosValidos" /></td>
												<td class="td25"><nested:write property="votosBlanco" /></td>
											</tr>
										</nested:iterate>
									</table>
									</td>
								</tr>
							</nested:notEmpty>
						</table>
					</nested:equal></td>
				</tr>

				<tr>
					<td class="td15"></td>
				</tr>

			</nested:iterate>
		</logic:notEmpty>
		<tr>
			<td><html:link styleClass="sendBtn"
			action="/centralMenu.do">
			<div style="top: 10px;"><bean:message
					key="listaEscrutinio.boton.regresar" /></div>
			</html:link></td>
		</tr>
	</table>
</html:form>
