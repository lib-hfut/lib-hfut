//数组参数
//展示数组元素参数传递值的方法
package chapter4;

public class example04_08 {
  public static void main (String args[] ) {
     int c[]={1,10,100,1000};
     int j;
     System.out.println ("调用arrayMultiply方法前的数组C");
        for(j=0;j<c.length;j++)                
        System.out.print( c[j]+"  "); 
        System.out.println();
        elementMultiply(c[2]);
        System.out.println ("\n调用arrayMultiply方法后的数组C"); 
        for (j=0;j<c.length;j++)
           System.out.print( c[j]+"  "); 
           System.out.println();
        }
     static void  elementMultiply(int d) {
        d=2*d;
        System.out.println( "\nd="+d);        
     }
}  
