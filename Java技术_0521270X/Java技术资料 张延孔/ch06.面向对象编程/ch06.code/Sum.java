//求阶乘和的代码
public class Sum{
	public static void main(String args[]){
	
	long sum=0;//定义阶乘总和 
    long temp=1;//定义存放阶乘的变量 
    int n=1;   
    do{  
    	temp=n*temp;   
    	sum=sum+temp;  
    	n++;}
    while(n<=50); 
    System.out.println("50以内的阶乘总和是"+sum);	    
    
    //System.out.println("50以内的阶乘总和是"+ "18446744073709551615");	    
	//2的64次方- 1 = 18446744073709551615
	//需要用到 BigInteger
	} 
}