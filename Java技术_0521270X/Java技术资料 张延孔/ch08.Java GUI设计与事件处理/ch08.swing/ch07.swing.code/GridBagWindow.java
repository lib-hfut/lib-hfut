/*
 * Swing version.
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class GridBagWindow extends JFrame {
    
    final boolean shouldFill = true;
    final boolean shouldWeightX = true;
     
    public GridBagWindow() {
        JButton button;
        Container contentPane = getContentPane();
        GridBagLayout gridbag = new GridBagLayout();
        GridBagConstraints c = new GridBagConstraints();
        contentPane.setLayout(gridbag);
        if (shouldFill) {
            //natural height, maximum width
            c.fill = GridBagConstraints.HORIZONTAL; 
        }
   
        button = new JButton("Button 1");
        if (shouldWeightX) {
            c.weightx = 0.5;
        }
        c.gridx = 0;
        c.gridy = 0;
        gridbag.setConstraints(button, c);
        contentPane.add(button);

        button = new JButton("2");
        c.gridx = 1;
        c.gridy = 0;
        gridbag.setConstraints(button, c);
        contentPane.add(button);

        button = new JButton("Button 3");
        c.gridx = 2;
        c.gridy = 0;
        gridbag.setConstraints(button, c);
        contentPane.add(button);

        button = new JButton("Long-Named Button 4");
        c.ipady = 40;      //make this component tall
        c.weightx = 0.0;
        c.gridwidth = 3;
        c.gridx = 0;
        c.gridy = 1;
        gridbag.setConstraints(button, c);
        contentPane.add(button);

        button = new JButton("Button 5");
        c.ipady = 0;       //reset to default
        c.weighty = 1.0;   //request any extra vertical space
        c.anchor = GridBagConstraints.SOUTH; //bottom of space
        c.insets = new Insets(10,0,0,0);  //top padding
        c.gridx = 1;       //aligned with button 2
        c.gridwidth = 2;   //2 columns wide
        c.gridy = 2;       //third row
        gridbag.setConstraints(button, c);
        contentPane.add(button);

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                       System.exit(0);               
            }
        });
    }

    public static void main(String args[]) {
        GridBagWindow window = new GridBagWindow();

        window.setTitle("GridBagLayout");
        window.pack();
        window.setVisible(true);
    }
}
