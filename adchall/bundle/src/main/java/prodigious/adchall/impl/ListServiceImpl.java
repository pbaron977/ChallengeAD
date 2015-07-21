package prodigious.adchall.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.List;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;

import prodigious.adchall.ListService;


@Service(value = ListService.class)
@Component(immediate = true)
public class ListServiceImpl implements ListService {
	
	private static final String CMD="GETTASK:ALL";

	public List<String> getTasks(int first,int size) {
		try {
			Socket socket=new Socket("192.168.0.26",9090);
			BufferedReader in=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			PrintWriter out=new PrintWriter(socket.getOutputStream(),true);
			out.println(CMD);
			String tasks=in.readLine();
			in.close();
			out.close();
			socket.close();
			List<String> data=Arrays.asList(tasks.split(";"));
			int initial=first*size;
			if(size<0){
				return data;
			}
			return data.subList(initial, initial+size);
		} catch (UnknownHostException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
