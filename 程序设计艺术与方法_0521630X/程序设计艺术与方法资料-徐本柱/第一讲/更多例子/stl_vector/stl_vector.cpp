// =============================================================================
// 
//       Filename:  stl_vector.cpp
// 
//    Description:  Basic operations of STL vector
// 
//        Version:  1.0
//        Created:  04/14/2012 11:26:30 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================

#include <cstdio>
#include <vector>
#include <cstdlib>
#include <iostream>
using namespace std;

int main(int argc, char *argv[]) 
{
    vector<int> arr;
    int n, data;
    while (cin >> n) 
    {
        arr.clear();    //clean the array
        if (arr.empty()) 
        {
            cout << "It's empty!" << endl;
        }
        for (int i = 0; i < n; ++i) 
        {
            cin >> data;
            arr.push_back(data);
        }
        cout << "The size of the array is " << arr.size() << endl;
        cout << "All the element(s) in the array is(are) ";
        for (vector<int>::iterator it = arr.begin(); it != arr.end(); ++it) 
        {
            cout << *it << " ";
        }
        cout << endl;
    }
    return EXIT_SUCCESS;
}
