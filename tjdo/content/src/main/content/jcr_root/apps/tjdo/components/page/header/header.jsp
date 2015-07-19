<%@include file="/libs/foundation/global.jsp" %>
<div>
<c:set var="title" value="${properties['title']}" />
<c:if test="${empty title}">
    <c:set var="title" value="TJDo ToDo's" />
</c:if>
		<h1>${title}</h1>
</div>