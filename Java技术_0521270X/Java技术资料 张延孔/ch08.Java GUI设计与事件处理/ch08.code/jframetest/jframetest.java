// 创建带有标签和按钮的swing窗体，标签带有文字和图片
// 定义按钮事件当单击按钮时弹出对话框
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class  myJFrame extends JFrame{//swing窗体JFrame
   private JLabel label1;//swing标签JLabel   
   private JButton  but1;//swing按钮JButton  
   public myJFrame(){
       super("标签按钮测试窗口"); //引用父类构造方法
       setSize(300,200);
       Container c=getContentPane(); //设置一个ContentPane容器对象，与Frame不同
       c.setLayout(new FlowLayout(40,100,10));  //选择窗口布局为FlowLayout
       Icon icon=new ImageIcon("0.gif");    
       label1=new JLabel("标签中有文字和图像",icon,SwingConstants.CENTER);
       c.add(label1);          //添加标签对象
       but1=new JButton("按钮1");
       c.add(but1); 
       //按钮监听器接口
       but1.addActionListener(new listener()); 
       this.show();
   }  

   //事件监听器
   private class listener implements ActionListener{//定义listener类并实现监听程序
     public void actionPerformed(ActionEvent e) {
         JOptionPane.showMessageDialog(null,"You pressed:"+e.getActionCommand());
     }
   }
}

//主类
public class jframetest{
	public static void main(String args[]){
    	myJFrame frm=new myJFrame(); 
    	frm.addWindowListener(
     		new WindowAdapter(){
      			public void windowClosing(WindowEvent e){
      				System.exit(0);}
     		}
     	);
    }
}