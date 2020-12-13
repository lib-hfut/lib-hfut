// Freeform_Curve.h : main header file for the FREEFORM_CURVE application
//

#if !defined(AFX_FREEFORM_CURVE_H__A7E2CBA2_C191_40B7_BE39_A9F5752DAD16__INCLUDED_)
#define AFX_FREEFORM_CURVE_H__A7E2CBA2_C191_40B7_BE39_A9F5752DAD16__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CFreeform_CurveApp:
// See Freeform_Curve.cpp for the implementation of this class
//

class CFreeform_CurveApp : public CWinApp
{
public:
	CFreeform_CurveApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFreeform_CurveApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CFreeform_CurveApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FREEFORM_CURVE_H__A7E2CBA2_C191_40B7_BE39_A9F5752DAD16__INCLUDED_)
