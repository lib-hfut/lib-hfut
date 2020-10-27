// SettingDialog.cpp : implementation file
//

#include "stdafx.h"
#include "illumination.h"
#include "SettingDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSettingDialog dialog


CSettingDialog::CSettingDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CSettingDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSettingDialog)
	m_nLongitude_Grids = 0;
	m_nLatitude_Grids = 0;
	m_Ka = 0.0;
	m_Kd = 0.0;
	m_nGridLineThickness = 0;
	m_Ia = 0.0;
	m_Id = 0.0;
	m_fLen = 0.0f;
	m_fAngleToXOY = 0.0;
	m_nShadingMode = -1;
	m_bShowGridLine = FALSE;
	m_bAmbientLight = FALSE;
	m_bDiffuseLight = FALSE;
	m_fAngleOnXOYProjectionToX = 0.0;
	//}}AFX_DATA_INIT

	m_AmbientLightColor = RGB(0,0,255);
	m_DiffuseLightColor  = RGB(0,255,0);
	m_GridLineColor      = RGB(255,255,255);
	
}


void CSettingDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSettingDialog)
	DDX_Text(pDX, IDC_LONGITUDE_GRIDS, m_nLongitude_Grids);
	DDV_MinMaxInt(pDX, m_nLongitude_Grids, 10, 50);
	DDX_Text(pDX, IDC_LATITUDE_GRIDS, m_nLatitude_Grids);
	DDV_MinMaxInt(pDX, m_nLatitude_Grids, 5, 10);
	DDX_Text(pDX, IDC_KA, m_Ka);
	DDV_MinMaxDouble(pDX, m_Ka, 0., 1.);
	DDX_Text(pDX, IDC_KD, m_Kd);
	DDV_MinMaxDouble(pDX, m_Kd, 0., 1.);
	DDX_Control(pDX, IDC_GRID_LINE_COLOR_WND, m_GridLineColorWnd);
	DDX_Text(pDX, IDC_GRID_LINE_WIDTH, m_nGridLineThickness);
	DDV_MinMaxInt(pDX, m_nGridLineThickness, 1, 5);
	DDX_Control(pDX, IDC_AMBIENT_LIGHT_COLOR_WND, m_AmbientLightColorWnd);
	DDX_Text(pDX, IDC_IA, m_Ia);
	DDV_MinMaxDouble(pDX, m_Ia, 0., 1000.);
	DDX_Text(pDX, IDC_ID, m_Id);
	DDV_MinMaxDouble(pDX, m_Id, 0., 1000.);
	DDX_Control(pDX, IDC_DIFFUSE_LIGHT_COLOR_WND, m_DiffuseLightColorWnd);
	DDX_Text(pDX, IDC_LENGHT, m_fLen);
	DDV_MinMaxFloat(pDX, m_fLen, 1.1f, 50.f);
	DDX_Text(pDX, IDC_ANGLE_TO_XOY, m_fAngleToXOY);
	DDV_MinMaxDouble(pDX, m_fAngleToXOY, 0., 90.);
	DDX_Radio(pDX, IDC_SHADING_MODE, m_nShadingMode);
	DDX_Check(pDX, IDC_CHECK_GRID_LINE, m_bShowGridLine);
	DDX_Check(pDX, IDC_CHECK_AMBIENT_LIGHT, m_bAmbientLight);
	DDX_Check(pDX, IDC_CHECK_DIFFUSE_LIGHT, m_bDiffuseLight);
	DDX_Text(pDX, IDC_ANGLE_ON_XOY_PROJECTION_TO_X, m_fAngleOnXOYProjectionToX);
	DDV_MinMaxDouble(pDX, m_fAngleOnXOYProjectionToX, 0., 360.);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSettingDialog, CDialog)
	//{{AFX_MSG_MAP(CSettingDialog)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSettingDialog message handlers

BOOL CSettingDialog::OnInitDialog() 
{
	//Convert radius to degree 
	this->m_fAngleOnXOYProjectionToX *= (180.0/PI);
	this->m_fAngleToXOY              *= (180.0/PI);
	this->m_AmbientLightColorWnd.m_Color = this->m_AmbientLightColor;
	this->m_DiffuseLightColorWnd.m_Color  = this->m_DiffuseLightColor;
	this->m_GridLineColorWnd.m_Color      = this->m_GridLineColor;
	
	CDialog::OnInitDialog();

	
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSettingDialog::OnOK() 
{
	UpdateData(TRUE);

	this->m_AmbientLightColor = this->m_AmbientLightColorWnd.m_Color;
	this->m_DiffuseLightColor  = this->m_DiffuseLightColorWnd.m_Color;
	this->m_GridLineColor      = this->m_GridLineColorWnd.m_Color;

	CDialog::OnOK();
	
	this->m_fAngleOnXOYProjectionToX /= (180.0/PI);
	this->m_fAngleToXOY              /= (180.0/PI);
}
