/**
  * 比较两个字符串是否含有共同的子字符串
  * 返回找到的最大字串和循环次数
  * 思路动态规划中的 LCS问题
  *  */


public class hasSameSubStr2 {
    
    public static void check(String str1, String str2) {
        Boolean bool = false;
        String a = str1.length() <= str2.length() ? str1 : str2;
        String b = str1.length() <= str2.length() ? str2 : str1;
        int lena = a.length();
        int flag = 0;
        int num = 2;
        String sub = "";
        int ln = 0;
        
        for(int i = flag; i < lena - 1; i++) {
            for(int n = num; n <= lena - i; n++) {
                String c = a.substring(i, i + n);
                int t = b.indexOf(c);
                if(t != -1) {
                    bool = true;
                    flag = i;
                    if(n > sub.length()) {
                        sub = c;                        
                    }
                }else {
                    flag++;
                    break;
                }
                ln++;
            }
            if(sub.length() >= num) {
                num = sub.length();
            }
            ln++;
        }
        String cunzai = "不存在";
        if(bool) {
            cunzai = "存在";
        }
        System.out.println(cunzai);
        if(bool) {
            System.out.println("最长共同子串：" + sub);
        }
        System.out.println("共循环" + ln + "次");
    }

    public static void main(String[] args) {        
        String str1 = "abcabcdabcde";
        String str2 = "abceabcdeabcdef";
        check(str1, str2);
    }
}