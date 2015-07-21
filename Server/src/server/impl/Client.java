package server.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {

	public static void main(String[] args) throws IOException {
		try {
			System.out.println("socket");
			Socket socket=new Socket("10.68.2.145",9090);
			BufferedReader in=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			PrintWriter out=new PrintWriter(socket.getOutputStream(),true);
			out.println("xx");
			System.out.println("xx");
			String tasks=in.readLine();
			System.out.println(tasks);
			in.close();
			out.close();
			socket.close();
			System.out.println("closed");
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
