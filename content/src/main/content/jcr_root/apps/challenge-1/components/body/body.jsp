<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>

<style>
    body{
        background-color: ${properties.backgroundColor};
    }
</style>

<script>
    var textLeft = '${properties.itemsLetfLabel}';
</script>

<div id="todoapp">
    <header>
        <input id="new-todo" type="text" placeholder="${properties.placeholderText}">
    </header>
    <section id="main">
        <ul id="todo-list">
        </ul>
    </section>
    <section id="controls">
        <span id="total">

        </span>
        <button>All</button>
        <button>Active</button>
        <button>Completed</button>
        <button id="btnClearCompleted">Clear Completed</button>
    </section>
</div>



