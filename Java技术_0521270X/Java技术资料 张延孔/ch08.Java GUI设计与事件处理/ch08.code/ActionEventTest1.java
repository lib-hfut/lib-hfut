//Inner class 事件处理例一
import java.awt.*;
import java.awt.event.*;

class myButtonFrame extends Frame{
	Button btn;
	
	myButtonFrame(String s){//构造函数
		super(s);
		
		this.setSize(400,300);
		
		btn = new Button("点击");//事件源
		
		this.add(btn);
		
		//创建事件监听器注册
		ButtonListener bl = new ButtonListener();
		ButtonListener2 bl2 = new ButtonListener2();

		//创建事件监听器注册
		btn.addActionListener(bl);
		btn.addActionListener(bl2);
		
		//显示窗体
	    this.setVisible(true);
		}

    //事件监听器1
    private class ButtonListener implements ActionListener{
	    public void actionPerformed(ActionEvent e){
		    System.out.println("点击事件的响应_1");
	    }
    }
   
    //事件监听器2 (可以添加多个事件监听器)
    private class ButtonListener2 implements ActionListener{
	    public void actionPerformed(ActionEvent e){
	    	System.out.println("点击事件的响应__2");
		    System.exit(1);
	    }
    }
    
}


//主类
public class ActionEventTest1{
	public static void main(String args[]){
		myButtonFrame frm = new myButtonFrame("ActionEventTest");
	}
}