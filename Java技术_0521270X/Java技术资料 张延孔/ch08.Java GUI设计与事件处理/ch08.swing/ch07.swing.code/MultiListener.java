import java.awt.*;
import java.awt.event.*;

import javax.swing.*;

  public class MultiListener extends JFrame
                           implements ActionListener {
    JTextArea topTextArea;
    JTextArea bottomTextArea;
    JButton button1, button2;
    final static String newline = "\n";

    public MultiListener(){
        super("Multilistener") ;

        JLabel l = null;

        Container contentPane = getContentPane();
        contentPane.setLayout(new BoxLayout(contentPane,
                                       BoxLayout.Y_AXIS));

        l = new JLabel("What MultiListener hears:");
        l.setAlignmentX(0.5f);
        contentPane.add(l);

        topTextArea = new JTextArea();
        topTextArea.setEditable(false);
        JScrollPane topScrollPane = new JScrollPane(topTextArea);
        Dimension preferredSize = new Dimension(200, 75);
        topScrollPane.setPreferredSize(preferredSize);
        contentPane.add(topScrollPane);


        l = new JLabel("What Eavesdropper hears:");
        l.setAlignmentX(0.5f);
        contentPane.add(l);

        bottomTextArea = new JTextArea();
        bottomTextArea.setEditable(false);
        JScrollPane bottomScrollPane = new JScrollPane(bottomTextArea);
        bottomScrollPane.setPreferredSize(preferredSize);
        contentPane.add(bottomScrollPane);

        JPanel panel=new JPanel();
        button1 = new JButton("Blah blah blah");
        panel.add(button1);

        button2 = new JButton("You don't say!");
        panel.add(button2);

        contentPane.add(panel);

        button1.addActionListener(this);
        button2.addActionListener(this);

        button2.addActionListener(new Eavesdropper(bottomTextArea));

      }

    public void actionPerformed(ActionEvent e) {
        topTextArea.append(e.getActionCommand() + newline);
    }

    public static void main(String[] args) {
        JFrame frame = new MultiListener();
        frame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        frame.pack();
        frame.setVisible(true);
    }


}

class Eavesdropper implements ActionListener {
    JTextArea myTextArea;
    public Eavesdropper(JTextArea ta) {
        myTextArea = ta;
    }

    public void actionPerformed(ActionEvent e) {
        myTextArea.append(e.getActionCommand()
                        + MultiListener.newline);
    }
}