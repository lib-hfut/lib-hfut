import java.applet.*; 
import java.awt.*;
public class Boy extends Applet
{  
    public void paint(Graphics g)
    {   g.setColor(Color.red);   
        g.drawString("我一边喝着咖啡，一边学Java", 5, 30);
        g.setColor(Color.blue);
        g.drawString("我学得很认真",10,50);
    }
} 
