//创建多Frame程序
import java.awt.*;

public class TestMultiFrame {
	public static void main(String args[]){
		MyFrame frm1 = 
			new MyFrame(100, 100, 200, 200, Color.blue);
		MyFrame frm2 = 
			new MyFrame(300, 100, 200, 200, Color.yellow);
		MyFrame frm3 = 
			new MyFrame(100, 300, 200, 200, Color.green);
		MyFrame frm4 = 
			new MyFrame(300, 300, 200, 200, Color.magenta);
	}	
}

class MyFrame extends Frame{
	static int id = 0;
	MyFrame(int x, int y, int w, int h, Color myColor){
		super("MyFrame " + (++id));
		this.setBackground(myColor);
		this.setLayout(null);
		this.setBounds(x, y, w, h);
		this.setVisible(true);
	}	
}