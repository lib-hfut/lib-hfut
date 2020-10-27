// Illumination.h : main header file for the ILLUMINATION application
//

#if !defined(AFX_ILLUMINATION_H__89EF86A9_4DEF_45BC_8E3D_8484F6D02014__INCLUDED_)
#define AFX_ILLUMINATION_H__89EF86A9_4DEF_45BC_8E3D_8484F6D02014__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CIlluminationApp:
// See Illumination.cpp for the implementation of this class
//

class CIlluminationApp : public CWinApp
{
public:
	CIlluminationApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIlluminationApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CIlluminationApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ILLUMINATION_H__89EF86A9_4DEF_45BC_8E3D_8484F6D02014__INCLUDED_)
