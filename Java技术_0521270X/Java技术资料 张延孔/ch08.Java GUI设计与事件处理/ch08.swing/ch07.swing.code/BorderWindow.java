/*
 * Swing version.
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class BorderWindow extends JFrame {
     
    public BorderWindow() {
        Container contentPane = getContentPane();
        //Use the content pane's default BorderLayout.
        //contentPane.setLayout(new BorderLayout()); //unnecessary
   
        contentPane.add(new JButton("Button 1 (NORTH)"),
                        BorderLayout.NORTH);
        contentPane.add(new JButton("2 (CENTER)"),
                        BorderLayout.CENTER);
        contentPane.add(new JButton("Button 3 (WEST)"),
                        BorderLayout.WEST);
        contentPane.add(new JButton("Long-Named Button 4 (SOUTH)"),
                        BorderLayout.SOUTH);
        contentPane.add(new JButton("Button 5 (EAST)"),
                        BorderLayout.EAST);

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                        System.exit(0);             
            }
        });
    }

    public static void main(String args[]) {
        BorderWindow window = new BorderWindow();
      //  window.inAnApplet = false;

        window.setTitle("BorderLayout");
        window.pack();
        window.setVisible(true);
    }
}
