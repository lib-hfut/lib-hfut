//自定义异常类将继承Exception 类的所有方法
//除此之外，还可以在类体中定义其他处理方法  
class OverFlowException extends Exception {//自定义异常类
    OverFlowException() {
        System.out.println("此处数据有溢出，溢出类是OverFlowException");
    }
} 
public class ExceptionDemo04{
    public static int x=100000;
    public static int multi() throws OverFlowException{
        int aim;
        aim=x*x*x;
        if(aim>2.15E9||aim<0){
           throw new OverFlowException();}
        else 
        return x*x;
    }
    
    public static void main(String args[]){
        int y;
        try{ 
           y=multi();
           System.out.println(" y="+y);
        } 
        catch( OverFlowException e){//捕获异常并处理
           System.out.println(e); }
    }
}