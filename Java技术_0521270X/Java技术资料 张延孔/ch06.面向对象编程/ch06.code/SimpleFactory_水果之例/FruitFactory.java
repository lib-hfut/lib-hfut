public class FruitFactory {
//get方法，获得所有产品对象
	public static Fruit getFruit(String type) 
	       throws Exception{ //InstantiationException, IllegalAccessException, ClassNotFoundException {
		if(type.equalsIgnoreCase("apple")) {
			return Apple.class.newInstance();
			
		} else if(type.equalsIgnoreCase("banana")) {
			return Banana.class.newInstance();
		} else {
			System.out.println("找不到相应的实例化类");
			return null;
		}		
	}
}