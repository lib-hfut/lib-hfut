#if !defined(AFX_SETTINGDIALOG_H__5FD505FA_04DE_4BB0_9A62_5E8B9A428D9C__INCLUDED_)
#define AFX_SETTINGDIALOG_H__5FD505FA_04DE_4BB0_9A62_5E8B9A428D9C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SettingDialog.h : header file
//

#include "ColorWnd.h"

/////////////////////////////////////////////////////////////////////////////
// CSettingDialog dialog

class CSettingDialog : public CDialog
{
// Construction
public:
	CSettingDialog(COLORREF fillColor= RGB(255, 0,0), BOOL bFillPolygon = TRUE, int iAlgorithm = 0,CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSettingDialog)
	enum { IDD = IDD_SETTING };
	CColorWnd	m_ColorWnd;
	BOOL	m_bFill_Polygon;
	int		m_iAlgorithm;
	//}}AFX_DATA
	COLORREF m_FillColor;


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSettingDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSettingDialog)
	virtual void OnOK();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETTINGDIALOG_H__5FD505FA_04DE_4BB0_9A62_5E8B9A428D9C__INCLUDED_)
