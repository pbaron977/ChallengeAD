<%@include file="/libs/foundation/global.jsp" %>
<%@page session="false" %>

<script>
    var textLeft = '${properties.itemsLetfLabel}';

    $(document).ready(function () {
        pagination = ${properties.tasksPerPage};
        maxItemsPage = ${properties.maxNumberTasks};
    });
</script>

<div id="todoapp">
    <header>
        <input id="new-todo" type="text" placeholder="${properties.placeholderText}">
    </header>
    <section id="main">
        <ul class="pagination1">
        </ul>
    </section>
    <section id="controls">
        <span id="total">
        </span>

        <button id="btnAll" class="button">All</button>
        <button id="btnActive" class="button">Active</button>
        <button id="btnCompleted" class="button">Completed</button>
        <button id="btnClearCompleted">Clear Completed</button>
    </section>

</div>



