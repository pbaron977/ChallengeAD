<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" import="com.day.cq.wcm.api.WCMMode"%><%

    final WCMMode mode = WCMMode.fromRequest(slingRequest);


    /* Component Properties and Data */
    final String question = properties.get("itemsleft", "");
    final String answer = properties.get("clearcompleted", "");
    final String type = properties.get("type", "");

%>

<%-- Component Presentation --%>
<div class="main-controls">
    <div class="itemsleft" >
        <%= type %>
        <span class="btn-control">2 </span>
        <span class="btn-control">
            <cq:text property="itemsleft" escapeXml="true"/>
        </span>
    </div>
    <div class="center-controls">
         <span class="btn-control">
            <cq:text property="allcontrol"  escapeXml="true"/>
         </span>
         <span class="btn-control">
            <cq:text property="activecontrol"  escapeXml="true"/>
         </span>
         <span class="btn-control">
            <cq:text property="completedcontrol"  escapeXml="true"/>
         </span>
    </div>
    <div class="clearcompleted">
        <cq:text property="clearcompleted" tagName="span" escapeXml="true"/>
    </div>
</div>

