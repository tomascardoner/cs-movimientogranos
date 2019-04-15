VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmLocalidad_Lista 
   Caption         =   "Localidades"
   ClientHeight    =   4980
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12375
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Localidad_Lista.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   4980
   ScaleWidth      =   12375
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   1005
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12375
      _ExtentX        =   21828
      _ExtentY        =   1773
      FixedOrder      =   -1  'True
      _CBWidth        =   12375
      _CBHeight       =   1005
      _Version        =   "6.7.9782"
      Child1          =   "tlbMain"
      MinWidth1       =   5595
      MinHeight1      =   570
      Width1          =   5595
      FixedBackground1=   0   'False
      Key1            =   "Toolbar"
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "picProvincia"
      MinWidth2       =   4935
      MinHeight2      =   345
      Width2          =   4935
      FixedBackground2=   0   'False
      Key2            =   "Provincia"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picPartido"
      MinWidth3       =   4935
      MinHeight3      =   345
      Width3          =   4935
      FixedBackground3=   0   'False
      Key3            =   "Partido"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Begin VB.PictureBox picPartido 
         BorderStyle     =   0  'None
         Height          =   345
         Left            =   165
         ScaleHeight     =   345
         ScaleWidth      =   12120
         TabIndex        =   5
         Top             =   630
         Width           =   12120
         Begin VB.ComboBox cboPartido 
            Height          =   330
            Left            =   900
            Style           =   2  'Dropdown List
            TabIndex        =   7
            Top             =   0
            Width           =   4050
         End
         Begin VB.Label lblPartido 
            AutoSize        =   -1  'True
            Caption         =   "Partido:"
            Height          =   210
            Left            =   0
            TabIndex        =   6
            Top             =   60
            Width           =   540
         End
      End
      Begin VB.PictureBox picProvincia 
         BorderStyle     =   0  'None
         Height          =   345
         Left            =   7350
         ScaleHeight     =   345
         ScaleWidth      =   4935
         TabIndex        =   2
         Top             =   135
         Width           =   4935
         Begin VB.ComboBox cboProvincia 
            Height          =   330
            Left            =   900
            Style           =   2  'Dropdown List
            TabIndex        =   4
            Top             =   0
            Width           =   4050
         End
         Begin VB.Label lblProvincia 
            AutoSize        =   -1  'True
            Caption         =   "Provincia:"
            Height          =   210
            Left            =   0
            TabIndex        =   3
            Top             =   60
            Width           =   705
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   1
         Top             =   30
         Width           =   7095
         _ExtentX        =   12515
         _ExtentY        =   1005
         ButtonWidth     =   2170
         ButtonHeight    =   1005
         ToolTips        =   0   'False
         AllowCustomize  =   0   'False
         Wrappable       =   0   'False
         Style           =   1
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   7
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Enabled         =   0   'False
               Caption         =   "&Nuevo"
               Key             =   "NEW"
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Propiedades"
               Key             =   "PROPERTIES"
               ImageIndex      =   2
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Enabled         =   0   'False
               Caption         =   "&Eliminar"
               Key             =   "DELETE"
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Enabled         =   0   'False
               Caption         =   "Copiar"
               Key             =   "COPY"
            EndProperty
            BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Seleccionar"
               Key             =   "SELECT"
               ImageIndex      =   5
            EndProperty
            BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Filtrar"
               Key             =   "FILTER"
               Object.ToolTipText     =   "F3"
            EndProperty
            BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Quitar Filtros"
               Key             =   "FILTER_CLEAR"
               Object.ToolTipText     =   "F4"
            EndProperty
         EndProperty
      End
   End
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3255
      Left            =   120
      TabIndex        =   8
      Top             =   1200
      Width           =   12795
      _ExtentX        =   22569
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "ID"
      Columns(0).DataField=   "IDLocalidad"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Nombre"
      Columns(1).DataField=   "Nombre"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Partido"
      Columns(2).DataField=   "Partido"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Provincia"
      Columns(3).DataField=   "Provincia"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   4
      Splits(0)._UserFlags=   0
      Splits(0).Locked=   -1  'True
      Splits(0).MarqueeStyle=   3
      Splits(0).AllowRowSizing=   0   'False
      Splits(0).RecordSelectors=   0   'False
      Splits(0).RecordSelectorWidth=   688
      Splits(0)._SavedRecordSelectors=   0   'False
      Splits(0).AlternatingRowStyle=   -1  'True
      Splits(0).DividerColor=   14215660
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=4"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1773"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1693"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8705"
      Splits(0)._ColumnProps(6)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(7)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(8)=   "Column(1).Width=7938"
      Splits(0)._ColumnProps(9)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(10)=   "Column(1)._WidthInPix=7858"
      Splits(0)._ColumnProps(11)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(12)=   "Column(1)._ColStyle=8704"
      Splits(0)._ColumnProps(13)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(14)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(15)=   "Column(2).Width=7938"
      Splits(0)._ColumnProps(16)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(17)=   "Column(2)._WidthInPix=7858"
      Splits(0)._ColumnProps(18)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(19)=   "Column(2)._ColStyle=8704"
      Splits(0)._ColumnProps(20)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(21)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(22)=   "Column(3).Width=7938"
      Splits(0)._ColumnProps(23)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(24)=   "Column(3)._WidthInPix=7858"
      Splits(0)._ColumnProps(25)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(26)=   "Column(3)._ColStyle=8704"
      Splits(0)._ColumnProps(27)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(28)=   "Column(3).Order=4"
      Splits.Count    =   1
      PrintInfos(0)._StateFlags=   3
      PrintInfos(0).Name=   "piInternal 0"
      PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageHeaderHeight=   0
      PrintInfos(0).PageFooterHeight=   0
      PrintInfos.Count=   1
      AllowUpdate     =   0   'False
      DefColWidth     =   0
      HeadLines       =   1
      FootLines       =   1
      MultipleLines   =   0
      CellTipsWidth   =   0
      MultiSelect     =   0
      DeadAreaBackColor=   -2147483636
      RowDividerColor =   14215660
      RowSubDividerColor=   14215660
      DirectionAfterEnter=   1
      MaxRows         =   250000
      ViewColumnCaptionWidth=   0
      ViewColumnWidth =   0
      _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
      _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
      _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
      _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
      _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
      _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(7)   =   ":id=1,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(8)   =   ":id=1,.fontname=Arial"
      _StyleDefs(9)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
      _StyleDefs(10)  =   "HeadingStyle:id=2,.parent=1,.namedParent=34,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(11)  =   ":id=2,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(12)  =   ":id=2,.fontname=Arial"
      _StyleDefs(13)  =   "FooterStyle:id=3,.parent=1,.namedParent=35,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(14)  =   ":id=3,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(15)  =   ":id=3,.fontname=Arial"
      _StyleDefs(16)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(17)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
      _StyleDefs(18)  =   "EditorStyle:id=7,.parent=1"
      _StyleDefs(19)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
      _StyleDefs(20)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
      _StyleDefs(21)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
      _StyleDefs(22)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
      _StyleDefs(23)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
      _StyleDefs(24)  =   "Splits(0).Style:id=13,.parent=1"
      _StyleDefs(25)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
      _StyleDefs(26)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
      _StyleDefs(27)  =   "Splits(0).FooterStyle:id=15,.parent=3"
      _StyleDefs(28)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
      _StyleDefs(29)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
      _StyleDefs(30)  =   "Splits(0).EditorStyle:id=17,.parent=7"
      _StyleDefs(31)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(32)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(33)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
      _StyleDefs(34)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(35)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(36)  =   "Splits(0).Columns(0).Style:id=32,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(37)  =   "Splits(0).Columns(0).HeadingStyle:id=29,.parent=14,.alignment=2"
      _StyleDefs(38)  =   "Splits(0).Columns(0).FooterStyle:id=30,.parent=15"
      _StyleDefs(39)  =   "Splits(0).Columns(0).EditorStyle:id=31,.parent=17"
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=46,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=44,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=45,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=86,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=83,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=84,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=85,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=82,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=80,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=81,.parent=17"
      _StyleDefs(52)  =   "Named:id=33:Normal"
      _StyleDefs(53)  =   ":id=33,.parent=0"
      _StyleDefs(54)  =   "Named:id=34:Heading"
      _StyleDefs(55)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(56)  =   ":id=34,.wraptext=-1"
      _StyleDefs(57)  =   "Named:id=35:Footing"
      _StyleDefs(58)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(59)  =   "Named:id=36:Selected"
      _StyleDefs(60)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(61)  =   "Named:id=37:Caption"
      _StyleDefs(62)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(63)  =   "Named:id=38:HighlightRow"
      _StyleDefs(64)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(65)  =   "Named:id=39:EvenRow"
      _StyleDefs(66)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(67)  =   "Named:id=40:OddRow"
      _StyleDefs(68)  =   ":id=40,.parent=33"
      _StyleDefs(69)  =   "Named:id=41:RecordSelector"
      _StyleDefs(70)  =   ":id=41,.parent=34"
      _StyleDefs(71)  =   "Named:id=42:FilterBar"
      _StyleDefs(72)  =   ":id=42,.parent=33"
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   360
      Left            =   0
      TabIndex        =   9
      Top             =   4620
      Width           =   12375
      _ExtentX        =   21828
      _ExtentY        =   635
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Bevel           =   0
            Object.Width           =   661
            MinWidth        =   661
            Key             =   "PIN"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   20611
            Key             =   "TEXT"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmLocalidad_Lista"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mSkipLoadData As Boolean
