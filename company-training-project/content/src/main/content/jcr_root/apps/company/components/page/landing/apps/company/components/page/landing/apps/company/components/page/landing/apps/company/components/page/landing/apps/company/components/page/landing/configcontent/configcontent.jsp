<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%@ page import="java.util.ArrayList, com.adobe.training.core.CopyRight, com.adobe.training.core.domain.Task, com.adobe.training.core.controller.TaskController" %>
<%
        Object o = properties.get("txtcontentplaceholder");
        String txtcontentplaceholder="";
        if(o!=null){
            txtcontentplaceholder = (String)o;
        }

        o = properties.get("btncontentplaceholder");
        String btncontentplaceholder="";
        if(o!=null){
             btncontentplaceholder = (String)o;
        }

        o = properties.get("btncontentall");
        String btncontentall="";
        if(o!=null){
             btncontentall = (String)o;
        }

        o = properties.get("btncontentactive");
        String btncontentactive="";
        if(o!=null){
             btncontentactive = (String)o;
        }

        o = properties.get("btncontentcompleted");
        String btncontentcompleted="";
        if(o!=null){
              btncontentcompleted = (String)o;
        }

        o = properties.get("btncontentclearcompleted");
        String btncontentclearcompleted="";
        if(o!=null){
             btncontentclearcompleted = (String)o;
        }

        o = properties.get("optcontentvalueactived");
        String optcontentvalueactived="";
        if(o!=null){
              optcontentvalueactived = (String)o;
        }

        Object chxshowconfpage = properties.get("chxshowconfpage");
        Object txttaskperpage = properties.get("txttaskperpage");
        Object chxlimit = properties.get("chxlimit");
        Object txtmaxlimit = properties.get("txtmaxlimit");
        String x = "";
        int cantMax = 10;
        if(txtmaxlimit!=null){
            x = (String)txtmaxlimit;
            if(x.equals("")){
                cantMax=10;
            }
            else{
                cantMax = Integer.valueOf(x);
            }
        }

        TaskController tc = new TaskController();
        ArrayList<Task> tasks = tc.getTask(cantMax);
        String textotask = "";
        for(int i=0;i<tasks.size();i++){
            Task t = tasks.get(i);
            textotask = textotask+"<input type='checkbox' name='t' />"+t.getTitle()+"<br>";
        }

%>
<form >
  <input type="text" name="fname" placeholder="<%=txtcontentplaceholder%>">
  <input type="submit" value="<%=btncontentplaceholder%>">
</form>
<div>
    <%=textotask%>
<div>
<div>
    ---<%=x%>---
<div>
<form >
  <input type="submit" value="<%=x%>">
  <input type="submit" value="<%=optcontentvalueactived%>">
  <input type="submit" value="<%=btncontentall%>">
  <input type="submit" value="<%=btncontentactive%>">
  <input type="submit" value="<%=btncontentcompleted%>">
  <input type="submit" value="<%=btncontentclearcompleted%>">
</form>






