

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;

public class SimpleApplet extends JApplet {
    private static String labelPrefix = "Number of button clicks: ";
    private int numClicks = 0;


    public void init() {
        final JLabel label = new JLabel(labelPrefix + "0    ");

        JButton button = new JButton("I'm a Swing button!");
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                numClicks++;
                label.setText(labelPrefix + numClicks);
            }
        });

        JPanel pane = new JPanel();
        pane.setLayout(new GridLayout(0, 1));
        pane.add(button);
        pane.add(label);

        pane.setBorder(BorderFactory.createEmptyBorder(20,20,10,20));

        getContentPane().add(pane,BorderLayout.CENTER );
    }
}
