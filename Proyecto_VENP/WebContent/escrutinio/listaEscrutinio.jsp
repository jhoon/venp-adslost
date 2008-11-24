<%@ include file="/includes/taglibs.inc.jsp" %>

            <html:form action="listaEscrutinio.do">
            <tr>
              <td colspan="2" align="center"> 
                <table class="tborder2" border="0" cellpadding="6" cellspacing="1" width="100%">
				
  				<tr>
			      <td height="10"></td>
			    </tr>
			    <logic:empty name="listaEscrutinioForm" property="listaEscrutinio">
                 	 <tr><td class="alt01" valign="middle" align="center"><bean:message key="listaConsolidacion.nohaydatos" /></td></tr>
                 </logic:empty>
                 
                 
                 <logic:notEmpty name="listaEscrutinioForm" property="listaEscrutinio">
                 	<tr> 
				 	<td align="center"><div style="font-size: 14px; font-family: Tahoma, Verdana, Arial;"><b><bean:message key="listaEscrutinio.listadoPaises" /></b></div></td>
					</tr> 
					    <nested:iterate id="locaciones" property="listaEscrutinio" >
							    <tr> 
							      <td align="left">
							         
							      <nested:equal property="mensaje" value="faltaVotacion">
								      <table class="tborder" cellspacing="1" cellpadding="6" border="0" width="100%">
									      <tr>
									        <td width="50%" align="left" class="alt01"><nested:write property="nombrePais"/></td>
									        <td width="1%" class="alt01"> - </td>
										    <td width="49%" align="left" class="alt01"><bean:message key="listaEscrutinio.mensaje.faltaConcluir" /></td>
										  </tr>
								      </table>											         													     
								  </nested:equal>
								  
								  
								  <nested:equal property="mensaje" value="escrutinio">  
										  <table class="tborder" cellspacing="1" cellpadding="6" border="0" width="100%">
										      <tr>
											        <td width="50%" align="left" class="alt02"><b><nested:write property="nombrePais"/></b></td>
												    <td width="50%" align="center" style="background: #195093;">
													    <nested:equal property="locacionCerrada" value="true">
														    <nested:link styleClass="sendBtn" href="listaEscrutinio.do?cmd=listarDetalleLocacion" paramId="keyValue" paramProperty="paisId" >
														     <div style="top: 10px;"><bean:message key="listaEscrutinio.boton.generarEscrutinio" /></div>   
											                </nested:link>
										                </nested:equal>									                
									                </td>
											  </tr>
											  <nested:notEmpty property="listaEscrutinioDetalle">
												  <tr>
												    <td colspan="2">
													  <table width="600"  border="0" cellspacing="2" cellpadding="1" class="text">
														  <tr> 
														    <td align="left" valign="middle"><b><bean:message key="listaEscrutinio.locacion"/></b></td>
														  	<td align="center" valign="middle"><b><bean:message key="listaEscrutinio.TotalVotos"/></b></td>
														  	<td align="center" valign="middle"><b><bean:message key="listaEscrutinio.VotosValidos"/></b></td>
														  	<td align="center" valign="middle"><b><bean:message key="listaEscrutinio.VotosBlanco"/></b></td>
														  </tr>
														  <nested:iterate id="detalle" property="listaEscrutinioDetalle">
														  <tr>
														    <td valign="middle" align="left" style="font: 16px Tahoma, Verdana, Arial;"><nested:write property="nombreLocacion" /></td>
														    <td valign="middle" align="center" style="font: 16px Tahoma, Verdana, Arial;"><nested:write property="totalVotos"/></td>
														    <td valign="middle" align="center" style="font: 16px Tahoma, Verdana, Arial;"><nested:write property="votosValidos"/></td>
														    <td valign="middle" align="center" style="font: 16px Tahoma, Verdana, Arial;"><nested:write property="votosBlanco"/></td>
														  </tr>
														  </nested:iterate>
													  </table>
												    </td>
												  </tr>
											  </nested:notEmpty>
									      </table>
								  </nested:equal>
								  
						        	      
								<tr>
							      <td height="10"></td>
							    </tr>	 
							    
						</nested:iterate>
				</logic:notEmpty>
				<tr>
				    	<td align="center">
					  		<html:link styleClass="sendBtn" href="index.jsp">
					  		 <div style="top: 10px;"><bean:message key="listaEscrutinio.boton.regresar" /></div>
					  		</html:link>
					  		 
					   	</td>
				</tr>
			    </table>
			    
              </td>
            </tr> 
            </html:form>