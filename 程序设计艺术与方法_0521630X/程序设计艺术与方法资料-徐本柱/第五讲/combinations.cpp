#include <cstdlib>
#include <iostream>

#define inttype long long

using namespace std;

inttype gcd1(inttype a, inttype b) //insure a >= b > 0
{
    for (inttype c=a%b; c>0; c=a%b) {
        a = b;
        b = c;
    }
    return b;
}

inttype gcd(inttype a, inttype b)
{
    if (a >= b)
        return gcd1(a, b);
    else
        return gcd1(b, a);
}

inttype combinations(inttype m, inttype n) //insure m>=n
{
    if (m<0 || n<0 || m<n)
        return -1;
        
    if (n == 0)
        return 1;
        
    inttype result = m; //c(m, 1)
    for(inttype i=2, j=m-1; i<=n; ++i, --j) {
        inttype gcd_i_j = gcd(i, j);
        result = result/(i/gcd_i_j) * (j/gcd_i_j); //c(m,i)
        //result = result*j/i;
    }
    return result;
}

int main(int argc, char *argv[])
{
    cout << combinations(100,17) << endl;
    system("PAUSE");
    return EXIT_SUCCESS;
}
