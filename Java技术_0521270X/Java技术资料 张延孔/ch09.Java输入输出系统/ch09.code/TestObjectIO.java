//ObjectOutputStream和ObjectInputStream类的例子，用于串行化保存和读取对象
import java.io.*;

public class TestObjectIO {
	public static void main(String args[]) throws Exception {
		T t = new T();
		t.k = 8;
		FileOutputStream fos = new FileOutputStream("d:/share/java/io/testobjectio.dat");
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		oos.writeObject(t);
		oos.flush();
		oos.close();
		
		FileInputStream fis = new FileInputStream("d:/share/java/io/testobjectio.dat");
		ObjectInputStream ois = new ObjectInputStream(fis);
		T tReaded = (T)ois.readObject();
		System.out.println(tReaded.i + " " + tReaded.j + " " + tReaded.d + " " + tReaded.k);		
	}
}

class T implements Serializable {
	int i = 10;
	int j = 9;
	double d = 2.3;
	transient int k = 15;
}