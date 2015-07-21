<%@include file="/libs/foundation/global.jsp" %>
<c:set var="bg_color" value="CCCCCC"/>

<c:set var="todo_placeholder_label" value="Agrega una tarea!"/>
<c:set var="todo_title_label" value="Your TODOs"/>
<c:set var="todo_item_left_label" value="Tareas Pendientes..."/>
<c:set var="todo_all_label" value="Todas"/>
<c:set var="todo_completed_label" value="Completadas"/>
<c:set var="todo_active_label" value="Activas"/>
<c:set var="todo_clear_label" value="Eliminar Completadas"/>


<c:if test="${not empty properties.background_color}">
    <c:set var="bg_color" value="${properties.background_color}"/>
</c:if>

<c:if test="${not empty properties.todo_placeholder_label}">
    <c:set var="todo_placeholder_label" value="${properties.todo_placeholder_label}"/>
</c:if>
<c:if test="${not empty properties.todo_title_label}">
    <c:set var="todo_title_label" value="${properties.todo_title_label}"/>
</c:if>
<c:if test="${not empty properties.todo_item_left_label}">
    <c:set var="todo_item_left_label" value="${properties.todo_item_left_label}"/>
</c:if>
<c:if test="${not empty properties.todo_all_label}">
    <c:set var="todo_all_label" value="${properties.todo_all_label}"/>
</c:if>
<c:if test="${not empty properties.todo_completed_label}">
    <c:set var="todo_completed_label" value="${properties.todo_completed_label}"/>
</c:if>
<c:if test="${not empty properties.todo_active_label}">
    <c:set var="todo_active_label" value="${properties.todo_active_label}"/>
</c:if>
<c:if test="${not empty properties.todo_clear_label}">
    <c:set var="todo_clear_label" value="${properties.todo_clear_label}"/>
</c:if>

<script type="text/javascript">
    $(document).ready(function(){
        $('#todoapp').pajinate();
    });
</script>

        <section id="todoapp">
            <div class="page_navigation"></div>
            <header id="header">
                <div style="background-color:#${bg_color};">
                    <h1>${todo_title_label}</h1>
                    <input id="new-todo" placeholder="${todo_placeholder_label}" autofocus>
                </div>
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
            <span id="todo-count"><strong><b>{{activeTodoCount}}</b></strong> ${todo_item_left_label}</span>
			<ul id="filters">
				<li>
                    <a {{#eq filter 'all'}}class="selected"{{/eq}} href="#/all">${todo_all_label}</a>
				</li>
				<li>
                    <a {{#eq filter 'active'}}class="selected"{{/eq}}href="#/active">${todo_active_label}</a>
				</li>
				<li>
                    <a {{#eq filter 'completed'}}class="selected"{{/eq}}href="#/completed">${todo_completed_label}</a>
				</li>
			</ul>
            {{#if completedTodos}}<button id="clear-completed">${todo_clear_label}</button>{{/if}}
		</script>
		<script>

		</script>
