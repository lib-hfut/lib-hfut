//abstract class USB{
interface USB{
	//声明两个方法
	//开始工作
	abstract void start();
	//停止工作
	abstract void stop();
	//int a; //报错，接口中变量是static和final的，需要初始化。且不能是private的。
	}

/*另一个接口，用于实验
interface Bluetooth{
      //进行蓝牙连接
	abstract void connect();
	//断开蓝牙连接
	abstract void disconnect();
	}
*/

class MobilePhone implements USB{
//class MobilePhone implements USB, Bluetooth{ //实验，一个类实现多个接口
	public void start(){
		System.out.println("手机,USB开始工作！");
	}
	public void stop(){
		System.out.println("手机,USB停止工作！");
	}
}

//编写相机类，并实现USB接口
//当一个类实现了一个接口，就要求实现接口内的所有方法
class Camera implements USB{
	public void start(){
		System.out.println("相机,USB开始工作！");
	}
	public void stop(){
		System.out.println("相机,USB停止工作！");
	}
}

class Computer{
	public void UseUSB(USB usb){
		usb.start();
		usb.stop();
	}
}

public class TestInterface {
	public static void main(String [] args){
		 Computer pc = new  Computer();
		 Camera DC = new Camera();
		 MobilePhone phone = new MobilePhone();
		 pc.UseUSB(phone);
		 pc.UseUSB(DC);
	}
}
