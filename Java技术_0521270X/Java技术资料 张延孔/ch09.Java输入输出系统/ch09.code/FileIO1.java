//将文件c:\\newfile.txt中保存的信息输入到屏幕 
import java.io.*;
public class FileIO1 {
    public static void main(String args[])throws IOException    {
        int ch;
        //建立文件对象，打开一个文件
        File file1=new File("c:\\file.txt");
        
        //必须进行异常处理
        try{
           //建立文件输入流，并关联到已经建立的文件对象
           FileInputStream fin=new FileInputStream(file1);
           //打印说明信息
           System.out.println("newfile.txt文件中的信息为： ");
           //读入第一个字符
           ch=fin.read();
           //判断，若不到文件尾，就循环一次取一个字符打印出来
           while(ch!=-1){
       	       System.out.print((char)ch);
               ch=fin.read();
           }
           //用完文件输入流后必须关闭
           fin.close();
        }
        catch(FileNotFoundException e)
           { System.out.println(e);  }
        catch(IOException e)
           { System.out.println(e);  }
    }
}