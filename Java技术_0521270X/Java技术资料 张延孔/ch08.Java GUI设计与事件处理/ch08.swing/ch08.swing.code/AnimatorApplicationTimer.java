/*
 * Swing version.
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/* 
 * A template for animation applications.
 */
public class AnimatorApplicationTimer extends JFrame
                                      implements ActionListener {
    int frameNumber = -1;
    Timer timer;
    boolean frozen = false;
    JLabel label;

    AnimatorApplicationTimer(int fps, String windowTitle) {
        super(windowTitle);
        int delay = (fps > 0) ? (1000 / fps) : 100;

        //Set up a timer that calls this object's action handler.
        timer = new Timer(delay, this);
        timer.setInitialDelay(0);
        timer.setCoalesce(true);

        addWindowListener(new WindowAdapter() {
            public void windowIconified(WindowEvent e) {
                stopAnimation();
            }
            public void windowDeiconified(WindowEvent e) {
                startAnimation();
            }
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }  
        });

        label = new JLabel("Frame     ", JLabel.CENTER);
        label.addMouseListener(new MouseAdapter() {
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

        getContentPane().add(label, BorderLayout.CENTER);
    }

    //Can be invoked by any thread (since timer is thread-safe).
    public void startAnimation() {
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

    //Can be invoked by any thread (since timer is thread-safe).
    public void stopAnimation() {
        //Stop the animating thread.
        if (timer.isRunning()) {
            timer.stop();
        }
    }

    public void actionPerformed(ActionEvent e) {
        //Advance the animation frame.
        frameNumber++;
        label.setText("Frame " + frameNumber);
    }

    public static void main(String args[]) {
        AnimatorApplicationTimer animator = null;
        int fps = 10;

        //Get frames per second from the command line argument.
        if (args.length > 0) {
            try {
                fps = Integer.parseInt(args[0]);
            } catch (Exception e) {}
        }
        animator = new AnimatorApplicationTimer(fps, "Animator with Timer");
        animator.pack();
        animator.setVisible(true);

        //It's OK to start the animation here because 
        //startAnimation can be invoked by any thread.
        animator.startAnimation();
    }
}
