<%@include file="/libs/foundation/global.jsp"%>
<%@page import ="com.day.text.Text" %>
<h1>
    <c:set var="title" value="${properties['title']}" />
    <c:if test="${empty title}">
		<c:set var="title" value="ToDo's" />
    </c:if>
    ${title}
</h1>
