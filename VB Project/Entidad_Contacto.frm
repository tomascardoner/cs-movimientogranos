VERSION 5.00
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmEntidad_Contacto 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Contactos de la Entidad"
   ClientHeight    =   5205
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   10290
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Entidad_Contacto.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   5205
   ScaleWidth      =   10290
   Begin VB.CommandButton cmdEliminar 
      Caption         =   "Borrar"
      Height          =   555
      Left            =   2040
      Picture         =   "Entidad_Contacto.frx":08CA
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   4500
      Width           =   795
   End
   Begin VB.CommandButton cmdEditar 
      Caption         =   "Editar"
      Height          =   555
      Left            =   1080
      Picture         =   "Entidad_Contacto.frx":0E54
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   4500
      Width           =   795
   End
   Begin VB.CommandButton cmdAgregar 
      Caption         =   "Agregar"
      Height          =   555
      Left            =   120
      Picture         =   "Entidad_Contacto.frx":13DE
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   4500
      Width           =   795
   End
   Begin VB.CommandButton cmdCerrar 
      Cancel          =   -1  'True
      Caption         =   "Cerrar"
      Height          =   375
      Left            =   8940
      TabIndex        =   29
      Top             =   4680
      Width           =   1215
   End
   Begin VB.Frame fraEdit 
      Height          =   4035
      Left            =   5160
      TabIndex        =   6
      Top             =   480
      Width           =   4995
      Begin VB.CommandButton cmdCancelar 
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   3600
         TabIndex        =   28
         Top             =   3540
         Width           =   1215
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Default         =   -1  'True
         Height          =   375
         Left            =   2280
         TabIndex        =   27
         Top             =   3540
         Width           =   1215
      End
      Begin VB.TextBox txtNotas 
         BackColor       =   &H8000000F&
         Height          =   675
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   8000
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   26
         TabStop         =   0   'False
         Top             =   2760
         Width           =   3675
      End
      Begin VB.TextBox txtEmail2 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   24
         TabStop         =   0   'False
         Top             =   2400
         Width           =   3675
      End
      Begin VB.TextBox txtEmail1 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   22
         TabStop         =   0   'False
         Top             =   2040
         Width           =   3675
      End
      Begin VB.TextBox txtTelefono2Numero 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2880
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox txtTelefono2Nombre 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1275
      End
      Begin VB.TextBox txtTelefono1Numero 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2880
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   1320
         Width           =   1935
      End
      Begin VB.TextBox txtTelefono1Nombre 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   1320
         Width           =   1275
      End
      Begin VB.TextBox txtNombre 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   50
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   960
         Width           =   3675
      End
      Begin VB.TextBox txtCargo 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   600
         Width           =   1935
      End
      Begin VB.TextBox txtIDContacto 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   100
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   240
         Width           =   915
      End
      Begin VB.Label lblNotas 
         Caption         =   "Notas:"
         Height          =   195
         Left            =   180
         TabIndex        =   25
         Top             =   2820
         Width           =   930
      End
      Begin VB.Label lblEmail2 
         Caption         =   "E-mail 2:"
         Height          =   195
         Left            =   180
         TabIndex        =   23
         Top             =   2460
         Width           =   930
      End
      Begin VB.Label lblEmail1 
         Caption         =   "E-mail 1:"
         Height          =   195
         Left            =   180
         TabIndex        =   21
         Top             =   2100
         Width           =   930
      End
      Begin VB.Label lblTelefono2Numero 
         Caption         =   "Nº:"
         Height          =   195
         Left            =   2580
         TabIndex        =   19
         Top             =   1740
         Width           =   270
      End
      Begin VB.Label lblTelefono2Nombre 
         Caption         =   "Teléfono 2:"
         Height          =   195
         Left            =   180
         TabIndex        =   17
         Top             =   1740
         Width           =   930
      End
      Begin VB.Label lblTelefono1Numero 
         Caption         =   "Nº:"
         Height          =   195
         Left            =   2580
         TabIndex        =   15
         Top             =   1380
         Width           =   270
      End
      Begin VB.Label lblTelefono1Nombre 
         Caption         =   "Teléfono 1:"
         Height          =   195
         Left            =   180
         TabIndex        =   13
         Top             =   1380
         Width           =   930
      End
      Begin VB.Label lblNombre 
         Caption         =   "Nombre:"
         Height          =   195
         Left            =   180
         TabIndex        =   11
         Top             =   1020
         Width           =   930
      End
      Begin VB.Label lblCargo 
         Caption         =   "Cargo:"
         Height          =   195
         Left            =   180
         TabIndex        =   9
         Top             =   660
         Width           =   930
      End
      Begin VB.Label lblIDContacto 
         Caption         =   "ID:"
         Height          =   195
         Left            =   180
         TabIndex        =   7
         Top             =   300
         Width           =   930
      End
   End
   Begin VB.TextBox txtEntidadNombre 
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1140
      Locked          =   -1  'True
      MaxLength       =   100
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   4875
   End
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3855
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   4875
      _ExtentX        =   8599
      _ExtentY        =   6800
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDContacto"
      Columns(0).DataField=   "IDContacto"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Cargo"
      Columns(1).DataField=   "Cargo"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Nombre"
      Columns(2).DataField=   "Nombre"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   3
      Splits(0)._UserFlags=   0
      Splits(0).ExtendRightColumn=   -1  'True
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=3"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=2831"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2752"
      Splits(0)._ColumnProps(12)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8704"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(16)=   "Column(2).Width=4180"
      Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=4101"
      Splits(0)._ColumnProps(19)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8704"
      Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
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
      _StyleDefs(36)  =   "Splits(0).Columns(0).Style:id=32,.parent=13,.locked=-1"
      _StyleDefs(37)  =   "Splits(0).Columns(0).HeadingStyle:id=29,.parent=14"
      _StyleDefs(38)  =   "Splits(0).Columns(0).FooterStyle:id=30,.parent=15"
      _StyleDefs(39)  =   "Splits(0).Columns(0).EditorStyle:id=31,.parent=17"
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=94,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=91,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=92,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=93,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=46,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
      _StyleDefs(48)  =   "Named:id=33:Normal"
      _StyleDefs(49)  =   ":id=33,.parent=0"
      _StyleDefs(50)  =   "Named:id=34:Heading"
      _StyleDefs(51)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(52)  =   ":id=34,.wraptext=-1"
      _StyleDefs(53)  =   "Named:id=35:Footing"
      _StyleDefs(54)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(55)  =   "Named:id=36:Selected"
      _StyleDefs(56)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(57)  =   "Named:id=37:Caption"
      _StyleDefs(58)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(59)  =   "Named:id=38:HighlightRow"
      _StyleDefs(60)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(61)  =   "Named:id=39:EvenRow"
      _StyleDefs(62)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(63)  =   "Named:id=40:OddRow"
      _StyleDefs(64)  =   ":id=40,.parent=33"
      _StyleDefs(65)  =   "Named:id=41:RecordSelector"
      _StyleDefs(66)  =   ":id=41,.parent=34"
      _StyleDefs(67)  =   "Named:id=42:FilterBar"
      _StyleDefs(68)  =   ":id=42,.parent=33"
   End
   Begin VB.Label lblEntidadNombre 
      Caption         =   "Entidad:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   990
   End
