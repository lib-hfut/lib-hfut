//ex02.java 说明类的继承 访问控制符
package MyApp;  //打包到MyApp

import MyLib.People;  //必须加上才能访问MyLib包内的People类

public class ch05_01_outpakage2{
	public static void main(String args[]){
		People someguy=new People();
		someguy.setinfo( "鸣人", "木叶" );
	//	People someguy=new Student();
	//	someguy.setinfo( "鸣人", "木叶" );		
	//	someguy.setGrade(3);
		System.out.println(someguy.toString());
	} 
}