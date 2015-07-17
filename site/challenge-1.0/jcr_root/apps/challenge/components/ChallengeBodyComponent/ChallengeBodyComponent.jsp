<%--

  Body Component component.

  The body component for the Backend Challenge

--%>

<%@include file='/libs/foundation/global.jsp'%>

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
  }

  .configTableSelected {
    font-weight: 900;
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

<div class='mainBody'>
  <p>
    <table class='todoTable'>
      <tr>
        <td class='todoTableNewTd'><input class="todoTableNewTdText" type='text' placeholder='<%=properties.get( "placeholder", "What needs to be done?" )%>'></td>
      </tr>
      <tr>
        <td><input type='checkbox' name='task_2' value='task_2'>Clean room</td>
      </tr>
      <tr>
        <td class='todoTableDoneTd'><input type='checkbox' name='task_3' value='task_3'>Feed the dog</td>
      </tr>
      <tr>
        <td><input type='checkbox' name='task_4' value='task_4'>Take yoga class</td>
      </tr>
    </table>
    <br/>
    <table class='configTable'>
      <tr>
        <td width='34%'><%=properties.get( "itemsleft", "{0} items left" )%></td>
        <td width='33%'>
          <table class='configTable'>
            <tr>
              <td width='33%'><a id='All'><%=properties.get( "all", "All" )%></a></td>
              <td width='33%'><a id='Active'><%=properties.get( "active", "Active" )%></a></td>
              <td width='34%'><a id='Completed'><%=properties.get( "completed", "Completed" )%></a></td>
            <tr>
          </table>
        </td>
        <td width='34%'><a id='Clear'><%=properties.get( "clear", "Clear completed" )%></a></td>
      </tr>
    </table>
  </p>
</div>