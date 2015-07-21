<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
    Object itemsLeftLabel = properties.get("itemsLeftLabel") != null ? properties.get("itemsLeftLabel") : "items left" ;
	Object allButtonLabel = properties.get("allButtonLabel") != null ? properties.get("allButtonLabel") : "All"; 
    Object activeButtonLabel = properties.get("activeButtonLabel") != null ? properties.get("activeButtonLabel") : "Active";
	Object completedButtonLabel = properties.get("completedButtonLabel") != null ? properties.get("completedButtonLabel") : "Completed" ;
	Object clearButtonLabel = properties.get("clearButtonLabel") != null ? properties.get("clearButtonLabel") : "Clear completed" ;
	Object defaultListMode = properties.get("listMode") != null ? properties.get("listMode") : "active";
%>

<div class="todo-list-control-panel" ng-init="todoListCtrl.setListMode('<%= defaultListMode %>')">
    <div class="btn-group" role="group" >
    	<button class="btn btn-default" type="button" disabled="disabled">
        	<span class="badge">{{todoListCtrl.pendingTasks()}}</span> <%= itemsLeftLabel %> 
    	</button>
    </div>
    <div class="btn-group" role="group" >
        <button type="button" class="btn btn-default" ng-click="todoListCtrl.setListMode('all')" ng-class="{active: todoListCtrl.listMode == 'all' }" ><%= allButtonLabel %></button>
        <button type="button" class="btn btn-default" ng-click="todoListCtrl.setListMode('active')" ng-class="{active: todoListCtrl.listMode == 'active' }" ><%= activeButtonLabel %></button>
        <button type="button" class="btn btn-default" ng-click="todoListCtrl.setListMode('completed')" ng-class="{active: todoListCtrl.listMode == 'completed'}" ><%= completedButtonLabel %></button>
    </div>
    <div class="btn-group" role="group" >
        <button type="button" class="btn btn-default" ng-click="todoListCtrl.clearCompleted()"><%= clearButtonLabel %></button>
    </div>
</div>
 <div align="center">
	<dir-pagination-controls></dir-pagination-controls>
 </div>