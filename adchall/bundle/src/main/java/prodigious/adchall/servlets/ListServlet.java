package prodigious.adchall.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;

import prodigious.adchall.ListService;
import prodigious.adchall.impl.ListServiceImpl;

@SuppressWarnings("serial")
@SlingServlet(paths="/bin/list", methods = "POST", metatype=true )
public class ListServlet extends org.apache.sling.api.servlets.SlingAllMethodsServlet{

	@Override
	protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) 
			throws IOException{
		int first=Integer.parseInt(request.getParameter("firstIndex"));
		int length=Integer.parseInt(request.getParameter("length"));
		ListService service=new ListServiceImpl();
		PrintWriter out=new PrintWriter(response.getOutputStream(),true);
		List<String> tasks=service.getTasks(first,length);
		for(int i=0;i<tasks.size();i++){
			out.print("<tr>");
	    	out.print("<td>");
	        out.print("<font face=\"verdana\" size=\"2\" color=\"black\">"+
	        		tasks.get(i)+"</font>");
	        out.print("<input type=\"checkbox\" name=\"1\">");
	       	out.print("</td>");
	        out.print("</tr>");
		}
		out.close();
	}
	
	
}
