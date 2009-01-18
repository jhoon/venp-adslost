<%@ include file="/includes/taglibs.inc.jsp"%>
<table class="cedulaForm" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<h1 class="cedulaFormTitle"><bean:message
			key="cedula.data.titulo" /></h1>
		</td>
	</tr>
	<tr>
		<td>
		<h2 class="cedulaFormTitle"><bean:message key="cedula.data.nuevo" /></h2>
		</td>
	</tr>
	<tr>
		<td align="center"><html:form action="cedula.do" method="post">
			<html:hidden property="codigo" />
			<input type="hidden" name="cmd" />
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					<div class="cedulaLabel"><bean:message
						key="cedula.data.proceso" /></div>
					</td>
					<td><html:select property="procesoId" styleClass="cedulaForm">
						<html:option value="">
							<bean:message key="cedula.data.seleccione" />
						</html:option>
						<html:optionsCollection name="listaProcesosElectorales"
							label="value" value="key" />
					</html:select></td>
				</tr>
				<tr>
					<td>
					<div class="cedulaLabel"><bean:message key="cedula.data.tipo" /></div>
					</td>
					<td><html:select property="tipo" styleClass="cedulaForm">
						<html:option value="P">
							<bean:message key="cedula.tipo.presidencial" />
						</html:option>
					</html:select></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<table cellpadding="15" cellspacing="0" border="0">
						<tr>
							<td>
							<div class="btnWhiteBg" onclick="alert(Sortable.serialize('list'))">
							<div style="top: 11px;"><bean:message
								key="cedula.data.addOpcion" /></div>
							</div>
							</td>
							<td>
							<div class="btnWhiteBg">
							<div style="top: 11px;"><bean:message
								key="cedula.data.publicar" /></div>
							</div>
							</td>
							<td><html:link page="/cedula.do" styleClass="btnWhiteBg">
								<div style="top: 11px;"><bean:message
									key="general.opcion.cancelar" /></div>
							</html:link></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					
					<ul id="list">
						<nested:iterate property="opciones" id="opcion">
						<li id="item_<bean:write name="opcion" />">
							<table width="100%" border="0" cellspacing="0" cellpadding="3">
							<tr>
							<td align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
				                <td width="10">&nbsp;</td>
								<td class="nombrePartido">
								Partido Politico
								</td>
				                <td width="10">&nbsp;</td>
				                <td width="74"><img src="files/simbolo1.jpg" width="74" height="74" border="0" class="fotoCedula" /></td>
				                <td width="10">&nbsp;</td>
				                <td width="74"><img src="files/candidato1.jpg" width="74" height="74" border="0" class="fotoCedula" /></td>
								</tr>
								</table>
							</td>
							</tr>
							</table>
						</li>
						</nested:iterate>
					</ul>

					<p id="list-info"></p>
					
<script type="text/javascript">
//<![CDATA[
Sortable.create("list", {onUpdate:function(){new Ajax.Updater('list-info', 'cedula.do?cmd=ajax', {asynchronous:true, evalScripts:true, onComplete:function(request){new Effect.Highlight("list",{});}, parameters:Sortable.serialize("list")})}})
//Sortable.create("list", {onUpdate:function(){new Effect.Highlight("list",{});}});
//]]>
</script>
					
					</td>
				</tr>
			</table>
		</html:form></td>
	</tr>
</table>