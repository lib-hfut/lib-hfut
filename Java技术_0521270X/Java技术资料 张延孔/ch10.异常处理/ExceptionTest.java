import java.util.Scanner;
public class ExceptionTest{
	public static void main(String args[]){		
		int a[]={0,1,2},sum=0;
		int m =1,n;
		/*
		m = Integer.parseInt(args[0]);
		Scanner input = new Scanner(System.in);
		System.out.println("请输入两个数 ： ");
		m = input.nextInt();
		n = input.nextInt();
		System.out.println(m);
		System.out.println(n);		
		*/
		try{		
			for (int i=0;i<3;i++){
				sum+=a[i];
			}
			n = sum/m;
			throw new Exception("抛着玩！");
		}catch( ArrayIndexOutOfBoundsException e ){
			e.printStackTrace();
		}catch (ArithmeticException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println("出错啦！");			
		}finally{
		} 	
	}
}