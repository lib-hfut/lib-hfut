//Test_SayHI.java  说明接口的定义
//定义接口
interface SayHI {
	void SayHI();
}

//定义类Chinese实现SayHI接口
class Chinese implements SayHI {
	public  void SayHI() { 
	     System.out.println("中国人习惯问候语：你好，吃饭了吗？ ");
    }
}

//定义类English实现SayHI接口
class English implements SayHI {
	public  void SayHI() {
		 System.out.println("英国人习惯问候语：你好，天气不错 ");
    }
}

//主类
public class Test_SayHI{
	public static void main(String args[]) {
		 SayHI someguy;

		 Chinese Jet = new Chinese();
		 Jet.SayHI(); 		 		 
		 //someguy = new Chinese();
		 //someguy.SayHI();
		 
		 English Beckham = new English();
		 Beckham.SayHI(); 
    }
}
