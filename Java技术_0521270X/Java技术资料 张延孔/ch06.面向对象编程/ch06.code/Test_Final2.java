// 定义final成员属性   
class Calculate {
    private double r;
    final double PI=3.14159;
    void area(double r) {
       double x;
       x=PI*r*r;
       System.out.println("Area=" + x);
    }   
}
public class Test_Final2{ 
    public static void main(String args[]) {
       Calculate   cal = new Calculate();      
       cal.area(12.3);
    }    
}
