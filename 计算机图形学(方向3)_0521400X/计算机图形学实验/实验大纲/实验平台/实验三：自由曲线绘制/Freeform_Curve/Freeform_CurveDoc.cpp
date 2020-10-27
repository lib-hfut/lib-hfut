// Freeform_CurveDoc.cpp : implementation of the CFreeform_CurveDoc class
//

#include "stdafx.h"
#include "Freeform_Curve.h"

#include "Freeform_CurveDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFreeform_CurveDoc

IMPLEMENT_DYNCREATE(CFreeform_CurveDoc, CDocument)

BEGIN_MESSAGE_MAP(CFreeform_CurveDoc, CDocument)
	//{{AFX_MSG_MAP(CFreeform_CurveDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFreeform_CurveDoc construction/destruction

CFreeform_CurveDoc::CFreeform_CurveDoc()
{
	// TODO: add one-time construction code here

}

CFreeform_CurveDoc::~CFreeform_CurveDoc()
{
}

BOOL CFreeform_CurveDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CFreeform_CurveDoc serialization

void CFreeform_CurveDoc::Serialize(CArchive& ar)
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
// CFreeform_CurveDoc diagnostics

#ifdef _DEBUG
void CFreeform_CurveDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CFreeform_CurveDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CFreeform_CurveDoc commands
