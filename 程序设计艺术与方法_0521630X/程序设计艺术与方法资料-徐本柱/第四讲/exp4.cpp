#include <cstdlib>
#include <iostream>
#include <math.h> 
using namespace std;

#define MAX_SIZE 1000
#define MAX 2000000 

struct Pos
{
    int x,y;
};
Pos allPos[MAX_SIZE];
int k[MAX_SIZE]; 
double dis[MAX_SIZE]; 

double GetDis(int i,int j)
{
    return sqrt((allPos[i].x-allPos[j].x)*(allPos[i].x-allPos[j].x)*1.0+(allPos[i].y-allPos[j].y)*(allPos[i].y-allPos[j].y)*1.0);
} 

double GetAllDis(int i,int j) 
{
    double dis=0;
    for (int jj=i+1;jj<=j;jj++)
        dis=dis+GetDis(jj-1,jj);
    return dis; 
}

double GetMinDis(int i,int n)
{
    double min=MAX;
    for (int j=i;j<=n-1;j++)
    {
        double nowmin=GetAllDis(i,j)+dis[j+1]+GetDis(j+1,i-1);
        if  (min>nowmin)
        {
            min=nowmin; 
            k[i]=j; 
        }
    } 
    return min; 
} 

int main(int argc, char *argv[]) 
{
    int n;
    int i,j;
    cin>>n;
    memset(allPos,-1,sizeof(allPos));
    memset(k,-1,sizeof(k));
    memset(dis,-1,sizeof(dis));
    for (i=0;i<n;i++)
        cin>>allPos[i].x>>allPos[i].y;
    allPos[n].x=allPos[0].x;
    allPos[n].y=allPos[0].y;

    for (i=0;i<=n;i++)
        for (j=i+1;j<=n;j++)
        {
            if (allPos[i].x>allPos[j].x)
            {
               int a=allPos[i].x;
               int b=allPos[i].y;
               allPos[i].x=allPos[j].x;
               allPos[i].y=allPos[j].y;
               allPos[j].x=a;
               allPos[j].y=b;
            }            
        }
    dis[n]=GetDis(n,n-1); 
    k[n]=n;
    for (i=n-1;i>0;i--) 
        dis[i]=GetMinDis(i,n); 

    cout<<dis[1]<<endl; 
    system("PAUSE");
    return EXIT_SUCCESS;
}

