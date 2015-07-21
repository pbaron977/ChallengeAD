<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%
String tamLetra = (String)properties.get("textheadersizechooser");
Object x = properties.get("textheaderfield1");
String texto="";

if(x!=null){
    texto = (String)properties.get("textheaderfield1");
}

Object cb = properties.get("colorheaderchooser");
String colorBack="";
if(cb!=null){
    colorBack = colorBack +"#"+(String)properties.get("colorheaderchooser");
}

Object c = properties.get("colortextchooser");
String color="";
if(c!=null){
    color = color +"#"+(String)properties.get("colortextchooser");
}

Object f = properties.get("textfontchooser");
String font="";
if(f!=null){
    font = (String)properties.get("textfontchooser");
}

Object a = properties.get("textalignchooser");
String align="";
if(a!=null){
    align = (String)properties.get("textalignchooser");
}

if(texto.equals("")){
    texto ="PRODIGIOUS <br> LAYNE CHALLENGE <br> 2015";
}

%>
<div align="<%=align%>" style="color:<%=color%>;font-size:<%=tamLetra%>;background-color:<%=colorBack%>;font-family:<%=font%>">
<%=texto%>
</div>

