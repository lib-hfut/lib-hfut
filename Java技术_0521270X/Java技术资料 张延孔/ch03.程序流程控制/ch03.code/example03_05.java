//WhileOp
//ÓÃwhileÓï¾ä¼ÆËã10µÄ½×³Ë
package chapter3;

public class example03_05{
  public static void main(String args[]){
    int n=10;
    long result=1;
    while(n>=1)
      result*=n--;
    System.out.println("10!="+result);
  }
}