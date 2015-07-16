<%@include file="/libs/foundation/global.jsp"%>
<cq:includeClientLib categories="cq.jquery"/>
<html>
    <head>
        <script>
            $(document).ready(function() {
				queryTODORows(-1,5);
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
                var siguiente = $('#registros tr:last-child td:first-child').text();
                clearData();
                queryTODORows(siguiente,5);
            }
        </script>
    </head>
    <body>
        <h1>Titulo</h1>
        <div id="header">
			Este es el header
        </div>
        <div id="body">
            <table id="registros">
            </table>
            <a onclick="nextTODO();">next</a>
        </div>
        <div id="footer">
            Este es el pie de pagina
        </div>
    </body>
</html>