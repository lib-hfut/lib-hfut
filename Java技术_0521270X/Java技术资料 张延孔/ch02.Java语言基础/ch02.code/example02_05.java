//通过比较字符串，将字符串比较结果输出
public class example02_05 {
  public static void main(String args[]){
    int time=10;//上班时间
    String week="Monday";
    if(week=="Sunday"|week=="Saturday")
    System.out.println("今天我休息");
    else
    if(time>8 && time<12)
    System.out.println("今天你迟到了");
  }
}