End
Attribute VB_Name = "frmEntidad_Contacto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mEntidad As Entidad
Private mEntidad_Contacto As Entidad_Contacto

Public Function Startup(ByRef Entidad As Entidad) As Boolean
    Set mEntidad = Entidad
    
    Load Me
        
    Startup = True
End Function

Public Function LoadData(ByVal IDEntidad As Long, ByVal IDContacto As Byte) As Boolean
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    
    txtEntidadNombre.Text = mEntidad.Nombre
    
    Screen.MousePointer = vbHourglass
    
    If pIsCompiled Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Entidad_Contacto_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , IDEntidad)
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenStatic, adLockReadOnly, adCmdStoredProc
    
    Set tdbgrdData.DataSource = recData
    Set recData = Nothing
    
    EnableControls False
    
    Call FillData
    
    LoadData = True
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.Entidad_Contacto.LoadData", "Error al mostrar los Contactos de la Entidad.")
End Function

Private Sub FillData()
    Dim recData As ADODB.Recordset
    
    Set mEntidad_Contacto = New Entidad_Contacto
    
    Set recData = tdbgrdData.DataSource
    If Not recData.EOF Then
        With mEntidad_Contacto
            .IDEntidad = mEntidad.IDEntidad
            .IDContacto = tdbgrdData.Columns("IDContacto").Value
            If .Load() Then
                txtIDContacto.Text = .IDContacto_Formatted
                txtCargo.Text = .Cargo
                txtNombre.Text = .Nombre
                txtTelefono1Nombre.Text = .Telefono1Nombre
                txtTelefono1Numero.Text = .Telefono1Numero
                txtTelefono2Nombre.Text = .Telefono2Nombre
                txtTelefono2Numero.Text = .Telefono2Numero
                txtEmail1.Text = .Email1
                txtEmail2.Text = .Email2
                txtNotas.Text = .Notas
            Else
                Call CleanFields
            End If
        End With
    End If
    Set recData = Nothing
