// =============================================================================
// 
//       Filename:  kruskal.cpp
// 
//    Description:  
// 
//        Version:  1.0
//        Created:  04/23/2012 11:00:14 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================

#include <cstdlib>
#include <iostream>
#include <algorithm>
using namespace std;

const int MAX_VERTEX_NUM = 104;
const int MAX_EDGE_NUM = 10004;

struct Edge
{
    int u, v, w;    //u indicates the begin point of an edge, 
                    //v indicates the end point of an edge,
                    //w indicates the value of an edge;
};

bool edges_cmp(const Edge & lhs, const Edge & rhs)
{
    return lhs.w < rhs.w;
}
void ufset_init(int ufset[], int n)
{
    for (int i = 0; i < n; ++i) 
    {
        ufset[i] = i;
    }
    return ;
}
int ufset_find(int x, int ufset[])
{
    int t = x;
    while (x != ufset[x]) 
    {
        x = ufset[x];
    }
    while (t != x)      //compress the path
    {
        int buf = ufset[t];
        ufset[t] = x;
        t = buf;
    }
    return x;
}
void ufset_union(int x, int y, int ufset[])
{
    int _x = ufset_find(x, ufset), _y = ufset_find(y, ufset);
    if (_x < _y) 
    {
        ufset[_y] = _x;
    }
    else
    {
        ufset[_x] = _y;
    }
    return ;
}
void incubate()
{
    int n, m;
    Edge edges[MAX_EDGE_NUM];
    int ufset[MAX_VERTEX_NUM];  //disjoint set data structure
    int sum;
    while (cin >> n >> m)   // n is the number of vertexes, 
                            // m is the number of edges.
    {
        for (int i = 0; i < m; ++i) 
        {
            cin >> edges[i].u >> edges[i].v >> edges[i].w;
        }
        sort(edges, edges + m, edges_cmp);
        ufset_init(ufset, n);
        sum = 0;
        for (int i = 0, k = 0; i < m && k < n - 1; ++i) 
        {
            int u = edges[i].u;
            int v = edges[i].v;
            if (ufset_find(u, ufset) != ufset_find(v, ufset)) 
            {
                sum += edges[i].w;
                ++k;
                ufset_union(u, v, ufset);
            }
        }
        cout << "The sum cost of this MST Problem is " << sum << endl;
    }
    return ;
}
int main(int argc, char *argv[]) 
{
    incubate();
    return EXIT_SUCCESS;
}


/*

3 3
0 1 4
1 2 6
0 2 8



 */
