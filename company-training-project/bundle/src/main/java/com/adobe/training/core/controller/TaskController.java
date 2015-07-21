package com.adobe.training.core.controller;

import com.adobe.training.core.business.TaskBusiness;
import com.adobe.training.core.domain.Task;

import java.util.ArrayList;

/**
 * Created by laygrana on 20/07/15.
 */
public class TaskController {

    TaskBusiness tb = new TaskBusiness();

    public ArrayList<Task> getTask(int cantMax){
        return tb.getTask(cantMax);
    }


}
