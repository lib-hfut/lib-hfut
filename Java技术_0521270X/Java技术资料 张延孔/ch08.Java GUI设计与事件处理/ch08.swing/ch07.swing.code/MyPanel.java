import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class MyPanel extends JFrame{

  public MyPanel() {
     super("MyPanel");
     JPanel pane = new JPanel();
     JButton button = new JButton("Click Me");
     JLabel lbl= new JLabel("How are you?");

     pane.add(button);
     pane.add(lbl);
     pane.setSize(100,100);
     pane.setBackground(Color.yellow );

     getContentPane().setBackground(Color.blue);
     getContentPane().add(pane, BorderLayout.NORTH );
 

  }
  public static void main(String[] args) {
    JFrame f = new MyPanel();
    f.setSize(200,200);
    f. addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                        System.exit(0);             
            }
    });

    f.setVisible(true);
    f.setBackground(Color.blue);
  }
}