//ContinueOp2.WithLabel
//使用带标号continue语句继续外循环
//绘制直角三角形
       package chapter3;

       public class example03_12 {
         public static void main(String args[]){
outer: 	   for (int i=0; i<10; i++) {
		     for (int j=0; j<20; j++){
			   if (j>i) {
				  System.out.println();
				  continue outer;
			   }
			   System.out.print("*  ");
			 }
		   }
         }
       }