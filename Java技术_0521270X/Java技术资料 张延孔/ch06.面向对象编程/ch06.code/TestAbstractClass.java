//抽象类的例子
abstract class Animal {
	String name;
	int age;
	//动物会叫
	abstract public void cry();
	//错误abstract public void cry(){};
}

//当一个类继承的父类是抽象类的话，需要把抽象类中的所有抽象方法实现
//“实现”是指有方法体
class Cat extends Animal{
	public void cry(){
		System.out.println("喵喵...");
	}
}

class Dog extends Animal{
	public void cry(){
		System.out.println("汪汪...");
	}
}

//主类
public class TestAbstractClass{
	public static void main(String [] args){
		//Animal one = new Animal();
		Animal one = new Cat();
		one.cry();
	}
}