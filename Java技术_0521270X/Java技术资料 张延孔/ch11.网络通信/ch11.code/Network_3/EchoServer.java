//Network_3，C/S通信服务器端，接收字符串并显示
import java.net.*;
import java.io.*;

public class EchoServer {

  public static void main(String[] args) throws IOException {

    ServerSocket serverSocket = null;
    PrintWriter out = null;
    BufferedReader in = null;

    try {
      serverSocket = new ServerSocket(80);
    } catch (IOException e) {
       System.err.println("Could not listen on port: 80.");
       System.exit(1);
    }

    Socket clientSocket = null;

    try {
        clientSocket = serverSocket.accept();
        out = new PrintWriter(clientSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    } catch (IOException e) {
        System.err.println("Accept failed.");
        System.exit(1);
    }


    String fromUser;
    int strlen;

    while (true) {
        fromUser= in.readLine();
        strlen=fromUser.length();
        out.println("received string's length is: "+ strlen);
		System.out.println("Server: received string's length is: "+ strlen);
        if(fromUser.equalsIgnoreCase("Bye"))
          break;
    }

    out.close();
    in.close();
    clientSocket.close();
    serverSocket.close();
  }
}
