; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CExperiment_Frame_OneView
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Experiment_Frame_One.h"
LastPage=0

ClassCount=7
Class1=CExperiment_Frame_OneApp
Class2=CExperiment_Frame_OneDoc
Class3=CExperiment_Frame_OneView
Class4=CMainFrame

ResourceCount=4
Resource1=IDD_ABOUTBOX
Resource2=IDD_SETTING
Class5=CAboutDlg
Class6=CSettingDlg
Resource3=IDR_MAINFRAME
Class7=CInputDialog
Resource4=IDD_INPUT

[CLS:CExperiment_Frame_OneApp]
Type=0
HeaderFile=Experiment_Frame_One.h
ImplementationFile=Experiment_Frame_One.cpp
Filter=N

[CLS:CExperiment_Frame_OneDoc]
Type=0
HeaderFile=Experiment_Frame_OneDoc.h
ImplementationFile=Experiment_Frame_OneDoc.cpp
Filter=N

[CLS:CExperiment_Frame_OneView]
Type=0
HeaderFile=Experiment_Frame_OneView.h
ImplementationFile=Experiment_Frame_OneView.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=IDM_INPUT


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=IDM_SETTING




[CLS:CAboutDlg]
Type=0
HeaderFile=Experiment_Frame_One.cpp
ImplementationFile=Experiment_Frame_One.cpp
Filter=D
LastObject=CAboutDlg

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
Command1=IDM_INPUT
Command2=IDM_SETTING
Command3=ID_VIEW_TOOLBAR
Command4=ID_VIEW_STATUS_BAR
Command5=ID_APP_ABOUT
CommandCount=5

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

[DLG:IDD_SETTING]
Type=1
Class=CSettingDlg
ControlCount=11
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,static,1342308864
Control5=IDC_PSIZE_EDIT,edit,1350631552
Control6=IDC_STATIC,static,1342308864
Control7=IDC_PCOLOR_EDIT,edit,1484849280
Control8=IDC_PCOLOR_BUTTON,button,1342246656
Control9=IDC_STATIC,static,1342308864
Control10=IDC_ALGORITHM_COMBO,combobox,1344339970
Control11=IDC_GRID_CHECK,button,1342242819

[CLS:CSettingDlg]
Type=0
HeaderFile=SettingDlg.h
ImplementationFile=SettingDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CSettingDlg
VirtualFilter=dWC

[DLG:IDD_INPUT]
Type=1
Class=CInputDialog
ControlCount=10
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308864
Control4=IDC_STATIC,static,1342308864
Control5=IDC_STATIC,static,1342308864
Control6=IDC_STATIC,static,1342308864
Control7=IDC_X0_EDIT,edit,1350631552
Control8=IDC_Y0_EDIT,edit,1350631552
Control9=IDC_X1_EDIT,edit,1350631552
Control10=IDC_Y1_EDIT,edit,1350631552

[CLS:CInputDialog]
Type=0
HeaderFile=InputDialog.h
ImplementationFile=InputDialog.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC

