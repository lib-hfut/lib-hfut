//使用FileInputStream从文件中读取字节流
import java.io.*;
public class TestFileInputStream_Excption {
  public static void main(String[] args) {
    int b = 0;
    long num = 0;
    FileInputStream in = null;
    try {
      in = new FileInputStream("C:/io/TestFileInputStream.java");
      while((b=in.read())!=-1){//一次读一个字节,判断是否读到文件结尾
        System.out.print((char)b); 
        num++;
      }
      in.close();  
      System.out.println("\n共读取了 "+num+" 个字节");                              
                              
    } catch (FileNotFoundException e) {
      System.out.println("找不到指定文件"); 
      System.exit(-1);
    } catch (IOException e1) {
      System.out.println("文件读取错误"); 
      System.exit(-1);
    }
  }
}