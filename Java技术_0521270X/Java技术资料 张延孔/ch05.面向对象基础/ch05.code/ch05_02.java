//ch05_02
//定义类的protected 方法，通过创建对象来引用此方法 
class Max {
     private int x,y;
     protected int play(int s,int t) {
        int m;
        x=s;
        y=t;
        m=(x>y)?x/y:y/x;
        return  m;
     }   
}
public  class ch05_02 {
     public static void main(String args[]) {
        int result;
        Max ss=new Max();
        result=ss.play(5,45);     
        System.out.println(" result= "+result);
     }
}
