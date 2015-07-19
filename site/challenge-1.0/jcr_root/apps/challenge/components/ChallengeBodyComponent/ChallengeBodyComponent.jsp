<%--

  Body Component component.

  The body component for the Backend Challenge

--%>

<%@include file='/libs/foundation/global.jsp'%>

<cq:includeClientLib categories='cq.jquery'/>

<style>
  .mainBody {
    display: table;
    width: 700px;
    height: auto;
    background-color: #C0C0C0;
    margin-left: auto;
    margin-right: auto;
  }

  .mainBody p {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
  }

  .todoTable {
    width: 100%;
    text-align: left;
    font-family: sans-serif;
    font-size: 16px;
  }

  .configTable {
    width: 100%;
    text-align: center;
    font-family: sans-serif;
    font-size: 12px;
    cursor: pointer
  }

  .configTableSelected {
    font-weight: bold;
    text-decoration: underline;
  }

  .todoTableNewTd {
    height: 50px;
    text-align: right;
    font-size: 20px;
    font-style: italic;
  }

  .todoTableNewTdText {
    height: 45px;
    width: 97%;
    border: 0;
    background-color: rgba( 0, 0, 0, 0 );
    font-size: 20px;
    font-style: italic;
  }

  .todoTableNewTdText:focus {
    outline-width: 0;
  }

  .todoTableDoneTd {
    text-decoration: line-through;
  }
</style>

<script>
  var jsonData = [];
  var actualStatus = null;
  var originalPending = null;

  var maxLimit = null;
  var maxValue = null;
  var doPaging = null;
  var tasksPP = null;
  var currPag = 1;

  $( document ).ready( start );

  function start() {
    loadTaskData();

    doPaging = <%=properties.get( "pagination", "false" )%>;
    maxLimit = <%=properties.get( "limitmax", "false" )%>;

    maxValue = <%=properties.get( "max", "10" )%>;
    tasksPP = <%=properties.get( "taskspp", "10" )%>;
  }

  function loadTaskData() {
    $.getJSON( 'http://localhost:4502/content/todo/tasks.json', function( data ) { for ( task in data ) jsonData.push( data[task] ); loadPending(); loadStatus( '<%=properties.get( "status", "All" )%>' ); } );
  }

  function loadPending() {
    var pending = 0;

    if ( null == originalPending )
      originalPending = $( '#Pending' ).text();

    for ( task in jsonData )
      if ( 'pending' == jsonData[task].status )
        pending++;

    $( '#Pending' ).text( originalPending.replace( '{0}', pending.toString() ) );
  }

  function loadStatus( status ) {
    $( '#All' ).removeClass( 'configTableSelected' );
    $( '#Active' ).removeClass( 'configTableSelected' );
    $( '#Completed' ).removeClass( 'configTableSelected' );

    switch( status ) {
      default:
        $( '#All' ).addClass( 'configTableSelected' );
        break;
      case 'Active':
        $( '#Active' ).addClass( 'configTableSelected' );
        break;
      case 'Completed':
        $( '#Completed' ).addClass( 'configTableSelected' );
        break;
    }

    if ( actualStatus != status ) {
      actualStatus = status;
      currPag = 1;
    }

    $( '#TodoTable tr' ).remove();

    if ( !doPaging ) {
      for ( task in jsonData )
        if ( 'done' == jsonData[task].status && ( 'All' == actualStatus || 'Completed' == actualStatus ) )
          $( '#TodoTable tbody' ).append( '<tr><td class="todoTableDoneTd"><input id="' + task + '" type="checkbox" checked="true" onchange="switchStatus( this )">' + jsonData[task].name + '</td></tr>' );
        else if ( 'pending' == jsonData[task].status && ( 'All' == actualStatus || 'Active' == actualStatus ) )
          $( '#TodoTable tbody' ).append( '<tr><td><input id="' + task + '" type="checkbox" onchange="switchStatus( this )">' + jsonData[task].name + '</td></tr>' );
    } else {
        var rendered = 0;

        for ( task = ( currPag - 1 ) * tasksPP ; task < jsonData.length ; task++ ) {
          if ( 'done' == jsonData[task].status && ( 'All' == actualStatus || 'Completed' == actualStatus ) ) {
            $( '#TodoTable tbody' ).append( '<tr><td class="todoTableDoneTd"><input id="' + task + '" type="checkbox" checked="true" onchange="switchStatus( this )">' + jsonData[task].name + '</td></tr>' );
            rendered++
          } else if ( 'pending' == jsonData[task].status && ( 'All' == actualStatus || 'Active' == actualStatus ) ) {
            $( '#TodoTable tbody' ).append( '<tr><td><input id="' + task + '" type="checkbox" onchange="switchStatus( this )">' + jsonData[task].name + '</td></tr>' );
            rendered++;
          }

          if ( tasksPP <= rendered )
              break;
        }
    }
  }

  function deleteComplete() {
    for ( task in jsonData )
        if ( 'done' == jsonData[task].status )
          jsonData.splice( task, 1 );

    $.ajax( { url: 'http://localhost:4502/content/todo/tasks.json', type: 'PUT', data: JSON.stringify( jsonData ) } );

    loadPending();
    loadStatus( actualStatus );
  }

  function addPending( event ) {
    if ( 13 == event.which && '' != $( '#NewTask' ).val() ) {
      var task = $.parseJSON( '{ "name": "' + $( '#NewTask' ).val() + '", "status": "pending" }' );

      $( '#NewTask' ).val( '' );

      jsonData.push( task );

      $.ajax( { url: 'http://localhost:4502/content/todo/tasks.json', type: 'PUT', data: JSON.stringify( jsonData ) } );

      loadPending();
      loadStatus( actualStatus );
    }
  }

  function switchStatus( event ) {
    if ( 'pending' == jsonData[event.id].status )
      jsonData[event.id].status = 'done';
    else if ( 'done' == jsonData[event.id].status )
      jsonData[event.id].status = 'pending';

    $.ajax( { url: 'http://localhost:4502/content/todo/tasks.json', type: 'PUT', data: JSON.stringify( jsonData ) } );

    loadPending();
    loadStatus( actualStatus );
  }

  function changePage( index ) {
    currPag += index;

    if ( 1 > currPag )
        currPag = 1;

    loadStatus( actualStatus );
  }
