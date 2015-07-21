package com.prodigious.challenge.niktelle;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.List;

import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;
import org.apache.sling.commons.osgi.OsgiUtil;
import org.apache.sling.jcr.api.SlingRepository;
import org.osgi.service.component.ComponentContext;
import org.slf4j.LoggerFactory;

import twitter4j.Logger;
import twitter4j.Paging;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

@SlingServlet(paths = "/bin/mySearchServlet", methods = "GET", metatype = true)
public class MsSenderServlet extends SlingSafeMethodsServlet {

    private static final long serialVersionUID = 2598426539166789515L;@SuppressWarnings("unused")
    @Reference
    private SlingRepository repository;

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServerException,
            IOException {

        final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(MsSenderServlet.class);
        LOGGER.info("-------Info--------");
        

        // The factory instance is re-useable and thread safe.
        Twitter twitter = TwitterFactory.getSingleton();
        List<Status> statuses = new ArrayList<Status>();

        
        JSONObject jsonObject = new JSONObject();
        String[] jsonString;

        try {
            statuses = twitter.getUserTimeline("ideascorporate", new Paging(1));
        }
        catch (TwitterException e1) {
            e1.printStackTrace();
        }
        System.out.println("Showing home timeline.");

        for (Status status : statuses) {
            System.out.println(status.getUser().getName() + ":" + status.getText());
            try {
                jsonObject.put(String.valueOf(status.getId()), status.getText());
            }
            catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        response.setHeader("Content-Type","application/json;charset=UTF-8");
        response.getWriter().append(jsonObject.toString());

    }
}
