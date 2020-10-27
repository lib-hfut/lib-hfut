// SettingDialog.cpp : implementation file
//

#include "stdafx.h"
#include "Polygon_Conversion.h"
#include "SettingDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSettingDialog dialog


CSettingDialog::CSettingDialog(COLORREF fillColor/* = RGB */,
							   BOOL bFillPolygon /*= TRUE*/, 
							   int iAlgorithm/* = 0*/, 
							   CWnd *pParent /*= NULL*/)
	: CDialog(CSettingDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSettingDialog)
	m_bFill_Polygon = bFillPolygon;
	m_iAlgorithm = iAlgorithm;
	//}}AFX_DATA_INIT
	m_FillColor = fillColor;
}


void CSettingDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSettingDialog)
	DDX_Control(pDX, IDC_COLOR_WND, m_ColorWnd);
	DDX_Check(pDX, IDC_FILLPOLYGON_CHECK, m_bFill_Polygon);
	DDX_Radio(pDX, IDC_X_SCAN_LINE_CONVERSION_ALGORITHM_RADIO, m_iAlgorithm);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSettingDialog, CDialog)
	//{{AFX_MSG_MAP(CSettingDialog)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSettingDialog message handlers

void CSettingDialog::OnOK() 
{
	m_FillColor = m_ColorWnd.m_Color;
	
	CDialog::OnOK();
}

BOOL CSettingDialog::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	m_ColorWnd.m_Color = this->m_FillColor;
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
