//测试 == 和 Object.equals()方法
class Cat {
    String name;
    String color;
    
    Cat(String n, String c){
        name = n; color = c;
    }
    
  	public boolean equals(Object obj) {//覆盖了Object.equals()方法,体会不同
		if(obj == null) return false;
		else {
			if(obj instanceof Cat) { //("对象" instanceof "类")
				Cat c = (Cat)obj;
				if(c.name == this.name && c.color == this.color ) {
					return true;
				}
			}
		}
		return false;
	}
  
}

public class TestEqual {
	public static void main(String[] args) {
		//Integer x = new Integer(1);
		//Integer y = new Integer(1);
		//System.out.println("x == y:  " + (x == y));
		//System.out.println("x.equals(y):  "+  (x.equals(y)));
		
		Cat c1 = new Cat("Tom", "black");
		Cat c2 = new Cat("Rose", "white");
		
		System.out.println("c1 == c2:  "+(c1 == c2));
		
		System.out.println("c1.equals(c2):  "+(c1.equals(c2)));
	}
}