End Sub

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
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    Call SetTrueDBGridAppearance
    
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mEntidad = Nothing
    Set mEntidad_Contacto = Nothing
    Set frmEntidad_Contacto = Nothing
End Sub

Private Sub tdbgrdData_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
    Call FillData
End Sub

Private Sub cmdAgregar_Click()
    Set mEntidad_Contacto = New Entidad_Contacto
    mEntidad_Contacto.IDEntidad = mEntidad.IDEntidad
    
    Call CleanFields
    
    Call EnableControls(True)
    
    txtCargo.SetFocus
End Sub

Private Sub cmdEditar_Click()
    If tdbgrdData.FirstRow = "" Then
        MsgBox "No hay ningún Contacto seleccionado para Editar.", vbExclamation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    Call EnableControls(True)
    
    txtCargo.SetFocus
End Sub

Private Sub cmdEliminar_Click()
    If tdbgrdData.FirstRow = "" Then
        MsgBox "No hay ningún Contacto seleccionado para Borrar.", vbExclamation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    If MsgBox("¿Desea borrar este Contacto?" & vbCr & vbCr & "Cargo: " & mEntidad_Contacto.Cargo & vbCr & "Nombre: " & mEntidad_Contacto.Nombre, vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
        mEntidad_Contacto.Delete
    End If
    
    tdbgrdData.SetFocus
End Sub

Private Sub txtCargo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCargo)
End Sub

Private Sub txtNombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNombre)
End Sub

Private Sub txtTelefono1Nombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTelefono1Nombre)
End Sub

Private Sub txtTelefono1Numero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTelefono1Numero)
End Sub

Private Sub txtTelefono2Nombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTelefono2Nombre)
End Sub

Private Sub txtTelefono2Numero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTelefono2Numero)
End Sub

Private Sub txtEmail1_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtEmail1)
End Sub

Private Sub txtEmail2_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtEmail2)
End Sub

Private Sub txtNotas_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNotas)
End Sub

Private Sub cmdAceptar_Click()
    If Trim(txtNombre.Text) = "" Then
        MsgBox "Debe ingresar el Nombre del Contacto.", vbInformation, App.Title
        txtNombre.SetFocus
        Exit Sub
    End If
    
    With mEntidad_Contacto
        .Cargo = txtCargo.Text
        .Nombre = txtNombre.Text
        .Telefono1Nombre = txtTelefono1Nombre.Text
        .Telefono1Numero = txtTelefono1Numero.Text
        .Telefono2Nombre = txtTelefono2Nombre.Text
        .Telefono2Numero = txtTelefono2Numero.Text
        .Email1 = txtEmail1.Text
        .Email2 = txtEmail2.Text
        .Notas = txtNotas.Text

        If .Update Then
            Call EnableControls(False)
            
            tdbgrdData.SetFocus
        End If
    End With
End Sub

Private Sub cmdCancelar_Click()
    Call EnableControls(False)
    
    tdbgrdData.SetFocus
End Sub

Private Sub cmdCerrar_Click()
    Unload Me
End Sub

Private Sub EnableControls(ByVal Editable As Boolean)
    tdbgrdData.Enabled = Not Editable

    cmdAgregar.Enabled = Not Editable
    cmdEditar.Enabled = Not Editable
    cmdEliminar.Enabled = Not Editable

    Call CSM_Control_TextBox.ChangeEditableState(txtCargo, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtNombre, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtTelefono1Nombre, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtTelefono1Numero, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtTelefono2Nombre, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtTelefono2Numero, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtEmail1, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtEmail2, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtNotas, Editable)
    
    cmdAceptar.Visible = Editable
    cmdCancelar.Visible = Editable
    cmdCancelar.Cancel = Editable
    
    cmdCerrar.Cancel = Not Editable
End Sub

Private Sub CleanFields()
    txtIDContacto.Text = ""
    txtCargo.Text = ""
    txtNombre.Text = ""
    txtTelefono1Nombre.Text = ""
    txtTelefono1Numero.Text = ""
    txtTelefono2Nombre.Text = ""
    txtTelefono2Numero.Text = ""
    txtEmail1.Text = ""
    txtEmail2.Text = ""
    txtNotas.Text = ""
End Sub
