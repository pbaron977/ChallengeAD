<%--

  Todo List Component component.

  Component to manage TO DO lists

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	// TODO add you code here
    Object placeholder = properties.get("placeholder") != null ? properties.get("placeholder") : "...";
    Object backgroundColor = properties.get("backgroundColor");
%>
<div class="new-task row">
  <div class="col-lg-6">
    <div class="input-group input-group-lg">
      <input type="text" class="form-control" ng-model="todoListCtrl.newTask" ng-keyup="$event.keyCode == 13 && todoListCtrl.addTask()" placeholder="<%= placeholder %>" style="background-color: #<%= backgroundColor %>;" />
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" ng-click="todoListCtrl.addTask()">Add!</button>
      </span>
    </div>
  </div>
</div>
<br>