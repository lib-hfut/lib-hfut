//ContinueOp1.withoutLabel
//使用continue语句终止当前循环
package chapter3;

public class example03_10{
  public static void main(String args[]){
    int n;
  	for(n=1;n<=10;n++){
      if (n%2==0) continue;
        System.out.println("n="+n);
    }
  }
}