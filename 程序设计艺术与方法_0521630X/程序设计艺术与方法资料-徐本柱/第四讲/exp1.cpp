#include <cstdlib>
#include <iostream>
#include <time.h>

using namespace std;


int f(int n)
{
    if ((n==0)||(n==1))
       return 1;
    return f(n-1)+f(n-2);
}

int main(int argc, char *argv[])
{
    clock_t start, finish; 
    start = clock(); 
    cout<<f(42)<<endl;
    finish = clock(); 
    double duration = (double)(finish - start) / CLOCKS_PER_SEC; 
    cout<<duration<<" seconds"<<endl;
    system("PAUSE");
    return EXIT_SUCCESS;
}
