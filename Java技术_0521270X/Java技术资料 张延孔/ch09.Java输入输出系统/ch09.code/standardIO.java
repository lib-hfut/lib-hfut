//从键盘输入字符，然后在屏幕上显示输入结果
import  java.io.*;
public  class standardIO{
    public static void main(String[] args)
                       throws IOException{//IO操作必须捕获IO异常
    char c;
    System.out.println("输入任一字符 ");
    c=(char)System.in.read();
    System.out.println("输入的字符是 ："+c);
    }
} 
