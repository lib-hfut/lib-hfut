#include <cstdlib>
#include <iostream>
 
using namespace std;

#define MAX_SIZE 1000

int main(int argc, char *argv[]) 
{
    int Catalan[MAX_SIZE];
    int n;
    cin>>n;
    memset(Catalan,0,sizeof(Catalan));
    
    Catalan[2]=1;
    for (int i=3;i<=n;i++)
        for (int j=2;j<=i-1;j++)
            Catalan[i]=Catalan[i]+Catalan[j]*Catalan[i-j+1];
    cout<<Catalan[n]<<endl;
    system("PAUSE");
    return EXIT_SUCCESS;
}

