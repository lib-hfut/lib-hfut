//触发多种异常
//try-catch的使用
import java.util.Scanner;
public class ExceptionTest{
	public static void main(String args[]) {
	int a[]={1,2,3},sum=0;
 	int m = 0, n = 0 ;
	try{			
        	for(int i=0; i<=3; i++) // i<=3 数组下标越界
            	sum += a[i];
        		System.out.println("sum= "+ sum + "\n Successfully!");	
		/* //从命令行启动程序时读入参数，测试除数为零异常
			m = Integer.parseInt(args[0]) ;
			n = Integer.parseInt(args[1]) ;
			System.out.println("计算结果：" + (m / n)) ;
		*/	
		/* //用Scanner命令行读入数据
			Scanner input = new Scanner(System.in);
	 		System.out.print("Enter two integers: ");
			m = input.nextInt();
			n = input.nextInt();
			System.out.println("计算结果：" + (m / n)) ;
		*/
			//throw new Exception("抛着玩的。") ;	// 人为抛出		
		}catch( ArrayIndexOutOfBoundsException e){
			System.out.println("输入的参数个数不对：" + e) ;
			//e.printStackTrace();
		}catch( ArithmeticException e){
			System.out.println("出现了数学异常：" + e) ;
		}catch( NumberFormatException e){
			System.out.println("输入的不是数字：" + e) ;		
		}catch(Exception e){ //最后处理"最大"的异常
			System.out.println("其他异常：" + e) ;
		}finally{
			// System.out.println("不管是否有异常，我都执行") ;
		}
	}
}