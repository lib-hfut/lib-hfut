//ch05_01_nopakage.java  说明类的定义、产生对象、final和static属性
//创建一个新人物
//import MyLib.People;   //必须加上才能访问MyLib包内的People类

public class ch05_01_outpakage1{
	public static void main(String args[]){
		People someguy=new People();
		someguy.setinfo( "鸣人", "木叶" );		
		System.out.println(someguy.toString());
	} 
}