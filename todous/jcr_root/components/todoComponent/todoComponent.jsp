<%@ page language="Java" %>
<%@include file="/libs/foundation/global.jsp"%>
<% %>
<%@page session="false" %>
<% %>
<%
// TODO add you code here
%>

<div class="jumbotron text-center">
	<h1><%=properties.get("displaytext")%> <span class="label label-info todoscount">0</span></h1>
</div>

        <!-- TODO LIST -->
        <div id="todo-list" class="row">
            <div id="content" class="col-sm-4 col-sm-offset-4">

                <!-- LOOP OVER THE TODOS IN $scope.todos -->
                <div class="checkbox hide clonable">
                    <label>
                        <input type="checkbox" > <span class="task">{{ todo.text }}</span>
                    </label>
                </div>

            </div>
			<div class="col-sm-4 col-sm-offset-4">
                <ul id='page_navigation' class="pagination text-center">
                    <li><a class="previous_link" href="#">Prev</a></li>
                    <li><a class="next_link" href="#">Next</a></li>
                </ul>
            </div>    
        </div>



        <!-- FORM TO CREATE TODOS -->
        <div id="todo-form" class="row">
            <div class="col-sm-8 col-sm-offset-2 text-center">
                <form>
                    <div class="form-group">

                        <!-- BIND THIS VALUE TO formData.text IN ANGULAR -->
                        <input type="text" class="form-control input-lg text-center" placeholder="<%=properties.get("placeholder")%>">
                    </div>

                    <!-- createToDo() WILL CREATE NEW TODOS -->
                    <button type="submit" class="btn btn-primary btn-lg"><%=properties.get("button")%></button>
                </form>
            </div>
        </div>

<input type='hidden' id='current_page' value="<%=properties.get("pagination")%>"/>  
<input type='hidden' id='show_per_page' />  



<script>



$(document).ready(function(){

    $("#page_navigation").hide();

        //how much items per page to show
	var show_per_page = 3;
	//getting the amount of elements inside content div
	var number_of_items = $('#content').children().size();
	//calculate the number of pages we are going to have
	var number_of_pages = Math.ceil(number_of_items/show_per_page);

	//set the value of our hidden input fields
	$('#current_page').val(0);
	$('#show_per_page').val(show_per_page);

	//now when we got all we need for the navigation let's make it '

	/*
	what are we going to have in the navigation?
		- link to previous page
		- links to specific pages
		- link to next page
	*/


    $(".previous_link").click(function(){
		//get the number of items shown per page
        var show_per_page = parseInt($('#show_per_page').val());
		var page_num = parseInt($('#current_page').val())-1;

        //get the element number where to start the slice from
        start_from = page_num * show_per_page;

        //get the element number where to end the slice
        end_on = start_from + show_per_page;

        //hide all children elements of content div, get specific items and show them
        $('#content').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');

        /*get the page link that has longdesc attribute of the current page and add active_page class to it
        and remove that class from previously active page link*/
        $('.page_link[longdesc=' + page_num +']').addClass('active_page').siblings('.active_page').removeClass('active_page');

        //update the current page input field
        $('#current_page').val(page_num);
        return false;
    });

    $(".next_link").click(function(){
		//get the number of items shown per page
        var show_per_page = parseInt($('#show_per_page').val());
		var page_num = parseInt($('#current_page').val())+1;

        //get the element number where to start the slice from
        start_from = page_num * show_per_page;

        //get the element number where to end the slice
        end_on = start_from + show_per_page;

        //hide all children elements of content div, get specific items and show them
        $('#content').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');

        /*get the page link that has longdesc attribute of the current page and add active_page class to it
        and remove that class from previously active page link*/
        $('.page_link[longdesc=' + page_num +']').addClass('active_page').siblings('.active_page').removeClass('active_page');

        //update the current page input field
        $('#current_page').val(page_num);
        return false;
    });



	function recalculate() {
        var number_of_items = $('#content').children().size();
        var number_of_pages = Math.ceil(number_of_items/show_per_page);


         //hide all the elements inside content div  
        $('#content').children().css('display', 'none');  

        //and show the first n (show_per_page) elements  
        $('#content').children().slice(0, show_per_page).css('display', 'block');  
        size = $(".checkbox").length-1;
        $(".todoscount").text(size);
        if(size>show_per_page){
			$("#page_navigation").show();
        }else{
			$("#page_navigation").hide();	
        }
	}

	$("input[type='checkbox']").change(function() {

        if(this.checked) {
			$(this).parent().parent().remove();
            recalculate()
        }
    });
    $("form").submit(function(e){
    	task=$("input:text").val();
    	if(task.length != 0 ){
			add=$(".clonable").clone(true);
			add.removeClass("clonable hide");

            add.find(".task").text(task);
            $(".checkbox").parent().append(add)

        }
		$("input:text").val("");
		recalculate()

		return false;
    });
});

</script>

<!-- <html>
<head><title>Link Components</title>
<script>

</script>
</head>
<body>
	<p><%=properties.get("linkpage")%></p>
    <p><%=properties.get("select")%></p>
</body>
</html> -->