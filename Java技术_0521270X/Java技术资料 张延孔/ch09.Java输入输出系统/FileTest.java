//File类基本使用示例，包括文件夹的使用
import java.io.File;
import java.io.IOException;

public class FileTest{
	public static void main(String args[]){
		try {
		
			File f = new File("C:" + File.separator + "hello" + File.separator +"1.txt");	
			if (f.exists()){ //如果文件存在
				System.out.println("文件长度 ： "+f.length());
				System.out.println("文件是否可执行 ：  "+f.canExecute());
				System.out.println("是否为文件 ： "+f.isFile());
				System.out.println("是否为文件夹 ： "+f.isDirectory());
				System.out.println("父文件夹是否为空 ： "+f.getParent().isEmpty());
			}else{
				//f.createNewFile();//不能直接创建子文件夹下的文件
				if (!f.getParentFile().exists()){//如果父路径文件不存在
					f.getParentFile().mkdir();
				}f.createNewFile();
			}
			
			///list()列出子文件和子文件夹的名称信息
			File f2 = new File("C:" + File.separator +"Intel");//指定一个文件夹
			if (f2.isDirectory()){
				String str[] = f2.list();
				for (int i =0;i<str.length;i++){
					System.out.println(str[i]);
				}
			}

			///listFiles()列出全部文件信息
			if (f2.isDirectory()){
				File f3[] = f2.listFiles();
				for (int i =0; i<f3.length; i++){
					System.out.println(f3[i]);//直接使用对象,使用toString()
				}
			}
			///
			
			///调用递归程序递归，列出包括嵌套子文件夹的文件和文件夹
			 FileTest.mylist(new File("c:"+File.separator ));
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
		
	//递归列出所有子文件和子文件夹，包括嵌套
	public static void mylist(File file) {
		if (file.isDirectory()) {//如果现在的路径是文件夹，则可能还有内容
			File f[] = file.listFiles();
			if (f!=null){
				for (int i =0; i<f.length; i++){
					mylist(f[i]);//向嵌套内继续列出
				}
			} else {
				System.out.println(file);//输出文件信息,使用toString()
			}
		}
	}
}