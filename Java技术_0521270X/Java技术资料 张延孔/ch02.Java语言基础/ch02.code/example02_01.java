//Unicode编码
public class  example02_01 {
   public static void main (String[] args)	{ 
      char enWord='a',
           chinaWord='槑',
           japanWord='ぁ';
      int  p1=36328,p2=38358;
      System.out.println("英文\'a\'在unicode表中的顺序位置" + (int)enWord);
      System.out.println("汉字\'槑\'在unicode表中的顺序位置" + (int)chinaWord);
      System.out.println("日语\'ぁ\'在unicode表中的顺序位置" + (int)japanWord); 
      System.out.println("unicode表中第20328位置上的字符是:" + (char)p1);
      System.out.println("unicode表中第12358位置上的字符是:" + (char)p2); 
    }
}