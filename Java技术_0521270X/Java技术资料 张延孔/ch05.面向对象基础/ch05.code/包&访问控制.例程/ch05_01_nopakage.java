//ch05_01_nopakage.java  说明类的定义、产生对象、final和static属性
//创建一个新人物
//package MyLib; //测试打包的效果

class People {
	private String name, address;
	//final int age = 16;       //说明Final 属性
	//static String Nationality = "jap" ;    //说明static属性
	
	public People(){
		name = ""; 
		address = ""; 
	}
	
	public void  setinfo(String newname, String newaddress){
		name = newname; 
		address = newaddress; 
	}
	
	public  String toString(){
		return "["+ name + ", " + address + "]";
	}
}

public class ch05_01_nopakage{
	public static void main(String args[]){
		People someguy=new People();
		someguy.setinfo( "鸣人", "木叶" );		
		System.out.println(someguy.toString());
	//	someguy.age = 17;	 //说明Final 属性
	//	System.out.println(People.Nationality);	//说明static属性,用类名访问	
	} 
}