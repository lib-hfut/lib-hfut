//以字符流的方式从命令行读入多行字符
//并按行写入磁盘文件c:\\dataFile.txt中
//读信息：内存<-BufferedReader<-InputStreamReader<-命令行
//写文件：内存->BufferedWriter->FileWriter->目标文件
import java.io.*;

public class FileIO3_write{
    public static void main(String args[])throws IOException{
       String s;  //暂存字符串
       	
       //建立输入流	InputStreamReader 的对象iin
       InputStreamReader isr = new InputStreamReader(System.in);
       
       //建立缓冲BufferedReader对象br，关联到iin
       BufferedReader br = new BufferedReader(isr);
       
       //创建文件输出 FileWriter类对象fw1
       FileWriter fw = new FileWriter("e:\\dataFile.txt");
       
       //创建带缓冲的BufferedWriter类对象bw，并关联到fw1
       BufferedWriter bw = new BufferedWriter(fw);
              
       //将读入字符串写入到文件中
       System.out.println("将输入的字符串写入dataFile.txt文件");
       
       //循环读入字符串
       while(true){
       	
           System.out.println("输入一个字符串,以空行结束: ");
           //清空输出缓冲区
           System.out.flush();
           
           //读入输入的一行
           s = br.readLine();
           
           //若遇到空行则break,结束读-写工作
           if(s.length()==0)break;
           
           //将本行字符串写出到对象bw
           bw.write(s);
           
           //在对象bw中创建新行，为下一行输出做准备
           bw.newLine();           
       }
       //关闭输出对象
       br.close();
       bw.close();
       
    }
}