<%@include file="/libs/foundation/global.jsp" %>
<c:set var="title" value="Default Title"/>

<c:if test="${not empty properties.title}">
    <c:set var="title" value="${properties.title}"/>
</c:if>

<c:if test="${empty properties.background_color}">
    <div style="background-color:#CCCCCC; text-align:center;">
</c:if>
<c:if test="${not empty properties.background_color}">
   	<div style="background-color:#${properties.background_color}; text-align:center;">
</c:if>

<h1>
<c:if test="${empty properties.title_color}">
   	<p style="color:#000000;">
</c:if>
<c:if test="${not empty properties.title_color}">
   	<p style="color:#${properties.title_color};">
</c:if>
    ${title}
    </p>
</h1>
</div>