// =============================================================================
// 
//       Filename:  stl_priority_queue.cpp
// 
//    Description:  Basic operations of STL priority_queue
// 
//        Version:  1.0
//        Created:  04/14/2012 11:47:08 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================

#include <queue>
#include <cstdlib>
#include <iostream>
using namespace std;

int main(int argc, char *argv[]) 
{
    int n, op, data;
    priority_queue< int, vector<int>, less<int> > PQ;
    while (cin >> n)    //n operations
    {
        while (!PQ.empty()) 
        {
            PQ.pop();
        }
        for (int i = 0; i < n; ++i) 
        {
            cin >> op;
            if (0 == op)    //if op = 0, push a data into the priority_queue
            {
                 cin >> data;
                 PQ.push(data);
            }
            else 
            {
                PQ.pop();
            }
            cout << "Currently, the maximum element in the priority_queue is ";
            cout << PQ.top() << endl;
        }
    }
    return EXIT_SUCCESS;
}
