#if !defined(AFX_COLORWND_H__534D47C0_4691_49E3_B338_E0103D76E25E__INCLUDED_)
#define AFX_COLORWND_H__534D47C0_4691_49E3_B338_E0103D76E25E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ColorWnd.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CColorWnd window

class CColorWnd : public CStatic
{
// Construction
public:
	CColorWnd();

// Attributes
public:
	COLORREF  m_Color;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CColorWnd)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CColorWnd();

	// Generated message map functions
protected:
	//{{AFX_MSG(CColorWnd)
	afx_msg void OnPaint();
	afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_COLORWND_H__534D47C0_4691_49E3_B338_E0103D76E25E__INCLUDED_)
