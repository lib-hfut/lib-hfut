//输入字符串、浮点数、整数在屏幕上显示输入结果
//输入流的套接使用，   
//System.in -> InputStreamReader -> BufferedReader
import  java.io.*;
public  class standardIO3{
    public static void main(String[] args) throws IOException{
        //使用System.in创建InputStreamReader类对象ii
        InputStreamReader iin=new InputStreamReader(System.in);
        //创建BufferedReader类对象bin，并关联到iin
        BufferedReader bin=new BufferedReader(iin);
        
        //或者合并写成如下
        //BufferedReader stdin= new BufferedReader( new InputStreamReader(System.in));

        String  s;
        float   f;
        int i=0;

        System.out.println("输入任一字符串");
        s=bin.readLine();
        System.out.println("输入浮点数");
        f=Float.parseFloat(bin.readLine());
        System.out.println("输入整数");
        i=Integer.parseInt(bin.readLine());
        
        System.out.println("输入的字符串："+s);
        System.out.println("输入的浮点数："+f);
        System.out.println("输入的整数："+i);
    }
} 