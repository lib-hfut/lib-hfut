#include <cstdlib>
#include <iostream>
#include <time.h>

using namespace std;

long dp[700];	//用于保存f(n)的结果

int f(int n)
{
    if(dp[n]) return dp[n];	//如果问题已经被求解，则直接返回结果
    long nResult;
    if ((n==0)||(n==1))
       nResult=1;
    else
       nResult=f(n-2)+f(n-1);
	return dp[n] = nResult;	//记录问题的解，并返回
}

int main(int argc, char *argv[])
{
    clock_t start, finish; 
    start = clock(); 
    memset(dp, 0, sizeof(dp));	//初始化结果集
    cout<<f(700)<<endl;
    finish = clock(); 
    double duration = (double)(finish - start) / CLOCKS_PER_SEC; 
    cout<<duration<<"seconds"<<endl;
    system("PAUSE");
    return EXIT_SUCCESS;
}
