//People.java  
//在MyLib包中 定义People类
package  MyLib;

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
	public  String showname(){
		return "["+ name + ", " + address + "]";
	}
}