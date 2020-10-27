; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMainFrame
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "illumination.h"
LastPage=0

ClassCount=7
Class1=CColorWnd
Class2=CIlluminationApp
Class3=CAboutDlg
Class4=CIlluminationDoc
Class5=CIlluminationView
Class6=CMainFrame

ResourceCount=3
Resource1=IDR_MAINFRAME
Resource2=IDD_ABOUTBOX
Class7=CSettingDialog
Resource3=IDD_SETTING_DIALOG

[CLS:CColorWnd]
Type=0
BaseClass=CStatic
HeaderFile=ColorWnd.h
ImplementationFile=ColorWnd.cpp

[CLS:CIlluminationApp]
Type=0
BaseClass=CWinApp
HeaderFile=Illumination.h
ImplementationFile=Illumination.cpp

[CLS:CAboutDlg]
Type=0
BaseClass=CDialog
HeaderFile=Illumination.cpp
ImplementationFile=Illumination.cpp
LastObject=CAboutDlg

[CLS:CIlluminationDoc]
Type=0
BaseClass=CDocument
HeaderFile=IlluminationDoc.h
ImplementationFile=IlluminationDoc.cpp

[CLS:CIlluminationView]
Type=0
BaseClass=CView
HeaderFile=IlluminationView.h
ImplementationFile=IlluminationView.cpp
Filter=C
VirtualFilter=VWC
LastObject=CIlluminationView

[CLS:CMainFrame]
Type=0
BaseClass=CFrameWnd
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_SETTING_DIALOG]
Type=1
Class=CSettingDialog
ControlCount=47
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,static,1342308864
Control5=IDC_STATIC,static,1342308864
Control6=IDC_LONGITUDE_GRIDS,edit,1350631552
Control7=IDC_LATITUDE_GRIDS,edit,1350631552
Control8=IDC_STATIC,static,1342308864
Control9=IDC_STATIC,static,1342308864
Control10=IDC_STATIC,button,1342177287
Control11=IDC_STATIC,static,1342308864
Control12=IDC_STATIC,static,1342308864
Control13=IDC_KA,edit,1350631552
Control14=IDC_KD,edit,1350631552
Control15=IDC_STATIC,static,1342308864
Control16=IDC_STATIC,static,1342308864
Control17=IDC_STATIC,static,1342308864
Control18=IDC_IA,edit,1350631552
Control19=IDC_STATIC,static,1342308864
Control20=IDC_AMIBIENT_LIGHT_COLOR_WND,static,1342177540
Control21=IDC_STATIC,button,1342177287
Control22=IDC_STATIC,static,1342308864
Control23=IDC_ID,edit,1350631552
Control24=IDC_STATIC,static,1342308864
Control25=IDC_DIFFUSE_LIGHT_COLOR_WND,static,1342177540
Control26=IDC_LENGHT,edit,1350631552
Control27=IDC_STATIC,static,1342308864
Control28=IDC_STATIC,button,1342177287
Control29=IDC_STATIC,static,1342308864
Control30=IDC_ANGLE_TO_XOY,edit,1350631552
Control31=IDC_STATIC,static,1342308864
Control32=IDC_STATIC,static,1342308864
Control33=IDC_ANGLE_ON_XOY_PROJECTION_TO_X,edit,1350631552
Control34=IDC_STATIC,static,1342308864
Control35=IDC_STATIC,static,1342308864
Control36=IDC_STATIC,button,1342177287
Control37=IDC_CHECK_GRID_LINE,button,1342242819
Control38=IDC_CHECK_AMIBIENT_LIGHT,button,1342242819
Control39=IDC_CHECK_DIFFUSE_LIGHT,button,1342242819
Control40=IDC_STATIC,button,1342177287
Control41=IDC_STATIC,static,1342308864
Control42=IDC_GRID_LINE_COLOR_WND,static,1342177540
Control43=IDC_STATIC,static,1342308864
Control44=IDC_GRID_LINE_WIDTH,edit,1350631552
Control45=IDC_SHADING_MODE,button,1342308361
Control46=IDC_RADIO2,button,1342177289
Control47=IDC_RADIO3,button,1342177289

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

[MNU:IDR_MAINFRAME]
Type=1
Class=CIlluminationView
Command1=ID_FUNCTION_SETTING
Command2=ID_APP_EXIT
CommandCount=2

[ACL:IDR_MAINFRAME]
Type=1
Class=?
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

[CLS:CSettingDialog]
Type=0
HeaderFile=SettingDialog.h
ImplementationFile=SettingDialog.cpp
BaseClass=CDialog
Filter=D
LastObject=CSettingDialog
VirtualFilter=dWC

