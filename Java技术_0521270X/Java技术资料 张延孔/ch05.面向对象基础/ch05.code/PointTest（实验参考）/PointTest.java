public class PointTest{
	public static void main(String[] args){
		Point2D p2d1, p2d2;
		Point3D p3d1, p3d2;
		
		//double distance;
		//System.out.println("Message from main!");
		//Point2D p1 = new Point2D(1,1); 
		p2d1 = new Point2D(2,2); 
		//计算2D 两点距离
		//distance = Math.sqrt(Math.pow((p1.X-p2.X),2)+Math.pow((p1.Y-p2.Y),2));
		//System.out.println("Distance Between Point2D P1 and P2 is "+ distance);
		//p2.offset(4,5);
		//Point3D p4 = new Point3D(p2,3);
		
		p3d1 = new Point3D(3,4,5); 
		p3d1.show_2d();
		p3d1.show_3d();
		//p2d2 = (Point2D)p3d1;     //父类引用指向子类对象
		//p2d2.show_2d();           //引用父类的成员变量
		//p2d2.show_3d();           ////父类不能引用子类的方法
		
		//p3d2 = (Point3D)p2d1;   ////强制将父类对象转换为子类对象，系统出错  
		 
    }	
}