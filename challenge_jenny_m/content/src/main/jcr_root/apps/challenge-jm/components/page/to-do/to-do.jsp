<%--
    Content Page 
--%>
<%@include file="/libs/foundation/global.jsp"%>
<body>
    <section id="todoapp">
    <header id="header">
        <h1>todos</h1>
        <input id="new-todo" placeholder="${properties['placeholder']}" autofocus>
    </header>
    
    <section id="main">
        <input id="toggle-all" type="checkbox">
        <label for="toggle-all">Mark all as complete</label>
        <ul id="todo-list"></ul>
        </section>
    <footer id="footer"></footer>
    </section>
    
    <footer id="info">
        <p>Double-click to edit a todo</p>
        <p>Created by <a href="http://sindresorhus.com">Sindre Sorhus</a></p>
        <p>Part of <a href="http://todomvc.com">TodoMVC</a></p>
    </footer>
    
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
        <span id="todo-count"><strong>{{activeTodoCount}}</strong> ${properties['itemsLeft']} </span>
        <ul id="filters">
        <li>
        <a {{#eq filter 'all'}}class="selected"{{/eq}} href="#/all">${properties['status_text']}</a>
        </li>
        <li>
        <a {{#eq filter 'active'}}class="selected"{{/eq}}href="#/active">${properties['status_2_text']}</a>
        </li>
        <li>
        <a {{#eq filter 'completed'}}class="selected"{{/eq}}href="#/completed">${properties['status_3_text']}</a>
        </li>
        </ul>
        {{#if completedTodos}}<button id="clear-completed">${properties['clear_completed']}</button>{{/if}}
    </script>