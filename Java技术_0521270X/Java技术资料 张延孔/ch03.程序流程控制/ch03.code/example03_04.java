//Number2Month
//通过键盘输入月份，输出相应月份的英文单词
//注意月份是在命令行中给出的
package chapter3;

public class example03_04 {
  public static void main(String args[]){ 
    int month;
    month=Short.parseShort(args[0]);
    switch(month){
      case 1: System.out.println("January"); break;
      case 2: System.out.println("February"); break;
      case 3: System.out.println("March"); break;
      case 4: System.out.println("April"); break;
      case 5: System.out.println("May"); break;
      case 6: System.out.println("June"); break;
      case 7: System.out.println("July"); break;
      case 8: System.out.println("August"); break;
      case 9: System.out.println("September"); break;
      case 10: System.out.println("October"); break;
      case 11: System.out.println("Novenber"); break;
      case 12: System.out.println("December"); break;
      default: System.out.println("Input Number Error!!");break;}
    }
 }
