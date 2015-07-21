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

        ArrayList<String[]> todo = new ArrayList<String[]>();
        String textotask = "";

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
<table class="user-table">
    <thead>
        <tr>
            <th width="100">Col 1</th>
            <th width="100">Col 2</th>
            <th width="100">Col 3 is a long header name</th>
            <th width="300">Col 4</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>this is data 1 with overflowing content</td>
            <td>this is data 2</td>
            <td>this is data 3</td>
            <td>this is data 4</td>
        </tr>
        <tr>
            <td>this is data 1 </td>
            <td>this is data 2</td>
            <td>this is data 3</td>
            <td>this is data 4</td>
        </tr>
        <tr>
            <td>this is data 1 </td>
            <td>this is data 2</td>
            <td>this is data 3</td>
            <td>this is data 4</td>
        </tr>
        <tr>
            <td>this is data 1 </td>
            <td>this is data 2</td>
            <td>this is data 3</td>
            <td>this is data 4</td>
        </tr>
        <tr>
            <td>this is data 1 </td>
            <td>this is data 2</td>
            <td>this is data 3</td>
            <td>this is data 4</td>
        </tr>
    </tbody>
</table>






