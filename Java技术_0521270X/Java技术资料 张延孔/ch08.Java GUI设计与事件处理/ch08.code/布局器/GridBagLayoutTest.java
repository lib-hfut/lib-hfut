//GridBagLayout之例
import java.awt.*;
class myGridBagFrame extends Frame{	
	public myGridBagFrame(){ 
		super("GridBagLayout布局的窗体");
		Panel panel1 = new Panel();
		setSize(320,240);
		panel1.setLayout(new GridBagLayout());
		
		GridBagConstraints gbdc=new GridBagConstraints();
		gbdc.fill=GridBagConstraints.BOTH;//向两面扩张
		gbdc.weightx=1;//设置行（weightx）的量
		gbdc.weighty=1;
		gbdc.gridwidth=2;//添加进入的部件就会变成为2个单元格的宽度。
		gbdc.gridx=0;//另起一行，从最左边的单元格开始填充。
		panel1.add(new Button("No.1"),gbdc);
		gbdc.gridx=2;
		gbdc.gridwidth=1;
		gbdc.gridheight=2;
		panel1.add(new Button("No.2"),gbdc);
		gbdc.gridx=0;
		gbdc.gridheight=1;
		panel1.add(new Button("No.3"),gbdc);
		gbdc.gridx=1;
		panel1.add(new Button("No.4"),gbdc);
		add(panel1);
	}
}
public class GridBagLayoutTest{
	public static void main(String args[]){
		myGridBagFrame frm= new myGridBagFrame();
		frm.setVisible(true);	
	}
}