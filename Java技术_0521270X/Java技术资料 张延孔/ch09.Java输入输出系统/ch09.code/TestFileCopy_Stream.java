//以字节流方式，将一个文件中的信息复制到另一个文件
//读入：程序<-FileInputStream<-文件（信息源）
//写出：程序->FileOutputStream->文件（信息去向）
//未考虑异常处理
import java.io.*;
public class TestFileCopy_Stream {
  public static void main(String[] args)throws Exception {
	  int b = 0;
	  FileInputStream in = null;
	  FileOutputStream out = null;

	  //数据源，用于向程序中读取信息
	  in = new FileInputStream("e://source.txt");
	  //目标文件，程序将信息写到此文件中，会自动创建文件
	  out = new FileOutputStream("e://dest.txt");
	  while((b=in.read())!=-1){//一次读一个字节,判断是否读到文件结尾
	      out.write(b);//一次写一个字节
	  }
	  in.close(); 
	  out.close();

	  System.out.println("文件已复制");
  }
}