Private mColumnsResized As Boolean

Private mOrderColumn As Long
Private mOrderAscending As Boolean

Public Function Startup() As Boolean
    mSkipLoadData = True

    Load Me
    
    mSkipLoadData = False
    Startup = True
End Function

Public Function LoadData(ByVal IDLocalidad As Long) As Boolean
    Dim recData As ADODB.Recordset
    
    Dim SaveIDLocalidad As Long
    
    Dim RecordCount As Long
    
    If mSkipLoadData Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDLocalidad = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDLocalidad = tdbgrdData.Columns("IDLocalidad").Value
        End If
    Else
        SaveIDLocalidad = IDLocalidad
    End If
    
    Set recData = New ADODB.Recordset
        
    recData.Source = "usp_Localidad_ListComplete "
    If cboProvincia.ListIndex <= 0 Then
        recData.Source = recData.Source & "NULL"
    Else
        recData.Source = recData.Source & "'" & Chr(cboProvincia.ItemData(cboProvincia.ListIndex)) & "'"
    End If
    Select Case cboPartido.ListIndex
        Case -1, 0
            recData.Source = recData.Source & ", NULL"
        Case 1
            recData.Source = recData.Source & ", 0"
        Case Else
            recData.Source = recData.Source & ", " & cboPartido.ItemData(cboPartido.ListIndex)
    End Select
    recData.Source = recData.Source & ", NULL"
    
    recData.Open , pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    Set tdbgrdData.DataSource = recData
    
    Call SortColumn(mOrderColumn)

    recData.Find "IDLocalidad = " & SaveIDLocalidad
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Localidades."
        Case 1
            stbMain.SimpleText = "1 Localidad."
        Case Else
            stbMain.SimpleText = Format(RecordCount, "#,###") & " Localidades."
    End Select

    Set recData = Nothing
    
    On Error Resume Next
    If frmMDI.ActiveForm.Name = Me.Name And GetForegroundWindow() = frmMDI.hwnd And frmMDI.WindowState <> vbMinimized Then
        tdbgrdData.SetFocus
    End If
    
    Screen.MousePointer = vbDefault
    LoadData = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Forms.Localidad_Lista.LoadData", "Error al leer las Localidades."
    On Error Resume Next
    recData.Close
    Set recData = Nothing
