#include <cstdlib>
#include <iostream>
 
using namespace std;

int t,m,ans;
int countline[1001];
struct data
{
    int time;
    int price;
}med[101];

int indata()
{
  int i;
  cin>>t>>m;
  for(i=1;i<=m;i++)
    cin>>med[i].time>>med[i].price;
}

int count()
{
  int i,j,k;    
  memset(countline,0,sizeof(countline)) ;
  for(i=1;i<=m;i++)
    for(j=t;j>=1;j--)
      { 
        if (j>=med[i].time&&med[i].price+countline[j-med[i].time]>countline[j])
          countline[j]=med[i].price+countline[j-med[i].time];
      }
  ans=countline[t];    
}


int main(int argc, char *argv[]) 
{
    indata();
    count();
    cout<<ans<<endl; 
    system("PAUSE");
    return EXIT_SUCCESS;
}
