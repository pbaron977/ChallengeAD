package com.adobe.challenge.core;



import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jcr.Repository;

import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.Reference;

import org.apache.felix.scr.annotations.sling.SlingServlet;

import org.apache.sling.api.SlingHttpServletRequest;

import org.apache.sling.api.SlingHttpServletResponse;

import org.apache.sling.api.servlets.SlingSafeMethodsServlet;

import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONException;

import org.apache.sling.commons.json.JSONObject;



@SlingServlet(resourceTypes="challenge/components/page/homepage", selectors="data", methods = "GET")

public class ChallengeApi extends SlingSafeMethodsServlet {

    private static final long serialVersionUID = -3960692666512058118L;

    private Map<String,Todo> map1;

    @Override

    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {

        JSONArray jsonArray = new JSONArray();

        request.getResourceResolver();
        response.setHeader("Content-Type", "application/json");

        //response.getWriter().print("{\"coming\" : \"soon\"}");
        //    request.getRequestParameter("num");

        if(map1 == null || map1.isEmpty()){
           setNewMap();
        }

        if(request.getRequestParameter("num")!=null && !request.getRequestParameter("num").getString().isEmpty()){
            int limit = Integer.parseInt(request.getRequestParameter("num").getString());
            for(int i = 1; i <= limit; i++) {
                try {
                    Todo temp = map1.get(""+i);
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("id", ""+i);
                    jsonObject.put("name", temp.getName());
                    jsonObject.put("state", temp.getState());
                    jsonArray.put(jsonObject);
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }else{
            int currentPosition = 1;
            for (Todo todo : map1.values()) {
                try {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("id", ""+currentPosition);
                    jsonObject.put("name", todo.getName());
                    jsonObject.put("state", todo.getState());
                    jsonArray.put(jsonObject);
                    currentPosition ++;
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }

        response.getWriter().print(jsonArray.toString());

    }

    private void setNewMap(){
        map1 = new HashMap<String, Todo>();
        map1.put("1",new Todo("Learn something new",0));
        map1.put("2",new Todo("Upgrade website",0));
        map1.put("3",new Todo("Replace the broken window",0));
        map1.put("4",new Todo("Buy a new pc",0));
        map1.put("5",new Todo("Workout",0));
        map1.put("6",new Todo("Laundry",0));
        map1.put("7",new Todo("Haircut",0));
        map1.put("8",new Todo("Review AEM documentation",0));
        map1.put("9",new Todo("blog about sling",0));
        map1.put("10",new Todo("Learn more about AEM",0));
    }

}

