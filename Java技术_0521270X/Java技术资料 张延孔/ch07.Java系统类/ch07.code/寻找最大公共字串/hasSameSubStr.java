/**
  * 比较两个字符串是否含有共同的子字符串
  * @return 比较结果
  * 思路先比较两个字符串的长度。取长度短的那个字符串A，长的为B 
  * 取A字符串的前两个字符（然后2和3,一次类推）
  * 到B中查找有没有，有返回TRUE，没有返回FALSE
  */

public class hasSameSubStr{
	public static void main(String [ ] args){
		Boolean bool = false;
		String a = "aldjfkld";
		String b = "fjdkjfd";
		int lena = a.length();
		for(int i = 0; i < lena - 1; i++) {
  			String c = a.substring(i, i + 2);
			int t = b.indexOf(c);
			if(t != -1) {
				bool = true;
      			break;
      			//如果要返回找到的字串，可在这里打印
      			//...
    		}
		}
		System.out.println(bool);		
	}	
}