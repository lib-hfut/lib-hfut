//ch05_BetweenPackage1.java  说明访问一个包内的类需要import
//创建一个新人物
import MyLib.People;   //必须加上才能访问MyLib包内的People类

public class ch05_BetweenPackage1{
	public static void main(String args[]){
		People someguy=new People();
		someguy.setinfo( "jame", "SUN" );		
		System.out.println(someguy.showname());
	} 
}