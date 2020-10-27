// IlluminationDoc.h : interface of the CIlluminationDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_ILLUMINATIONDOC_H__426BF9B8_A53E_4763_A870_051ABA8B2366__INCLUDED_)
#define AFX_ILLUMINATIONDOC_H__426BF9B8_A53E_4763_A870_051ABA8B2366__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CIlluminationDoc : public CDocument
{
protected: // create from serialization only
	CIlluminationDoc();
	DECLARE_DYNCREATE(CIlluminationDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIlluminationDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CIlluminationDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CIlluminationDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ILLUMINATIONDOC_H__426BF9B8_A53E_4763_A870_051ABA8B2366__INCLUDED_)
