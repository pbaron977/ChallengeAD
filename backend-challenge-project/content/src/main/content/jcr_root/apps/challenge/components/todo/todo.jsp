<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false"%><%
%>
<cq:includeClientLib categories="challenge.todolist" />

<header id="header">
	<input id="new-todo" placeholder="${properties.placeholder}" autofocus>
</header>
<section id="main">
	<input id="toggle-all" type="checkbox">
	<label for="toggle-all">Mark all as complete</label>
	<ul id="todo-list"></ul>
</section>
<footer id="footer"></footer>
<div class="holder"></div>
<script id="todo-template" type="text/x-handlebars-template">
{{#this}}
<li {{#if completed}}class="completed"{{/if}} data-id="{{id}}">
	<div class="view">
		<input class="toggle" type="checkbox" {{#if completed}}checked{{/if}}>
		<label>{{title}}</label>
		<button class="destroy"></button>
	</div>
	<input class="edit" value="{{title}}">
</li>
{{/this}}
</script>
<script id="footer-template" type="text/x-handlebars-template">
<span id="todo-count"><strong>{{activeTodoCount}}</strong> ${properties.itemsleft}</span>
	<ul id="filters">
		<li>
			<a {{#eq filter 'all'}}class="selected"{{/eq}} href="#/all">${properties.buttonall}</a>
		</li>
		<li>
		<a {{#eq filter 'active'}}class="selected"{{/eq}}href="#/active">${properties.buttonactive}</a>
		</li>
		<li>
			<a {{#eq filter 'completed'}}class="selected"{{/eq}}href="#/completed">${properties.buttoncompleted}</a>
		</li>
	</ul>
{{#if completedTodos}}<button id="clear-completed">${properties.buttonclear}</button>{{/if}}
</script>