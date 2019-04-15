VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmContrato_Liquidacion 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Liquidaciones del Contrato"
   ClientHeight    =   5265
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
   Icon            =   "Contrato_Liquidacion.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   5265
   ScaleWidth      =   10290
   Begin VB.TextBox txtContratoNumeroComprador 
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
      Left            =   4680
      Locked          =   -1  'True
      MaxLength       =   20
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   120
      Width           =   1875
   End
   Begin VB.CommandButton cmdEliminar 
      Caption         =   "Borrar"
      Height          =   555
      Left            =   2040
      Picture         =   "Contrato_Liquidacion.frx":0CCA
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   4560
      Width           =   795
   End
   Begin VB.CommandButton cmdEditar 
      Caption         =   "Editar"
      Height          =   555
      Left            =   1080
      Picture         =   "Contrato_Liquidacion.frx":1254
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   4560
      Width           =   795
   End
   Begin VB.CommandButton cmdAgregar 
      Caption         =   "Agregar"
      Height          =   555
      Left            =   120
      Picture         =   "Contrato_Liquidacion.frx":17DE
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   4560
      Width           =   795
   End
   Begin VB.CommandButton cmdCerrar 
      Cancel          =   -1  'True
      Caption         =   "Cerrar"
      Height          =   375
      Left            =   8940
      TabIndex        =   26
      Top             =   4740
      Width           =   1215
   End
   Begin VB.Frame fraEdit 
      Height          =   3975
      Left            =   5160
      TabIndex        =   8
      Top             =   480
      Width           =   4995
      Begin VB.CommandButton cmdFecha_Hoy 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3360
         Picture         =   "Contrato_Liquidacion.frx":1D68
         Style           =   1  'Graphical
         TabIndex        =   15
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   660
         Width           =   315
      End
      Begin VB.CommandButton cmdFecha_Siguiente 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3060
         Picture         =   "Contrato_Liquidacion.frx":1EB2
         Style           =   1  'Graphical
         TabIndex        =   14
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   660
         Width           =   300
      End
      Begin VB.CommandButton cmdFecha_Anterior 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1320
         Picture         =   "Contrato_Liquidacion.frx":243C
         Style           =   1  'Graphical
         TabIndex        =   12
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   660
         Width           =   300
      End
      Begin VB.CommandButton cmdCancelar 
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   3600
         TabIndex        =   25
         Top             =   3420
         Width           =   1215
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Default         =   -1  'True
         Height          =   375
         Left            =   2280
         TabIndex        =   24
         Top             =   3420
         Width           =   1215
      End
      Begin VB.TextBox txtNotas 
         BackColor       =   &H8000000F&
         Height          =   1215
         Left            =   1320
         Locked          =   -1  'True
         MaxLength       =   8000
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   2100
         Width           =   3555
      End
      Begin VB.TextBox txtImporteNeto 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1320
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "CURRENCY|NOTEMPTY|NOTZERO|POSITIVE"
         Top             =   1740
         Width           =   1335
      End
      Begin VB.TextBox txtPrecio 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1320
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   19
         TabStop         =   0   'False
         Tag             =   "CURRENCY|NOTEMPTY|NOTZERO|POSITIVE"
         Top             =   1380
         Width           =   1335
      End
      Begin VB.TextBox txtKilogramo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1320
         Locked          =   -1  'True
         MaxLength       =   7
         TabIndex        =   17
         TabStop         =   0   'False
         Tag             =   "INTEGER|NOTEMPTY|NOTZERO|POSITIVE"
         Top             =   1020
         Width           =   1095
      End
      Begin VB.TextBox txtNumero 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1320
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   300
         Width           =   1935
      End
      Begin MSComCtl2.DTPicker dtpFecha 
         Height          =   315
         Left            =   1620
         TabIndex        =   13
         Top             =   660
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         Format          =   101122049
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin VB.Label lblFecha 
         AutoSize        =   -1  'True
         Caption         =   "Fecha:"
         Height          =   210
         Left            =   180
         TabIndex        =   11
         Top             =   720
         Width           =   495
      End
      Begin VB.Label lblNotas 
         Caption         =   "Notas:"
         Height          =   195
         Left            =   180
         TabIndex        =   22
         Top             =   2220
         Width           =   1110
      End
      Begin VB.Label lblImporteNeto 
         Caption         =   "Importe Neto:"
         Height          =   195
         Left            =   180
         TabIndex        =   20
         Top             =   1800
         Width           =   1110
      End
      Begin VB.Label lblPrecio 
         Caption         =   "Precio x ton.:"
         Height          =   195
         Left            =   180
         TabIndex        =   18
         Top             =   1440
         Width           =   1110
      End
      Begin VB.Label lblKilogramo 
         Caption         =   "Kilogramos:"
         Height          =   195
         Left            =   180
         TabIndex        =   16
         Top             =   1080
         Width           =   1110
      End
      Begin VB.Label lblNumero 
         Caption         =   "Número:"
         Height          =   195
         Left            =   180
         TabIndex        =   9
         Top             =   360
         Width           =   1110
      End
   End
   Begin VB.TextBox txtContratoNumero 
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
      MaxLength       =   20
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   1335
   End
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3855
      Left            =   120
      TabIndex        =   4
      Top             =   600
      Width           =   4875
      _ExtentX        =   8599
      _ExtentY        =   6800
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDLiquidacion"
      Columns(0).DataField=   "IDLiquidacion"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Número"
      Columns(1).DataField=   "Numero"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Kgs."
      Columns(2).DataField=   "Kilogramo"
      Columns(2).NumberFormat=   "#,##0"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Precio"
      Columns(3).DataField=   "Precio"
      Columns(3).NumberFormat=   "Currency"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Importe Neto"
      Columns(4).DataField=   "ImporteNeto"
      Columns(4).NumberFormat=   "Currency"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   5
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=5"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=2990"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2910"
      Splits(0)._ColumnProps(12)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8704"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(16)=   "Column(2).Width=1429"
      Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=1349"
      Splits(0)._ColumnProps(19)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8706"
      Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(23)=   "Column(3).Width=1614"
      Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=1535"
      Splits(0)._ColumnProps(26)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(27)=   "Column(3)._ColStyle=8706"
      Splits(0)._ColumnProps(28)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(29)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(30)=   "Column(4).Width=1879"
      Splits(0)._ColumnProps(31)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(4)._WidthInPix=1799"
      Splits(0)._ColumnProps(33)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(34)=   "Column(4)._ColStyle=8706"
      Splits(0)._ColumnProps(35)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(36)=   "Column(4).Order=5"
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
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=46,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=28,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=26,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=27,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=50,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=48,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=49,.parent=17"
      _StyleDefs(56)  =   "Named:id=33:Normal"
      _StyleDefs(57)  =   ":id=33,.parent=0"
      _StyleDefs(58)  =   "Named:id=34:Heading"
      _StyleDefs(59)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(60)  =   ":id=34,.wraptext=-1"
      _StyleDefs(61)  =   "Named:id=35:Footing"
      _StyleDefs(62)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(63)  =   "Named:id=36:Selected"
      _StyleDefs(64)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(65)  =   "Named:id=37:Caption"
      _StyleDefs(66)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(67)  =   "Named:id=38:HighlightRow"
      _StyleDefs(68)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(69)  =   "Named:id=39:EvenRow"
      _StyleDefs(70)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(71)  =   "Named:id=40:OddRow"
      _StyleDefs(72)  =   ":id=40,.parent=33"
      _StyleDefs(73)  =   "Named:id=41:RecordSelector"
      _StyleDefs(74)  =   ":id=41,.parent=34"
      _StyleDefs(75)  =   "Named:id=42:FilterBar"
      _StyleDefs(76)  =   ":id=42,.parent=33"
   End
   Begin VB.Label lblContratoNumeroComprador 
      Caption         =   "Contrato Comprador N°:"
      Height          =   195
      Left            =   2820
      TabIndex        =   2
      Top             =   180
      Width           =   1830
   End
   Begin VB.Label lblContratoNumero 
      Caption         =   "Contrato N°:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   990
   End
