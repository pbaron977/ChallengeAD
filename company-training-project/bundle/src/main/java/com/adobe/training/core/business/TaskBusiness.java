package com.adobe.training.core.business;

import com.adobe.training.core.domain.Task;
import com.adobe.training.core.util.ConsumeService;
import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;

import java.util.ArrayList;

/**
 * Created by laygrana on 20/07/15.
 */
public class TaskBusiness {

    ConsumeService cs = new ConsumeService();

    public ArrayList<Task> getTask(int cantMax){
        ArrayList<Task> tasks = new ArrayList<Task>();
        JSONArray json = cs.consumeTasks();

        if(cantMax>json.length()){
            cantMax=json.length();
        }

        try {
            for(int i=0;i<cantMax;i++){
                JSONObject j = (JSONObject)json.get(i);
                Task task = new Task(j.getInt("id"),j.getString("title"), j.getBoolean("completed") );
                tasks.add(task);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return tasks;
    }


}
