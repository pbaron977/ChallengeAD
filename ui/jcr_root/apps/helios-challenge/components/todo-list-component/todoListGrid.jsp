<%--

  Todo List Component component.

  Component to manage TO DO lists

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	Object enablePagination = properties.get("enablePagination") != null ? properties.get("enablePagination") : "false";
	Object tasksXPage = null;
	if(enablePagination.equals("on")){
		tasksXPage = properties.get("tasksXPage") != null ? properties.get("tasksXPage") : 5;
    }
	else{
        tasksXPage = properties.get("maxTasksNumber") != null ? properties.get("maxTasksNumber") : 1000;
    }
%>
<div class="todo-list-grid">
 <div class="row" dir-paginate="task in todoListCtrl.tasksToList() | itemsPerPage: <%= tasksXPage %>">
  <div class="col-lg-6">
    <div class="input-group">
      <span class="input-group-addon">
        <input type="checkbox" ng-model="task.completed">
      </span>
        <input type="text" class="form-control" value="{{task.name}}" ng-class="{completed: task.completed}" >
    </div>
  </div>
 </div>
</div>
<br>