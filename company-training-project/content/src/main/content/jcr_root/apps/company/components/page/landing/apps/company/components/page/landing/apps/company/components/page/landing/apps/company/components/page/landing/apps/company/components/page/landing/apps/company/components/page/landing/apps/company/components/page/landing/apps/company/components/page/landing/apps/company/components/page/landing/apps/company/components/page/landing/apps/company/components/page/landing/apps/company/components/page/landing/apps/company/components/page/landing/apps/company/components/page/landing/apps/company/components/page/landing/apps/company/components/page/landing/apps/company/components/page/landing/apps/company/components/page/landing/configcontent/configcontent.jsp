<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%@ page import="java.util.ArrayList, com.adobe.training.core.CopyRight, com.adobe.training.core.domain.Task, com.adobe.training.core.controller.TaskController" %>
<%

        CopyRight copy = new CopyRight();
        copy.activate();
        String resultadocopy = copy.getCurrentMsg();

        TaskController tc = new TaskController();
        int cantMax = 500;
        ArrayList<Task> tasks = tc.getTask(cantMax);
        String pru = String.valueOf(tasks.size());
        String textotask = "";
        for(int i=0;i<tasks.size();i++){
            Task t = tasks.get(i);
            textotask += "<input type='checkbox' name='t' /> I have a car<br>";
        }

       Object txtcontentplaceholder = properties.get("txtcontentplaceholder");
       Object btncontentplaceholder = properties.get("btncontentplaceholder");
       Object btncontentall = properties.get("btncontentall");
       Object btncontentactive = properties.get("btncontentactive");
       Object btncontentcompleted = properties.get("btncontentcompleted");
       Object btncontentclearcompleted = properties.get("btncontentclearcompleted");
       Object optcontentvalueactived = properties.get("optcontentvalueactived");


%>
<cq:includeClientLib categories="componentlab" />
<script type="text/javascript">
    $CQ(function ($)){
        $('.user-table').flexgrid();
    }
</script>
<div>
    <%=textotask%>
<div>






