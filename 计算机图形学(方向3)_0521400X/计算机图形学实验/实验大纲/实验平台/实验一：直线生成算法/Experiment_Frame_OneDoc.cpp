// Experiment_Frame_OneDoc.cpp : implementation of the CExperiment_Frame_OneDoc class
//

#include "stdafx.h"
#include "Experiment_Frame_One.h"

#include "Experiment_Frame_OneDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CExperiment_Frame_OneDoc

IMPLEMENT_DYNCREATE(CExperiment_Frame_OneDoc, CDocument)

BEGIN_MESSAGE_MAP(CExperiment_Frame_OneDoc, CDocument)
	//{{AFX_MSG_MAP(CExperiment_Frame_OneDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CExperiment_Frame_OneDoc construction/destruction

CExperiment_Frame_OneDoc::CExperiment_Frame_OneDoc()
{
	// TODO: add one-time construction code here

}

CExperiment_Frame_OneDoc::~CExperiment_Frame_OneDoc()
{
}

BOOL CExperiment_Frame_OneDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CExperiment_Frame_OneDoc serialization

void CExperiment_Frame_OneDoc::Serialize(CArchive& ar)
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
// CExperiment_Frame_OneDoc diagnostics

#ifdef _DEBUG
void CExperiment_Frame_OneDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CExperiment_Frame_OneDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CExperiment_Frame_OneDoc commands
