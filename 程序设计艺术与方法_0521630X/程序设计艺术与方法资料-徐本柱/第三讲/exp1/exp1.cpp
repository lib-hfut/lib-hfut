#include <cstdlib>
#include <iostream>
#include <vector> 
#include <fstream>

 
using namespace std;

struct Pos
{
   int x,y; 
};

struct Line
{
   Pos pos1,pos2; 
};

typedef vector<Line> AllLine; 

bool Across(Line linei, Line linej)
{
     bool flag1=false;
     bool flag2=false; 
     //第一步,快速排斥试验
     if ((max(linei.pos1.x,linei.pos2.x)>=min(linej.pos1.x,linej.pos2.x))&&(min(linei.pos1.x,linei.pos2.x)<=max(linej.pos1.x,linej.pos2.x))) 
        flag1=true;
     if ((max(linei.pos1.y,linei.pos2.y)>=min(linej.pos1.y,linej.pos2.y))&&(min(linei.pos1.y,linei.pos2.y)<=max(linej.pos1.y,linej.pos2.y))) 
        flag2=true;
        
     if (flag1 && flag2)
     {
        //第二步，跨立试验 
        int mul1,mul2;
        mul1=(linej.pos1.x-linei.pos1.x)*(linei.pos2.y-linei.pos1.y)-(linei.pos2.x-linei.pos1.x)*(linej.pos1.y-linei.pos1.y); 
        mul2=(linej.pos2.x-linei.pos1.x)*(linei.pos2.y-linei.pos1.y)-(linei.pos2.x-linei.pos1.x)*(linej.pos2.y-linei.pos1.y); 
        if ((mul1==0)||(mul2==0))
           return false;
        else if (mul1*mul2>0)
           return false;
        else
            return true;
     }
     else    
         return false; 
} 

int GetT(AllLine allLine)
{
    int T=0;
    for (int i=0;i<allLine.size();i++)
        for (int j=i+1;j<allLine.size();j++)
        {
            if (Across(allLine[i],allLine[j]))
               T++; 
        }
    return T; 
} 

int main(int argc, char *argv[]) 
{
    int w,h; //地图的宽度和高度 
    int L; //线段的数目
    AllLine allLine; 
    fstream inFile;
    inFile.open("DataofExp1.txt",ios::in);     
    inFile>>w>>h;
    inFile>>L;
    Line line;
    inFile>>line.pos1.x>>line.pos1.y;

    for (int i=1;i<=L;i++)
    {
        int x,y; 
        inFile>>x>>y;
        line.pos2.x=x; 
        line.pos2.y=y; 
        allLine.push_back(line);
        line.pos1.x=x; 
        line.pos1.y=y;          
    } 
    int nResult=GetT(allLine)+L+1; 
    cout<<nResult<<endl;
    system("PAUSE");
    return EXIT_SUCCESS;
}


