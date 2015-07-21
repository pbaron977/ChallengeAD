package com.mycompany.myproject.sling;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.rmi.ServerException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SlingServlet(paths = "/bin/ToDoAppServlet", methods = { "POST", "GET" }, metatype = true)
public class ToDoServiceProvider extends org.apache.sling.api.servlets.SlingAllMethodsServlet {

    /** Serial UID */
    private static final long serialVersionUID = 2175189166009818772L;
    /** tMDb API base url */
    private static final String THE_MOVIE_DATABASE_BASE_URL = "http://api.themoviedb.org/3/search/movie?";
    /** tMDb API API Key */
    private static final String THE_MOVIE_DATABASE_API_KEY = "115038b5a6aaefa14e056b2fca601a26";
    /** default logger factory */
    private final Logger LOGGER = LoggerFactory.getLogger(ToDoServiceProvider.class);
    /** The Open Weather Map API base url */
    private static final String THE_OPEN_WEATHER_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?mode=json&units=metric&cnt=5";

    @Override
    protected void doPost(SlingHttpServletRequest request, 
                          SlingHttpServletResponse response) throws ServerException, IOException {
        // option parameter containing the service data source
        String option = request.getParameter("option");
        // doPost response in json format
        String jsonData = null;
        // tMDb list
        if (option.equals("fs2")) {
            String query = request.getParameter("query");
            jsonData = this.getTheMovieDbResponse(URLEncoder.encode(query, "UTF-8"));
            if (jsonData != null) {
                JSONArray jsonArray = this.extractMovieTitlesFromJson(jsonData);
                jsonData = jsonArray.toJSONString();
            }
        }
        // Option for the Open Weather Service
        if (option.equals("fs3")) {
            String query = request.getParameter("q");
            jsonData = this.getTheOpenWeatherResponse(URLEncoder.encode(query, "UTF-8"));
            if (jsonData != null) {
                JSONArray jsonArray = this.extractWeatherForecastFromJson(jsonData);
                jsonData = jsonArray.toJSONString();
            }
        }
        response.getWriter().write(jsonData == null ? "[{title:error}]" : jsonData);
    }

    /**
     * Calling remote the Open Weather rest service, GET method.
     * 
     * @param query
     *            .
     * @return
     */
    private String getTheOpenWeatherResponse(String query) {
        String response = "";
        try {
            if (query.isEmpty()) {
                throw new MalformedURLException("query parameter can't be empty");
            }
            URL url = new URL(THE_OPEN_WEATHER_BASE_URL + "&q=" + query);
            HttpURLConnection conn = null;
            try {
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Accept", "application/json");
                // In case of OK response
                if (conn.getResponseCode() == 200) {
                    BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
                    String output = null;
                    // output from sever
                    while ((output = br.readLine()) != null) {
                        response = response + output;
                    }
                }
            }
            catch (IOException e) {
                LOGGER.error("getTheOpenWeatherResponse method:" + e.getMessage());
                response = null;
            }
            finally {
                conn.disconnect();
            }
        }
        catch (MalformedURLException e) {
            LOGGER.error("getTheOpenWeatherResponse method:" + e.getMessage());
        }
        LOGGER.info("getTheOpenWeatherResponse, query=" + query + ", response=" + response);
        return response;
    }

    /**
     * Calling remote tMDb rest service, GET method.
     * @param query .
     * @return
     */
    private String getTheMovieDbResponse(String query) {
        String response = "";
        try {
            if (query.isEmpty()) {
                throw new MalformedURLException("query parameter can't be empty");
            }
            URL url = new URL(THE_MOVIE_DATABASE_BASE_URL + "api_key=" + THE_MOVIE_DATABASE_API_KEY + "&query=" + query);
            HttpURLConnection conn = null;
            try {
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Accept", "application/json");
                // In case of OK response
                if (conn.getResponseCode() == 200) {
                    BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
                    String output = null;
                    // output from sever
                    while ((output = br.readLine()) != null) {
                        response = response + output;
                    }
                }
            }
            catch (IOException e) {
                LOGGER.error("getTheMovieDbResponse method:" + e.getMessage());
                response = null;
            }
            finally {
                conn.disconnect();
            }

        }
        catch (MalformedURLException e) {
            LOGGER.error("getTheMovieDbResponse method:" + e.getMessage());
        }
        LOGGER.info("getTheMovieDbResponse, query=" + query + ", response=" + response);
        return response;
    }

