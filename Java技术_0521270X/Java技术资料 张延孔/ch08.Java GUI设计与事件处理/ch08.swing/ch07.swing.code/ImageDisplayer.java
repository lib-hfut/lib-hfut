import java.awt.*;
import java.awt.event.*;
import javax.swing.*;


public class ImageDisplayer{
    static String imageFile = "images/rocketship.gif";


    public static void main(String[] args) {
       Image image = Toolkit.getDefaultToolkit().getImage(
                                       ImageDisplayer.imageFile);

           ImagePanel imagePanel = new ImagePanel(image);

        JFrame f = new JFrame("ImageDisplayer");
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        f.getContentPane().add(imagePanel, BorderLayout.CENTER);
        f.setSize(new Dimension(550,100));
        f.setVisible(true);
    }
}

class ImagePanel extends JPanel {
    Image image;

    public ImagePanel(Image image) {
        this.image = image;
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g); //paint background

        //Draw image at its natural size first.
        g.drawImage(image, 0, 0, this); //85x62 image


        //Now draw the image scaled.
        g.drawImage(image, 100, 0, 200, 62, this);
        g.setColor(Color.red);
        g.drawRect(340,0,40,40);
        g.setColor(Color.yellow );
        g.fillRect(341,1,39,39);
    }
}