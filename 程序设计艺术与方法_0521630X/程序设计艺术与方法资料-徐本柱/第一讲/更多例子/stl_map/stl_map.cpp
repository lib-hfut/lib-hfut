// =============================================================================
// 
//       Filename:  stl_map.cpp
// 
//    Description:  A simple telephone directory
// 
//        Version:  1.0
//        Created:  04/14/2012 11:33:41 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================


#include <map>
#include <string>
#include <utility>
#include <cstdlib>
#include <iostream>
using namespace std;

int main(int argc, char *argv[]) 
{
    int n, m;
    string name;
    int phone_id;
    map<string, int> hs;
    while (cin >> n >> m) 
    {
        hs.clear();
        for (int i = 0; i < n; ++i) 
        {
            cin >> name >> phone_id;
            hs.insert(pair<string, int>(name, phone_id));
        }
        cout << "List:" << endl;
        for (map<string, int>::iterator it = hs.begin(); it != hs.end(); ++it) 
        {
            cout << it->first << " " << it->second << endl;
        }
        while (m--) 
        {
            cin >> name;
            if (hs.find(name) != hs.end())
            {
                cout << hs[name] << endl;
            }
            else
            {
                cout << "No such peron in your telephone directory." << endl;
            }
        }
    }
    return EXIT_SUCCESS;
}
