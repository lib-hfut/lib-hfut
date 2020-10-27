// Experiment_Frame_OneDoc.h : interface of the CExperiment_Frame_OneDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_EXPERIMENT_FRAME_ONEDOC_H__A38FD6B1_1195_4F16_844F_E1A7E2317179__INCLUDED_)
#define AFX_EXPERIMENT_FRAME_ONEDOC_H__A38FD6B1_1195_4F16_844F_E1A7E2317179__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CExperiment_Frame_OneDoc : public CDocument
{
protected: // create from serialization only
	CExperiment_Frame_OneDoc();
	DECLARE_DYNCREATE(CExperiment_Frame_OneDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CExperiment_Frame_OneDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CExperiment_Frame_OneDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CExperiment_Frame_OneDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EXPERIMENT_FRAME_ONEDOC_H__A38FD6B1_1195_4F16_844F_E1A7E2317179__INCLUDED_)
