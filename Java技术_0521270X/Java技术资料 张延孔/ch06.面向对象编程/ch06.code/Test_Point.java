class Point2D{
	int X;  int Y;  //Point2D私有属性
	public Point2D(){//无参的Point2D构造方法
		X=0;  Y=0;
		//System.out.println("Point2D Constructed without Parameter!");
	}
	Point2D(int x, int y){//有参的Point2D构造方法
		X=x;  Y=y;
		//System.out.println("Point2D Constructed With Parameters!");
	}
	public String toString(){
        return ("Point position  " + this.X +"  " + this.Y); 
    }
}
class Point3D extends Point2D {
	int X;  int Y;  	int Z;  //Point3D私有成员属性
	public Point3D(int x, int y, int z){ //有参构造函数
		super(x,y);    Z=z;
	}
	public String toString(){
        return (super.toString()+"  "+ this.Z); 
    }
}
public class Test_Point {
     public static void main(String args[]){
         Point3D p1, p2;
         p1=new Point3D(1, 2, 3);
         System.out.println(p1.toString());
     }
}