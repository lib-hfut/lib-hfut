//以字符流的方式复制文件内容。将c:\\source.txt数据备份到dest.txt中
//读入内存：内存<-BufferedReader<-FileReader<-信息源文件
//写文件：  内存->BufferedWriter->FileWriter->目标文件
import java.io.*;
public class TestFileCopyException {
  public static void main(String args[]){
                                    //throws IOException{
    FileReader fr1;
    BufferedReader br1;
    FileWriter fw1;
    BufferedWriter bw1;
    String s;
    int lineNum=0;
    
    try {
 		fr1 = new FileReader("c:\\source.txt");
      	br1 = new BufferedReader(fr1);
      
		fw1 = new FileWriter("c:/dest.txt");      
		bw1 = new BufferedWriter(fw1);
		System.out.println("输入文件是：c:\\source.txt\n输出文件是：c:\\dest.txt");
      
      	s = br1.readLine();
      	while(s!=null){
	        lineNum++;
	        //bw1.write(String.valueOf(lineNum));//加行号
	        //bw1.write(":    ");
	        bw1.write(s);
	        bw1.newLine();
	        s = br1.readLine();
     	 }
        bw1.close();
  	  }  catch (FileNotFoundException e2) {
	    System.out.println("找不到指定文件"); System.exit(-1);
	  } catch (IOException e1) {
	    System.out.println("文件复制错误"); System.exit(-1);
	  } finally{
	  	//啥都不做
	  }
      System.out.println(lineNum);
   }
}