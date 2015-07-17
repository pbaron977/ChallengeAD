<%--

  Header component.

  The header component for the Backend Challenge

--%>

<%@include file='/libs/foundation/global.jsp'%>
<%@page import='com.day.cq.wcm.foundation.Placeholder'%>

<style>
  .header p {
    display: table-cell;
    vertical-align: middle;
    font-size: 30px;
    font-family: monospace;
  }
</style>

<div class='header' style='display: table; width: 700px; height: 100px; background-color: <%="#" + properties.get( "color", "FFFFFF" )%>; margin-left: auto; margin-right: auto;'>
  <p>
    <cq:text property='text' escapeXml='true' placeholder='<%=Placeholder.getDefaultPlaceholder( slingRequest, component, null )%>'/>
  </p>
</div>