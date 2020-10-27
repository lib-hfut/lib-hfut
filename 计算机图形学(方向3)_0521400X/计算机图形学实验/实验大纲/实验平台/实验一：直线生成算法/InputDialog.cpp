// InputDialog.cpp : implementation file
//

#include "stdafx.h"
#include "Experiment_Frame_One.h"
#include "InputDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CInputDialog dialog


CInputDialog::CInputDialog(int X0 /* = 0 */, 
						   int Y0 /* = 0 */, 
						   int X1 /* = 10 */, 
						   int Y1 /* = 10 */, 
						   CWnd* pParent /* = NULL */)
	: CDialog(CInputDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CInputDialog)
	m_X0 = X0;
	m_X1 = X1;
	m_Y0 = Y0;
	m_Y1 = Y1;
	//}}AFX_DATA_INIT
}


void CInputDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CInputDialog)
	DDX_Text(pDX, IDC_X0_EDIT, m_X0);
	DDX_Text(pDX, IDC_X1_EDIT, m_X1);
	DDX_Text(pDX, IDC_Y0_EDIT, m_Y0);
	DDX_Text(pDX, IDC_Y1_EDIT, m_Y1);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CInputDialog, CDialog)
	//{{AFX_MSG_MAP(CInputDialog)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CInputDialog message handlers
