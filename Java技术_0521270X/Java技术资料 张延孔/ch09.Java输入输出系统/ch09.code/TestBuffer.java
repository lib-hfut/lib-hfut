//文件流的嵌套使用
//程序<-BufferedReader<-FileReader<-文件（信息源）
//程序->BufferedWriter->FileWriter->文件（信息去向）
//未考虑异常处理
import java.io.*;
public class TestBuffer {
  public static void main(String[] args)throws Exception{

      BufferedReader br = new BufferedReader(
                          new FileReader("E:/source.txt"));
      BufferedWriter bw = new BufferedWriter(
                          new FileWriter("E:/dest.txt"));
      String s = null;
      
      //按行从信息源文件中读取信息，打印显示
      while((s=br.readLine())!=null){
          System.out.println(s);
      }
      
	    //生成随机数，按行写入到信息去向文件中
      for(int i=1;i<=100;i++){
        s = String.valueOf(Math.random());
        bw.write(s);
        bw.newLine();
      }
      
      bw.flush();
      bw.close();  //用完要关闭
      br.close();  //用完要关闭
  } 
}
