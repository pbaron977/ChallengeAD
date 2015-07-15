<%@include file="/libs/foundation/global.jsp"%>
<cq:includeClientLib categories="xtype" />
 
<%@ page import="com.day.cq.commons.Doctype,
                    com.day.cq.wcm.foundation.Image,
                    com.day.cq.wcm.api.components.DropTarget,
                    com.day.cq.wcm.api.components.EditConfig,
                    com.day.cq.wcm.commons.WCMUtils,
                    org.apache.jackrabbit.commons.JcrUtils"
                        %>
 


<div class="jumbotron text-center">
	<h1>I'm a Todo-aholic <span class="label label-info todoscount">0</span></h1>
</div>

        <!-- TODO LIST -->
        <div id="todo-list" class="row">
            <div class="col-sm-4 col-sm-offset-4">

                <!-- LOOP OVER THE TODOS IN $scope.todos -->
                <div class="checkbox hide clonable">
                    <label>
                        <input type="checkbox" > <span class="task">{{ todo.text }}</span>
                    </label>
                </div>

            </div>
        </div>

        <!-- FORM TO CREATE TODOS -->
        <div id="todo-form" class="row">
            <div class="col-sm-8 col-sm-offset-2 text-center">
                <form>
                    <div class="form-group">

                        <!-- BIND THIS VALUE TO formData.text IN ANGULAR -->
                        <input type="text" class="form-control input-lg text-center" placeholder="I want to buy a puppy that will love me forever">
                    </div>

                    <!-- createToDo() WILL CREATE NEW TODOS -->
                    <button type="submit" class="btn btn-primary btn-lg">Add</button>
                </form>
            </div>
        </div>





<script>



$(document).ready(function(){

	function recalculate() {
		  $(".todoscount").text($(".checkbox").length-1);
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