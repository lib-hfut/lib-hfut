import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.*;

public class PointPaint extends JFrame{
      JLabel label;

      public PointPaint(String str){
        super(str);

        Container container = getContentPane() ;
        container.setLayout(new BoxLayout(container,BoxLayout.Y_AXIS ));


        PointPanel pointPanel= new PointPanel(this);
        container.add(pointPanel);


        label = new JLabel("click within the frame area");
        container.add(label);


        pointPanel.setAlignmentX(LEFT_ALIGNMENT);
        label.setAlignmentX(LEFT_ALIGNMENT);
    }

    public void updateLabel(Point point){
        label.setText("the current point is ("+point.x+","+point.y+")");
    }
    public static void main(String[] args) {

        JFrame frame = new PointPaint("point paint");
        frame.addWindowListener(new WindowAdapter(){
            public void windowClosing(WindowEvent e){
                System.exit(0);
            }
        });


        frame.pack();
        frame.setVisible(true);
    }
}
 class PointPanel extends JPanel{
    PointPaint controller;
    Point point=null;
    Dimension preferredSize = new Dimension(400,150);

    public PointPanel(PointPaint controller){
        this.controller = controller;

        Border raisedBevel = BorderFactory.createRaisedBevelBorder();
        Border lowedBevel = BorderFactory.createLoweredBevelBorder();
        Border compond = BorderFactory.createCompoundBorder
                                                (raisedBevel,lowedBevel);

        setBorder(compond);

        addMouseListener(new MouseAdapter(){
            public void mousePressed(MouseEvent e){
               int x=e.getX();
               int y=e.getY();

               if(point==null){
                 point =new Point(x,y);
               }else{
                 point.x=x;
                 point.y=y;
               }

               repaint();
            }
        });
    }
    public Dimension getPreferredSize(){
        return preferredSize;
    }

    public void paintComponent(Graphics g){
        super.paintComponent(g);
        if(point!=null){
            controller.updateLabel(point);
            g.setColor(Color.yellow );
            g.fillRect(point.x,point.y,30 ,30);
        }
    }

}