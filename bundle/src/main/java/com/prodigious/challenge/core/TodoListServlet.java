package com.prodigious.challenge.core;

import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;

import javax.jcr.Repository;
import javax.servlet.ServletException;
import java.io.IOException;

/**
 * Created by jorcuell on 7/15/15.
 */
@SlingServlet(paths = "/bin/todolist/data")
public class TodoListServlet extends SlingSafeMethodsServlet {

    @Reference
    private Repository repository;

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {

        response.setHeader("Content-Type", "application/json");

        //response.getWriter().print("{\"coming\" : \"soon\"}");

        String[] keys = repository.getDescriptorKeys();
        String[] todo = {"fuck", "ass", "bitch"};

        JSONObject jsonObject = new JSONObject();

        for (int i = 0; i < todo.length; i++) {

            try {

                jsonObject.put(todo[i], todo[i]);

            } catch (JSONException e) {

                e.printStackTrace();

            }

        }

        response.getWriter().print(jsonObject.toString());

    }

}
