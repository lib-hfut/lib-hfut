//Student.java  定义Student类
package  MyLib;  //打包到MyLib

public class Student extends People { 
//定义 Student 类     
  int grade; //年级
    
  public void setGrade(int newgrade){
      grade = newgrade; //赋值
  }
  public  String toString(){
	  return "["+ name + ", " + address + ", " + grade + "]";
  }
}
