//  定义一个学生档案类，包括学生姓名、性别和所在学校
//  使用static修饰成员变量
class Student { 
    String name;
    String  sex;
    static String school="合肥工业大学";    
}
public class Test_Student { 
    public static void main(String args[]) {
        Student stu1=new Student();
        Student stu2=new Student();
        stu1.name="李明 ";
        stu1.sex="男 ";
        stu2.name="张敏 ";
        stu2.sex="女";
        //对类成员变量赋值
        stu1.school="安徽大学";  
        System.out.println(stu1.name+"  "+stu1.sex+"  "+stu1.school);
        System.out.println(stu2.name+"  "+stu2.sex+"  "+stu2.school);
    }    
}
