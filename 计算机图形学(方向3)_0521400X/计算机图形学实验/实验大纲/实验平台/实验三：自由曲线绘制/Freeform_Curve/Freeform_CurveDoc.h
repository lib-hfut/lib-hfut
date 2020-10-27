// Freeform_CurveDoc.h : interface of the CFreeform_CurveDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_FREEFORM_CURVEDOC_H__27F029CE_ADD9_4120_836C_24DDDC41295A__INCLUDED_)
#define AFX_FREEFORM_CURVEDOC_H__27F029CE_ADD9_4120_836C_24DDDC41295A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CFreeform_CurveDoc : public CDocument
{
protected: // create from serialization only
	CFreeform_CurveDoc();
	DECLARE_DYNCREATE(CFreeform_CurveDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFreeform_CurveDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CFreeform_CurveDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CFreeform_CurveDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FREEFORM_CURVEDOC_H__27F029CE_ADD9_4120_836C_24DDDC41295A__INCLUDED_)
