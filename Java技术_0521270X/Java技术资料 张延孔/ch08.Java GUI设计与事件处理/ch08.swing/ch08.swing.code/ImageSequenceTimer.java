import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


public class ImageSequenceTimer implements ActionListener {
    ImageSQPanel imageSQPanel;
    static int frameNumber = -1;
    int delay;
    Thread animatorThread;
    static boolean frozen = false;
    Timer timer;

    void buildUI(Container container, Image[] dukes) {
       int fps = 10;

        //How many milliseconds between frames?
        delay = (fps > 0) ? (1000 / fps) : 100;

        //Set up a timer that calls this object's action handler
        timer = new Timer(delay, this);
        timer.setInitialDelay(0);
        timer.setCoalesce(true);

        imageSQPanel = new ImageSQPanel(dukes);
        container.add(imageSQPanel, BorderLayout.CENTER);

        imageSQPanel.addMouseListener(new MouseAdapter() {
            public void mousePressed(MouseEvent e) {
                if (frozen) {
                    frozen = false;
                    startAnimation();
                } else {
                    frozen = true;
                    stopAnimation();
                }
            }
       });
    }


    public  void startAnimation() {
        if (frozen) {
            //Do nothing.  The user has requested that we
            //stop changing the image.
        } else {
            //Start animating!
            if (!timer.isRunning()) {
                timer.start();
            }
        }
    }

    public  void stopAnimation() {
        //Stop the animating thread.
        if (timer.isRunning()) {
            timer.stop();
        }
    }

    public void actionPerformed(ActionEvent e) {
        //Advance the animation frame.
        frameNumber++;

        //Display it.
        imageSQPanel.repaint();
    }

    class ImageSQPanel extends JPanel{
        Image dukesWave[];

        public ImageSQPanel(Image[] dukesWave) {
            this.dukesWave = dukesWave;
        }

        //Draw the current frame of animation.
        public void paintComponent(Graphics g) {
            super.paintComponent(g); //paint background

            //Paint the frame into the image.
            try {
                g.drawImage(dukesWave[ImageSequenceTimer.frameNumber%10],
                            0, 0, this);

            } catch (ArrayIndexOutOfBoundsException e) {
                //On rare occasions, this method can be called
                //when frameNumber is still -1.  Do nothing.
                return;
            }
        }
    }

    //Invoked only when this is run as an application.
    public static void main(String[] args) {
        Image[] waving = new Image[10];

        for (int i = 1; i <= 10; i++) {
            waving[i-1] =
                Toolkit.getDefaultToolkit().getImage(
                    "images/T"+i+".gif");
        }

        JFrame f = new JFrame("ImageSequenceTimer");
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        ImageSequenceTimer controller = new ImageSequenceTimer();
        controller.buildUI(f.getContentPane(), waving);
        controller.startAnimation();
        f.setSize(new Dimension(75, 100));
        f.setVisible(true);
    }
}