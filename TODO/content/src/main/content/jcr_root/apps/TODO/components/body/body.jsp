<%@include file='/libs/foundation/global.jsp'%>
<script>
            $(document).ready(function() {
				queryTODORows(-1,<%=properties.get("taskPerPage","5") %>);
			});

            function queryTODORows(first, pageSize){
                $.ajax({
         			type: 'POST',    
         			url:'/bin/challange',
         			data:'first='+first+'&pageSize='+pageSize+'&state=TODO',
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
                queryTODORows(next,<%=properties.get("taskPerPage","5") %>);
            }

            function previousTODO(){
                var previous = $('#registros tr:nth-child(2) td:first-child').text();
                previous = (previous -1);
                if(previous > 0){
					clearData();
	                queryTODORows((previous-5),<%=properties.get("taskPerPage","5") %>);
                }
            }
        </script>
<div id="body">
	<%=properties.get( "lblList", "TODO List?" )%>
	<table id="registros">
	</table>
	<% if(Boolean.valueOf(properties.get("pagEnabled","false"))){
			out.println("<a onclick='previousTODO();'>"+properties.get("previousLabel","previous")+"</a>");
			out.println("<a onclick='nextTODO();'>"+properties.get("nextLabel","next")+"</a>");
	   }
	%>
</div>