<%@include file="/apps/challenge/global/global.jsp"%>
<%@page session="false"%>
<cq:includeClientLib categories="cq.foundation-main"/>
<cq:include script="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp"/>
<%
    currentDesign.writeCssIncludes(pageContext); 
%>

<cq:includeClientLib css="challenge.main" />