// Polygon_ConversionView.h : interface of the CPolygon_ConversionView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_POLYGON_CONVERSIONVIEW_H__CF6286A6_FB84_485C_9349_019E3DD79747__INCLUDED_)
#define AFX_POLYGON_CONVERSIONVIEW_H__CF6286A6_FB84_485C_9349_019E3DD79747__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


#define  MAX_VERTEX_NUMBER 100
class CPolygon_ConversionView : public CView
{
protected: // create from serialization only
	CPolygon_ConversionView();
	DECLARE_DYNCREATE(CPolygon_ConversionView)

// Attributes
public:
	CPolygon_ConversionDoc* GetDocument();
	CDC                   *m_pDC;

// Operations
protected:
	int  m_Vertices[MAX_VERTEX_NUMBER][2];   //多边形顶点列表
	int  m_Vertex_Number;

	COLORREF m_Fill_Color;
	BOOL     m_bFillPolygon;
	int      m_iFillAlgorithm;     

protected:
	BOOL    m_bInputting_Polygon;
	CPoint  m_PrePoint;

protected:
	void DrawPolygonOutline(CDC *pDC);
	void X_Scan_Line_Conersion(int Vertices[][2], int VertexNum);
	void Active_Edge_Table_Conersion(int Vertices[][2], int VertexNum);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPolygon_ConversionView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CPolygon_ConversionView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	void DrawPixel(int x, int y);
	//{{AFX_MSG(CPolygon_ConversionView)
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnViewInputPolygon();
	afx_msg void OnUpdateViewInputPolygon(CCmdUI* pCmdUI);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnViewSetting();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in Polygon_ConversionView.cpp
inline CPolygon_ConversionDoc* CPolygon_ConversionView::GetDocument()
   { return (CPolygon_ConversionDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_POLYGON_CONVERSIONVIEW_H__CF6286A6_FB84_485C_9349_019E3DD79747__INCLUDED_)
