<%@include file="/libs/foundation/global.jsp" %>
<c:set var="msg" value="${properties['footer_msg']}" />
<c:if test="${empty msg}">
	<c:set var="msg" value="Copyright &copy;2015 - All rights reserved" />
</c:if>
<footer id="info">
	<p>${msg}</p>
	<p>Double-click to edit a todo</p>
	<p>Created by <a href="http://sindresorhus.com">Sindre Sorhus</a></p>
	<p>Part of <a href="http://todomvc.com">TodoMVC</a></p>
</footer>