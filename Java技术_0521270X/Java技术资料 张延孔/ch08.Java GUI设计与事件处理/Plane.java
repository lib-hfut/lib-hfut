import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Plane extends JFrame{
    public Plane(){
        this.setSize(300,200);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);
    }

    public static void main(String[] args) {
        Plane frame = new Plane();
        Panel panel = new Panel();
        frame.add(panel);
    }
}


class Panel extends JPanel {
    public void paint(Graphics g) {
        super.paint(g);
        //着色
        //后浆
        g.setColor(Color.CYAN);
        g.fillOval((15-12),(31-12),12*2,12*2);

        //前桨
        g.fillPolygon(new int[]{62,63,65,69,77,93,108}, new int[]{11,10,9,8,7,6,6}, 7);
        g.fillPolygon(new int[]{62,77,93,101,105,107,108}, new int[]{11,10,9,8,7,6,6}, 7);
        g.fillPolygon(new int[]{112,113,115,119,127,143,158}, new int[]{6,5,4,3,2,1,1}, 7);
        g.fillPolygon(new int[]{112,127,143,151,155,157,158}, new int[]{6,5,4,3,2,1,1}, 7);

        //飞机躯干
        g.setColor(Color.GREEN);
        g.fillPolygon(
        	new int[] { 158, 147, 139, 124, 120, 92, 76, 50,46,37,41, 14, 15, 75, 89, 142},
        	new int[] { 43,  34,  27,  23,  19,  19, 26, 28,25,25,28, 29, 33, 39, 51, 51},
        	16);
        g.fillArc(89+20, 52-(52-43)*2, (158-89)-20, (52-43)*2, 0, -70);

        //机身
        g.setColor(Color.GRAY);
        g.fillPolygon(new int[]{87,123,124,74}, new int[]{22,22,24,26}, 4);
        g.fillArc(131-10, 38-(44-38), 10, (44-38)*2, 0, -90);
        g.fillPolygon(new int[]{74,81,131-10/2,131,124}, new int[]{26,44,44,38,24}, 5);
        g.fillPolygon(new int[]{54,45,37,46}, new int[]{31,31,25,25}, 4);

        //尾翼
        g.fillPolygon(new int[]{24,17,14,13},  new int[]{28,21,21,28}, 4);
        g.fillArc(13,19,4,4,160,-180);
      
        //前桨
        g.setColor(Color.RED);
        g.fillPolygon(new int[]{112,112,108,108}, new int[]{19,10,10,19}, 4);
        g.fillOval(108, (10-4), 4, 4);

        //飞机窗口
        g.setColor(Color.BLACK);
        g.fillPolygon(new int[]{147,133,128,139}, new int[]{34,34,25,27}, 4);
        g.fillPolygon(new int[]{87,123,120,92}, new int[]{22,22,19,19}, 4);
        g.fillPolygon(new int[]{129,120,116,124}, new int[]{35,35,26,24}, 4);
        g.fillPolygon(new int[]{113,117,108,102}, new int[]{26,35,35,26}, 4);

        //飞机躯干
        g.drawPolyline(
        	new int[] { 158, 147, 139, 124, 120, 92, 76, 50,46,37,41, 14, 15, 75,89 ,142},
        	new int[] { 43, 34, 27, 23, 19, 19, 26, 28,25,25,28, 29, 33, 39, 51,51},
		    16);

        g.drawArc(89+20, 52-(52-43)*2, (158-89)-20, (52-43)*2, 0, -70);

        //飞机头部
        g.drawPolyline(new int[]{147,133,128}, new int[]{34,34,25}, 3);

        //飞机机身
        g.drawPolyline(new int[]{87,123}, new int[]{22,22}, 2);
        g.drawPolyline(new int[]{74,124,131}, new int[]{26,24,38}, 3);
        g.drawArc(131-10, 38-(44-38), 10, (44-38)*2, 0, -90);
        g.drawPolyline(new int[]{74,81,131-10/2}, new int[]{26,44,44}, 3);
	    g.drawPolyline(new int[]{129,120,116}, new int[]{35,35,26}, 3);
        g.drawPolyline(new int[]{113,117,108,102}, new int[]{26,35,35,26}, 4);
        g.drawPolygon(new int[]{54,45,37,46}, new int[]{31,31,25,25}, 4);
        g.drawLine(99, 26, 106, 44);
        g.drawLine(99, 32, 101, 32);
        g.drawLine(102, 39, 104, 39);

        //飞机前桨
        g.drawPolyline(new int[]{112,112,108,108}, new int[]{19,10,10,19}, 4);
        g.drawOval(108, (10-4), 4, 4);
        g.drawArc(108-(108-62)*2, 6-5, (108-62)*2, 5*2, 0, -90);
        g.drawArc(108-(108-62), 6, (108-62)*2, 5*2, 180, -90);
        g.drawArc(112-(108-62), 6-5*2, (108-62)*2, 5*2, 0, -90);
        g.drawArc(112, 6-5, (108-62)*2, 5*2, 180, -90);

        //飞机后浆 计算正切圆的切点坐标及外接正方形的起点坐标
	    g.drawPolyline(new int[]{24,17}, new int[]{28,21}, 2);
        g.drawPolyline(new int[]{13,14}, new int[]{21,28},2);
        g.drawArc(13,19,4,4,160,-180);
        g.drawOval((15-12),(31-12),12*2,12*2);
        g.drawArc((15-8),(31-8),8*2,8*2,20,120);
        g.drawArc((15-8),(31-8),8*2,8*2,-20,-50);
        g.drawArc((15-8),(31-8),8*2,8*2,-90,-100);

        //飞机底座
        g.drawArc(108,51,16,16,0,90);
        g.drawArc(130,51,16,16,20,90);
        g.drawArc(55,(51-8+6),100,(16-6),-20,-70);   

    }

}