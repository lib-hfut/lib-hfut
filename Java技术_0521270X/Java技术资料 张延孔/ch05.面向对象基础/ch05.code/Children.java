//对父类中的public方法设置final 属性，禁止子类继承父类中定义的方法
// 为系统安全考虑 防止父类方法被非法覆盖
//本程序中父类定义的sum()方法具有final属性，子类不准许定义与sum同名方法
class  mother{ 
     int x=100,y=20;
     public  final void sum(){ 
         int s;   s=x+y;  
         System.out.println(" s="+s ); }
 }
 public class  Children extends mother {
     int m=20, n=30;
     public void sum(){
         int f;
         f=m+n;
         System.out.println(" f="+f ); }    
     public static void main(String args[]){
         Children aa=new Children();
         aa.sum();  }
  }
