<%@ page language="Java" %>
<%@include file="/libs/foundation/global.jsp"%>
<% %>
<%@page session="false" %>
<% %>
<%

%>
<div class="container component">
<div class="page-header text-center">
	<h1><%=properties.get("displaytext")%> <span class="label label-info todoscount">0</span></h1>
</div>

        <!-- TODO LIST -->
        <div id="todo-list" class="row">

            <div id="images"></div>
            <div class="alert alert-danger alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span class="close" aria-hidden="true">&times;</span></button>
              <strong>Warning!</strong> Max number of task reached.
            </div>
            <div id="content" class="col-sm-4 col-sm-offset-4">

                <!-- LOOP OVER THE TODOS IN $scope.todos -->


            </div>
            <div class="checkbox hide clonable">
                    <label>
                        <input type="checkbox" > <span class="task">{{ todo.text }}</span>
                    </label>
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

	<input type='hidden' id='current_page' /> 
    <input type='hidden' id='show_per_page' value="<%=properties.get("pagination")%>" />  
    <input type='hidden' id='color' value="<%=properties.get("color")%>" />  
    <input type='hidden' id='maxtask' value="<%=properties.get("maxtask")%>" />  

</div>

<script>


$(document).ready(function() {

    $("#page_navigation").hide();
    $(".alert").hide();
    $('#current_page').val(0);
	$(".container").not(".component").css("background-color",$("#color").val());



    function refresh(page_num) {
        var show_per_page = parseInt($('#show_per_page').val());
        start_from = page_num * show_per_page;
        end_on = start_from + show_per_page;

        $('#content').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');
        $('.page_link[longdesc=' + page_num + ']').addClass('active_page').siblings('.active_page').removeClass('active_page');

        $('#current_page').val(page_num);
    }

    $(".previous_link").click(function() {

        var page_num = parseInt($('#current_page').val()) - 1;
        if(page_num>=0){
	        refresh(page_num);
        }
        return false;
    });

    $(".next_link").click(function() {
		var show_per_page = parseInt($('#show_per_page').val());
        var number_of_items = $('#content').children().size();
        var number_of_pages = Math.ceil(number_of_items / show_per_page);

        var page_num = parseInt($('#current_page').val()) + 1;
        if(page_num<number_of_pages){
	        refresh(page_num);
        }
        return false;
    });



    function recalculate() {
        var show_per_page = parseInt($('#show_per_page').val());
        var number_of_items = $('#content').children().size();
        var number_of_pages = Math.ceil(number_of_items / show_per_page);


        //hide all the elements inside content div
        $('#content').children().css('display', 'none');

        //and show the first n (show_per_page) elements
        $('#content').children().slice(0, show_per_page).css('display', 'block');
        size = number_of_items;
        $(".todoscount").text(size);
        if (size > show_per_page) {
            $("#page_navigation").show();
        } else {
            $("#page_navigation").hide();
        }
    }

    $("input[type='checkbox']").change(function() {

        if (this.checked) {
            $(this).parent().parent().remove();
            recalculate()
        }
    });
    $("form").submit(function(e) {
		var number_of_items = $('#content').children().size();
        var maxtask = parseInt($('#maxtask').val());
        if(number_of_items < maxtask){

            task = $("input:text").val();
            if (task.length != 0) {
                addTask(task);

            }
            $("input:text").val("");
            recalculate()
        }else{
            $(".alert").show();
            $(".alert").fadeOut(2500);
        }

        return false;
    });

    function addTask(text){
        add = $(".clonable").clone(true);
        add.removeClass("clonable hide");
        add.css("color","white");
        add.css("padding","32px");

        add.find(".task").text(text);

		var flickerAPI = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";
        $.getJSON( flickerAPI,
                  {
                        tags: text,
                        tagmode: "any",
                        format: "json"
                    }).done(function( data ) {
                    	$.each( data.items, function( i, item ) {
                            add.css( "background-image", "url("+item.media.m+")" );
                            if ( i === 0 ) {
                                return false;
                            }
                        });
        			});


        $("#content").append(add);
    }

});
</script>
