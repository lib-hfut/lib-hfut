#include <cstdlib>
#include <iostream>


using namespace std;


int main(int argc, char *argv[])
{
    int c[124], d[124]; 
    int n,i,j,k; 
    while(cin>>n) 
    { 
      //对于 1+x+x^2+x^3+ 他们所有的系数都是 1 
      // 而 c2全部被初始化为0是因为以后要用到 c2[i] += x ;                   
      for(i = 0; i <= n; i++) 
      { 
           c[i] = 1; 
           d[i] = 0; 
      } 
      //第一层循环是一共有 n 个小括号，而刚才已经算过一个了
      //所以是从2 到 n 
      for(i = 2; i <= n; i++) 
            // 第二层循环是把每一个小括号里面的每一项，都要与前一个
            //小括号里面的每一项计算。       
           for(j = 0; j <= n; j++) 
                  //第三层小括号是要控制每一项里面 X 增加的比例 
                  // 这就是为什么要用 k+= i ; 
                 for(k = 0; k + j <= n; k += i) 
                       d[j + k] += c[j];    // 合并同类项，他们的系数要加在一起

      for(j = 0; j <= n; j++) 
      { 
           c[j] = d[j]; 
           d[j] = 0; 
      } 
      cout<<c[n]<<endl; 
    } 
    

    system("PAUSE");
    return EXIT_SUCCESS;
}
