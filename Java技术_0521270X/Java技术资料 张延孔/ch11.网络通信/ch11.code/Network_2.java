//URLConnectionReader
// π”√BufferedReader°¢URL∫ÕURLConnection
import java.net.*;
import java.io.*;

public class  Network_2{
    public static void main(String[] args) throws Exception{
        URL duniang = new URL("http://www.baidu.com");
        URLConnection yc = duniang.openConnection();
        BufferedReader in = new BufferedReader( new InputStreamReader( yc.getInputStream()	) );
        String inputLine;

        while ((inputLine = in.readLine()) != null) 
            System.out.println(inputLine);
        in.close();
    }
}