</script>

<div class='mainBody'>
  <p>
    <table class='todoTable'>
      <tr>
        <td class='todoTableNewTd'><input id='NewTask' class='todoTableNewTdText' type='text' placeholder='<%=properties.get( "placeholder", "What needs to be done?" )%>' onkeypress='addPending( event )'></td>
      </tr>
    </table>
    <table id='TodoTable' class='todoTable'>
      <tbody/>
    </table>
    <br/>
    <table class='configTable'>
      <tr>
        <td id='Pending' width='34%'><%=properties.get( "itemsleft", "{0} items left" )%></td>
        <td width='33%'>
          <table class='configTable'>
            <tr>
              <td width='50%'><a id='Prev' onclick='changePage( -1 )'><%=properties.get( "prev", "Prev." )%></a></td>
              <td width='50%'><a id='Next' onclick='changePage( 1 )'><%=properties.get( "next", "Next" )%></a></td>
            <tr>
          </table>
          <table class='configTable'>
            <tr>
              <td width='33%'><a id='All'  onclick='loadStatus( "All" )'><%=properties.get( "all", "All" )%></a></td>
              <td width='33%'><a id='Active' onclick='loadStatus( "Active" )'><%=properties.get( "active", "Active" )%></a></td>
              <td width='34%'><a id='Completed' onclick='loadStatus( "Completed" )'><%=properties.get( "completed", "Completed" )%></a></td>
            <tr>
          </table>
        </td>
        <td width='34%'><a id='Clear' onclick='deleteComplete()'><%=properties.get( "clear", "Clear completed" )%></a></td>
      </tr>
    </table>
  </p>
</div>