package com.adobe.training.core.util;

import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by laygrana on 20/07/15.
 */
public class ConsumeService {

    public ConsumeService() {
    }

    public JSONArray consumeTasks (){
        String tasks="";
        JSONArray array = new JSONArray();
        try {

            URL url = new URL("http://jsonplaceholder.typicode.com/todos");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("GET");
            BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
            String output;

            while ((output = br.readLine()) != null) {
                tasks+=output;
            }

            conn.disconnect();

            try {
                array = new JSONArray(tasks.trim());
            } catch (JSONException e) {
                e.printStackTrace();
            }


        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return array;
    }
}
