<%@include file="/apps/company/global/global.jsp"%><%
%><%@page session="false"%>
<%
%>
<body>

    <div class="container_12">

        <header >
            <div >
                <cq:include path="var-header" resourceType="foundation/components/parsys"/>
            </div>
        </header>

        <hr/>

        <hr/>

        <div class="page-content">
           <cq:include path="var-content_aux" resourceType="foundation/components/parsys"/>
        </div>

         <hr/>

        <hr/>

        <footer class="footer clearfix">
            <cq:include path="var-footer" resourceType="foundation/components/parsys"/>
        </footer>

    </div>

    <cq:includeClientLib js="company.main"/>
</body>