<%@include file="/libs/foundation/global.jsp" %>
<body 
<c:if test="${not empty currentStyle.background_color}">
	style="background-color: ${currentStyle.background_color};"
</c:if>
>
<cq:include path="headercomp" resourceType="tjdo/components/page/header" />
<cq:include path="todocontent" resourceType="tjdo/components/page/todocontent" />
<cq:include path="footer" resourceType="tjdo/components/page/footer" />
</body>