public class TestString1 {
	public static void main(String [] args) {
		 //字符数组构建字符串
		char c[] = {'s', 'u', 'n', ' ', 'j', 'a', 'v', 'a'} ;
		String s1 = new String(c) ;
		String s2 = new String(c, 4, 4) ;
		//System.out.println(s1) ; // sun java
		//System.out.println(s2) ; // java
		
		//字符串比较
		String s3 = "hello"; 
		String s4 = "world";
		//String s5 = "hello";
		//System.out.println((s3 == s5)); //true
		//String s6 = new String ("hello");
		//String s7 = new String ("hello");
		//System.out.println("s6 == s7 is  "+ (s6 == s7)); //false
		//System.out.println("s6 equals s7 is "+ s1.equals(s2)); //true
		
	  //String的方法
	  //System.out.println(s3.charAt(2)); //e
		//System.out.println(s3.equalsIgnoreCase("Hello")); //忽略大小写

		String s8 = "我 coding Java 程序！";
		//System.out.println(s8.indexOf("Java"));//匹配子串，12
		//System.out.println(s8.indexOf("java"));//匹配子串，-1			
		//System.out.println(s8.replace('我', '你')); //字符替换
		System.out.println(s8.substring(0, 3)); //取子串"我 c"
		//trim可去除开头和结尾的空格    					
		//valueOf可将基本数据类型转变为字符串
	}
}