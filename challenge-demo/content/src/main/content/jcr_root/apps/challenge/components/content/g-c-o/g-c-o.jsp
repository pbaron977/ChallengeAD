<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" import="com.day.cq.wcm.api.WCMMode"%><%

    final WCMMode mode = WCMMode.fromRequest(slingRequest);


    /* Component Properties and Data */
    final String question = properties.get("itemsleft", "");
    final String answer = properties.get("clearcompleted", "");
    final String type = properties.get("type", "");
    final String bg = properties.get("bgColor", "");
    String flashVars = "{backgroundColor:\"" + xssAPI.encodeForJSString(properties.get("bgColor", "ffffff")) + "\"}";

%>
 <script type="text/javascript">

 console.log("flash",<%= flashVars %>);
 $( "#bodyAll" ).css( "background-color", '#<%= bg %>');
 </script>

<%-- Component Presentation --%>

<div class="row">
    <div class="container-fluid">
        <ul class="list-inline">
          <li>
            <span class="btn-control">2</span>
            <span class="btn-control">
                <cq:text property="itemsleft" escapeXml="true"/>
            </span>
          </li>
          <li>
                    <% if( type.equals("all")) { %>
                              <button type="button" class="btn btn-success"><cq:text property="allcontrol"  escapeXml="true"/></button>
                    <% } else { %>
                              <button type="button" class="btn btn-default"><cq:text property="allcontrol"  escapeXml="true"/></button>
                    <% } %>
          </li>
           <li>
                <% if( type.equals("active")) { %>
                    <button type="button" class="btn btn-success"><cq:text property="activecontrol"  escapeXml="true"/></button>
                <% } else { %>
                    <button type="button" class="btn btn-default"><cq:text property="activecontrol"  escapeXml="true"/></button>
                <% } %>
           </li>
           <li>
                 <% if( type.equals("completed")) { %>
                    <button type="button" class="btn btn-success"><cq:text property="completedcontrol"  escapeXml="true"/></button>
                 <% } else { %>
                    <button type="button" class="btn btn-default"><cq:text property="completedcontrol"  escapeXml="true"/></button>
                 <% } %>
           </li>
           <li>
               <button type="button" class="btn btn-default">
                   <cq:text property="clearcompleted"  escapeXml="true"/>
               </button>
           </li>
        </ul>
    </div>
</div>


