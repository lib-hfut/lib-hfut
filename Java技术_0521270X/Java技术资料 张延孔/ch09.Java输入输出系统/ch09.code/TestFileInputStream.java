//使用FileInputStream从文件中读取字节流
//未考虑异常处理
import java.io.*;
public class TestFileInputStream {
  public static void main(String[] args) throws Exception{
    int b = 0;
    long num = 0;
    FileInputStream in = new FileInputStream("c://source.txt");//或"c:/source.txt"
      while((b=in.read())!=-1){//一次读一个字节,判断是否读到文件结尾
        System.out.print((char)b); 
        num++;
      }
      in.close();  
      System.out.println("\n共读取了 "+num+" 个字节");                              
    }
  }