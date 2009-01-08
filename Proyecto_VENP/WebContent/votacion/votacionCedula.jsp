<%@ include file="/includes/taglibs.inc.jsp" %>
<script type="text/javascript">
var myOption = null;
function doVote() {
	with(document.cedulaForm) {
		if(myOption != null && voto.value != "") {
			submit();
			return;
		}
		var answer = confirm("<bean:message key='elector.valida.votoblanco' />")
		if (answer){
			voto.value = '<bean:message key="elector.valida.idblanco" />';
			submit();
			return;
		}
	}
}
function setOpcion(obj, idx) {
	with(document.cedulaForm) {
		if(myOption != obj) {
			if(myOption != null) myOption.className = "bgOpcion";
			voto.value = idx;
			obj.className = "bgOpcionSelected";
			myOption = obj;
		}
		else {
			myOption.className = "bgOpcion";
			myOption = null;
			voto.value = "";
		}
	}
}
function fOver(obj) {
	if(obj != myOption)
		obj.className = "bgOpcionOver";
}
function fOut(obj) {
	if(obj != myOption)
		obj.className = "bgOpcion";
}
</script>
<script language="JavaScript">
function correctPNG() // correctly handle PNG transparency in Win IE 5.5 & 6.
{
   var arVersion = navigator.appVersion.split("MSIE")
   var version = parseFloat(arVersion[1])
   if ((version >= 5.5) && (document.body.filters)) 
   {
      for(var i=0; i<document.images.length; i++)
      {
         var img = document.images[i]
         var imgName = img.src.toUpperCase()
         if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
         {
            var imgID = (img.id) ? "id='" + img.id + "' " : ""
            var imgClass = (img.className) ? "class='" + img.className + "' " : ""
            var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
            var imgStyle = "display:inline-block;" + img.style.cssText 
            if (img.align == "left") imgStyle = "float:left;" + imgStyle
            if (img.align == "right") imgStyle = "float:right;" + imgStyle
            if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
            var strNewHTML = "<span " + imgID + imgClass + imgTitle
            + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
            + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
            + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
            img.outerHTML = strNewHTML
            i = i-1
         }
      }
   }    
}
window.attachEvent("onload", correctPNG);
</script>

<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
    <table width="600" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2" class="cedulaTitle"><bean:message key="elector.cedula.title" /></td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <html:form action="votacion.do">
      <input type="hidden" name="cmd" value="votar" />
      <input type="hidden" name="voto" value="votar" />
      <tr>
        <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="20" class="bgCedula">
          <tr>
            <td align="center">
            
            <nested:iterate property="opciones" id="opcion">
            	<nested:equal property="nombre" value="VACIO">
					<div class="bgOpcion" style="display:none;">
				</nested:equal>
				<nested:notEqual property="nombre" value="VACIO">
					<div class="bgOpcion" onmouseover="fOver(this)" onmouseout="fOut(this)" onclick="setOpcion(this, '${opcion.id}')">
				</nested:notEqual>
			<table width="100%" border="0" cellspacing="0" cellpadding="3">
			<tr>
			<td align="center">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
                <td width="10">&nbsp;</td>
				<td class="nombrePartido">
				<nested:equal property="nombre" value="VACIO">
					<bean:message key="elector.cedula.votoblanco" />
				</nested:equal>
				<nested:notEqual property="nombre" value="VACIO">
					<nested:write property="nombre" />
				</nested:notEqual>
				</td>
                <td width="10">&nbsp;</td>
                <td width="74"><div class="cedulaFoto"><img src="files/${opcion.logo}" width="74" height="74" border="0" /><div><img src="media/cross.png" width="74" height="74" border="0" /></div></div></td>
                <td width="10">&nbsp;</td>
                <td width="74"><img src="files/${opcion.foto}" width="74" height="74" border="0" /></td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
			</div>
			<br>
			</nested:iterate>

            </td>
          </tr>
        </table>
        </td>
      </tr>
      </html:form>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        <html:link href="javascript:doVote();" styleClass="grisBtn">
   	    <div style="top: 11px;"><bean:message key="elector.cedula.btn" /></div>
   	    </html:link>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="20"></td>
      </tr>
    </table>
    </td>
  </tr>
</table>