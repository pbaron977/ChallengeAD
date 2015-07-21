package jar;

import static javax.servlet.http.HttpServletResponse.SC_OK;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@SlingServlet(resourceTypes = {"challengegabriel/components/page/todoPage"
        }, selectors = "songlist", methods = "GET", extensions = "json")
public class SpotifyServlet extends SlingAllMethodsServlet {
	private static final long serialVersionUID = 380408103951299485L;
    /* "application/json" */
    public final static String APPLICATION_JSON = "application/json";
    public static final String DISPATCHER = "Dispatcher";
    public static final String NO_CACHE = "no-cache";

    private static final Logger LOGGER = LoggerFactory.getLogger(SpotifyServlet.class);



    @Override
    public void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response)  {
    	System.out.println("insideservlet");
    	String jsonResponse="";
    	String idArtist="";
    	String artistRequested=request.getParameter("artistName");
    	artistRequested=artistRequested.replace(" ","%20");
    	try {
			String artistServiceResponse="";
			URL url = new URL("https://api.spotify.com/v1/search?q="+artistRequested+"&type=artist");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
	 
			if (conn.getResponseCode() != 200) {
				LOGGER.debug("Customer not found {} server response 200");
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());		
			}
	 
			BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream()))); 
	 
			String output;
			
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				artistServiceResponse=artistServiceResponse.concat(output);
			}
			LOGGER.debug("Server response for artist "+artistServiceResponse);
			conn.disconnect();
			try{
				JSONObject artistdata = new JSONObject(artistServiceResponse);
				JSONObject artistDataExtracted = artistdata.getJSONObject("artists");
				JSONArray artistItems= artistDataExtracted.getJSONArray("items");
				JSONObject artistSolo=artistItems.getJSONObject(0);
				idArtist=artistSolo.getString("id");
			}catch(JSONException e){
			
			}
		  } catch (MalformedURLException e) {
			LOGGER.debug("Malformed URL ", e);
			e.printStackTrace();
	 
		  } catch (IOException e) {
			LOGGER.debug("IOException",e);
			e.printStackTrace();
	 
		  }

    	try {
			 
    		URL url = new URL("https://api.spotify.com/v1/artists/"+idArtist+"/related-artists");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
	 
			if (conn.getResponseCode() != 200) {
				LOGGER.debug("Customer not found {} server response 200");
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}
	 
			BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream()))); 
	 
			String output;
			
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				jsonResponse=jsonResponse.concat(output);
			}
			LOGGER.debug("Server response for related artist "+jsonResponse);
			conn.disconnect();
			//JSONObject json_data = new JSONObject(total);
		  } catch (MalformedURLException e) {
			LOGGER.debug("Malformed URL ", e);
			e.printStackTrace();
	 
		  } catch (IOException e) {
			LOGGER.debug("IOException ", e);
			e.printStackTrace();
	 
		  }
    	try{
    		writeJson(response,jsonResponse, SC_OK);
    	}catch(IOException e){
		
    	}
    }
    
    
    private void writeJson(SlingHttpServletResponse response, String spotifyString, int statusCode) throws IOException {
    	response.setStatus(statusCode);
        response.getWriter().print(spotifyString);
        response.setContentType(APPLICATION_JSON);
        response.setHeader(DISPATCHER, NO_CACHE);
    }
    
    @Override
    public void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response){
    	
    }
}
