import java.awt.*;
 import java.awt.event.*;

 import javax.swing.*;

 public class TwoListener
     implements MouseMotionListener, MouseListener {
   private JFrame f;
   private JTextField tf;

 public TwoListener() {
 f = new JFrame("Two listeners example");
 tf = new JTextField(30);
 }

 public void launchFrame() {
 JLabel label = new JLabel("Click and drag the mouse");
 Container content=f.getContentPane();
 content.add(label, BorderLayout.NORTH);
 content.add(tf, BorderLayout.SOUTH);
 // Add this object as a listener
 f.addMouseMotionListener(this);
 f.addMouseListener(this);
 // Size the frame and make it visible
 f.setSize(300, 200);
 f.setVisible(true);
 }

 // These are MouseMotionListener events
 public void mouseDragged(MouseEvent e) {
 String s = "Mouse dragging: X = " + e.getX()
 + " Y = " + e.getY();
 tf.setText(s);
 }

 public void mouseEntered(MouseEvent e) {
 String s = "The mouse entered";
 tf.setText(s);
 }

 public void mouseExited(MouseEvent e) {
  String s = "The mouse has left the building";
  tf.setText(s);
 }

 public void mousePressed(MouseEvent e) { }
 public void mouseClicked(MouseEvent e) { }
 public void mouseReleased(MouseEvent e) { }
 public void mouseMoved(MouseEvent e) {}

 public static void main(String args[]) {
 TwoListener two = new TwoListener();
 two.launchFrame();
 }
 }