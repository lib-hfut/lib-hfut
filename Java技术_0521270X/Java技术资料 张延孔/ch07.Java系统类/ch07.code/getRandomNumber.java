//方法一import java.lang.Math;
/*方法二
 * 在java.util这个包里面提供了一个Random的类，可以新建一个Random的对象来产生随机数.
 * 可以产生随机整数、随机float、随机double，随机long，在j2me的程序里经常用的一个取随机数的方法
 **/
 //import java.util.Random;

public class getRandomNumber{
	public static void main(String args[]){
/*
 		//方法一，
		double a = Math.random();
		double b = Math.random();
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		//返回0~2间整数
		for (int i=0; i<10; i++) {
			int c =(int)(Math.floor((Math.random()*10)%3));//返回最接近整数
			System.out.println(c);
		}		
	}
*/	
		//方法二，无种子，返回值不定	
		java.util.Random r1=new java.util.Random(); 
		for(int i=0;i<1;i++){ 
			System.out.println("有种："+ r1.nextInt());
		}
		//方法二,有种子，返回值一定
		java.util.Random r2=new java.util.Random(10);
		for(int i=0;i<1;i++){
			System.out.println("无种："+ r2.nextInt());
		}
	}
}