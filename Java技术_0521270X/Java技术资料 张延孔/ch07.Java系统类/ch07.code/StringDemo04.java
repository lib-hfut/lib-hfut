public class StringDemo04{
	public static void main(String args[]){
		String str1 = "hello" ;					// 直接赋值
		String str2 = new String("hello") ;		// 通过new赋值
		String str3 = str2 ;					// 传递引用
		System.out.println("str1 == str2 --> " + (str1==str2)) ;	// false
		System.out.println("str1 == str3 --> " + (str1==str3)) ;	// false
		System.out.println("str2 == str3 --> " + (str2==str3)) ;	// true
	}
};