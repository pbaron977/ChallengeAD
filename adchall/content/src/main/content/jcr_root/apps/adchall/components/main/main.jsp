<%--

  MainChallComp component.

  Main Challenge Component

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
%>
<html>
    <head>
    </head>
    <body>
       	<cq:include script="head.jsp"/>
 		<cq:include path="parsys" resourceType="foundation/components/parsys"/>
        <div align="north">
            <cq:include path="head"  resourceType="adchall/components/headerComp" />
        </div>
        <div align="center">
            <cq:include path="content" resourceType="adchall/components/body" />
        </div>
        <div align="south">
            <cq:include path="footer" resourceType="adchall/components/footerComp" />
        </div>
    </body>
</html>