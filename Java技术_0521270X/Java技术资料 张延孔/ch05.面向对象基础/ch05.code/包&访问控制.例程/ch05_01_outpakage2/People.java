//People.java  定义People类
package  MyLib; //打包到MyLib

public class People {
	//private 
	       String name, address;
   
	public People(){
		name = "";   address = ""; 
	}	
	public void  setinfo(String newname, String newaddress){
		name = newname; 
		address = newaddress; 
	}
	public  String toString(){
		return "["+ name + ", " + address + "]";
	}
}