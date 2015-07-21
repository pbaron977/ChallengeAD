<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false"%>
<cq:include script="head.jsp" />

<script type="text/javascript">
	$( window ).ready(function() {
		$.get("/bin/mySearchServlet", function(data, status) {
			/* alert("Data: " + data + "\nStatus: " + status); */
			//data = $.parseJSON(data);
			$.each(data, function(i, item) {
			    $( ".cil_01" ).append( "<li><input type='checkbox'><label>"+item+"</label><input type='text' value='"+item+"'><button class='edit'>Edit</button><button class='delete'>Delete</button></li>")
			});
		});
	});
</script>



<cq:include path="header"
	resourceType="challenge1/components/page/header" />
	

<!DOCTYPE html >
<html >
  <head>
    <meta charset="UTF-8">
    <title>List app</title>
    
    
    
    <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

    <link rel="stylesheet" href="/apps/challenge1/components/src/css/style.css">

    
    
    
  </head>

  <body>

    <html>

<head>
  <title>Todo App</title>
  <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="/apps/challenge1/components/src/css/style.css" type="text/css" media="screen" charset="utf-8">
  <link rel="stylesheet" href="../font-awesome-4.3.0/css/font-awesome.min.css">
</head>

<body>
  <div class="container">
    <p>
      <label for="new-task">Add Item</label>
      <input id="new-task" >
      <button id="add">Add</button>
      <div class="warning"></div>
      <div class="success"></div>
    </p>

    <h3>To Do or To Read
      <span id="counter"></span></h3>
    <ul id="incomplete-tasks" class="cil_01"></ul>

    <h3>Completed</h3>
    <ul id="completed-tasks">
      <li>
        <input type="checkbox" checked>
        <label>See the Doctor</label>
        <input type="text">
        <button class="edit">Edit</button>
        <button class="delete">Delete</button>
      </li>
    </ul>
  </div>
  <script src="../jquery-1.11.2.js"></script>
  <script src="/apps/challenge1/components/src/js/app.js"></script>
</body>

</html>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>

    <script src="/apps/challenge1/components/src/js/index.js"></script>

    
    
    
  </body>
</html>

<cq:include path="footer"
	resourceType="challenge1/components/page/footer" />