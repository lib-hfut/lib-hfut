//URLReader.java
//使用BufferedReader和URL
//URL--  InputStreamReader--BufferedReader -- Program
import java.net.*;
import java.io.*;

public class Network_1{
    public static void main(String[] args) throws Exception{
		URL duniang = new URL("http://www.baidu.com");
		InputStreamReader isr = new InputStreamReader(duniang.openStream());
		BufferedReader in = new BufferedReader( isr );
	
		//也可合并编写
		//BufferedReader in = new BufferedReader( new InputStreamReader( hfut.openStream()) );
		
		String inputLine;
		//打印输出HTML
		while ((inputLine = in.readLine()) != null)
		    System.out.println(inputLine);
		//关闭缓冲区
		in.close();
    }
}