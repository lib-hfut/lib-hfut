//ArrayCopy
//一维数组的复制
class example04_01{
  public static void main(String args[ ] )   {
    int a[ ],b[ ],i,j;
    a=new int[3];
    b=new int[5];
    
    System.out.println(" a.length="+a.length);
    
    for (i=0;i<a.length;i++)  {  
       a[i]=i;
       System.out.print( a[i] + "  ");
    }
    
    System.out.println("\n\n");
    System.out.println("Before array assigment  ");
    System.out.println("b.length="+b.length );
    
    for (j=0;j<b.length;j++)  {
       b[j]=j*10; 
       System.out.print( b[j]+"  ");
    }
    
    System.out.println("\n\n");
    
    /*for (i=0;i<a.length;i++)  {  
       b[i] = a[i];
       System.out.print( b[i] + "  ");
    }   
    */
    
    //b赋给a； 引用"b"指向"a"所指向的数组
    b=a;
    
    System.out.println("After array assigment  ");
    System.out.println( "b.length="+b.length);
    
    for(j=0;j<b.length;j++)
        System.out.print( b[j]+"  ");
    System.out.println("\n\n");
    
    int grade [ ] [ ] = { {65,34}, {81,56,92}, {56,87,90}, {92,69,75} };

 	//创建数组对象，判断“相等”
    String s1 = "abc";
    String s2 = "ABC";    
    //返回字符串的第几个字符
    System.out.println("charat  " + (s1.charAt(2)));
    System.out.println("s1==s2 :  " + (s1==s2));
	//对象项内容是否相等：是
	System.out.println("s1.equals(abc)" + (s1.equals("abc")));
	//对象项内容是否相等：否
	System.out.println("s1.equals(s2)" + (s1.equals(s2)));	
	//忽略大小写，对象项内容是否相等：是
	System.out.println("s1.equalsIgnoreCase(s2)" + (s1.equalsIgnoreCase(s2)));

    
  }
} 