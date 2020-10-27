// IlluminationView.h : interface of the CIlluminationView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_ILLUMINATIONVIEW_H__8D86E375_2538_44AB_8930_784CF8698836__INCLUDED_)
#define AFX_ILLUMINATIONVIEW_H__8D86E375_2538_44AB_8930_784CF8698836__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define MAX_LONGITUDE_GRIDS 50   //经度
#define MAX_LATITUDE_GRIDS  10    //纬度
#define ROUND(x)   (x + 0.5)




class CIlluminationView : public CView
{
protected: // create from serialization only
	CIlluminationView();
	DECLARE_DYNCREATE(CIlluminationView)

// Attributes
public:
	CIlluminationDoc* GetDocument();


// Operations
private:  //几何模型参数
	int		 m_nLongitude_Grids;
	int		 m_nLatitude_Grids;
	double   m_Ka;                 // Ambient Reflection Coefficient
	double   m_Kd;                 // Diffuse Reflection Coefficient
	int      m_Vectices[MAX_LONGITUDE_GRIDS][MAX_LATITUDE_GRIDS][3];
	double   m_Normals[MAX_LONGITUDE_GRIDS][MAX_LATITUDE_GRIDS][3];
	
private:  //网格线参数
	COLORREF m_GridLineColor;      //Grid line Color
	int		 m_nGridLineThickness; //Grid Line Thickness
	
private:  //环境光参数；
	double	 m_Ia;                 // Ambient Light Intensity;
	COLORREF m_AmbientLightColor; // Ambient Light Color
private:  //漫放射光参数
	double	 m_Id;                 //Diffuse Light Intensity;
	COLORREF m_DiffuseLightColor;  //Diffuse Light Color
	int		m_nShadingMode;
	float	m_fLen;                //distance between sphere center and light source;
	double	m_fAngleToXOY;       
	double	m_fAngleOnXOYProjectionToX;  

	int     m_Light_Pos[3];
	double  m_light_direction[3];

private: //显示控制参数
	BOOL	m_bShowGridLine;
	BOOL	m_bAmbientLight;
	BOOL	m_bDiffuseLight;


protected:
	void CreateMesh();   //Create Mesh
protected:
	void DrawEdges(CDC *pDC);    //
	void Rendering(CDC *pDC);

	void FillQuad(CDC     *pDC,
				  int      Vectices[4][3], 
		          double   Normals[4][3]);

	COLORREF Calculate_Color(int Pt[3],   int Vectices[4][3], double Normals[4][3]);

	double   DiffuseLightIntensity(int Pt[3],
				           int      Vectices[4][3], 
		                   double   Normals[4][3]);

	double   ConstIntensity(int      Vectices[4][3], 
						   int      lightPos[3],
						   double   Ip,
						   double   Kd);

	double  Gouraud(int    Pt[3],
		            int    Vectices[4][3],
		            double Normals[4][3],
					int    lightPos[3],
					double Ip,
					double Kd);

	double  Phong(int    Pt[3],
				  int    Vectices[4][3],
				  double Normals[4][3],
				  int    lightPos[3],
				  double Ip,
				  double Kd);
	

	double DensityOnPoint( int    Pt[3],
		                   double N[3],
						   int    lightPos[3],
						   double Ip,
						   double Kd);


public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIlluminationView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual void OnInitialUpdate();
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CIlluminationView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CIlluminationView)
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnFunctionSetting();
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in IlluminationView.cpp
inline CIlluminationDoc* CIlluminationView::GetDocument()
   { return (CIlluminationDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ILLUMINATIONVIEW_H__8D86E375_2538_44AB_8930_784CF8698836__INCLUDED_)
