//Student.java 
//定义Student类,打包到MyLib 
package  MyLib;  

public class Student extends People { 
  
  int grade; //年级
    
  public void setGrade(int newgrade){
      grade = newgrade; //赋值
  }
  public  String showwname(){
	  return "["+ name + ", " + address + ", " + grade + "]";
  }
}
