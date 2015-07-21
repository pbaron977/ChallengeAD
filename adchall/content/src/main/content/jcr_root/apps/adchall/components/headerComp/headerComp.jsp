<%--

  headerComp component.

  this is the header Comp

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	// TODO add you code here
%>
 <div  align="center" >
 	<style>
 		background-color:<%=properties.get("color","#7D2323").toUpperCase()%>
 	</style>
 	<font face="verdana" size="15" color="black">
 		<%=properties.get("header", "TODO List")%>
 	</font>
 </div>