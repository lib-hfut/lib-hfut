#if !defined(AFX_SETTINGDLG_H__E0E7A658_7DDB_4354_AC95_72067D2A8F08__INCLUDED_)
#define AFX_SETTINGDLG_H__E0E7A658_7DDB_4354_AC95_72067D2A8F08__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SettingDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSettingDlg dialog

class CSettingDlg : public CDialog
{
// Construction
public:
	CSettingDlg(int      iPointSize = 5,  
		        COLORREF PointColor = RGB(255,0,0),
				int      iActiveAlgorithm = 0,
				BOOL     bGridOn  = TRUE,
				CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSettingDlg)
	enum { IDD = IDD_SETTING };
	CComboBox	m_Algorithms;
	int		m_Point_Size;
	BOOL	m_bGridOn;
	//}}AFX_DATA
	COLORREF m_Point_Color;
	int      m_iActive_Algorithm;


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
	afx_msg void OnPcolorButton();
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeAlgorithmCombo();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETTINGDLG_H__E0E7A658_7DDB_4354_AC95_72067D2A8F08__INCLUDED_)
