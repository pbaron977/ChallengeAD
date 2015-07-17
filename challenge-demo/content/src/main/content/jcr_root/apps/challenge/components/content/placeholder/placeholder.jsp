<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" import="com.day.cq.wcm.api.WCMMode"%><%

    final WCMMode mode = WCMMode.fromRequest(slingRequest);

    /* Component Properties and Data */
    final String placeh = properties.get("placeholdertxt", "");

%>

<%-- Component Presentation --%>
<div class="row">
 <div class="col-xs-10">
    <input id="new-todo" class="form-control input-lg" type="text" placeholder="<%= placeh %>" autofocus>
 </div>
 <button type="button" class="btn btn-success btn-lg">Add</button>
</div>
