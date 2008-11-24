<%@ include file="/includes/taglibs.inc.jsp" %>  
<html> 
  <body> 
    <table width="800" border="0" cellspacing="0" cellpadding="0">
      
      <tr>
        <td align="center" valign="top">
        <logic:empty name="listaConsolidacionForm" property="listaConsolidacion">
        <table>
        <tr>
            
               <tr>
	               	<td align="center"><b><html:errors/></b><br /><br /><br /></td>
	           </tr>
        </table>
          </logic:empty> 
        <html:form action="listaConsolidacion.do">
          <table border="0" cellspacing="0" cellpadding="0">
         
            <tr><td colspan="2" height="20"></td></tr>
            
            <tr><td colspan="2" height="40"></td></tr>
            
            <tr>
              <td align="center">
               
               <logic:notEmpty name="listaConsolidacionForm" property="listaConsolidacion">
               <nested:iterate id="detalle" property="listaConsolidacion">
                <table width="600" class="tabla" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                    <td rowspan="4" width="250" align="center" valign="middle">
                      <nested:notEqual property="nombrePartidoPolitico" value="VACIO">
                        <img src='files/<nested:write property="imagenPartidoPolitico" />' width="84" height="84" border="0" />
                  	  
                  	  <br>
                  	  <img src='files/<nested:write property="imagenCandidato" />' width="84" height="84" border="0" />
                  	  </nested:notEqual>
                  	  <br /><br /><bean:message key="listaConsolidacion.computo" /><br /><nested:write property="fecha"/>
                    </td>
                    
                    <td align="center" class="partido">
                    <nested:equal property="nombrePartidoPolitico" value="VACIO">VOTO en BLANCO</nested:equal>
                    <nested:notEqual property="nombrePartidoPolitico" value="VACIO">
                    <nested:write property="nombrePartidoPolitico"/>
                    </nested:notEqual>
                    </td>
                  </tr>
                  <tr>
                  	<td align="center" class="candidato"><nested:write property="nombreCandidato"/></td>
                  </tr>
                  <tr class="resultado">
                    <td align="center" ><nested:write property="resultado"/></td>
                  </tr>
                  <tr >
                    <td valign="middle" align="center" class="porcentaje"><nested:write property="porcentaje"/></td>
                  </tr>
                </table>
                <br>
                </nested:iterate>
                </logic:notEmpty>
                <br />
              </td>
            </tr>
             <tr>
				    	<td align="center">
					  		<html:link styleClass="sendBtn" href="index.jsp">
					  		 <div style="top: 10px;"><bean:message key="listaEscrutinio.boton.regresar" /></div>
					  		</html:link>
					  		 
					   	</td>
				</tr> 
          </table>
          </html:form>
        </td>
      </tr> 
    </table> 
  </body> 
</html>