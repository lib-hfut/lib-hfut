//使用多态机制，创建对象和调用方法
public class MainClass {
	public static void main(String[] args){		
		//实例化一个Apple
		Apple apple = new Apple();
		//实例化一个Banana
		Banana banana = new Banana();
		apple.get();
		banana.get();
  }
}