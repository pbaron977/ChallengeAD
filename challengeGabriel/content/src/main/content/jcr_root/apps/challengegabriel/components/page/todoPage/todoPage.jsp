<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false"%>
<cq:include script="head.jsp"/>
<cq:include path="header" resourceType="challengegabriel/components/page/header"/>


<div id="bodyContent">
	<div class="genericBox">
		<div>
			Artist search
		</div>
		<div id="artist">
			<input type="text" id="artistField"placeholder="type your artist then enter"/>
		</div>
	</div>




<div id="todoapp">
<header>
<h2>List of undesired artist</h2>
<input id="new-todo" type="text" placeholder="What I don't want to listen?">
</header>

<ul id='todo-list'>
</ul>

<footer> <a id="clear-completed">Clear completed</a>
<div id='todo-count'></div>
</footer>
</div>
</div>
<cq:include path="footer" resourceType="challengegabriel/components/content/footer"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="http://www.jquery4u.com/demos/jquery-quick-pagination/js/jquery.quick.pagination.min.js"></script>
<script type="text/javascript" src="/etc/clientlibs/challengegabriel/todo.js"></script>
<script type="text/javascript" src="/etc/clientlibs/challengegabriel/artistSearch.js"></script>

<script>
    paginator = '${properties.pagernumber}';
</script>
