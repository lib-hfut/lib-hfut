// Experiment_Frame_OneView.h : interface of the CExperiment_Frame_OneView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_EXPERIMENT_FRAME_ONEVIEW_H__0CF6B8B3_4F61_4827_911C_6893C7AC5135__INCLUDED_)
#define AFX_EXPERIMENT_FRAME_ONEVIEW_H__0CF6B8B3_4F61_4827_911C_6893C7AC5135__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CExperiment_Frame_OneView : public CView
{
protected: // create from serialization only
	CExperiment_Frame_OneView();
	DECLARE_DYNCREATE(CExperiment_Frame_OneView)

// Attributes
public:
	CExperiment_Frame_OneDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CExperiment_Frame_OneView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL
protected:
	void DDA(int X0, int Y0, int X1, int Y1);
	void Mid_Bresenham(int X0, int Y0, int X1, int Y1);

protected://服务函数和变量
	void DrawPixel(int x, int y);
	void DrawGrid(CDC *pDC);
	int  X0,  Y0,  X1,  Y1;

// Implementation
public:
	virtual ~CExperiment_Frame_OneView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	bool      m_bGridOn;
	int       m_iMarginSize;
	int       m_iPointSize;
	COLORREF  m_PointColor;
	int       m_iActive_Algorithm;
	

// Generated message map functions
protected:
	//{{AFX_MSG(CExperiment_Frame_OneView)
	afx_msg void OnSetting();
	afx_msg void OnInput();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in Experiment_Frame_OneView.cpp
inline CExperiment_Frame_OneDoc* CExperiment_Frame_OneView::GetDocument()
   { return (CExperiment_Frame_OneDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EXPERIMENT_FRAME_ONEVIEW_H__0CF6B8B3_4F61_4827_911C_6893C7AC5135__INCLUDED_)
