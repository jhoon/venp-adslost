<%@ include file="/includes/taglibs.inc.jsp" %>
            <ul id="dhtmlgoodies_menu">
              <li>
                <html:link href="procesoElectoralLista.do?cmd=listar"><bean:message key="central.procesoElectoral" /></html:link>
              </li>
              <li>
                <html:link href="centralSubMenu.do"><bean:message key="central.mantenimiento" /></html:link>
              </li>
              <li>
                <html:link href="cedula.do"><bean:message key="central.cedula" /></html:link>
              </li>
              <li>
                <html:link href="listaEscrutinio.do?cmd=listarEscrutinio"><bean:message key="central.escrutinio" /></html:link>
              </li>
              <li>
                <html:link href="listaConsolidacion.do?cmd=listarConsolidacion"><bean:message key="central.consolidacion" /></html:link>
              </li>
              <li>
                <html:link href="login.do?cmd=salir"><bean:message key="central.cerrar" /></html:link>
              </li>
            </ul>