<%@ include file="/includes/taglibs.inc.jsp"%>

<html>
<body>
<table class="tablaPrincipal">

	<tr>
		<td class="td0"><logic:empty name="listaConsolidacionForm"
			property="listaConsolidacion">
			<td class="centro"><b><html:errors /></b><br />
			<br />
			<br />
			</td>
		</logic:empty></td>

		<td><html:form action="listaConsolidacion.do">
			<table>
				<tr>
					<td class="td4"><logic:notEmpty name="listaConsolidacionForm"
						property="listaConsolidacion">
						<nested:iterate id="detalle" property="listaConsolidacion">
							<div class="interTabla" />
							<table>
								<tr>
									<td><nested:notEqual property="nombrePartidoPolitico"
										value="VACIO">
										<img
											src='files/<nested:write property="imagenPartidoPolitico" />'
											class="imagen1" />
										<br>
										<img src='files/<nested:write property="imagenCandidato" />'
											class="imagen2" />
									</nested:notEqual> <br />
									<br />
									<bean:message key="listaConsolidacion.computo" /><br />
									<nested:write property="fechaConsolidacion" /></td>

									<td class="partido"><nested:equal
										property="nombrePartidoPolitico" value="VACIO">VOTO en BLANCO
													                    	 <table class="centro">
											<tr>
												<td><nested:write property="resultadoOpcion" /></td>
											</tr>

											<tr>
												<td><nested:write property="porcentajeObtenido" /></td>
											</tr>
										</table>
									</nested:equal> <nested:notEqual property="nombrePartidoPolitico"
										value="VACIO">
										<table class="centro">
											<tr>
												<td><nested:write property="nombrePartidoPolitico" />
												</td>
											</tr>

											<tr>
												<td><nested:write property="nombreCandidato" /></td>
											</tr>

											<tr>
												<td><nested:write property="resultadoOpcion" /></td>
											</tr>

											<tr>
												<td><nested:write property="porcentajeObtenido" /></td>
											</tr>
										</table>
									</nested:notEqual></td>
								</tr>
							</table>
							</div>
							<br>
						</nested:iterate>
					</logic:notEmpty> <br />
					</td>
				</tr>
			</table>

		</html:form></td>
	</tr>

	<tr>

		<td></td>
		<td class="centro"><html:link styleClass="sendBtn"
			action="/centralMenu.do">
			<div style="top: 10px;"><bean:message
				key="listaEscrutinio.boton.regresar" /></div>
		</html:link></td>
	</tr>
</table>
</body>
</html>