//ch05_BetweenPackage2.java
//说明类的继承，访问控制符，跨包访问。打包到MyApp
package MyApp;  

import MyLib.People;//必须加上才能访问MyLib包内的People类

public class ch05_BetweenPackage2{
	public static void main(String args[]){
		People someguy=new People();
		someguy.setinfo( "Jame", "SUN" );
	//	People someguy=new Student();
	//	someguy.setinfo( "Jame", "SUN" );		
	//	someguy.setGrade(3);
		System.out.println(someguy.showname());
	} 
}