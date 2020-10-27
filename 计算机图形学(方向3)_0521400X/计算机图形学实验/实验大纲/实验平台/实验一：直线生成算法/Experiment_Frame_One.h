// Experiment_Frame_One.h : main header file for the EXPERIMENT_FRAME_ONE application
//

#if !defined(AFX_EXPERIMENT_FRAME_ONE_H__2F3D33C0_C24D_43E1_8278_F5BF6EA81E9B__INCLUDED_)
#define AFX_EXPERIMENT_FRAME_ONE_H__2F3D33C0_C24D_43E1_8278_F5BF6EA81E9B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CExperiment_Frame_OneApp:
// See Experiment_Frame_One.cpp for the implementation of this class
//

class CExperiment_Frame_OneApp : public CWinApp
{
public:
	CExperiment_Frame_OneApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CExperiment_Frame_OneApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CExperiment_Frame_OneApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EXPERIMENT_FRAME_ONE_H__2F3D33C0_C24D_43E1_8278_F5BF6EA81E9B__INCLUDED_)
