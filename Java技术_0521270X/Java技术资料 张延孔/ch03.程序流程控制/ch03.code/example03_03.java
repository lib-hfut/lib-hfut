//NumberCompare
//给出任意三个数，通过使用if语句嵌套，将它们
//按从小到大排序
//package chapter3;

import javax.swing.JOptionPane;

 public class example03_03 {
  public static void main(String args[]){
   String str;
   double x,y,z,t;
   str=JOptionPane.showInputDialog("请输入第一个数");
   x=Double.parseDouble(str);
   str=JOptionPane.showInputDialog("请输入第二个数");
   y=Double.parseDouble(str);
   str=JOptionPane.showInputDialog("请输入第三个数");
   z=Double.parseDouble(str);
   if (x>y){
      t=x; x=y; y=t;
      if (x>z){
         t=x; x=z; z=t;
      }      
   else
      if (y>z){
         t=y; y=z; z=t;}
      }  
      else
         if (x>z) {
            t=x;x=z;z=t;
            if (y>z) {
               t=y;y=z;z=t;
            } 
         }
   if (y>z) {
      t=y;y=z;z=t;
   } 
   System.out.println("最小值＝"+x);
   System.out.println("中间值＝"+y);
   System.out.println("最大值＝"+z);
   System.exit(0);
  }
}