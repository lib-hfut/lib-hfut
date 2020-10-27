#include "StdAfx.h"
#include "math.h"
#include "Global_Funcs.h"


/*********************************************************************
功    能：在给定的DC上绘制一个像素点
参数含义：
          pDC     :Device Context
          x, y    :点的坐标，
		  clr     :点的颜色

返 回 值: 无

日    期: 2009-10-20
作    者: 罗月童
**********************************************************************/

void DrawPixel(CDC *pDC, int x, int y, COLORREF clr)
{
	
	// to create the new pen;
	CPen *pNewPen = new CPen;
	pNewPen->CreatePen(PS_SOLID, 1, clr);
	CPen *pOldPen = pDC->SelectObject(pNewPen);
	
	
	// To draw pixel;
	pDC->MoveTo(x-1, y);
	pDC->LineTo(x, y);
	
	//to restore the old pen
	pDC->SelectObject(pOldPen);
	pNewPen->DeleteObject();
	delete pNewPen;
}

/*********************************************************************
功    能：计算两点之间的欧拉距离
参数含义：
          P1, P2: 点的坐标

返 回 值: 欧拉距离

日    期: 2009-10-20
作    者: 罗月童
**********************************************************************/

double Distance(int P1[3], int P2[3])
{
	double dist = 0;
	for ( int i = 0; i < 3; i++)
	{
		dist += (P2[i] - P1[i]) * (P2[i] - P1[i]);
	}
	dist = sqrt(dist);
	return dist;
}

/*********************************************************************
功    能：在凸四边形中实现二次线性插值
参数含义：
          Vertices    : 四边形的四个顶点，按逆时针存储；
		  P           :点的坐标
		  uv:用于返回插值系数；

返 回 值: True-插值成功，Flase-插值失败（如果Pt不在四边形内部，则失败）

日    期: 2009-10-20
作    者: 罗月童
**********************************************************************/
bool BilinearInterpolation(int Vertices[4][3], 
						   int P[3], 
						   double uv[4])
{
	int i;
	for ( i = 0; i < 4; i++)
	{
		uv[i] = 0;
	}

	//首先判断P是否在某一个顶点上
	for ( i = 0; i < 4; i++)
	{
		if ( Distance(P, Vertices[i]) < 1.0e-6 )
		{
			uv[i] = 1;
			return true;               //直接返回；
		}
	}

	//如果不在顶点上，判断是否则在某条边上
	for ( i = 0; i < 4; i++)
	{
		double dist1, dist2, dist3;
		dist1 = Distance(P, Vertices[i]);
		dist2 = Distance(P, Vertices[(i+1)%4]);
		dist3 = Distance(Vertices[i], Vertices[(i+1)%4]);

		if ( fabs( dist1 + dist2 - dist3) < 1.0e-6 )
		{
			uv[i]       = dist2 / (dist1 + dist2);
			uv[(i+1)%4] = dist1 / (dist1 + dist2);
			return true;               //直接返回；
		}
	}

	//P既不在顶点上，也不处于边上

	int  IntersectionPoints[4][3], VerticesIndex[4][2];
	int  IntersectionPointsNum = 0;

	for ( i = 0; i < 4; i++)
	{
		if( fabs(P[1] - Vertices[i][1]) < 1.0E-6)
		{
			IntersectionPoints[IntersectionPointsNum][0] = 	Vertices[i][0];
			IntersectionPoints[IntersectionPointsNum][1] = 	Vertices[i][1];
			IntersectionPoints[IntersectionPointsNum][2] = 	Vertices[i][2];
			
			VerticesIndex[IntersectionPointsNum][0] = i;
			VerticesIndex[IntersectionPointsNum][1] = (i+1)%4;
			
			IntersectionPointsNum++;			
		}
		else if (  fabs(P[1] - Vertices[(i+1)%4][1]) < 1.0E-6  )
		{
			//do nothing;
		}
		else if ( (P[1] - Vertices[i][1]) * (P[1] - Vertices[(i+1)%4][1]) < 0 ) //存在交点
		{
			double t = double(P[1] -Vertices[i][1]) / 
				       double(Vertices[(i+1)%4][1] - Vertices[i][1]);

			IntersectionPoints[IntersectionPointsNum][0] = 
				      Vertices[i][0] + (Vertices[(i+1)%4][0] - Vertices[i][0])*t;

			IntersectionPoints[IntersectionPointsNum][1] = 
				 	  Vertices[i][1] + (Vertices[(i+1)%4][1] - Vertices[i][1])*t;

			IntersectionPoints[IntersectionPointsNum][2] = 
				      Vertices[i][2] + (Vertices[(i+1)%4][2] - Vertices[i][2])*t;

			VerticesIndex[IntersectionPointsNum][0] = i;
			VerticesIndex[IntersectionPointsNum][1] = (i+1)%4;

			IntersectionPointsNum++;
		}
	}
	if ( IntersectionPointsNum != 2)
	{
		return false;
	}
	else
	{
		double dist0, dist1;
		double u;
		//一次线性插值
		dist0 = Distance(P,IntersectionPoints[0]);
		dist1 = Distance(P,IntersectionPoints[1]);

		u = dist0 / (dist0 + dist1);


		//二次线性插值
		dist0 = Distance(IntersectionPoints[0], Vertices[VerticesIndex[0][0]]); //第一个交点
		dist1 = Distance(IntersectionPoints[0], Vertices[VerticesIndex[0][1]]);

		uv[VerticesIndex[0][0]] += (1-u) * dist1 / ( dist0 + dist1);
		uv[VerticesIndex[0][1]] += (1-u) * dist0 / ( dist0 + dist1);

		dist0 = Distance(IntersectionPoints[1], Vertices[VerticesIndex[1][0]]); //第二个交点
		dist1 = Distance(IntersectionPoints[1], Vertices[VerticesIndex[1][1]]);
		
		uv[VerticesIndex[1][0]] += u * dist1 / ( dist0 + dist1);
		uv[VerticesIndex[1][1]] += u * dist0 / ( dist0 + dist1);

		return true;
	}
}