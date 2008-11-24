<%@ include file="/includes/taglibs.inc.jsp" %>
            <ul id="dhtmlgoodies_menu">
              <li>
                <html:link href="partidoPoliticoLista.do?cmd=listar"><bean:message key="central.mantenimiento.partidoPolitico" /></html:link>
              </li>
              <li>
                <html:link href="candidatoLista.do?cmd=listar"><bean:message key="central.mantenimiento.candidato" /></html:link>
              </li>
              <li>
                <html:link href="centrovotacionLista.do?cmd=listar"><bean:message key="central.mantenimiento.centroVotacion" /></html:link>
              </li>
              <li>
                <html:link href="usuarioLista.do?cmd=listar"><bean:message key="central.mantenimiento.usuario" /></html:link>
              </li>
              <li>
                <html:link href="perfilLista.do?cmd=listar"><bean:message key="central.mantenimiento.perfil" /></html:link>
              </li>
              <li>
                <html:link href="paisLista.do?cmd=listar"><bean:message key="central.mantenimiento.pais" /></html:link>
              </li>
              <li>
                <html:link href="centralMenu.do"><bean:message key="central.mantenimiento.regresar" /></html:link>
              </li>
            </ul>