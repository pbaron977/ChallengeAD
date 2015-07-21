<%--

  body component.

  this is the body Comp

--%>
<%
	
%><%@include file="/libs/foundation/global.jsp"%>
<%
	
%><%@page session="false"%>
<%
	
%>
<%
	// TODO add you code here
%>
<div align="left" style="background-color: #7D2323">
	<cq:includeClientLib categories="cq.jquery"/>
        <%
    		int maximun=properties.get("max", -1);
			int pageSize=properties.get("page", -1);
			boolean paginate=properties.get("paginate", false);
    	%>
    	<script>
    		var actual=0;
    		var lengthVar = <%= pageSize %>;
    		var pagination= <%= paginate %>;
    		var max=<%= maximun %>;
    		$(window).ready(function() {
    			loadPage();
    		});
    	</script>
    	<script>
    		function loadPage(){
                var first = actual;
    			if(!pagination){
    				lengthVar=-1;
    			}
    			$.post('/bin/list', {
    				firstIndex : first,
    				length: lengthVar,
    			}, function(responseText) {
    				$('#data').html(responseText);
    			});
    		}
    		function avPag(){
    			var limit=(actual*5)+lengthVar;
    			if(max<0 || limit<max){
        			actual++;
        			loadPage();	
    			}else{
    				alert("No more results to show");
    			}
    		}
    		function rePag(){
    			if(actual>0){
        			actual--;
        			loadPage();	
    			}else{
    				alert("first page");
    			}
    		}
    		function doSelection(){
    			var selectedValue=<%= properties.get("show", "All") %>;
    			if(selectedValue=="All"){
    				document.getElementById(selectedValue).disabled=true;
    				document.getElementById("Completed").disabled=false;
    				document.getElementById("Active").disabled=false;
    			}
    			if(selectedValue=="Completed"){
    				document.getElementById(selectedValue).disabled=true;
    				document.getElementById("All").disabled=false;
    				document.getElementById("Active").disabled=false;
    			}
    			if(selectedValue=="Active"){
    				document.getElementById(selectedValue).disabled=true;
    				document.getElementById("Completed").disabled=false;
    				document.getElementById("All").disabled=false;
    			}
    		}
    </script>
	<font face="verdana" size="2" color="black"> <%=properties.get("list", "configure list field")%>
	</font>
	<form method="POST">
		<table id=data>
		</table>
		<table style="width: 100%">
			<tr>
				<td>
					<input type="button" value="previus" onclick="rePag();">
				</td>
				<td>
					<input type="button" value="next" onclick="avPag();">
				</td>
			</tr>
		</table>
		<table style="width: 100%">
			<tr>
				<td><%=properties.get("tasks", "items left button field")%></td>
				<td>
					<table style="width: 100%">
						<tr>
							<td>
								<button type="button">
									<%=properties.get("all", "all button field")%>
								</button>
							</td>
							<td>
								<button type="button">
									<%=properties.get("active", "active button field")%>
								</button>
							</td>
							<td>
								<button type="button">
									<%=properties.get("completed", "complete button field")%>
								</button>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<button type="button">
						<%=properties.get("clear", "clear button field")%>
					</button>
				</td>
			</tr>
		</table>
	</form>
</div>