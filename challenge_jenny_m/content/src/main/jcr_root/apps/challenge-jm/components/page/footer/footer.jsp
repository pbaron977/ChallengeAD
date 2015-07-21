<%@include file="/libs/foundation/global.jsp"%>
<%@page import ="com.day.text.Text" %>
<c:set var="footer_text_1" value="${properties['footer_text_1']}" />
<c:if test="${empty footer_text_1}">
    <c:set var="footer_text_1" value="Copyright" />
</c:if>
${footer_text_1}
