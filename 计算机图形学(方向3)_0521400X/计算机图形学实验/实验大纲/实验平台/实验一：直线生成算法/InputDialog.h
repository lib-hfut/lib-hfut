#if !defined(AFX_INPUTDIALOG_H__CFF9D8CE_B586_450A_8F7C_7F1285FFBFA9__INCLUDED_)
#define AFX_INPUTDIALOG_H__CFF9D8CE_B586_450A_8F7C_7F1285FFBFA9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// InputDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CInputDialog dialog

class CInputDialog : public CDialog
{
// Construction
public:
	CInputDialog(int X0 = 0,
		         int Y0 = 0,
				 int X1 = 10,
				 int Y1 = 10,
		         CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CInputDialog)
	enum { IDD = IDD_INPUT };
	int		m_X0;
	int		m_X1;
	int		m_Y0;
	int		m_Y1;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInputDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CInputDialog)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_INPUTDIALOG_H__CFF9D8CE_B586_450A_8F7C_7F1285FFBFA9__INCLUDED_)
