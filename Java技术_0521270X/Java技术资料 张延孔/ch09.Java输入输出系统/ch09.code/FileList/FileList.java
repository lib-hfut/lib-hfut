//该程序打印出C盘下A目录下的所有文件和子目录
//并按照目录层次缩进排列;  调用File类的listFiles()方法
import java.io.*;

public class FileList {
	public static void main(String args []){
			//创建File对象
			File f = new File("F:/A");//"F:/A");
			System.out.println(f.getName());
			tree(f, 1);
	}
	
	//递归、获取文件目录列表
	private static void tree(File f, int level) {
		String preStr = "";
	 	for (int i=0; i<level; i++ ) {//根据文件夹层次决定显示时缩进多少
			preStr += "    ";	
		}
		
		//列出当前目录的孩子（文件&子目录），调用File类的listFiles()方法 
		File[] childs = f.listFiles();
		
		for (int i=0; i<childs.length; i++) {
			System.out.println(preStr + childs[i].getName());
			//若是子目录，递归，找孩子的孩子
			if (childs[i].isDirectory()) {
				tree(childs[i], level + 1);	
			}
		}	
	}		
}