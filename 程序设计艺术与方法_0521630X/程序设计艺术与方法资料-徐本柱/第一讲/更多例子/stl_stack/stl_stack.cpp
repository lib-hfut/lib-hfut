// =============================================================================
// 
//       Filename:  STL_stack.cpp
// 
//    Description:  Basic operations of STL stack
// 
//        Version:  1.0
//        Created:  04/14/2012 11:01:19 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================

#include <stack>
#include <vector>
#include <string>
#include <cstdlib>
#include <iostream>
using namespace std;


int main(int argc, char *argv[]) 
{
    int n, data;
    stack<int> S;
    cin >> n;
    for (int i = 0; i < n; ++i) 
    {
        cin >> data;
        S.push(data);
    }
    cout << "The size of the stack is " << S.size() << endl;
    while (!S.empty()) 
    {
        cout << S.top() << endl;    //get the top element in the stack
        S.pop();                    //pop the top element in the stack
    }
    return EXIT_SUCCESS;
}
