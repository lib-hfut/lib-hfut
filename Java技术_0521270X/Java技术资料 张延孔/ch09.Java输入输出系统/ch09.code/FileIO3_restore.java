//以字符流的方式复制文件内容。将c:\\source.txt数据备份到dest.txt中
//读入内存：内存<-BufferedReader<-FileReader<-信息源文件
//写文件：  内存->BufferedWriter->FileWriter->目标文件
import java.io.*;
public class FileIO3_restore {
   public static void main(String args[])throws IOException{
       FileReader fr1=new FileReader("c:\\source.txt");
       BufferedReader br1=new BufferedReader(fr1);      
       BufferedWriter bw1=new BufferedWriter(new FileWriter("c:/dest.txt"));
       int lineNum=0;
       String s;
       System.out.println("输入文件是：c:\\source.txt\n输出文件是：c:\\dest.txt");
       s=br1.readLine();
       while(s!=null)    {
         lineNum++;
         bw1.write(String.valueOf(lineNum));
         bw1.write(":    ");
         bw1.write(s);
         bw1.newLine();
         s=br1.readLine();
        }
       bw1.close();
   }
}