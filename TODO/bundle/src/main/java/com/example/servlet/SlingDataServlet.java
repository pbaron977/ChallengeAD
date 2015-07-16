package com.example.servlet;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.commons.json.JSONObject;

import com.example.data.DataService;
import com.example.dto.Row;
import com.example.enums.State;


@SlingServlet(paths="/bin/challange", methods = "POST", metatype=true , extensions = "json" )
public class SlingDataServlet extends org.apache.sling.api.servlets.SlingAllMethodsServlet{
	
	private Logger logger = LogManager.getRootLogger();
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) throws IOException {
		logger.info("Se recibio una petición para el servlet SlingDataServlet["+request.toString()+"]");
		System.out.println("Se recibio una petición para el servlet SlingDataServlet["+request.toString()+"]");
		Iterator it = request.getParameterMap().keySet().iterator();
		int first = Integer.parseInt(request.getParameter("first"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println("Parametro primero->"+first);
		System.out.println("Parametro cantidad->"+pageSize);
		String state= request.getParameter("state");
		System.out.println("Parametro estado->"+state);
		State stateEnum = State.valueOf(state);
		System.out.println("State ENUM->"+stateEnum);
		JSONObject obj = new JSONObject();
		try{
			List<Row> registros = DataService.getRows(first, pageSize, stateEnum);
			System.out.println("Se van a enviar "+registros);
			obj.put("regs", registros);
			response.setContentType("application/json");
			System.out.println("Se va a enviar la respuesta "+obj.toString());
	        response.getWriter().write(obj.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