End
Attribute VB_Name = "frmContrato_Liquidacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mContrato As Contrato
Private mContratoLiquidacion As ContratoLiquidacion

Public Function Startup(ByRef Contrato As Contrato) As Boolean
    Set mContrato = Contrato
    
    Load Me
    
    dtpFecha.Value = Date
        
    Startup = True
End Function

Public Function LoadData(ByVal IDContrato As Long, ByVal Indice As Byte) As Boolean
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    
    txtContratoNumero.Text = mContrato.Numero
    txtContratoNumeroComprador.Text = mContrato.NumeroComprador
    
    Screen.MousePointer = vbHourglass
    
    If pIsCompiled Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_ContratoLiquidacion_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , IDContrato)
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
    Call CSM_Error.ShowErrorMessage("Forms.ContratoLiquidacion.LoadData", "Error al mostrar las Liquidaciones del Contrato.")
End Function

Private Sub FillData()
    Dim recData As ADODB.Recordset
    
    Set mContratoLiquidacion = New ContratoLiquidacion
    
    Set recData = tdbgrdData.DataSource
    If Not recData.EOF Then
        With mContratoLiquidacion
            .IDContrato = mContrato.IDContrato
            .IDLiquidacion = tdbgrdData.Columns("IDLiquidacion").Value
            If .Load() Then
                txtNumero.Text = .Numero
                dtpFecha.Value = .Fecha
                txtKilogramo.Text = .Kilogramo_Formatted
                txtPrecio.Text = .Precio_Formatted
                txtImporteNeto.Text = .ImporteNeto_Formatted
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
    Set mContrato = Nothing
    Set mContratoLiquidacion = Nothing
    Set frmContrato_Liquidacion = Nothing
End Sub

Private Sub tdbgrdData_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
    Call FillData
End Sub

Private Sub cmdAgregar_Click()
    Set mContratoLiquidacion = New ContratoLiquidacion
    mContratoLiquidacion.IDContrato = mContrato.IDContrato
    
    Call CleanFields
    
    Call EnableControls(True)
    
    txtNumero.SetFocus
