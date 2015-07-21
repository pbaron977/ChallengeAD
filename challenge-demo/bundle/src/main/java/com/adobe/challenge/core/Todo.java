package com.adobe.challenge.core;

/**
 * Created by edwherre on 20/07/15.
 */
public class Todo {

    private String name;

    private int state;

    public Todo(String name, int state) {
        this.name = name;
        this.state = state;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public int getState() {
        return state;
    }

}
