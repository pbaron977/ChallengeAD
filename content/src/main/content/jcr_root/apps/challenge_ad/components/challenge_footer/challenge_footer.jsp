<%@include file="/libs/foundation/global.jsp" %>
<c:set var="footer" value="Default Footer"/>
<c:set var="background_prefix" value="text-align:center;background-color:#"/>
<c:set var="background_color" value="CCCCCC;"/>
<c:set var="text_bg_prefix" value="color:#"/>
<c:set var="text_bg_color" value="000000"/>

<c:if test="${not empty properties.title}">
    <c:set var="footer" value="${properties.title}"/>
</c:if>
<c:if test="${not empty properties.background_color}">
	<c:set var="background_color" value="${properties.background_color};"/>
</c:if>
<c:if test="${not empty properties.title_color}">
	<c:set var="text_bg_color" value="${properties.title_color};"/>
</c:if>

<footer>
    <div style="${background_prefix}${background_color}">
        <p style="${text_bg_prefix}${text_bg_color}">
            ${footer}
        </p>
        <p style="${text_bg_prefix}${text_bg_color}">
            Part of <a href="http://todomvc.com">TodoMVC</a>
       	</p>
    </div>
</footer>