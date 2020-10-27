// IlluminationDoc.cpp : implementation of the CIlluminationDoc class
//

#include "stdafx.h"
#include "Illumination.h"

#include "IlluminationDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CIlluminationDoc

IMPLEMENT_DYNCREATE(CIlluminationDoc, CDocument)

BEGIN_MESSAGE_MAP(CIlluminationDoc, CDocument)
	//{{AFX_MSG_MAP(CIlluminationDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIlluminationDoc construction/destruction

CIlluminationDoc::CIlluminationDoc()
{
	// TODO: add one-time construction code here

}

CIlluminationDoc::~CIlluminationDoc()
{
}

BOOL CIlluminationDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CIlluminationDoc serialization

void CIlluminationDoc::Serialize(CArchive& ar)
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
// CIlluminationDoc diagnostics

#ifdef _DEBUG
void CIlluminationDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CIlluminationDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CIlluminationDoc commands
