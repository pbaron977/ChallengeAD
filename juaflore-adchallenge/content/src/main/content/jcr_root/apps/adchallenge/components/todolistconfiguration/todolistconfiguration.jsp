<%@include file="/libs/foundation/global.jsp"%>
<div class="container">
	<section class="main">
		<div class="crearTransaccion">
			<h1>
				<span class="log-in">todos</span>
			</h1>
			<p class="float-100">
                <input type="checkbox" id="select-all"/></input>
				<input type="text" id="listitem" placeholder="What needs to be done?">
			</p>
			<p class="float-100">
				<input type="checkbox" id="select-item-1"></input>
				<p id="item-1"></p>
			</p>
		</div>
	</section>

</div>


<%
	Node node = component.getLocalResource("dialog/items/items/tab2/items").adaptTo(Node.class);
	//String title = node.hasProperty("./tasksperpage") ? node.getProperty("./tasksperpage").getString() : "default title";
	//String text = node.hasProperty("jcr:text") ? node.getProperty("jcr:text").getString() : "default text";
	//node.setProperty("text", "default textoooooo");

	PropertyIterator props = null;
	if (node.getProperties() != null)
		props = node.getProperties();

	while (props.hasNext()) {
		Property prop = props.nextProperty();

		if (prop.getName().equals("name")) {
			prop.setValue("prueba");
		}
%>
Name:
<%=prop.getName()%><br />
Value:
<%=prop.getValue()%><br />
<br />

<%
	}
%>
<br />
<br />
<br />
<br />
<br />
Component's text:
<%=properties.get("./tasksperpage", component.getLocalResource("dialog").getName())%>
<br />
Component's text2:
<%=properties.get("tasksperpage", node)%>
<br />
