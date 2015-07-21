package server.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;

public class Server {

	public final static String SEPARATOR=";";

	public static void main(String[] args) throws IOException {
		ServerSocket listener = new ServerSocket(9090);
		try {
			while (true) {
				System.out.println("listening");
				Socket socket = listener.accept();
				try {
					BufferedReader bf=new BufferedReader(
							new InputStreamReader(socket.getInputStream()));
					System.out.println("Request Recieved:..Processing   "+bf.readLine());
					PrintWriter pw=new PrintWriter(socket.getOutputStream(),true);
					pw.println(getTasks());
					System.out.println("request finished");
					bf.close();
					pw.close();
				} finally {
					socket.close();
				}
			}
		}
		finally {
			listener.close();
		}
	}
	
	private static String getTasks() throws IOException{
		Properties prop=new Properties();
		prop.load(new FileReader(new File("/Users/juasepul/Desktop/challenge/ChallengeAD/Server/data/data.txt")));
		int taskNum=Integer.parseInt(prop.getProperty("taskNum"));
		String preffix=prop.getProperty("taskPref");
		String tasks="";
		for(int i=1;i<taskNum;i++){
			tasks+=i+" "+preffix+" "+i+SEPARATOR;
		}
		tasks+=taskNum+" "+preffix+" "+taskNum;
		return tasks;
	}
}
