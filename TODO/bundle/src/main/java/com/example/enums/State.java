package com.example.enums;

public enum State {
	TODO("To do"),
	IN_PROGESS("In progres .."),
	DONE("Done");
	
	private State(String label){
		this.label = label;
	}
	
	private String label;
	
	public String getLabel(){
		return this.label;
	}
}
