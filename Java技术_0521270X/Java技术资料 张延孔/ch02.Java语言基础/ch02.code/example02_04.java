//通过对给定常数进行大小比较，将比较结果作为逻辑值输出
public class example02_04 {
  public static void main(String args[]){
    int x=15;
    int y=7;
    boolean c=(x>y);
    boolean d=((float)x/y==(double)x/y);
    System.out.println("c="+c);
    System.out.println("d="+d);
  }
}