//  定义多个同名方法， 实现的重载方法
//  这些方法具有相同的名称，但有不同的参数和不同的定义  
public class Test_Calculate {   
     public static int abs1(int x)   {//定义整数运算的方法
         int y;
         y=x;
         if (y<0) 
             y=-y+5;
         return y;         
     }   
     public static double abs1(double x)  {//定义双精数运算的方法
         double y;
         y=x;
         if (y<0)
             y=-y*2;
         return y;         
     }    
     public static void main(String args[] )  {
         int m=-25;
         double n=-8.27;
         System.out.println("m="+m+"   "+abs1(m));
         System.out.println("n="+n+"   "+abs1(n));
     }
}
