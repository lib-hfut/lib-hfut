//服务器端
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import java.net.*;
import javax.swing.*;

//窗体类
class SFrame extends Frame{
		ServerSocket server  =  null;  
		Socket client = null;
		TextField port = new  TextField("8000");//将端口默认设为8000
		Button start = new Button("Start");
		TextArea sfTA = new TextArea(25,  60);
		TextField sfTF = new TextField(40);
		Button say = new Button("say");
		SFListener sfListener = new SFListener();
			
		//初始化	
		SFrame(String title){
				super(title);
				init();//初始化
				
				start.addActionListener(sfListener);
				say.addActionListener(sfListener);
				//按键监听	
				addWindowListener(		//窗口监听器
						new WindowAdapter()	{
				    		public void windowClosing(WindowEvent e){		//关闭窗体
				    			try	{
				    				server.close();
				    			}
				    			catch(Exception ee)
				    			{
				    				ee.printStackTrace();
				    			}
				     			System.exit(0);
				    		}
				   		}
		   		);
		   		this.setVisible(true);
			}
		
		//初始化函数	
		void init()	{
					setLocation(10,10);		//窗体位置
					setSize(400,400);			//窗体大小
					setResizable(false);		//设置窗体不可由用户调整大小
					setBackground(Color.gray);  //设置窗体背景色
					sfTA.setBackground(Color.LIGHT_GRAY);
					
				//BorderLayout.NORTH设置
					Panel North = new Panel();
					North.add(new Label("port"));
					North.add(this.port);
					North.add(this.start);
					this.add(North,BorderLayout.NORTH);
				//BorderLayout.CENTER设置		
					Panel Center = new Panel();
					Center.add(this.sfTA);
					this.add(Center,BorderLayout.CENTER);
				//BorderLayout.SOUTH设置		
					Panel South = new Panel();
					South.add(new Label("say"));
					South.add(this.sfTF);
					South.add(this.say);
					this.add(South,BorderLayout.SOUTH);
				//自动调整窗口大小		
					pack();
		}
		
		//监听器类	
		class SFListener implements ActionListener {
					public void actionPerformed(ActionEvent e) {
							String s = e.getActionCommand();
							if ("Start" == s) {	//start操作
									try {
										start.setEnabled(false);
										int i = Integer.parseInt(port.getText());
										sfTA.append("Server Port :"+port.getText()+"\n");
										server = new ServerSocket(i);
										client = server.accept();
										sfTA.append("a client connect ...\n");
										
										ServerThread sfST = new ServerThread();  //
										sfST.start();
									}
									catch(Exception ce)	{
										ce.printStackTrace();
									}
							}
							else if("say" == s)	{	//say操作
									try {
										PrintWriter ss = new PrintWriter(client.getOutputStream());
										String str = sfTF.getText();
										if(str != "") {
													sfTA.append("Server say:" + str + "\n");
													ss.write("Server say:"+ str + "\n");
													ss.flush();
										}
										sfTF.setText("");
									}
									catch(Exception se) {
											se.printStackTrace();
									}
							}
				}
		}
			
		//线程类
		class ServerThread extends Thread {
				public void run() {
					try {		
							BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()) );
							String s = br.readLine();
							while(!"client say:bye".equals(s) && s != null) {
								sfTA.append(s+"\n");
								s = br.readLine();
							}
					}
					catch(Exception re)	{
							re.printStackTrace();
					}
				}
		}
}

//主类，启动服务器端
public class SocketServer{
	public static void main(String[] args){
		SFrame sf = new SFrame("服务器");
	}
}