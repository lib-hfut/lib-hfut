//分析一字符串，分别输出大写字符数、小写字符数和非英文字符数
public class TestString2{
	public static void main(String args[]){
		String myString = "aajava哈哈JAVA&（#@%￥java嘿嘿javaok";
		int lCount = 0, uCount = 0, oCount = 0;
		//方法一，用Array.charAt(i)方法依次取字符,用编码进行判断
/*		for (int i=0; i<myString.length(); i++){
			char c = myString.charAt(i);
			if(c>='a' && c<='z'){
				 lCount++; 
			}else if (c>='A' && c<='Z'){
				 uCount++; 
			}else{
				 oCount++;
			}		
		}
*/
		//方法二，用Array.charAt(i)方法依次取字符,用sL、sU进行判断
/*		String sL = "abcdefghijklmnopqistuvwxyz";
		String sU = "ABCDEFGHIJKLMNOPQISTUVWXYZ";
		for (int i=0; i<myString.length(); i++){
			char c = myString.charAt(i);
			if(sL.indexOf(c) != -1){
				 lCount++; 
			}else if (sU.indexOf(c) != -1){
				 uCount++; 
			}else{
				 oCount++;
			}		
		}
*/
		//方法三，用Array.charAt(i)方法依次取字符,用Character.isLowerCase()、Character.isUpperCase()进行判断
/*		for (int i=0; i<myString.length(); i++){
			char c = myString.charAt(i);
			if(Character.isLowerCase(c)){
				 lCount++; 
			}else if (Character.isUpperCase(c)){
				 uCount++; 
			}else{
				 oCount++;
			}		
		}		
*/		
//		System.out.println("小写字母个数 是 " + lCount);
//		System.out.println("大写字母个数 是 " + uCount);
//		System.out.println("非字母字符个数  是 " + oCount);

//以下为找子串		
		String sToFind = "java";
		int count = 0;//找到的计数
		int index = -1; 
		//以下不断从上一次判断结束处截取，用于下次判断
		while ((index = myString.indexOf(sToFind)) != -1){
			myString = myString.substring(index + sToFind.length());
			count++	;
		}		
		System.out.println("包含子串的个数为 "+count);	
	}	
}