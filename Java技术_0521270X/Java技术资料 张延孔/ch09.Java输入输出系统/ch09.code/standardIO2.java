//基本IO standardIO2.java
//从命令行读入字符串，并处理和显示
//输入流的套接使用   
//System.in -> InputStreamReader -> BufferedReader
import java.io.*;
public class standardIO2{
    public static void main(String[] args) throws IOException {//IO操作必须捕获IO异常
            //使用System.in创建InputStreamReader类对象iin
      	    InputStreamReader iin = new InputStreamReader(System.in);
      	    
      	    //创建BufferedReader类对象stdin，并关联到iin
      	    BufferedReader stdin=new BufferedReader(iin);
      	    //BufferedReader stdin=new BufferedReader(new InputStreamReader(System.in));
      	    
            //按行读取字符串
      	    System.out.println("请输入字符串: ");
      	    System.out.println(stdin.readLine());
      	    
            //读取字符串并转换成double类型数据输出
      	    System.out.println("请输入浮点数: ");
      	    
            //将字符串解析为带符号的double类型数据
      	    double number2=Double.parseDouble(stdin.readLine());
      	    //int i=Integer.parseInt(stdin.readLine());
      	    
      	    System.out.println(number2);
      	    stdin.close();
    }
}