// Freeform_CurveView.h : interface of the CFreeform_CurveView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_FREEFORM_CURVEVIEW_H__A6F46671_4B80_471A_85A8_36883F724928__INCLUDED_)
#define AFX_FREEFORM_CURVEVIEW_H__A6F46671_4B80_471A_85A8_36883F724928__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CFreeform_CurveView : public CView
{
protected: // create from serialization only
	CFreeform_CurveView();
	DECLARE_DYNCREATE(CFreeform_CurveView)

// Attributes
public:
	CFreeform_CurveDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFreeform_CurveView)
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
	virtual ~CFreeform_CurveView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	int m_Point_Num;
	int m_Points[MAX_POINT_NUMBER][2];

	int m_CurveTypes[6];   //标记不同曲线的类型
	int m_Curve_Ranks[6];  //标记不同曲线的阶次


protected:
	CDC *m_pDC;            //Pointer to the current Device Context;

private:
	int      m_Point_Size;
	BOOL     m_bShow_ControlPoint;
	COLORREF m_Point_Color;
	

	BOOL     m_bShow_ControlPolygon;
	COLORREF m_ControlPolygon_Color;

	BOOL     m_bShowCurves[6];
	int      m_nWidth;
	COLORREF m_CurveColors[6];

	BOOL     m_bInputting;	
private:

	void DrawPoint(int x, int y);
	void DrawSegment(int x0, int y0, int x1, int y1,CPen *pNewPen);
	void DrawControlPolygon(CDC *pDC);
	void DrawAllControlPoints();

private:
	void  BSpline( int m , int nSplineType, int nWidth, COLORREF clr);

private:

	bool  Create_Nodes_Vector(int    n,   int    m, 
							  int    SplineType, 
							  float  nodes[]);
	float BKM(float t, int k, int m, float nodes[]);

private:
	float Divide(float l_operand, float r_operand);
	void  DrawSplineCurve(int n, 
		                  int m, 
						  float nodes[], 
						  int SamplePointNumber, 
		                  int nWidth, 
						  COLORREF clr);

// Generated message map functions
protected:
	//{{AFX_MSG(CFreeform_CurveView)
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnFunctionInput();
	afx_msg void OnUpdateFunctionInput(CCmdUI* pCmdUI);
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnFunctionSetting();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in Freeform_CurveView.cpp
inline CFreeform_CurveDoc* CFreeform_CurveView::GetDocument()
   { return (CFreeform_CurveDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FREEFORM_CURVEVIEW_H__A6F46671_4B80_471A_85A8_36883F724928__INCLUDED_)
