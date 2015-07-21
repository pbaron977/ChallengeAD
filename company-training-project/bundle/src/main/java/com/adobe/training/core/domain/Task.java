package com.adobe.training.core.domain;

/**
 * Created by laygrana on 20/07/15.
 */
public class Task {

    private int id;
    private String title;
    private Boolean completed;

    public Task() {
    }

    public Task(int id, String title, Boolean completed) {
        this.id = id;
        this.title = title;
        this.completed = completed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Boolean getCompleted() {
        return completed;
    }

    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }
}
