; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CSettingDialog
LastTemplate=CStatic
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Polygon_Conversion.h"
LastPage=0

ClassCount=7
Class1=CPolygon_ConversionApp
Class2=CPolygon_ConversionDoc
Class3=CPolygon_ConversionView
Class4=CMainFrame

ResourceCount=3
Resource1=IDD_ABOUTBOX
Class5=CAboutDlg
Resource2=IDR_MAINFRAME
Class6=CSettingDialog
Class7=CColorWnd
Resource3=IDD_SETTING

[CLS:CPolygon_ConversionApp]
Type=0
HeaderFile=Polygon_Conversion.h
ImplementationFile=Polygon_Conversion.cpp
Filter=N

[CLS:CPolygon_ConversionDoc]
Type=0
HeaderFile=Polygon_ConversionDoc.h
ImplementationFile=Polygon_ConversionDoc.cpp
Filter=N

[CLS:CPolygon_ConversionView]
Type=0
HeaderFile=Polygon_ConversionView.h
ImplementationFile=Polygon_ConversionView.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=ID_VIEW_SETTING


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=ID_VIEW_INPUT_POLYGON




[CLS:CAboutDlg]
Type=0
HeaderFile=Polygon_Conversion.cpp
ImplementationFile=Polygon_Conversion.cpp
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
Command1=ID_VIEW_INPUT_POLYGON
Command2=ID_VIEW_SETTING
Command3=ID_APP_ABOUT
CommandCount=3

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
Class=CSettingDialog
ControlCount=8
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308864
Control4=IDC_COLOR_WND,static,1342177540
Control5=IDC_FILLPOLYGON_CHECK,button,1342242819
Control6=IDC_STATIC,button,1342177287
Control7=IDC_X_SCAN_LINE_CONVERSION_ALGORITHM_RADIO,button,1342308361
Control8=IDC_ACTIVE_EDGE_TABLE_CONVERSION_ALGORITHM_RADIO,button,1342177289

[CLS:CSettingDialog]
Type=0
HeaderFile=SettingDialog.h
ImplementationFile=SettingDialog.cpp
BaseClass=CDialog
Filter=D
LastObject=CSettingDialog
VirtualFilter=dWC

[CLS:CColorWnd]
Type=0
HeaderFile=ColorWnd.h
ImplementationFile=ColorWnd.cpp
BaseClass=CStatic
Filter=W
LastObject=CColorWnd
VirtualFilter=WC