    /**
     * Returns a JSONArray containing only the original title for each one.
     * @param jsonString jsonString as formatted by the Open Weather API rest service.
     * @return JSONArray
     */
    @SuppressWarnings("unchecked")
    private JSONArray extractWeatherForecastFromJson(String jsonString) {
        JSONArray responseArray = new JSONArray();
        try {
            JSONObject weatherJsonObject = (JSONObject) JSONValue.parseWithException(jsonString);
            JSONArray resultsArray = (JSONArray) weatherJsonObject.get("list");
            if (resultsArray != null && !resultsArray.isEmpty()) {
                for (int i = 0; i < resultsArray.size(); i++) {
                    String dailyForecast = "";
                    JSONObject dailyWeather = (JSONObject) resultsArray.get(i);
                    String dia = dailyWeather.get("dt").toString();
                    Long dialong = new Long(dia);
                    Calendar cal = new GregorianCalendar();
                    cal.setTime(new Date(dialong * 1000)); // to convert to real date from Epoch
                    dia = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DATE);
                    dailyForecast += dia;
                    JSONObject temp = (JSONObject) dailyWeather.get("temp");
                    dailyForecast += " Temperature:[Min:" + temp.get("min").toString() + " Celsius";
                    dailyForecast += ", Max:" + temp.get("max").toString() + " Celsius]";
                    String humidity = dailyWeather.get("humidity").toString();
                    dailyForecast += ", humidity:" + humidity + "%";
                    String pressure = dailyWeather.get("pressure").toString();
                    dailyForecast += ", pressure:" + pressure + " hPa";
                    JSONObject newForecast = new JSONObject();
                    newForecast.put("title", dailyForecast);
                    responseArray.add(newForecast);
                }
            }
        }
        catch (ParseException e) {
            LOGGER.error("extractWeatherForecastFromJson method" + e.getMessage());
        }
        return responseArray;
    }

    /**
     * Returns a JSONArray containing only the original title for each one.
     * 
     * @param jsonString
     *            jsonString as formatted by the tMDb API rest service.
     * @return JSONArray
     */
    @SuppressWarnings("unchecked")
    private JSONArray extractMovieTitlesFromJson(String jsonString) {
        JSONArray responseArray = new JSONArray();
        try {
            JSONObject moviesJsonObject = (JSONObject) JSONValue.parseWithException(jsonString);
            JSONArray resultsArray = (JSONArray) moviesJsonObject.get("results");
            if (resultsArray != null && !resultsArray.isEmpty()) {
                for (int i = 0; i < resultsArray.size(); i++) {
                    JSONObject movie = (JSONObject) resultsArray.get(i);
                    String title = movie.get("original_title").toString();
                    Object release = movie.get("release_date");
                    title = title + " (Release Date:" + (release == null ? "N/A" : release.toString()) + ")";
                    JSONObject newMovie = new JSONObject();
                    newMovie.put("title", title);
                    responseArray.add(newMovie);
                }
            }
        }
        catch (ParseException e) {
            LOGGER.error("extractMovieTitlesFromJson method" + e.getMessage());
        }
        return responseArray;
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException,
            IOException {
        response.setHeader("Content-Type", "application/json");
        JSONObject obj = new JSONObject();
        obj.put("title", "test");
        // Get the JSON formatted data
        String jsonData = obj.toJSONString();
        // Return the JSON formatted data
        response.getWriter().write(jsonData);
    }
}
