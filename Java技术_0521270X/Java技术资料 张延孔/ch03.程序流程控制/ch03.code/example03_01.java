//本程序从命令行输入两个数据与给定的值50进行比较，
//若大于50则输出结果
package chapter3;

public class example03_01 {
    public static void main(String args[]) {
        int x,serial,y=0;
        //读入命令行参数
        x=Integer.parseInt(args[0]);
        serial=Integer.parseInt(args[1]);
	   if(x>50)
	       y=x*serial;
        System.out.println("y="+y);  
	}         
} 