<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" %><%
%>
<body>
    <div class="container_12">
        <header class="header clearfix">
             <cq:include script="header.jsp"/>
        </header>

        <hr/>

        <div class="page-content">
           <cq:include script="main.jsp"/>
        </div>

        <hr/>

        <footer class="footer clearfix">
             <cq:include script="footer.jsp"/>
        </footer>

    </div>

    <cq:includeClientLib js="challenge.all"/>
</body>
