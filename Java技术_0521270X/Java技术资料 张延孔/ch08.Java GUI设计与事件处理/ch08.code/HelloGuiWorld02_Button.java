//HelloGuiWorld Frame-Label
import java.awt.*;
import java.awt.event.*;

class myFrame2 extends Frame {//新建的窗口类
 	Label greetingLab;
 	//Button myBtn;	
	myFrame2(String s){
	    super(s);  
      	this.setSize(300,200);
      	this.setBackground(Color.yellow);
      	//创建Label
        greetingLab=new Label("Hello GUI World");
        //将Label加到Frame   
       this.add(greetingLab,"Center"); 
        
        /*
        // 创建一个按钮
        myBtn=new Button("push me");
        //设置按钮的大小  
        myBtn.setBounds(50,50,100,50); 
        //将按钮添加到窗口中     
        this.add(myBtn) ;  
        */
          
        //显示窗体
        this.setVisible(true); 
    }
}
public class HelloGuiWorld02_Button{ 		
    public static void main(String[] args){ 
        myFrame2 frm=new myFrame2("HelloGUIWorld!");
    } 
}