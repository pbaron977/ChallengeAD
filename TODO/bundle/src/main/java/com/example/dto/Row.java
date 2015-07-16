package com.example.dto;

import org.apache.sling.commons.json.JSONObject;
import org.apache.sling.commons.json.io.JSONWriter;

import com.example.enums.State;

public class Row {
	
	private int id;
	
	private String name;
	
	private State state;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}
	
	public String toString(){
		return "{\"id\":\""+this.id+"\",\"nam\":\""+this.name+"\",\"state\":\""+this.state.getLabel()+"\"}";
	}
}
