// =============================================================================
// 
//       Filename:  prim.cpp
// 
//    Description:  
// 
//        Version:  1.0
//        Created:  04/24/2012 01:12:56 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================

#include <memory>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <algorithm>
using namespace std;

const int MAX_VERTEX_NUM = 104;
const int INF_INT = 0x3f3f3f3f;

int prim(int maze[][MAX_VERTEX_NUM], int n)
{
    bool hs[MAX_VERTEX_NUM];
    int cnt = 0, ret = 0;
    int que[MAX_VERTEX_NUM];
    memset(hs, false, sizeof(hs));
    hs[0] = true;
    que[cnt++] = 0;
    while (cnt < n) 
    {
        int end = cnt;
        int min_path = INF_INT;
        int v;
        for (int j = 0; j < end; ++j) 
        {
            int t = que[j];
            for (int i = 0; i < n; ++i) 
            {
                if (!hs[i] && maze[t][i] < min_path) 
                {
                    min_path = maze[t][i];
                    v = i;
                }
            }
        }
        if (min_path < INF_INT) 
        {
            hs[v] = true;
            que[cnt++] = v;
            ret += min_path;
        }
    }
    return ret;
}
void incubate()
{
    int n, m;
    int maze[MAX_VERTEX_NUM][MAX_VERTEX_NUM];
    int u, v, w;
    while (cin >> n >> m) 
    {
        memset(maze, INF_INT, sizeof(maze));
        for (int i = 0; i < m; ++i) 
        {
            cin >> u >> v >> w;
            maze[u][v] = maze[v][u] = min(maze[u][v], w);
        }
        cout << prim(maze, n) << endl;
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
0 1 2
1 2 3
0 2 1


 */
