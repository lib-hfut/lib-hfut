//如何引用类方法
//注意本程序需要从命令行输入两个整型参数
public class Static_method {
    int width,height;
    public static double area(int width,int height) {
        return width*height;
    }
    public static void main(String args[]) {
        int i,j;
        double f;
        i=Integer.parseInt(args[0]);
        j=Integer.parseInt(args[1]);
        f= Static_method.area(i,j);
        System.out.println("Area="+i+"*"+j+"="+f);
    }
}