// =============================================================================
// 
//       Filename:  dfs.cpp
// 
//    Description:  
// 
//        Version:  1.0
//        Created:  04/22/2012 11:04:07 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================

#include <iostream>
#include <cstdlib>
using namespace std;

const int MAX_SIZE = 25;

struct Pos
{
    int x, y;

    bool operator == (const Pos & rhs) const
    {
        return x == rhs.x && y == rhs.y;
    }
    bool operator != (const Pos & rhs) const
    {
        return !(*this == rhs);
    }
};

bool inside_judge(const Pos & pos, int n, int m)
{
    return 0 <= pos.x && pos.x < n && 0 <= pos.y && pos.y < m;
}
bool dfs(const Pos & now, const Pos & sink, int n, int m, int maze[][MAX_SIZE])
{
    if (now == sink) 
    {
        return true;
    }
    const int dir[4][2] = {{-1, 0}, {0, -1}, {1, 0}, {0, 1}};
    for (int ind = 0; ind < 4; ++ind) 
    {
        Pos next = now;
        next.x += dir[ind][0];
        next.y += dir[ind][1];
        if (inside_judge(next, n, m) && 0 == maze[next.x][next.y]) 
        {
            maze[next.x][next.y] = 1;
            if (dfs(next, sink, n, m, maze)) 
            {
                return true;
            }
            maze[next.x][next.y] = 0;
        }
    }
    return false;
}
void incubate()
{
    int n, m;
    int maze[MAX_SIZE][MAX_SIZE];
    Pos src, sink;
    bool ans;
    while (cin >> n >> m) 
    {
        for (int i = 0; i < n; ++i) 
        {
            for (int j = 0; j < m; ++j) 
            {
                cin >> maze[i][j];   //0 indicates an empty block, 
                                     //1 indicates a wall block,
                                     //2 indicates the start position,
                                     //3 indicates the target position.
            }
            
        }
        for (int i = 0; i < n; ++i) 
        {
            for (int j = 0; j < m; ++j) 
            {
                switch (maze[i][j]) 
                {
                    case 2: src.x = i, src.y = j, maze[i][j] = 1;
                    break;

                    case 3: sink.x = i, sink.y = j, maze[i][j] = 0;
                    break;
                    
                    default: 
                    break;
                }
            }
            
        }
        ans = dfs(src, sink, n, m, maze);
        if (ans) 
        {
            cout << "Connected!" << endl;
        }
        else
        {
            cout << "Disconnected!" << endl;
        }
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
2 0 0
0 1 0
1 3 0


*/
