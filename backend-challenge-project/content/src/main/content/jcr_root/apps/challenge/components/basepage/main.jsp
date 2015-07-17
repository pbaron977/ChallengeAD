<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false"%><%
%>
<header id="header">
	<input id="new-todo" placeholder="What needs to be done?" autofocus>
</header>
<section id="main">
	<input id="toggle-all" type="checkbox">
	<label for="toggle-all">Mark all as complete</label>
	<ul id="todo-list"></ul>
</section>
<footer id="footer"></footer>