End Function

Public Sub SetTrueDBGridAppearance()
    With tdbgrdData
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
    End With
End Sub

Private Sub Form_Load()
    cbrMain.Bands("Toolbar").MinWidth = CSM_Control_Toolbar.GetTotalWidth(tlbMain)
    
    CSM_Forms.ResizeAndPosition frmMDI, Me
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS ICONOS AL TOOLBAR
    Set tlbMain.ImageList = frmMDI.ilsFormToolbar
    Set tlbMain.HotImageList = frmMDI.ilsFormToolbarHot
    tlbMain.buttons("NEW").Image = "NEW"
    tlbMain.buttons("PROPERTIES").Image = "PROPERTIES"
    tlbMain.buttons("DELETE").Image = "DELETE"
    tlbMain.buttons("COPY").Image = "COPY"
    tlbMain.buttons("SELECT").Image = "SELECT"
    tlbMain.buttons("FILTER").Image = "FILTER"
    tlbMain.buttons("FILTER_CLEAR").Image = "FILTER_CLEAR"
    '//////////////////////////////////////////////////////////
    
    Call CSM_Parameter_CoolBar.GetSettings(Mid(Me.Name, 4), cbrMain)
    
    Call SetTrueDBGridAppearance
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4), tdbgrdData)
    
    mOrderColumn = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn(1)
    
    Call FillComboBox_Provincia
End Sub

Private Sub Form_Resize()
    ResizeControls cbrMain.Height
End Sub

