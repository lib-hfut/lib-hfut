//本程序需要从命令行输入若干字符串参数，然后输出
package chapter4;
public class example04_05 {
  public static void main(String args[] ){
    int i;
    for (i=0;i<args.length;i++)        
      System.out.println( args[i]);
  }
} 
