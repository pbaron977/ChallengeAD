<%--
    Content Page 
--%>
<%@include file="/libs/foundation/global.jsp"%>
<c:set var="bgcolor" value="${properties['backgroundcolor']}" />
<body bgcolor="${properties['backgroundcolor']}">
    <cq:include path="header"  resourceType="challenge-jm/components/page/header" />
 	<cq:include path="to-do"   resourceType="challenge-jm/components/page/to-do" />
    <cq:include path="footer"  resourceType="challenge-jm/components/page/footer" />
</body>