Private Sub cbrMain_HeightChanged(ByVal NewHeight As Single)
    ResizeControls NewHeight
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If (Shift And vbAltMask) > 0 Then
        Select Case KeyCode
            Case vbKeyN
                tlbMain_ButtonClick tlbMain.buttons.Item("NEW")
            Case vbKeyP
                tlbMain_ButtonClick tlbMain.buttons.Item("PROPERTIES")
            Case vbKeyE
                tlbMain_ButtonClick tlbMain.buttons.Item("DELETE")
            Case vbKeyS
                tlbMain_ButtonClick tlbMain.buttons.Item("SELECT")
            Case Else
                tdbgrdData_KeyDown KeyCode, Shift
        End Select
    Else
        Select Case KeyCode
            Case vbKeyF3    'FILTER
                tlbMain_ButtonClick tlbMain.buttons.Item("FILTER")
            Case vbKeyF4    'FILTER CLEAR
                tlbMain_ButtonClick tlbMain.buttons.Item("FILTER_CLEAR")
            Case Else
                tdbgrdData_KeyDown KeyCode, Shift
        End Select
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If mColumnsResized Then
        Call CSM_Parameter_TrueDBGrid.SaveSettings(Mid(Me.Name, 4), tdbgrdData)
    End If
    Call CSM_Parameter_CoolBar.SaveSettings(Mid(Me.Name, 4), cbrMain)

    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", mOrderColumn)
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", mOrderAscending)
    
    Set frmLocalidad_Lista = Nothing
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Localidad As Localidad
    Dim recData As ADODB.Recordset

    Select Case Button.Key
        Case "NEW"
'            Set Localidad = New Localidad
'            Set Localidad.Database = pDatabase
'            If frmLocalidad_Detalle.Startup(Localidad) Then
'                frmLocalidad_Detalle.Show
'                frmLocalidad_Detalle.WindowState = vbNormal
'                frmLocalidad_Detalle.SetFocus
'            Else
'                Unload frmLocalidad_Detalle
'                Set frmLocalidad_Detalle = Nothing
'            End If
            
        Case "PROPERTIES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ninguna Localidad seleccionada para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Localidad = New Localidad
            Localidad.IDLocalidad = tdbgrdData.Columns("IDLocalidad").Value
            If Localidad.Load() Then
                If frmLocalidad_Detalle.Startup(Localidad) Then
                    If frmLocalidad_Detalle.LoadData() Then
                        frmLocalidad_Detalle.Show
                    Else
                        Unload frmLocalidad_Detalle
                        Set frmLocalidad_Detalle = Nothing
                    End If
                Else
                    Unload frmLocalidad_Detalle
                    Set frmLocalidad_Detalle = Nothing
                End If
            End If
            Set Localidad = Nothing
            Set frmLocalidad_Detalle = Nothing
            
        Case "DELETE"
'            If tdbgrdData.FirstRow = "" Then
'                MsgBox "No hay ninguna Localidad seleccionada para eliminar.", vbExclamation, App.Title
'                tdbgrdData.SetFocus
'                Exit Sub
'            End If
'
'            Set Localidad = New Localidad
'            Set Localidad.Database = pDatabase
'            Localidad.IDLocalidad = tdbgrdData.Columns("IDLocalidad").Value
'            If Localidad.Load() Then
'                If MsgBox("¿Desea eliminar esta Localidad?" & vbCr & vbCr & "Nombre: " & Localidad.Nombre, vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
'                    Localidad.Delete
'                End If
'            End If
'            Set Localidad = Nothing
'            tdbgrdData.SetFocus
            
        Case "COPY"
'            If tdbgrdData.FirstRow = "" Then
'                MsgBox "No hay ninguna Localidad seleccionada para copiar.", vbExclamation, App.Title
'                tdbgrdData.SetFocus
'                Exit Sub
'            End If
'
'            Set Localidad = New Localidad
'            Set Localidad.Database = pDatabase
'            Localidad.IDLocalidad = tdbgrdData.Columns("IDLocalidad").Value
'            If Localidad.Copy() Then
'                If frmLocalidad_Detalle.Startup(Localidad) Then
'                    If frmLocalidad_Detalle.LoadData() Then
'                        frmLocalidad_Detalle.Show
'                    Else
'                        Unload frmLocalidad_Detalle
'                        Set frmLocalidad_Detalle = Nothing
'                    End If
'                Else
'                    Unload frmLocalidad_Detalle
'                    Set frmLocalidad_Detalle = Nothing
'                End If
'            End If
'            Set Localidad = Nothing
'            Set frmLocalidad_Detalle = Nothing
        
        Case "SELECT"
        Case "FILTER"
            frmFiltrar.Show vbModal, frmMDI
            With frmFiltrar
                If .Tag = "OK" Then
                    Set recData = tdbgrdData.DataSource
                    If Not recData.BOF Then
                        recData.MoveFirst
                    End If
                    recData.Filter = "Nombre LIKE '*" & .txtNombre.Text & "*'"
                End If
            End With
            Unload frmFiltrar
            Set frmFiltrar = Nothing
        Case "FILTER_CLEAR"
            Set recData = tdbgrdData.DataSource
            If recData.Filter <> "" Then
                recData.Filter = ""
            End If
    End Select
