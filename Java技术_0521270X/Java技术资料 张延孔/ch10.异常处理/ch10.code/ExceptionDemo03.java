//在自己编写的方法中主动抛出异常
// 方法本身不对异常捕获和处理，而由调用它的方法去处理
class MyMath{
	public int div (int i, int j)  throws Exception {//或ArithmeticException
		return (i / j) ;
	}
}
//主类
public class ExceptionDemo03{
	public static void main(String args[]){
		MyMath m = new MyMath() ;
		try{
			int temp = m.div(10, 0) ;
			System.out.println(temp) ;
		}catch (Exception e){
			System.out.println("捕获 除数为零异常") ;
		//e.printStackTrace(); // 打印异常
		}
    //throw new Exception("抛着玩的。") ;	// 人为抛出
	}
}
