//StraightSelectionSort
//选择法升序排序
package chapter4;
import java.io.*;  

public class example04_03 {
  public static void main(String args[ ]) throws IOException {
    //抛出输入输出异常
    BufferedReader Keyin=new BufferedReader(new InputStreamReader(System.in));
    //定义变量keyin的目的是在程序运行过程中，通过键盘输入数据
    int a[ ],i,j,k,temp; 
    String c;
    System.out.println("Input the number of array elements! ");
    //给出数组元素的个数
    c= Keyin.readLine();
    //将字符型数据转换成整型
    temp=Integer.parseInt(c);
    //对数组a 进行初始化
    a=new int[temp]; 
    System.out.println(" Input "+temp+"  numbers.One per line!");
    for (i=0;i<a.length;i++) {
       //通过键盘输入的方式为数组赋初值
       c=Keyin.readLine();
       a[i]=Integer.parseInt(c);
    }
    System.out.println(" Array sorting!");
    for(i=0;i<a.length-1;i++){
       k=i;
       for(j=i+1;j<a.length;j++)
          if(a[j]<a[k]) k=j;
       temp=a[i];
       a[i]=a[k];
       a[k]=temp;             
    }
       for(i=0;i<a.length;i++)
          System.out.print( a[i]+"  ");      
       System.out.println( );
  }
}  