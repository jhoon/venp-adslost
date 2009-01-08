<%@ include file="/includes/taglibs.inc.jsp" %>
  <map name="Map">
    <area shape="poly" coords="209,70,208,94,591,94,591,69,536,69,536,42,255,42,255,70" href="<html:rewrite page="/intro.jsp" />">
  </map>
  <tr>
    <td height="135">
    <div style="position: relative; width: 800px; height: 135px;">
    <html:img page="/media/top_intro.jpg" width="800" height="135" border="0" style="position: absolute; top: 0px; left: 0px;" usemap="#Map" />
    <html:link action="/language.do?lang=en" style="position: absolute; top: 54px; left: 50px;" title="English"><html:img page="/includes/images/en.jpg" border="0" alt="English" /></html:link>
    <html:link action="/language.do?lang=es" style="position: absolute; top: 54px; left: 110px;" title="Español"><html:img page="/includes/images/es.gif" border="0" alt="Español" /></html:link>
    </div>
    </td>
  </tr>