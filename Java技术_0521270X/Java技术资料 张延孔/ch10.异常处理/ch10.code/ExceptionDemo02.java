//捕获算术异常  try、catch、finally
public class ExceptionDemo02{
  public static void main(String args[]){
  					 //尽量不要写throws ArithmeticException  { 
    try {
       int  x,y;
       x=15;
       y=0;
       System.out.println("x/y="+x/y);
       System.out.println(" Computing  successfully!");
    }
    catch(ArithmeticException e) {
       System.out.println(" 捕获 ArithmeticException !");
       System.out.println(" 异常信息:  " + e.toString());
    }
    finally {
        System.out.println("善后处理  !");
    }
  }
}
