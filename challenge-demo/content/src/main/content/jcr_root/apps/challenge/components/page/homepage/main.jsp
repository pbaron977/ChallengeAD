<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false"%><%

%>

      <div class="jumbotron">
        <h1 class="main-sub">
            <cq:include path="main-header-text" resourceType="foundation/components/text"/>
        </h1>
        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
      </div>

      <div class="row marketing">
        <div class="col-lg-12">
          <h4>New Task</h4>
          <cq:include path="place-par" resourceType="foundation/components/parsys"/>

          <h4>Music</h4>
          <div class="container-fluid">
            <div class="row">
              <ul class="list-unstyled">
                   <li>
                       <div class="checkbox">
                         <label>
                           <input type="checkbox" value="">
                           Option one is this and that&mdash;be sure to include why it's great
                         </label>
                       </div>
                   </li>
                    <li>
                       <div class="checkbox">
                         <label>
                            <input type="checkbox" value="">
                            Option one is this and that&mdash;be sure to include why it's great
                         </label>
                       </div>
                    </li>
              </ul>
            </div>
          </div>

          <h4>Global Controllers</h4>
          <cq:include path="main-par" resourceType="foundation/components/parsys"/>
        </div>
      </div>


