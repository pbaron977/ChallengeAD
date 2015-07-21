<%@include file="/libs/foundation/global.jsp" %>
<%@page session="false" %>

<script>
    var textLeft = '${properties.itemsLetfLabel}';

    $(document).ready(function () {
        pagination = ${properties.tasksPerPage};
        maxItemsPage = ${properties.maxNumberTasks};
        limitMaxNumberTasks = ${properties.limitMaxNumberTasks ne null ? properties.limitMaxNumberTasks : false};
        enablePagination = ${properties.enablePagination ne null ? properties.enablePagination : false};
        labelImageDetail = '${properties.labelImageDetail ne null ? properties.labelImageDetail : 'Insert label'}';
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

        <button id="btnAll" class="button">${properties.labelAllButton}</button>
        <button id="btnActive" class="button">${properties.labelActiveButton}</button>
        <button id="btnCompleted" class="button">${properties.labelCompletedButton}</button>
        <button id="btnClearCompleted">${properties.labelClearCompletedButton}</button>
    </section>

</div>



