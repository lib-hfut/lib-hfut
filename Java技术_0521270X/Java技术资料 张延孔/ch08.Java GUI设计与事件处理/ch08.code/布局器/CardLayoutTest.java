//CardLayout之例
import java.awt.*;
import java.awt.event.*;
class myCardLayoutFrame extends Frame
                        implements ActionListener{  
   CardLayout mycard;
   Button buttonFirst,buttonLast,buttonNext;
   Panel pCenter; 
   myCardLayoutFrame(){//构造函数
   	  super("CardLayout布局的窗体");
   	  mycard=new CardLayout();
      pCenter=new Panel();
      pCenter.setLayout(mycard);//设置CardLayout布局      
      buttonFirst=new Button("第一个");
      buttonLast=new Button("末一个");
      buttonNext=new Button("下一个"); 
      
      for(int i=1;i<=20;i++){
        pCenter.add("i am"+i,new Button("我是第 "+i+" 个按钮")); 
      }
      //给按钮添加事件监听器
      buttonFirst.addActionListener(this);
      buttonLast.addActionListener(this);
      buttonNext.addActionListener(this);
      
      //添加带有按钮的panel
      Panel pSouth=new Panel();
      pSouth.add(buttonFirst);
      pSouth.add(buttonNext);
      pSouth.add(buttonLast);
      add(pCenter,BorderLayout.CENTER);
      add(pSouth,BorderLayout.SOUTH);
      setBounds(0,0,320,240);
      validate();
   }
   //按钮事件处理
   public void actionPerformed(ActionEvent e){
   	   if(e.getSource()==buttonFirst){
   	   	  mycard.first(pCenter);
       }
       else if(e.getSource()==buttonNext){
       	  mycard.next(pCenter);
       }
       else if(e.getSource()==buttonLast){
       	  mycard.last(pCenter);
       }
   }
}
public class CardLayoutTest{
	public static void main(String args[]){
		myCardLayoutFrame frm = new myCardLayoutFrame();
		frm.show();
    }
}