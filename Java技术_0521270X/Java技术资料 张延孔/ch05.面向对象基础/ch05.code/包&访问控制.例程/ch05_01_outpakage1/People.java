//People.java  ∂®“ÂPeople¿‡
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
	public  String toString(){
		return "["+ name + ", " + address + "]";
	}
}