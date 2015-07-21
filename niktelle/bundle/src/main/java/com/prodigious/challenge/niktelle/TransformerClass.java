package com.prodigious.challenge.niktelle;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.rmi.ServerException;
import java.util.Dictionary;

import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.apache.sling.commons.osgi.OsgiUtil;
import org.apache.sling.jcr.api.SlingRepository;
import org.osgi.service.component.ComponentContext;

@SlingServlet(resourceTypes = "challenge1/components/page/contentpage",selectors = "tweets", methods = "GET", extensions = "json")
public class TransformerClass extends SlingSafeMethodsServlet {

    private static final long serialVersionUID = 2598426539166789515L;

    

    @SuppressWarnings("unused")
    @Reference
    private SlingRepository repository;


    
    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        super.doGet(request, response);
    }

    
    

   
}
