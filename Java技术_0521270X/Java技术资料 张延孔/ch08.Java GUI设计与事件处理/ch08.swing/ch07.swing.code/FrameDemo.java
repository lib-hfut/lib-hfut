import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class FrameDemo {
    public static void main(String s[]) {
        JFrame frame = new JFrame("FrameDemo");

        frame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        JLabel emptyLabel = new JLabel("");
        emptyLabel.setPreferredSize(new Dimension(275, 200));
        frame.getContentPane().add(emptyLabel, BorderLayout.CENTER);

        frame.pack();
        frame.setVisible(true);
    }
}
