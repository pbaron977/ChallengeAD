<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false" import="com.day.cq.wcm.api.WCMMode"%><%

final WCMMode mode = WCMMode.fromRequest(slingRequest);


/* Component Properties and Data */
final String question = properties.get("itemsleft", "");
final String answer = properties.get("clearcompleted", "");
final String type = properties.get("type", "");
final String bg = properties.get("bgColor", "");
final String maxn = properties.get("maxnumber", "");

%>

<%-- Component Presentation --%>


<div class="row marketing">
    <div class="col-lg-12">
        <h4>New Task</h4>
        <cq:include path="place-par" resourceType="foundation/components/parsys"/>

        <h4>TASK LIST</h4>
        <div class="container-fluid">
            <div class="row">
            <ul class="list-unstyled" id="task-list">

            </ul>
        </div>
    </div>

    <h4>Global Controllers</h4>

    <div class="row">
        <div class="container-fluid">
            <ul class="list-inline">
              <li>
                <span class="btn-control">2</span>
                <span class="btn-control">
                    <cq:text property="itemsleft" escapeXml="true"/>
                </span>
              </li>
              <li>
                        <% if( type.equals("all")) { %>
                                  <button type="button" id="allBtn" onclick="showAll()" class="btn btn-success"><cq:text property="allcontrol"  escapeXml="true"/></button>
                        <% } else { %>
                                  <button type="button" id="allBtn" onclick="showAll()" class="btn btn-default"><cq:text property="allcontrol"  escapeXml="true"/></button>
                        <% } %>
              </li>
               <li>
                    <% if( type.equals("active")) { %>
                        <button type="button" id="actBtn" onclick="showActive()" class="btn btn-success"><cq:text property="activecontrol"  escapeXml="true"/></button>
                    <% } else { %>
                        <button type="button" id="actBtn" onclick="showActive()" class="btn btn-default"><cq:text property="activecontrol"  escapeXml="true"/></button>
                    <% } %>
               </li>
               <li>
                     <% if( type.equals("completed")) { %>
                        <button type="button" id="comBtn" onclick="showCompleted()" class="btn btn-success"><cq:text property="completedcontrol"  escapeXml="true"/></button>
                     <% } else { %>
                        <button type="button" id="comBtn" onclick="showCompleted()" class="btn btn-default"><cq:text property="completedcontrol"  escapeXml="true"/></button>
                     <% } %>
               </li>
               <li>
                   <button type="button" class="btn btn-default">
                       <cq:text property="clearcompleted"  escapeXml="true"/>
                   </button>
               </li>
            </ul>
        </div>
    </div>

</div>

<script type="text/javascript">
    var data;
    $( "#bodyAll" ).css( "background-color", '#<%= bg %>');

    var url = "/content/challenge/home-page/jcr:content.data.html"+"?num=<%= maxn %>";

    $.ajax(url, {
        success: function(rawData, status, xhr) {
            var html = "";
            try {
                console.log(rawData);
                data = rawData;
                for(var i in rawData)
                {
                     html += "<li><div class='checkbox'><label id='label-"+rawData[i].id+"'><input type='checkbox' onchange='changeState( this )' value='"+rawData[i].id+"'>"+rawData[i].name+"</label></div></li>";
                }
                $("#task-list").append(html);
                showDefaultItems();
            } catch(err) {
                console.log(err);
            }
        },
        error: function(xhr, status, err) {
            console.log(err);
        }
    });

    function showDefaultItems (){
           var defaultControl = "<%= type %>";
           if(defaultControl == "active"){
                showActive();
           }
           if(defaultControl == "completed"){
                showCompleted();
           }
    }

    function changeState ( box ){
         console.log("val",$(box).val());
         if (box.checked) {
             $("#label-"+$(box).val()).addClass('text-checked');
             setStateCompleted( $(box).val() );
         } else {
             $("#label-"+$(box).val()).removeClass('text-checked');
             setStateAvailable( $(box).val() );
         }
    }

    function setStateCompleted(index){
        for (var i=0; i<data.length; i++) {
            if( data[i].id == index ){
                data[i].state=1;
            }
        }
        console.log("new data",data);
    }

    function setStateAvailable(index){
        for (var i=0; i<data.length; i++) {
            if( data[i].id == index ){
                    data[i].state=0;
            }
        }
        console.log("new data",data);
    }

    function removeControlStyles(){

        $( '#allBtn' ).removeClass( 'btn-success' );
        $( '#actBtn' ).removeClass( 'btn-success' );
        $( '#comBtn' ).removeClass( 'btn-success' );

        $( '#allBtn' ).addClass( 'btn-default' );
        $( '#actBtn' ).addClass( 'btn-default' );
        $( '#comBtn' ).addClass( 'btn-default' );

    }

    function showAll(){
        removeControlStyles();
        $( '#allBtn' ).addClass( 'btn-success' );
        var htmlTemp ="";
        for (var i=0; i<data.length; i++) {
            if( data[i].state == 1 ){
                    htmlTemp += "<li><div class='checkbox'><label id='label-"+data[i].id+"' class='text-checked'><input type='checkbox' checked onchange='changeState( this )' value='"+data[i].id+"'>"+data[i].name+"</label></div></li>";
              }else{
                    htmlTemp += "<li><div class='checkbox'><label id='label-"+data[i].id+"'><input type='checkbox' onchange='changeState( this )' value='"+data[i].id+"'>"+data[i].name+"</label></div></li>";
              }
        }
        $("#task-list").html(htmlTemp);
    }

    function showCompleted(){
        removeControlStyles();
        $( '#comBtn' ).addClass( 'btn-success' );
        var htmlTemp ="";
        for (var i=0; i<data.length; i++) {
            if( data[i].state == 1 ){
              htmlTemp += "<li><div class='checkbox'><label id='label-"+data[i].id+"' class='text-checked'><input type='checkbox' checked onchange='changeState( this )' value='"+data[i].id+"'>"+data[i].name+"</label></div></li>";
            }
        }
        $("#task-list").html(htmlTemp);
    }

    function showActive(){
        removeControlStyles();
        $( '#actBtn' ).addClass( 'btn-success' );
        var htmlTemp ="";
        for (var i=0; i<data.length; i++) {
            if( data[i].state == 0 ){
              htmlTemp += "<li><div class='checkbox'><label id='label-"+data[i].id+"'><input type='checkbox' onchange='changeState( this )' value='"+data[i].id+"'>"+data[i].name+"</label></div></li>";
            }
        }
        $("#task-list").html(htmlTemp);
    }


</script>

