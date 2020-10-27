#if !defined(AFX_SETTINGDLG_H__B841A776_DE0E_4B98_976F_7F3982217785__INCLUDED_)
#define AFX_SETTINGDLG_H__B841A776_DE0E_4B98_976F_7F3982217785__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SettingDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSettingDlg dialog
#include "ColorWnd.h"

class CSettingDlg : public CDialog
{
// Construction
public:
	CSettingDlg(int      ControlPoint_Size,
		        COLORREF ControlPoint_Color,
				BOOL     bShowControlPoint,

				BOOL     bShowControlPolygon,
				COLORREF ControlPolygon_Color,

				int      nCurveWidth,
				BOOL     bShowCurves[6],
				COLORREF CurveColors[6],
				CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSettingDlg)
	enum { IDD = IDD_SETTING_DIALOG };
	CColorWnd	m_Control_Polygon_Color_Wnd;
	CColorWnd	m_ControlPoint_Color_Wnd;
	int		    m_nCurveWidth;
	int		    m_nControlPoint_Size;
	BOOL	    m_bShowControlPoint;
	BOOL	    m_bShowControlPolygon;
	//}}AFX_DATA
	CColorWnd	m_Curve_Colors_Wnd[6];

	COLORREF    m_ControlPoint_Color;
	COLORREF    m_ControlPolygon_Color;
	COLORREF    m_CurveColors[6];
	BOOL        m_bShowCurves[6];


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSettingDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSettingDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnCancelMode();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETTINGDLG_H__B841A776_DE0E_4B98_976F_7F3982217785__INCLUDED_)
