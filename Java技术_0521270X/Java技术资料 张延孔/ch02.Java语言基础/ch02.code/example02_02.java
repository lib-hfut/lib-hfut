//简单类型强制转换
public class example02_02{
  public static void main (String args[ ]){
    int c=2200;
    long d=8000;
    float f;
    double g=123456789.123456789;
    c=(int)d;
    f=(float)g;   //导致精度的损失.
    System.out.println("c=  "+c);
    System.out.println("d=  "+d);
    System.out.println("f=  "+f);
    System.out.println("g=  "+g);
    
    int a=1, b=2;
	System.out.println(a+++b); 
  }
}
