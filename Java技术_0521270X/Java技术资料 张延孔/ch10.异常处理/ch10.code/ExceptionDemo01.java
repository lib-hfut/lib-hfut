//捕获数组下界越界异常，当i<=3改为i<3时执行正常
public class ExceptionDemo01 {
    public static void main(String args[]) {
        try{
          int a[]={1,2,3},sum=0;
          for(int i=0; i<=3; i++)sum+=a[i];
          System.out.println("sum="+sum + "Successfully!");
        }
        catch(ArrayIndexOutOfBoundsException e){
          System.out.println("ArrayIndexOutOfBoundsException detected");
          //e.printStackTrace();
          System.out.println("当i<=3改为i<3时执行正常!");
        }
        finally{
          System.out.println("Program Finished !");       
        }
    }
}