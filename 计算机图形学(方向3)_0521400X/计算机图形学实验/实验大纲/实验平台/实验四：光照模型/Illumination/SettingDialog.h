#if !defined(AFX_SETTINGDIALOG_H__52769B9F_9BBB_48A3_8055_D39073AF9863__INCLUDED_)
#define AFX_SETTINGDIALOG_H__52769B9F_9BBB_48A3_8055_D39073AF9863__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SettingDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSettingDialog dialog
#include "ColorWnd.h"
class CSettingDialog : public CDialog
{
// Construction
public:
	CSettingDialog(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSettingDialog)
	enum { IDD = IDD_SETTING_DIALOG };

	//几何模型参数
	int		m_nLongitude_Grids;
	int		m_nLatitude_Grids;
	double	m_Ka;
	double	m_Kd;

	//网格线参数
	CColorWnd	m_GridLineColorWnd;
	int		m_nGridLineThickness;

	//环境光参数
	CColorWnd	m_AmbientLightColorWnd;
	double	m_Ia;
	double	m_Id;

	//漫反射光参数
	int		m_nShadingMode;
	float	m_fLen;
	double	m_fAngleToXOY;
	double	m_fAngleOnXOYProjectionToX;
	CColorWnd	m_DiffuseLightColorWnd;


	//显示控制参数;
	BOOL	m_bShowGridLine;
	BOOL	m_bAmbientLight;
	BOOL	m_bDiffuseLight;
	//}}AFX_DATA

	COLORREF m_AmbientLightColor;
	COLORREF m_DiffuseLightColor;
	COLORREF m_GridLineColor;


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
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETTINGDIALOG_H__52769B9F_9BBB_48A3_8055_D39073AF9863__INCLUDED_)