End Sub

Private Sub cboProvincia_Click()
    Call LoadData(0)
    Call FillComboBox_Partido
End Sub

Private Sub cboPartido_Click()
    Call LoadData(0)
End Sub

Private Sub tdbgrdData_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized = True
End Sub

Private Sub tdbgrdData_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdData.SelStartCol <> tdbgrdData.SelEndCol Then
        tdbgrdData.SelEndCol = tdbgrdData.SelStartCol
    End If
    If tdbgrdData.SelStartCol + 1 = mOrderColumn Then
        mOrderAscending = Not mOrderAscending
    Else
        mOrderAscending = True
    End If
    OldOrderColumn = mOrderColumn
    mOrderColumn = tdbgrdData.SelStartCol + 1
    tdbgrdData.SelStartCol = -1
    tdbgrdData.SelEndCol = -1
    
    SortColumn OldOrderColumn
End Sub

Private Sub tdbgrdData_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdData.MoveFirst
        Case vbKeyEnd
            tdbgrdData.MoveLast
    End Select
End Sub

Private Sub tdbgrdData_DblClick()
    tlbMain_ButtonClick tlbMain.buttons("PROPERTIES")
End Sub

Private Sub SortColumn(ByVal OldOrderColumn As Long)
    Dim recData As ADODB.Recordset

    Set recData = tdbgrdData.DataSource
    If Not recData Is Nothing Then
        recData.Sort = tdbgrdData.Columns(mOrderColumn - 1).DataField & IIf(mOrderAscending, " ASC", " DESC")
    End If
    
    'ICONOS
    tdbgrdData.Columns(OldOrderColumn - 1).HeadingStyle.ForegroundPicture = 0
    tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.TransparentForegroundPicture = True
    If mOrderAscending Then
        Set tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

Private Sub ResizeControls(ByVal CoolBarHeight As Single)
    Const CONTROL_SPACE = 30
    
    On Error Resume Next
    
    tdbgrdData.Top = CoolBarHeight + CONTROL_SPACE
    tdbgrdData.Left = CONTROL_SPACE
    tdbgrdData.Height = ScaleHeight - tdbgrdData.Top - CONTROL_SPACE - stbMain.Height
    tdbgrdData.Width = ScaleWidth - (CONTROL_SPACE * 2)
End Sub

Public Function FillComboBox_Provincia() As Boolean
    Dim SaveItemData As Long
    
    cboProvincia.Clear
    cboProvincia.AddItem CSM_Constant.ITEM_ALL_FEMALE
    
    If cboProvincia.ListIndex > -1 Then
        SaveItemData = cboProvincia.ItemData(cboProvincia.ListIndex)
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboProvincia, "usp_Provincia_List 0", "IDProvinciaASCII", "Nombre", "Provincias", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Partido() As Boolean
    Dim SaveItemData As Long

    cboPartido.Clear
    cboPartido.AddItem CSM_Constant.ITEM_ALL_MALE
    cboPartido.AddItem CSM_Constant.ITEM_EMPTY_MALE

    If cboPartido.ListIndex > -1 Then
        SaveItemData = cboPartido.ItemData(cboPartido.ListIndex)
    End If
    
    If cboProvincia.ListIndex > 0 Then
        Call CSM_Control_ComboBox.FillFromSQL(cboPartido, "usp_Partido_List 0, " & Chr(cboProvincia.ItemData(cboProvincia.ListIndex)), "IDPartido", "Nombre", "Partidos", cscpItemOrFirst, SaveItemData, False)
    Else
        Call CSM_Control_ComboBox.FillFromSQL(cboPartido, "usp_Partido_List 0, NULL", "IDPartido", "Nombre", "Partidos", cscpItemOrFirst, SaveItemData, False)
    End If
End Function
