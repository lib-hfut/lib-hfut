import java.io.BufferedReader;
import java.io.InputStreamReader;

public class BufferedReaderDemo {

	public static void main(String[] args) throws Exception {
		BufferedReader buf = null;
		// 将字节输入流变为字符输入流放在字符流的缓冲区之中
		buf = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("请输入内容：");
		String str = buf.readLine();
		System.out.println("输入的内容是：" + str);
	}

}
