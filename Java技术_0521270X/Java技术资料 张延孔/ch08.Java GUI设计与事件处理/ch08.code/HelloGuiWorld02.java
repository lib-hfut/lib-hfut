//HelloGuiWorld Frame-Label
import java.awt.*;
import java.awt.event.*;

class myFrame2 extends Frame {//新建的窗口类
 	Label greetingLab;
	myFrame2(String s){
	    super(s);  
      	this.setSize(300,200);
      	this.setBackground(Color.yellow);
      	//创建Label
        greetingLab = new Label("Hello GUI World");
        //将Label加到Frame   
        this.add(greetingLab, "East"); 
        this.setVisible(true); 
    }
}

public class HelloGuiWorld02{ 		
    public static void main(String[] args){ 
        myFrame2 frm = new myFrame2("HelloGUIWorld!");
    } 
}