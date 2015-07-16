package com.example.data;

import java.util.ArrayList;
import java.util.List;

import com.example.dto.Row;
import com.example.enums.State;

public class DataService {
	
	
	public static List<Row> getRows(int first, int pageSize,State state){
		List<Row> result = new ArrayList<Row>();
		Row idx;
		first +=1;
		for(int i = 0 ; i < pageSize; i++){
			//TODO: Query diferent datasource instead to generate mock data
			idx= new Row();
			idx.setId(i+first);
			idx.setName(" Task "+(i+first));
			idx.setState(state);
			result.add(idx);
		}
		return result;
	}
	
	
}