End Sub

Private Sub cmdEditar_Click()
    If tdbgrdData.FirstRow = "" Then
        MsgBox "No hay ninguna Liquidación seleccionada para Editar.", vbExclamation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    Call EnableControls(True)
    
    txtNumero.SetFocus
End Sub

Private Sub cmdEliminar_Click()
    If tdbgrdData.FirstRow = "" Then
        MsgBox "No hay ninguna Liquidación seleccionada para Borrar.", vbExclamation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    If MsgBox("¿Desea borrar esta Liquidación?" & vbCr & vbCr & "Número: " & mContratoLiquidacion.Numero, vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
        mContratoLiquidacion.Delete
    End If
    
    tdbgrdData.SetFocus
End Sub

'============================================================
'NUMERO
Private Sub txtNumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNumero)
End Sub

'============================================================
'FECHA
Private Sub cmdFecha_Anterior_Click()
    dtpFecha.Value = DateAdd("d", -1, dtpFecha.Value)
    dtpFecha.SetFocus
End Sub

Private Sub cmdFecha_Siguiente_Click()
    dtpFecha.Value = DateAdd("d", 1, dtpFecha.Value)
    dtpFecha.SetFocus
End Sub

Private Sub cmdFecha_Hoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFecha.Value
    dtpFecha.Value = Date
    dtpFecha.SetFocus
End Sub

'============================================================
'PRECIO
Private Sub txtPrecio_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPrecio)
End Sub

Private Sub txtPrecio_LostFocus()
    Call FormatValue_ByTag(txtPrecio)
End Sub

'============================================================
'KILOGRAMO
Private Sub txtKilogramo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtKilogramo)
End Sub

Private Sub txtKilogramo_LostFocus()
    Call FormatValue_ByTag(txtKilogramo)
End Sub

Private Sub txtNotas_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNotas)
End Sub

'============================================================
'NOTAS
Private Sub cmdAceptar_Click()
    If Trim(txtNumero.Text) = "" Then
        MsgBox "Debe ingresar el Número de la Liquidación.", vbInformation, App.Title
        txtNumero.SetFocus
        Exit Sub
    End If
    
    If DateDiff("d", dtpFecha.Value, mContrato.Fecha) > 0 Then
        MsgBox "La Fecha de la Liquidación no debe ser anterior a la Fecha del Contrato.", vbInformation, App.Title
        dtpFecha.SetFocus
        Exit Sub
    End If
    
    If Trim(txtKilogramo.Text) = "" Then
        MsgBox "Debe especificar los Kilogramos.", vbInformation, App.Title
        txtKilogramo.SetFocus
        Exit Sub
    End If
    If Not IsNumeric(txtKilogramo.Text) Then
        MsgBox "Los Kilogramos deben ser un valor numérico.", vbInformation, App.Title
        txtKilogramo.SetFocus
        Exit Sub
    End If
    If CLng(txtKilogramo.Text) <= 0 Then
        MsgBox "Los Kilogramos deben ser mayores a cero.", vbInformation, App.Title
        txtKilogramo.SetFocus
        Exit Sub
    End If
    
    If Trim(txtPrecio.Text) = "" Then
        MsgBox "Debe especificar el Precio por tonelada.", vbInformation, App.Title
        txtPrecio.SetFocus
        Exit Sub
    End If
    If Not IsNumeric(txtPrecio.Text) Then
        MsgBox "El Precio debe ser un valor numérico.", vbInformation, App.Title
        txtPrecio.SetFocus
        Exit Sub
    End If
    If CCur(txtPrecio.Text) <= 0 Then
        MsgBox "El Precio debe ser mayor a cero.", vbInformation, App.Title
        txtPrecio.SetFocus
        Exit Sub
    End If
    
    With mContratoLiquidacion
        .Numero = txtNumero.Text
        .Fecha = dtpFecha.Value
        .Kilogramo_Formatted = txtKilogramo.Text
        .Precio_Formatted = txtPrecio.Text
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

    Call CSM_Control_TextBox.ChangeEditableState(txtNumero, Editable)
    cmdFecha_Anterior.Enabled = Editable
    dtpFecha.Enabled = Editable
    cmdFecha_Siguiente.Enabled = Editable
    cmdFecha_Hoy.Enabled = Editable
    Call CSM_Control_TextBox.ChangeEditableState(txtKilogramo, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtPrecio, Editable)
    Call CSM_Control_TextBox.ChangeEditableState(txtNotas, Editable)
    
    cmdAceptar.Visible = Editable
    cmdCancelar.Visible = Editable
    cmdCancelar.Cancel = Editable
    
    cmdCerrar.Cancel = Not Editable
End Sub

Private Sub CleanFields()
    txtNumero.Text = ""
    dtpFecha.Value = Date
    txtKilogramo.Text = ""
    txtPrecio.Text = ""
    txtImporteNeto.Text = ""
    txtNotas.Text = ""
End Sub
