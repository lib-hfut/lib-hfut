// ColorWnd.cpp : implementation file
//

#include "stdafx.h"
#include "Polygon_Conversion.h"
#include "ColorWnd.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CColorWnd

CColorWnd::CColorWnd()
{
	m_Color = RGB(255, 0, 0);
}

CColorWnd::~CColorWnd()
{
}


BEGIN_MESSAGE_MAP(CColorWnd, CStatic)
	//{{AFX_MSG_MAP(CColorWnd)
	ON_WM_PAINT()
	ON_WM_DRAWITEM()
	ON_WM_LBUTTONDOWN()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CColorWnd message handlers

void CColorWnd::OnPaint() 
{
	CPaintDC dc(this); // device context for painting

	CBrush *pNewBrush = new CBrush;
	pNewBrush->CreateSolidBrush(m_Color);

	CBrush *pOldBrush = dc.SelectObject(pNewBrush);

	CRect ClientRect;
	GetClientRect(&ClientRect);

	dc.Rectangle(&ClientRect);


	dc.SelectObject(pOldBrush);
	pNewBrush->DeleteObject();	
	// Do not call CStatic::OnPaint() for painting messages
}

void CColorWnd::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct) 
{
	// TODO: Add your message handler code here and/or call default
	
	CStatic::OnDrawItem(nIDCtl, lpDrawItemStruct);
}

void CColorWnd::OnLButtonDown(UINT nFlags, CPoint point) 
{
	CColorDialog ColorDialog;
	if ( ColorDialog.DoModal() == IDOK )
	{
		this->m_Color = ColorDialog.GetColor();
		Invalidate();
	}
	CStatic::OnLButtonDown(nFlags, point);
}
