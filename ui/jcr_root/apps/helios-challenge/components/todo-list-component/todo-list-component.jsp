<%--

  Todo List Component component.

  Component to manage TO DO lists

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
    Object serviceURL = properties.get("serviceURL");
%>

<div class="todo-list" ng-controller="TodoListComponentController as todoListCtrl" >
    <cq:include script="todoAddTask.jsp" />
    <cq:include script="todoListGrid.jsp" />
    <cq:include script="todoListPanel.jsp" />
</div>
