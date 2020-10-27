void DrawPixel(CDC *pDC, int x, int y, COLORREF clr);
double Distance(int P1[3], int P2[3]);
bool   BilinearInterpolation(int Vertices[4][3], int P[3], double uv[4]);