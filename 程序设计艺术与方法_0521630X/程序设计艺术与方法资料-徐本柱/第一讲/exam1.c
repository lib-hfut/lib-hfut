#include <iostream>
#include <vector>

using namespace std;
vector<int> myV;


int main(int argc, char *argv[])
{    
    for (int i=0;i<10;i++)
        myV.push_back(i);

    vector<int>::iterator it;
    for (it=myV.begin();it!=myV.end();it++)
        cout<<(*it)<<' ';

    system("PAUSE");  //press any key to continue......
    return 0;
}
