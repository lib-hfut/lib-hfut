//show GUI Frame
import java.awt.*;
class myFrame extends Frame {//新建的窗口类 		
	myFrame(String s){
	    super(s);  
      	this.setSize(300,200);
      	this.setBackground(Color.yellow);
        this.setVisible(true); 
    }
}
public class HelloGuiWorld01{ 		
    public static void main(String[] args){ 
        myFrame frm=new myFrame("HelloGUIWorld!"); 

    } 
}