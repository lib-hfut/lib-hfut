//ch05_01 private.vs.public
//引用私有方法和修改私有成员变量
class def05_01{
  private int x,y,z=0;
  private void method1(){
     int x=3,y=4,z;
     z=x*y;
     System.out.println("z="+z);  }
  public void show() {
     System.out.println("z="+z);  }
}
class ch05_01{
  public static void main(String args[]){
     def05_01 ss=new def05_01();
     ss.method1(); //调用私有方法出错
     ss.z=12;      //修改私有变量出错
     ss.show();
   }
}

/*
 //ch05_01b
 //引用公共方法和修改私有成员变量
class def {
    public int x,y,z=0;
    public void method1(){
       int x=3,y=4,z;
       z=x*y;
       System.out.println("z="+z);  }
    public void show() {
       System.out.println("z="+z);  }
 }
 class Change5_1b {
   public static void main(String args[]){
       int z=20;
       def ss=new def();
       ss.method1();
       ss.show();  }
 }

 */