//命令行读入参数
//与例03_02的区别是if语句后面有花括号 
package chapter3;

 public class example03_02  {
  public static void main(String args[])  { 
    int  x,serial,y; 
    x=Integer.parseInt(args[0]);
    serial=Integer.parseInt(args[1]);
    if(x>50){
       y=x*serial;
       System.out.println("y= "+y);
    }  
  }         
} 
