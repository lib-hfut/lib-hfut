import java.io.*;
import java.net.*;

public class FileClient {
  int i;
  static String iaddr;
  static int port;
  static String infilename;
  
  public FileClient() {
     try{
         //建立连接，接服务器端端口
         Socket socket=new Socket(InetAddress.getByName(iaddr),port);
         DataOutputStream outstream = new DataOutputStream(socket.getOutputStream());

         //传输文件内容
         FileInputStream fis = new FileInputStream(infilename);
         while((i=fis.read()) !=-1)
              outstream.writeInt(i);
         outstream.writeInt(i);

         System.out.println("Data sent to internet successfully!");
         socket.close(); 
      }

      catch(IOException e){
         System.out.println(e.getMessage()); 
      }
  }

  public static void main(String args[]) {
      if (args.length < 3){
         System.out.println("USAGE: java FileClient [iaddr] [port] [infilename]");	
         System.exit(1);
      }

      iaddr = args[0];
      port=Integer.parseInt(args[1]);
      infilename = args[2];
      FileClient ClientStart=new FileClient();
  }
}
