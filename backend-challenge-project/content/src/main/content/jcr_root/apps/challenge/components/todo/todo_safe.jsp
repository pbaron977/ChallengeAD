<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false"%><%
%>
<cq:includeClientLib categories="challenge.todolist" />

<script type="text/javascript">
$( document ).ready(function() {
	
});
</script>

<header id="header">
	<input id="new-todo" placeholder="${properties.placeholder}" autofocus>
</header>
<section id="main">
	<input id="toggle-all" type="checkbox">
	<label for="toggle-all"></label>
	<ul id="todo-list">
		<li>
			<div class="view">
				<input class="toggle" type="checkbox">
				<label>hhhj</label>
				<button class="destroy"></button>
			</div>
			<input class="edit" value="hhhj">
		</li>
		<li>
			<div class="view">
				<input class="toggle" type="checkbox">
				<label>rest</label>
				<button class="destroy"></button>
			</div>
			<input class="edit" value="rest">
		</li>
	</ul>
</section>
<footer id="footer">
	<span id="todo-count"><strong>0</strong> ${properties.itemsleft}</span>
	<ul id="filters">
		<li>
			<a class="selected" href="#/">${properties.buttonall}</a>
		</li>
		<li>
			<a href="#/active">${properties.buttonactive}</a>
		</li>
		<li>
			<a href="#/completed">${properties.buttoncompleted}</a>
		</li>
	</ul>
</footer>