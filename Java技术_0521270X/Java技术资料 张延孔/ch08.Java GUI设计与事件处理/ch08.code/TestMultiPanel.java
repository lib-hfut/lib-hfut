//创建多Panel程序
import java.awt.*;

public class TestMultiPanel{
	public static void main(String args[]){
		new MyFrame2("MyFrameWithPanel",300, 300, 400, 300);
	}
}

class MyFrame2 extends Frame{
	private Panel p1, p2, p3, p4;
	MyFrame2(String s, int x, int y, int w, int h){
		super(s);
		this.setLayout(null);
		this.setBounds(x, y, w, h);
		
		p1 = new Panel(null);
		p2 = new Panel(null);
		p3 = new Panel(null);
		p4 = new Panel(null);	
			
		p1.setBounds(0, 0, w/2, h/2);
		p2.setBounds(0, h/2, w/2, h/2);
		p3.setBounds(w/2, 0, w/2, h/2);
		p4.setBounds(w/2, h/2, w/2, h/2);

		//p1.setBackground(Color.blue);
		p1.setBackground(new Color(104, 204, 255));//三原色
		p2.setBackground(Color.green);
		p3.setBackground(Color.yellow);
		p4.setBackground(Color.magenta);
		
		this.add(p1); 	this.add(p2); 
		this.add(p3); 	this.add(p4); 
		
		this.setVisible(true);
	}
}