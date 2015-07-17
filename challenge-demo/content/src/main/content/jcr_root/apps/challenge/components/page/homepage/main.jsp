<%@include file="/apps/challenge/global/global.jsp"%><%
%><%@page session="false"%><%

%>

<div class="grid_12">
    <div class="promo">
        <cq:include path="main-header-text" resourceType="foundation/components/text"/>
    </div>
</div>

    <section id="todoapp" class="grid_12">
            <header id="header">
                <div id="headerBand"></div>
                <cq:include path="place-par" resourceType="foundation/components/parsys"/>
            </header>
            <section id="main">
                <div id="todo-list">
                    <div class="templateWrapper" >
                        <div class="templateContainer">
                            <h3 class="templateAddress">Algo Aca</h3>
                            <button class="templateLeft templateToggle" ></button>
                            <button class="templateLeft templateRemove" ></button>
                        </div>
                        <div class="templateBorder"></div>
                    </div>
                    <div class="templateWrapper" >
                         <div class="templateContainer">
                              <h3 class="templateAddress">Algo mas</h3>
                              <button class="templateLeft templateToggle" ></button>
                              <button class="templateLeft templateRemove" ></button>
                         </div>
                         <div class="templateBorder"></div>
                    </div>
                </div>
            </section>
    </section>
     <section class="grid_12">
            <cq:include path="main-par" resourceType="foundation/components/parsys"/>
     </section>


