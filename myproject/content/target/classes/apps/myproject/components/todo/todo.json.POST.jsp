<%@page session="false" %>
<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="org.apache.sling.jcr.api.SlingRepository" %>
<%@ page import="com.day.cq.security.UserManager" %>
<%@ page import="com.day.cq.security.UserManagerFactory" %>
<%@ page import="com.day.cq.security.User" %>
<%@ page import="com.day.cq.security.Authorizable" %>
<%@ page import="com.day.cq.security.profile.Profile" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.day.cq.commons.TidyJSONWriter" %>
 
<%

	final TidyJSONWriter writer = new TidyJSONWriter(response.getWriter());
    //Husband's House Cleaning List
        try
		{
    		//Begin writing JSON response
    		writer.setTidy("true".equals(request.getParameter("tidy")));
			writer.array();
    		writer.object();
    		writer.key("title").value("Iron the clothes");
			writer.endObject();
    		writer.object();
    		writer.key("title").value("Wash the dishes");
			writer.endObject();
            writer.object();
    		writer.key("title").value("Take out the trash");
			writer.endObject();
            writer.object();
    		writer.key("title").value("Dust all picture frames");
			writer.endObject();
            writer.object();
    		writer.key("title").value("Mop the floor");
			writer.endObject();
    		writer.endArray();
        } catch (Exception e){
    		System.out.println("to-do app Exception Occured: " + e.getMessage());
		}

%>