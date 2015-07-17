<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" import="com.day.cq.wcm.api.WCMMode"%><%

    final WCMMode mode = WCMMode.fromRequest(slingRequest);

    /* Component Properties and Data */
    final String placeh = properties.get("placeholdertxt", "");

%>

<%-- Component Presentation --%>
<input id="new-todo" placeholder="<%= placeh %>" autofocus>

