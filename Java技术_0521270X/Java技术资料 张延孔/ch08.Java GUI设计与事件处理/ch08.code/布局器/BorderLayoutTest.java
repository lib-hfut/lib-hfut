//BorderLayout之例
import java.awt.*;
class myBorderLayoutFrame extends Frame{
	public myBorderLayoutFrame(){
		
		super("BorderLayout布局的窗口");
		Panel myPanel=new Panel();
		myPanel.setLayout(new BorderLayout());
		Button north=new Button("北面");
		Button south=new Button("南面");
		Button east=new Button("东面");
		Button west=new Button("西面");
		Button center=new Button("中心");
		myPanel.add(north,BorderLayout.NORTH);  //显示上按钮
		myPanel.add(south,BorderLayout.SOUTH);
		myPanel.add(east,BorderLayout.EAST);    //显示东按钮
		myPanel.add(west,BorderLayout.WEST);
		myPanel.add(center,BorderLayout.CENTER);//显示中心按钮
		this.add(myPanel);
		this.setSize(320,240);
	}
}	
public class BorderLayoutTest{	
	public static void main(String args[]){
		myBorderLayoutFrame frm = new myBorderLayoutFrame();
		frm.show();
	}
}
