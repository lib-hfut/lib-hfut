//import java.lang.Math;//java.lang.*的类不用显式导入；

public class Point3D extends Point2D {
	//定义3D自己的X,Y,Z
	int X;  //Point3D私有成员属性
	int Y;  //Point3D私有成员属性
	int Z;  //Point3D私有成员属性
	
	//3D的有参构造函数
	public Point3D(int x, int y, int z){
		//X=x; 	Y=y;
		super(x,y);    
		Z=z;
		//System.out.println("Point3D Constructed with Parameters! " + this.X 
		//                   + "  " + this.Y + "  " + this.Z);
	}
		
	//由2D扩展的构造函数
	public Point3D(Point2D p2d,int z){
		X=p2d.X;
		Y=p2d.Y;
		Z=z;
		//System.out.println("Point3D Constructed from Point2D and Z!  " 
		//                    + this.X + "  " + this.Y + "  " + this.Z);
	}	
		
	//3D点的位移	
	void offset(int a, int b,int c){
		this.X+=a;
		this.Y+=b; 
		this.Z+=c;
		//System.out.println("Point3D Offset!/n");
	}	
	
	void show_3d( ){
        System.out.println("Point3D position  " + this.X +"  " + this.Y  +"  " + this.Z ); 
    }
	
}