//GridLayoutTest.java
import java.awt.*;
class myGridLayoutFrame extends Frame{
	Button[] buttons = new Button[20];
	
	public myGridLayoutFrame(){
		super("GridLayout布局的窗体");
		setSize(320,240);
		setLayout(new GridLayout(4,5));
		for(int i=0;i<buttons.length;i++){
			buttons[i]=new Button(""+(i+1));
			add(buttons[i]);
		}
	}
}
public class GridLayoutTest{	
	public static void main(String args[]){
		myGridLayoutFrame frm = new myGridLayoutFrame();
		frm.show();
	}
}
