//FlowLayoutTest.java
import java.awt.*;
//定义带有按钮的Frame
class myFlowLayoutFrame extends Frame{
    private int buttons;
    public myFlowLayoutFrame(int buttonNumber){
        buttons=buttonNumber;
      	setTitle("FlowLayout布局的窗体");
      	setSize(320,240);
       	Panel buttonPanel=new Panel();
       	//增加相应的按钮
      	for(int i=0;i<buttons;i++){
      	    Button addButton=new Button("按钮"+(i+1));
      	    buttonPanel.add(addButton);    
      	}
      	//Panel的默认布局管理器是FlowLayout,此处修改参数
      	//FlowLayout(对齐方式,横向间隙,纵向间隙)
        buttonPanel.setLayout(new FlowLayout(2,10,50));      	
      	//Frame的默认布局管理器为BorderLayout
      	this.add(buttonPanel);  
    }	
}

public class FlowLayoutTest{  
    public static void main(String[] args){  
      	//显示的按钮数目
      	int buttonNumber=18; 
      	myFlowLayoutFrame frm=new myFlowLayoutFrame(buttonNumber);
      	frm.setVisible(true);
    }
}