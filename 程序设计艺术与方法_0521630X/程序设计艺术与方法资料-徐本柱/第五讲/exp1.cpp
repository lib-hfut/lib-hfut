#include <cstdlib>
#include <iostream>
 
using namespace std;

#define MAX_SIZE 1000

int main(int argc, char *argv[]) 
{
    int nRedNum[MAX_SIZE];
    int n,m;
    cin>>n>>m;
    memset(nRedNum,0,sizeof(nRedNum));
    for (int i=0;i<m;i++)
    {
        int pos1,pos2;
        cin>>pos1>>pos2;
        nRedNum[pos1]++;
        nRedNum[pos2]++;
    }
    int Q=0;
    for (int i=0;i<n;i++)
        Q=Q+nRedNum[i]*(n-1-nRedNum[i]);
    int R=n*(n-1)*(n-2)/6-Q/2;
    cout<<R<<endl;    
    system("PAUSE");
    return EXIT_SUCCESS;
}
/*
5 3
0 3
1 2
2 3
*/