// 如何将没有设计构造函数的类添加构造函数
// 研究带有构造函数的类与没有构造函数的类之间的区别 
class   People {  //定义 People 类     
     String name, address;   
     public void  setInfo(String newname, String newaddress){
      	name = newname; address = newaddress; 
     }
     public  String toString(){
         return "["+ name + ", " + address + "]";
     }
}
class   Student extends People {  //定义 Student 类     
        int grade;   
        //static tatic long sum=0; 
        public void setGrade(int newgrade){
           grade = newgrade; 
        }
        //public void  构造函数前不能加
	 //public Student(){}
 	//public Student(String newname, String newaddress, int newgrade){
	 //name = newname; address = newaddress; grade = newgrade; 
 //      }
}
public class ch05_Student {  
       public static void main(String args[] ) {
           Student zhang=new Student();               //创建Student类的对象
           zhang.setInfo ("张三", "屯溪路");
           zhang.setGrade(2);
//	   Student zhang = new Student("张三", "屯溪路", 3); 
         System.out.println (zhang.name + zhang.address + zhang.grade);
       }    
}