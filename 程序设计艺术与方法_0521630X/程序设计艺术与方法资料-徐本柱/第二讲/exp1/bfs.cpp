// =============================================================================
// 
//       Filename:  bfs.cpp
// 
//    Description:  
// 
//        Version:  1.0
//        Created:  04/23/2012 10:42:49 PM
//       Revision:  none
//       Compiler:  g++
// 
//         Author:  SphinX (Geek), topcodersphinx@gmail.com
//        Company:  HFUT
// 
// =============================================================================


#include <queue>
#include <memory>
#include <cstdlib>
#include <cstring>
#include <iostream>
using namespace std;

const int MAX_SIZE = 25;
const int INF_INT = 0x3f3f3f3f;

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
int bfs(const Pos & src, const Pos & sink, int n, int m, int maze[][MAX_SIZE])
{
    const int dir[4][2] = {{-1, 0}, {0, -1}, {1, 0}, {0, 1}};
    int dp[MAX_SIZE][MAX_SIZE];
    queue<Pos> que;
    que.push(src);
    memset(dp, INF_INT, sizeof(dp));
    dp[src.x][src.y] = 0;
    while (!que.empty()) 
    {
        Pos now = que.front();
        que.pop();
        if (now == sink) 
        {
            return dp[sink.x][sink.y];
        }
        for (int ind = 0; ind < 4; ++ind) 
        {
            Pos next = now;
            next.x += dir[ind][0];
            next.y += dir[ind][1];
            if (inside_judge(next, n, m) && 0 == maze[next.x][next.y]) 
            {
                if (dp[now.x][now.y] + 1 < dp[next.x][next.y]) 
                {
                    dp[next.x][next.y] = dp[now.x][now.y] + 1;
                    que.push(next);
                }
            }
        }
    }
    return -1;
}
void incubate()
{
    int n, m;
    int maze[MAX_SIZE][MAX_SIZE];
    Pos src, sink;
    int ans;
    while (cin >> n >> m) 
    {
        for (int i = 0; i < n; ++i) 
        {
            for (int j = 0; j < m; ++j) 
            {
                cin >> maze[i][j];
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
        ans = bfs(src, sink, n, m, maze);
        if (-1 == ans) 
        {
            cout << "Disconnected!" << endl;
        }
        else
        {
            cout << "The miminum distance from start point to target point is" 
                 << ans << endl;
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
1 0 1
3 0 1

3 3
2 0 0
1 1 1
3 0 1


 */
