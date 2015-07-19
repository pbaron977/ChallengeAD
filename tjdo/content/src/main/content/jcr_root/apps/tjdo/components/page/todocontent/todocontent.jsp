<%@include file="/libs/foundation/global.jsp"%>
<c:set var="placeholder_msg" value="${properties['placeholder_msg']}" />
<c:set var="tems_left_label" value="${properties['items_left_label']}" />
<c:set var="all_label" value="${properties['control_all_label']}" />
<c:set var="active_label" value="${properties['control_active_label']}" />
<c:set var="completed_label" value="${properties['control_completed_label']}" />
<c:set var="control_default" value="${properties['control_default']}" />
<c:set var="cta_clear_completed" value="${properties['cta_clear_completed']}" />

<c:if test="${empty placeholder_msg}">
	<c:set var="placeholder_msg" value="What needs to be done?" />
</c:if>

<c:if test="${empty all_label}">
	<c:set var="all_label" value="All" />
</c:if>

<c:if test="${empty active_label}">
	<c:set var="active_label" value="Active" />
</c:if>

<c:if test="${empty completed_label}">
	<c:set var="completed_label" value="Completed" />
</c:if>

<c:if test="${empty cta_clear_completed}">
	<c:set var="cta_clear_completed" value="Clear completed" />
</c:if>

<section id="todoapp">
	<header id="header">
		<h1>todos</h1>
		<input id="new-todo" placeholder="${placeholder_msg}" autofocus>
	</header>
	<section id="main">
		<input id="toggle-all" type="checkbox"> <label
			for="toggle-all">Mark all as complete</label>
		<ul id="todo-list"></ul>
	</section>
	<footer id="footer"></footer>
</section>
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
	<span id="todo-count"><strong>{{activeTodoCount}}</strong> ${items_left_label}</span>
	<ul id="filters">
		<li>
			<a {{#eq filter 'all'}}class="selected"{{/eq}} href="#/all">${all_label}</a>
		</li>
		<li>
			<a {{#eq filter 'active'}}class="selected"{{/eq}}href="#/active">${active_label}</a>
		</li>
		<li>
			<a {{#eq filter 'completed'}}class="selected"{{/eq}}href="#/completed">${completed_label}</a>
		</li>
	</ul>
	{{#if completedTodos}}<button id="clear-completed">${cta_clear_completed}</button>{{/if}}
</script>