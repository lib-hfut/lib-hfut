//BreakOp2.WithLabel
//使用带标号break语句退出循环嵌套
package chapter3;

      public class example03_11 {
        public static void main(String args[]){
outer:    for(int i=0;i<3;i++) {
            System.out.print("Pass "+i+": ");
            for (int j=0;j<100;j++) {
              if (j==10) break outer;
              System.out.print(j+" ");
            }
            System.out.println("This will not print");
          }
          System.out.println("\nLoops complete.");
        }
      }