 public class MainClass {
    public static void main(String[] args)  throws Exception { 
          //简单工厂方法创建水果对象	
          Fruit apple = FruitFactory.getFruit("Apple");
          Fruit banana = FruitFactory.getFruit("Banana");
          //调用水果对象方法
          apple.get();
          banana.get();	
    }
 }
