/*
 * Swing version.
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class GridWindow extends JFrame {

    public GridWindow() {
        Container contentPane = getContentPane();

        contentPane.setLayout(new GridLayout(0,2));
   
        contentPane.add(new JButton("Button 1"));
        contentPane.add(new JButton("2"));
        contentPane.add(new JButton("Button 3"));
        contentPane.add(new JButton("Long-Named Button 4"));
        contentPane.add(new JButton("Button 5"));

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                     System.exit(0);
            }
        });
    }

    public static void main(String args[]) {
        GridWindow window = new GridWindow();
        
        window.setTitle("GridLayout");
        window.pack();
        window.setVisible(true);
    }
}
