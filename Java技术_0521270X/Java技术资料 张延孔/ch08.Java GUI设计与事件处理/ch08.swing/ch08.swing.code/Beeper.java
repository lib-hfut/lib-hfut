import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
public class Beeper extends JFrame
                    implements ActionListener {
    JButton button;

    public Beeper() {
        super("BorderDemo");

        button = new JButton("Click Me");
        getContentPane().add(button, BorderLayout.CENTER);
        button.addActionListener(this);
    }

    public void actionPerformed(ActionEvent e) {
        Toolkit.getDefaultToolkit().beep();
    }


    public static void main(String[] args) {
        JFrame frame = new Beeper();
        frame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        frame.pack();
        frame.setVisible(true);
    }
}