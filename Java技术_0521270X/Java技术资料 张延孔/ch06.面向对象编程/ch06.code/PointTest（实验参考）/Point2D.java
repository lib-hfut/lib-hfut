class Point2D{
	int X;  //Point2D私有属性
	int Y;  //Point2D私有属性
	public Point2D(){//无参的Point2D构造方法
		X=0;
		Y=0;
		//System.out.println("Point2D Constructed without Parameter!");
		}
		
	Point2D(int x, int y){//有参的Point2D构造方法
		X=x;
		Y=y;
		//System.out.println("Point2D Constructed With Parameters!");
		}
		
	void offset(int a, int b){//位移Point2D
		X+=a;
		Y+=b;
		//System.out.println("Point2D Offset to " + this.X +"  " + this.Y);
	}
	
	void show_2d( ){
        System.out.println("Point2D position  " + this.X +"  " + this.Y); 
    }
		
}