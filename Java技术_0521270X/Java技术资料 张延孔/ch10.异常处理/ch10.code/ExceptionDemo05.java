//自定义异常类将继承Exception 类的所有方法
//处理多种异常
import javax.swing.JOptionPane;

//自定义异常类
class payException extends Exception{
    payException(){
        System.out.println("  输入工资数据不正确"  );
    }
}

//自定义异常类
class nameException extends Exception{
    nameException(){
        System.out.println("  输入姓名数据不正确"  );
    }
}

//主类
public class ExceptionDemo05{
	//私有成员属性
    public static  String name;
    public static  int pay;
    public static  void inputdata() {
		try{
			//假如没有输入名字就抛出一个nameException异常         	
			name = JOptionPane.showInputDialog("请输入您的姓名 ");          
			if(name.equals("")) throw  new nameException();
           
			//假如输入的月工资数小于零，就会抛出自定义payException 异常         
			pay = Integer.parseInt(JOptionPane.showInputDialog("请输入您的月工资"));
			if(pay < 0) throw  new payException();
		}
        //捕获自定义姓名异常
        catch(nameException ne){
            ne.printStackTrace();
            System.exit(0); 
        }
        //捕获自定义工资异常		
		catch(payException pe){ 
             pe.printStackTrace();
             System.exit(0);
        }
	}  
	  
	//主方法
    public static void main(String args[]){
		inputdata();
		System.out.println(name+" 的年薪是  " + pay*12); 
	}
}