<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<cq:include script="style.jsp"/>

<div class="contentHeader header-footer" style="${properties.fontSize}">
    <h1>
        <c:choose>
            <c:when test="${properties.title eq null}">
                Insert text here.
            </c:when>
            <c:otherwise>
                ${properties.title}
            </c:otherwise>
        </c:choose>
    </h1>
</div>



