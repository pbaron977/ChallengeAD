<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<cq:include script="scripts.jsp"/>


<div class="contentFooter header-footer">
    <c:choose>
        <c:when test="${properties.title eq null}">
            Insert text here.
        </c:when>
        <c:otherwise>
            ${properties.title}
        </c:otherwise>
    </c:choose>
</div>