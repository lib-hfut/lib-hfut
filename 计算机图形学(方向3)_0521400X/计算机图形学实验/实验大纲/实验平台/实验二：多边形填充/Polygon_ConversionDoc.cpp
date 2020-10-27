// Polygon_ConversionDoc.cpp : implementation of the CPolygon_ConversionDoc class
//

#include "stdafx.h"
#include "Polygon_Conversion.h"

#include "Polygon_ConversionDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPolygon_ConversionDoc

IMPLEMENT_DYNCREATE(CPolygon_ConversionDoc, CDocument)

BEGIN_MESSAGE_MAP(CPolygon_ConversionDoc, CDocument)
	//{{AFX_MSG_MAP(CPolygon_ConversionDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPolygon_ConversionDoc construction/destruction

CPolygon_ConversionDoc::CPolygon_ConversionDoc()
{
	// TODO: add one-time construction code here

}

CPolygon_ConversionDoc::~CPolygon_ConversionDoc()
{
}

BOOL CPolygon_ConversionDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CPolygon_ConversionDoc serialization

void CPolygon_ConversionDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CPolygon_ConversionDoc diagnostics

#ifdef _DEBUG
void CPolygon_ConversionDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CPolygon_ConversionDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CPolygon_ConversionDoc commands
