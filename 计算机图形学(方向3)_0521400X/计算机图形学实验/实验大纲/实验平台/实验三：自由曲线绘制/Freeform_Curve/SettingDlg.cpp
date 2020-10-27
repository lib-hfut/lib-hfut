// SettingDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Freeform_Curve.h"
#include "SettingDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSettingDlg dialog


CSettingDlg::CSettingDlg(int      ControlPoint_Size,
						 COLORREF ControlPoint_Color,
						 BOOL     bShowControlPoint,

						 BOOL     bShowControlPolygon,
						 COLORREF ControlPolygon_Color,
						 
						 
						 int      nCurveWidth,
						 BOOL     bShowCurves[6],
						 COLORREF CurveColors[6],
						 CWnd* pParent /*=NULL*/)
						: CDialog(CSettingDlg::IDD, pParent)
{
	//Control Point
	this->m_nControlPoint_Size = ControlPoint_Size;
	this->m_bShowControlPoint =  bShowControlPoint;
	this->m_ControlPoint_Color = ControlPoint_Color;

	//Control Ploygon
	this->m_bShowControlPolygon  = bShowControlPolygon;
	this->m_ControlPolygon_Color = ControlPolygon_Color;

	
	this->m_nCurveWidth = nCurveWidth;
	for ( int i = 0; i < 6; i++)
	{
		this->m_bShowCurves[i] = bShowCurves[i];
		this->m_CurveColors[i] = CurveColors[i];
	}
}


void CSettingDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSettingDlg)
	DDX_Control(pDX, IDC_CONTROL_POLYGON_COLOR_WND, m_Control_Polygon_Color_Wnd);
	DDX_Control(pDX, IDC_CONTROL_POINT_COLOR, m_ControlPoint_Color_Wnd);
	DDX_Text(pDX, IDC_EDIT_CURVE_WIDTH, m_nCurveWidth);
	DDV_MinMaxInt(pDX, m_nCurveWidth, 1, 10);
	DDX_Text(pDX, IDC_EDIT_CONTROL_POINT_SIZE, m_nControlPoint_Size);
	DDV_MinMaxInt(pDX, m_nControlPoint_Size, 4, 10);
	DDX_Check(pDX, IDC_CHECK_SHOW_CONTROL_POINT, m_bShowControlPoint);
	DDX_Check(pDX, IDC_CHECK_SHOW_CONTROL_POLYGON, m_bShowControlPolygon);
	//}}AFX_DATA_MAP
	//Color Wnd
	DDX_Control(pDX, IDC_TWO_UNIFORM_BSPLINE_COLOR_WND, m_Curve_Colors_Wnd[0]);
	DDX_Control(pDX, IDC_TWO_OPEN_UNIFORM_BSPLINE_COLOR_WND, m_Curve_Colors_Wnd[1]);

	DDX_Control(pDX, IDC_THREE_UNIFORM_BSPLINE_COLOR_WND, m_Curve_Colors_Wnd[2]);
	DDX_Control(pDX, IDC_THREE_OPEN_UNIFORM_BSPLINE_COLOR_WND, m_Curve_Colors_Wnd[3]);

	DDX_Control(pDX, IDC_FOUR_UNIFORM_BSPLINE_COLOR_WND, m_Curve_Colors_Wnd[4]);
	DDX_Control(pDX, IDC_FOUR_OPEN_UNIFORM_BSPLINE_COLOR_WND, m_Curve_Colors_Wnd[5]);

	//show curves
	DDX_Check(pDX, IDC_CHECK_TWO_UNIFORM_BSPLINE, m_bShowCurves[0]);
	DDX_Check(pDX, IDC_CHECK_TWO_OPEN_UNIFORM_BSPLINE, m_bShowCurves[1]);
	
	DDX_Check(pDX, IDC_CHECK_THREE_UNIFORM_BSPLINE, m_bShowCurves[2]);
	DDX_Check(pDX, IDC_CHECK_THREE_OPEN_UNIFORM_BSPLINE, m_bShowCurves[3]);
	
	DDX_Check(pDX, IDC_CHECK_FOUR_UNIFORM_BSPLINE, m_bShowCurves[4]);
	DDX_Check(pDX, IDC_CHECK_FOUR_OPEN_UNIFORM_BSPLINE, m_bShowCurves[5]);
}


BEGIN_MESSAGE_MAP(CSettingDlg, CDialog)
	//{{AFX_MSG_MAP(CSettingDlg)
	ON_WM_CANCELMODE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSettingDlg message handlers

BOOL CSettingDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	this->m_ControlPoint_Color_Wnd.m_Color = 
		this->m_ControlPoint_Color;

	this->m_Control_Polygon_Color_Wnd.m_Color =
		this->m_ControlPolygon_Color;

	for (int i = 0; i < 6; i++)
	{
		this->m_Curve_Colors_Wnd[i].m_Color = 
			this->m_CurveColors[i];
	}
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSettingDlg::OnCancelMode() 
{
	CDialog::OnCancelMode();
}

void CSettingDlg::OnOK() 
{
	UpdateData(TRUE);

	this->m_ControlPoint_Color = this->m_ControlPoint_Color_Wnd.m_Color ;
	this->m_ControlPolygon_Color = this->m_Control_Polygon_Color_Wnd.m_Color;
	for (int i = 0; i < 6; i++)
	{
		this->m_CurveColors[i] = 
			this->m_Curve_Colors_Wnd[i].m_Color;
	}
	
	CDialog::OnOK();
}
