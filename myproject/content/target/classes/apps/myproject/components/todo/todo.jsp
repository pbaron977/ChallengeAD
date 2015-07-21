<%@include file="/libs/foundation/global.jsp"%><%
%>
<!-- pick up the client libraries --> 
<cq:includeClientLib categories="todolab" />

<script type="text/javascript">
	var baseURL = "<%= currentNode.getPath() %>";
	var selectionSource = "<%=properties.get("./tf","fs1")%>";
    var tmdbquery = "<%=properties.get("./tmdbQueryParam","Titanic")%>";
    var weatherquery = "<%=properties.get("./weatherQueryParam","London")%>";
    var cleanLocalStorage = false;
</script>

<body>
		<section id="todoapp">
			<header id="header">
                <input id="new-todo" placeholder="${properties.placeholder}" autofocus>
			</header>
			<section id="main">
				<input id="toggle-all" type="checkbox">
				<label for="toggle-all">Mark all as complete</label>
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
			<span id="todo-count"><strong>{{activeTodoCount}}</strong> ${properties.itemsleft}</span>
			<ul id="filters">
				<li>
                    <a {{#eq filter 'all'}}class="selected"{{/eq}} href="#/all">${properties.statusall}</a>
				</li>
				<li>
					<a {{#eq filter 'active'}}class="selected"{{/eq}}href="#/active">${properties.statusactive}</a>
				</li>
				<li>
					<a {{#eq filter 'completed'}}class="selected"{{/eq}}href="#/completed">${properties.statuscompleted}</a>
				</li>
			</ul>
			{{#if completedTodos}}<button id="clear-completed">${properties.clearlabel}</button>{{/if}}
		</script>
	</body>