//从命令行读入参数，写出到文件中保存
import java.io.*;
public class FileIO2_write{
    public static void main(String args[])throws IOException{
       int ch;
       //创建InputStreamReader对象iin，用系统方法System.in
       InputStreamReader iin=new InputStreamReader(System.in);
       //创建BufferedReader对象bin，关联到InputStreamReader对象iin上
       BufferedReader bin=new BufferedReader(iin);
       //创建File对象，并打开文件，作为写出数据的最终目标
       File file1=new File("c:\\dataInFile.txt");
       
       //必须进行异常处理
       try {
       	  //创建文件输出流对象，关联到 文件对象file1上
       	  FileOutputStream fout=new FileOutputStream(file1);
       	  //创建数据输出流对象，关联到 文件输出流fout上 
          DataOutputStream dout=new DataOutputStream(fout);
          
          System.out.println("输入整数 ");
          int i=Integer.parseInt(bin.readLine());
          System.out.println("输入浮点数 ");
          float f=Float.parseFloat(bin.readLine());
          System.out.println("输入布尔量 True or False ");
          boolean b=new Boolean(bin.readLine()).booleanValue();
          
          //将读入的变量写入到数据输出流对象dout中
          System.out.println("输入结果在c:\\dataInFile.txt文件中 ");
          dout.writeInt(i);
          dout.writeFloat(f);
          dout.writeBoolean(b);
          dout.close();
       }
       catch(FileNotFoundException e)
          {  System.out.println(e); }
       catch(IOException e)
          {  System.out.println(e); }
   }
}