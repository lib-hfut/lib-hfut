; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CSettingDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Freeform_Curve.h"
LastPage=0

ClassCount=6
Class1=CFreeform_CurveApp
Class2=CFreeform_CurveDoc
Class3=CFreeform_CurveView
Class4=CMainFrame

ResourceCount=3
Resource1=IDD_ABOUTBOX
Class5=CAboutDlg
Resource2=IDR_MAINFRAME
Class6=CSettingDlg
Resource3=IDD_SETTING_DIALOG

[CLS:CFreeform_CurveApp]
Type=0
HeaderFile=Freeform_Curve.h
ImplementationFile=Freeform_Curve.cpp
Filter=N

[CLS:CFreeform_CurveDoc]
Type=0
HeaderFile=Freeform_CurveDoc.h
ImplementationFile=Freeform_CurveDoc.cpp
Filter=N

[CLS:CFreeform_CurveView]
Type=0
HeaderFile=Freeform_CurveView.h
ImplementationFile=Freeform_CurveView.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=ID_FUNCTION_SETTING


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
BaseClass=CFrameWnd
VirtualFilter=fWC
LastObject=CMainFrame




[CLS:CAboutDlg]
Type=0
HeaderFile=Freeform_Curve.cpp
ImplementationFile=Freeform_Curve.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FUNCTION_INPUT
Command2=ID_FUNCTION_SETTING
CommandCount=2

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[DLG:IDD_SETTING_DIALOG]
Type=1
Class=CSettingDlg
ControlCount=29
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,static,1342308864
Control5=IDC_STATIC,static,1342308864
Control6=IDC_EDIT_CONTROL_POINT_SIZE,edit,1350631552
Control7=IDC_CONTROL_POINT_COLOR,static,1342177540
Control8=IDC_STATIC,button,1342177287
Control9=IDC_CHECK_TWO_UNIFORM_BSPLINE,button,1476460547
Control10=IDC_CHECK_THREE_UNIFORM_BSPLINE,button,1342242819
Control11=IDC_CHECK_TWO_OPEN_UNIFORM_BSPLINE,button,1476460547
Control12=IDC_CHECK_THREE_OPEN_UNIFORM_BSPLINE,button,1342242819
Control13=IDC_CHECK_FOUR_OPEN_UNIFORM_BSPLINE,button,1476460547
Control14=IDC_CHECK_FOUR_UNIFORM_BSPLINE,button,1476460547
Control15=IDC_TWO_UNIFORM_BSPLINE_COLOR_WND,static,1476395268
Control16=IDC_FOUR_OPEN_UNIFORM_BSPLINE_COLOR_WND,static,1476395268
Control17=IDC_TWO_OPEN_UNIFORM_BSPLINE_COLOR_WND,static,1476395268
Control18=IDC_THREE_UNIFORM_BSPLINE_COLOR_WND,static,1342177540
Control19=IDC_THREE_OPEN_UNIFORM_BSPLINE_COLOR_WND,static,1342177540
Control20=IDC_FOUR_UNIFORM_BSPLINE_COLOR_WND,static,1476395268
Control21=IDC_STATIC,static,1342308864
Control22=IDC_EDIT_CURVE_WIDTH,edit,1350631552
Control23=IDC_STATIC,static,1342308864
Control24=IDC_STATIC,static,1342308864
Control25=IDC_CHECK_SHOW_CONTROL_POINT,button,1342242819
Control26=IDC_STATIC,button,1342177287
Control27=IDC_STATIC,static,1342308864
Control28=IDC_CONTROL_POLYGON_COLOR_WND,static,1342177540
Control29=IDC_CHECK_SHOW_CONTROL_POLYGON,button,1342242819

[CLS:CSettingDlg]
Type=0
HeaderFile=SettingDlg.h
ImplementationFile=SettingDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_CHECK_SHOW_CONTROL_POINT
VirtualFilter=dWC

