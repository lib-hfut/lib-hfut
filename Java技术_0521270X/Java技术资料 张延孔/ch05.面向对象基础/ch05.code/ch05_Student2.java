//采用构造方法实现上述功能,研究带有构造器的类与没有构造器的类之间的区别
class Student{   //定义 Student 类
    static long sum=0; 
    String name;
    String address;
    String grade;
    static int score;
    public   static long collect(){  //定义类的方法
        sum+=score;
        return sum;
    }
    Student(String x1,String x2,String x3,int y) {
        name=x1;
        address=x2;
        grade=x3;
        score=y;
    }
}
public class ch05_Student2 { 
    public static void main(String args[]) {
        Student zhang;
        zhang=new Student("张三","屯溪路", "计算机学院",90);             
        zhang.collect();
        
        Student wang=new Student("王五","屯溪路","计算机学院",85);            
        System.out.println(zhang.name+zhang.address+zhang.grade);
        System.out.println(wang.name + wang.address+wang.grade);
        System.out.println( "总成绩是 "+ wang.collect());
    }
}