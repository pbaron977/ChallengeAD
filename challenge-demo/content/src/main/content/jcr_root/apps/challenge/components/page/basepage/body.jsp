<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" %><%
%>
  <body id="bodyAll">

    <div class="container">

      <div class="header clearfix">
        <cq:include script="header.jsp"/>
      </div>

      <cq:include script="main.jsp"/>

      <footer class="footer">
        <cq:include script="footer.jsp"/>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <cq:includeClientLib js="challenge.all"/>
  </body>
