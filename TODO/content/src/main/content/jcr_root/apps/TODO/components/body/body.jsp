<%@include file='/libs/foundation/global.jsp'%>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<script>
            $(document).ready(function() {
				queryRows(-1,<%=properties.get("taskPerPage","5") %>,'TODO');
			});

            function queryRows(first, pageSize,state){
                $.ajax({
         			type: 'POST',    
         			url:'/bin/challange',
         			data:'first='+first+'&pageSize='+pageSize+'&state='+state,
         			dataType: 'json',
         			success: function(msg){
	                    addHeader();
                    	$.each(msg, function(i, item) {
							$.each(item, function(idx, row) {
			                    data = jQuery.parseJSON(row);
			                    $("#registros").append('<tr><td>'+data.id+'</td><td>'+data.nam+'</td><tr>');
                			});
                    	});
            			var empty_tr = $('#registros').find('tr:empty');
            			if ( empty_tr.length > 0 ) $(empty_tr).remove();
         			},
         			error: function(msg){
         				alert('Error');
         			}
     			});
            }

            function addHeader(){
                $("#registros").append('<tr><td>ID</td><td>NAME</td></tr>');
            }

            function clearData(){
                $("#registros").children().remove()
            }


            function nextTODO(){
                var next = $('#registros tr:last-child td:first-child').text();
                clearData();
                queryRows(next,<%=properties.get("taskPerPage","5") %>,'TODO');
            }

            function previousTODO(){
                var previous = $('#registros tr:nth-child(2) td:first-child').text();
                previous = (previous -1);
                if(previous > 0){
					clearData();
	                queryRows((previous-5),<%=properties.get("taskPerPage","5") %>,'TODO');
                }
            }
        </script>
<div id="body" style="align: center;">
	<%=properties.get( "lblList", "TODO List?" )%>
	<table id="registros" class="pure-table" style="text-align: center; position: relative;left:50%;">
	</table>
	<% if(Boolean.valueOf(properties.get("pagEnabled","false"))){
			out.println("<a onclick='previousTODO();'>"+properties.get("previousLabel","previous")+"</a>");
			out.println("<a onclick='nextTODO();'>"+properties.get("nextLabel","next")+"</a>");
	   }
	%>

</div>