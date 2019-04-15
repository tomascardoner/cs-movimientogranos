VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmMovimiento_SubProducto_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Movimiento de SubProducto"
   ClientHeight    =   7320
   ClientLeft      =   4575
   ClientTop       =   3135
   ClientWidth     =   9300
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Movimiento_SubProducto_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   7320
   ScaleWidth      =   9300
   Begin VB.PictureBox picDetailSingle 
      BorderStyle     =   0  'None
      Height          =   1875
      Left            =   480
      ScaleHeight     =   1875
      ScaleWidth      =   8595
      TabIndex        =   54
      TabStop         =   0   'False
      Top             =   4740
      Width           =   8595
      Begin VB.TextBox txtKilogramo 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1500
         MaxLength       =   7
         TabIndex        =   58
         Tag             =   "INTEGER|EMPTY|ZERO|POSITIVE"
         Top             =   420
         Width           =   1095
      End
      Begin VB.TextBox txtPrecioToneladaDolar 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1500
         MaxLength       =   15
         TabIndex        =   60
         Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox txtPrecioToneladaPeso 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1500
         MaxLength       =   15
         TabIndex        =   68
         Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
         Top             =   1260
         Width           =   1095
      End
      Begin VB.CommandButton cmdCotizacionDolarFecha_Anterior 
         Height          =   315
         Left            =   3660
         Picture         =   "Movimiento_SubProducto_Detalle.frx":0CCA
         Style           =   1  'Graphical
         TabIndex        =   62
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   840
         Width           =   300
      End
      Begin VB.CommandButton cmdCotizacionDolarFecha_Siguiente 
         Height          =   315
         Left            =   5400
         Picture         =   "Movimiento_SubProducto_Detalle.frx":1254
         Style           =   1  'Graphical
         TabIndex        =   64
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   840
         Width           =   300
      End
      Begin VB.CommandButton cmdCotizacionDolarFecha_Hoy 
         Height          =   315
         Left            =   5700
         Picture         =   "Movimiento_SubProducto_Detalle.frx":17DE
         Style           =   1  'Graphical
         TabIndex        =   65
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   840
         Width           =   315
      End
      Begin VB.TextBox txtCotizacionDolarImporte 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   6120
         MaxLength       =   15
         TabIndex        =   66
         Tag             =   "DECIMAL|EMPTY|NOTZERO|POSITIVE|999.9999"
         Top             =   840
         Width           =   1095
      End
      Begin MSDataListLib.DataCombo datcboSubProducto 
         Height          =   330
         Left            =   1500
         TabIndex        =   56
         Top             =   0
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSComCtl2.DTPicker dtpCotizacionDolarFecha 
         Height          =   315
         Left            =   3960
         TabIndex        =   63
         Top             =   840
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   116391937
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin VB.Label lblSubProducto 
         AutoSize        =   -1  'True
         Caption         =   "&SubProducto:"
         Height          =   210
         Left            =   0
         TabIndex        =   55
         Top             =   60
         Width           =   975
      End
      Begin VB.Label lblKilogramo 
         AutoSize        =   -1  'True
         Caption         =   "&Kilogramos:"
         Height          =   210
         Left            =   0
         TabIndex        =   57
         Top             =   480
         Width           =   840
      End
      Begin VB.Label lblPrecioToneladaDolar 
         AutoSize        =   -1  'True
         Caption         =   "Precio x Tn. (USD):"
         Height          =   210
         Left            =   0
         TabIndex        =   59
         Top             =   900
         Width           =   1380
      End
      Begin VB.Label lblPrecioToneladaPeso 
         AutoSize        =   -1  'True
         Caption         =   "Precio x Tn. ($):"
         Height          =   210
         Left            =   0
         TabIndex        =   67
         Top             =   1320
         Width           =   1155
      End
      Begin VB.Label lblCotizacionDolarFecha 
         AutoSize        =   -1  'True
         Caption         =   "Cotización:"
         Height          =   210
         Left            =   2760
         TabIndex        =   61
         Top             =   900
         Width           =   795
      End
   End
   Begin VB.PictureBox picDetailGrid 
      BorderStyle     =   0  'None
      Height          =   1875
      Left            =   480
      ScaleHeight     =   1875
      ScaleWidth      =   8595
      TabIndex        =   69
      Top             =   4740
      Width           =   8595
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Borrar"
         Height          =   315
         Left            =   7740
         TabIndex        =   73
         Top             =   720
         Width           =   855
      End
      Begin VB.CommandButton cmdModify 
         Caption         =   "Editar"
         Height          =   315
         Left            =   7740
         TabIndex        =   72
         Top             =   360
         Width           =   855
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Agregar"
         Height          =   315
         Left            =   7740
         TabIndex        =   71
         Top             =   0
         Width           =   855
      End
      Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
         Height          =   1875
         Left            =   0
         TabIndex        =   70
         Top             =   0
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   3307
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "Linea"
         Columns(0).DataField=   "Linea"
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "IDSubProducto"
         Columns(1).DataField=   "IDSubProducto"
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "SubProducto"
         Columns(2).DataField=   "SubProductoNombre"
         Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(3)._VlistStyle=   0
         Columns(3)._MaxComboItems=   5
         Columns(3).Caption=   "Kilogramos"
         Columns(3).DataField=   "Kilogramos"
         Columns(3).NumberFormat=   "#,##0"
         Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(4)._VlistStyle=   0
         Columns(4)._MaxComboItems=   5
         Columns(4).Caption=   "Precio x Tn. (USD)"
         Columns(4).DataField=   "PrecioToneladaDolar"
         Columns(4).NumberFormat=   "Currency"
         Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(5)._VlistStyle=   0
         Columns(5)._MaxComboItems=   5
         Columns(5).Caption=   "Precio x Tn. ($)"
         Columns(5).DataField=   "PrecioToneladaPeso"
         Columns(5).NumberFormat=   "Currency"
         Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   6
         Splits(0)._UserFlags=   0
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   953
         Splits(0)._SavedRecordSelectors=   0   'False
         Splits(0).AlternatingRowStyle=   -1  'True
         Splits(0).DividerColor=   15790320
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=6"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
         Splits(0)._ColumnProps(4)=   "Column(0).AllowSizing=0"
         Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
         Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
         Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
         Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(9)=   "Column(1).Width=2725"
         Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2646"
         Splits(0)._ColumnProps(12)=   "Column(1).AllowSizing=0"
         Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8196"
         Splits(0)._ColumnProps(14)=   "Column(1).Visible=0"
         Splits(0)._ColumnProps(15)=   "Column(1).AllowFocus=0"
         Splits(0)._ColumnProps(16)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(17)=   "Column(2).Width=5292"
         Splits(0)._ColumnProps(18)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(19)=   "Column(2)._WidthInPix=5212"
         Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8704"
         Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
         Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(23)=   "Column(3).Width=1773"
         Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=1693"
         Splits(0)._ColumnProps(26)=   "Column(3)._ColStyle=514"
         Splits(0)._ColumnProps(27)=   "Column(3).AllowFocus=0"
         Splits(0)._ColumnProps(28)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(29)=   "Column(4).Width=2725"
         Splits(0)._ColumnProps(30)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(31)=   "Column(4)._WidthInPix=2646"
         Splits(0)._ColumnProps(32)=   "Column(4)._ColStyle=8706"
         Splits(0)._ColumnProps(33)=   "Column(4).AllowFocus=0"
         Splits(0)._ColumnProps(34)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(35)=   "Column(5).Width=2725"
         Splits(0)._ColumnProps(36)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(37)=   "Column(5)._WidthInPix=2646"
         Splits(0)._ColumnProps(38)=   "Column(5)._ColStyle=8706"
         Splits(0)._ColumnProps(39)=   "Column(5).AllowFocus=0"
         Splits(0)._ColumnProps(40)=   "Column(5).Order=6"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   3
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         AllowUpdate     =   0   'False
         DataMode        =   4
         DefColWidth     =   0
         HeadLines       =   1
         FootLines       =   1
         TabAction       =   1
         MultipleLines   =   0
         CellTipsWidth   =   0
         DeadAreaBackColor=   15790320
         RowDividerColor =   15790320
         RowSubDividerColor=   15790320
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
         _StyleDefs(8)   =   ":id=1,.fontname=MS Sans Serif"
         _StyleDefs(9)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
         _StyleDefs(10)  =   "HeadingStyle:id=2,.parent=1,.namedParent=34,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(11)  =   ":id=2,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(12)  =   ":id=2,.fontname=MS Sans Serif"
         _StyleDefs(13)  =   "FooterStyle:id=3,.parent=1,.namedParent=35,.bold=0,.fontsize=825,.italic=0"
         _StyleDefs(14)  =   ":id=3,.underline=0,.strikethrough=0,.charset=0"
         _StyleDefs(15)  =   ":id=3,.fontname=MS Sans Serif"
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
         _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=50,.parent=13,.locked=-1"
         _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=47,.parent=14"
         _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=48,.parent=15"
         _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=49,.parent=17"
         _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=28,.parent=13,.alignment=0,.locked=-1"
         _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=25,.parent=14,.alignment=2"
         _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=26,.parent=15"
         _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=27,.parent=17"
         _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=46,.parent=13,.alignment=1"
         _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=43,.parent=14,.alignment=2"
         _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=44,.parent=15"
         _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=45,.parent=17"
         _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=54,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=51,.parent=14,.alignment=2"
         _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=52,.parent=15"
         _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=53,.parent=17"
         _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=58,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=55,.parent=14,.alignment=2"
         _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=56,.parent=15"
         _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=57,.parent=17"
         _StyleDefs(60)  =   "Named:id=33:Normal"
         _StyleDefs(61)  =   ":id=33,.parent=0"
         _StyleDefs(62)  =   "Named:id=34:Heading"
         _StyleDefs(63)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(64)  =   ":id=34,.wraptext=-1"
         _StyleDefs(65)  =   "Named:id=35:Footing"
         _StyleDefs(66)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(67)  =   "Named:id=36:Selected"
         _StyleDefs(68)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(69)  =   "Named:id=37:Caption"
         _StyleDefs(70)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(71)  =   "Named:id=38:HighlightRow"
         _StyleDefs(72)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(73)  =   "Named:id=39:EvenRow"
         _StyleDefs(74)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(75)  =   "Named:id=40:OddRow"
         _StyleDefs(76)  =   ":id=40,.parent=33"
         _StyleDefs(77)  =   "Named:id=41:RecordSelector"
         _StyleDefs(78)  =   ":id=41,.parent=34"
         _StyleDefs(79)  =   "Named:id=42:FilterBar"
         _StyleDefs(80)  =   ":id=42,.parent=33"
      End
   End
   Begin MSComctlLib.TabStrip tabDetalle 
      Height          =   2115
      Left            =   60
      TabIndex        =   53
      TabStop         =   0   'False
      Top             =   4620
      Width           =   9135
      _ExtentX        =   16113
      _ExtentY        =   3731
      MultiRow        =   -1  'True
      Style           =   1
      Placement       =   2
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Carga simple"
            Key             =   "SIMPLE"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Grilla"
            Key             =   "GRILLA"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   7260
      TabIndex        =   74
      Top             =   6840
      Width           =   915
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   8280
      TabIndex        =   75
      Top             =   6840
      Width           =   915
   End
   Begin VB.Frame fraOrigenDestino 
      Caption         =   "Origen y Destino del SubProducto"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2175
      Left            =   4680
      TabIndex        =   28
      Top             =   60
      Width           =   4515
      Begin VB.TextBox txtDestinoDireccion 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   35
         Top             =   1020
         Width           =   3195
      End
      Begin VB.TextBox txtDestinoLocalidad 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   37
         Top             =   1380
         Width           =   3195
      End
      Begin VB.TextBox txtDestinoProvincia 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   39
         Top             =   1740
         Width           =   3195
      End
      Begin VB.CommandButton cmdDestino 
         Caption         =   "…"
         Height          =   315
         Left            =   4140
         TabIndex        =   33
         TabStop         =   0   'False
         ToolTipText     =   "Orígenes / Destinos"
         Top             =   660
         Width           =   255
      End
      Begin MSDataListLib.DataCombo datcboDestino 
         Height          =   330
         Left            =   1200
         TabIndex        =   32
         Top             =   660
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboOrigen 
         Height          =   330
         Left            =   1200
         TabIndex        =   30
         Top             =   300
         Width           =   3225
         _ExtentX        =   5689
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblOrigen 
         AutoSize        =   -1  'True
         Caption         =   "Origen:"
         Height          =   210
         Left            =   120
         TabIndex        =   29
         Top             =   360
         Width           =   525
      End
      Begin VB.Label lblDestinoProvincia 
         AutoSize        =   -1  'True
         Caption         =   "Provincia:"
         Height          =   210
         Left            =   120
         TabIndex        =   38
         Top             =   1800
         Width           =   705
      End
      Begin VB.Label lblDestinoLocalidad 
         AutoSize        =   -1  'True
         Caption         =   "Localidad:"
         Height          =   210
         Left            =   120
         TabIndex        =   36
         Top             =   1440
         Width           =   735
      End
      Begin VB.Label lblDestinoDireccion 
         AutoSize        =   -1  'True
         Caption         =   "Dirección:"
         Height          =   210
         Left            =   120
         TabIndex        =   34
         Top             =   1080
         Width           =   720
      End
      Begin VB.Label lblDestino 
         AutoSize        =   -1  'True
         Caption         =   "Destino:"
         Height          =   210
         Left            =   120
         TabIndex        =   31
         Top             =   720
         Width           =   585
      End
   End
   Begin VB.Frame fraDatosTransporte 
      Caption         =   "Datos del Transporte"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   4680
      TabIndex        =   40
      Top             =   2280
      Width           =   4515
      Begin VB.TextBox txtTransporteCamion 
         Height          =   315
         Left            =   1200
         MaxLength       =   7
         TabIndex        =   42
         Tag             =   "STRING|EMPTY|UPPER|7"
         Top             =   300
         Width           =   915
      End
      Begin VB.TextBox txtTransporteAcoplado 
         Height          =   315
         Left            =   3300
         MaxLength       =   7
         TabIndex        =   44
         Tag             =   "STRING|EMPTY|UPPER|7"
         Top             =   300
         Width           =   1095
      End
      Begin VB.TextBox txtTransporteKilometro 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   46
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   660
         Width           =   1095
      End
      Begin VB.TextBox txtTransporteTarifa 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   3300
         MaxLength       =   10
         TabIndex        =   52
         Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
         Top             =   1020
         Width           =   1095
      End
      Begin VB.CommandButton cmdTransporteKilometro 
         Caption         =   "<"
         Height          =   315
         Left            =   2280
         TabIndex        =   47
         TabStop         =   0   'False
         ToolTipText     =   "Obtener los kilómetros desde el Origen / Destino"
         Top             =   660
         Width           =   255
      End
      Begin VB.CommandButton cmdTransporteTarifa 
         Caption         =   "<"
         Height          =   315
         Left            =   2280
         TabIndex        =   50
         TabStop         =   0   'False
         ToolTipText     =   "Obtener la Tarifa de Flete"
         Top             =   1020
         Width           =   255
      End
      Begin VB.TextBox txtTransporteTarifaReferencia 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1200
         MaxLength       =   10
         TabIndex        =   49
         Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
         Top             =   1020
         Width           =   1095
      End
      Begin VB.Label lblTransporteCamion 
         AutoSize        =   -1  'True
         Caption         =   "Camión:"
         Height          =   210
         Left            =   120
         TabIndex        =   41
         Top             =   360
         Width           =   570
      End
      Begin VB.Label lblTransporteAcoplado 
         AutoSize        =   -1  'True
         Caption         =   "Acoplado:"
         Height          =   210
         Left            =   2460
         TabIndex        =   43
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblTransporteKilometro 
         AutoSize        =   -1  'True
         Caption         =   "Kms.:"
         Height          =   210
         Left            =   120
         TabIndex        =   45
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblTransporteTarifaReferencia 
         AutoSize        =   -1  'True
         Caption         =   "Tarifa Refer.:"
         Height          =   210
         Left            =   120
         TabIndex        =   48
         Top             =   1080
         Width           =   960
      End
      Begin VB.Label lblTransporteTarifa 
         AutoSize        =   -1  'True
         Caption         =   "Tarifa:"
         Height          =   210
         Left            =   2760
         TabIndex        =   51
         Top             =   1080
         Width           =   465
      End
   End
   Begin VB.Frame fraEntidad 
      Caption         =   "Entidades"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   60
      TabIndex        =   13
      Top             =   1920
      Width           =   4515
      Begin VB.TextBox txtTransportistaCUIT 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   24
         Top             =   1740
         Width           =   1635
      End
      Begin VB.TextBox txtDestinatarioCUIT 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   1020
         Width           =   1635
      End
      Begin VB.CommandButton cmdEntidad 
         Caption         =   "…"
         Height          =   315
         Left            =   900
         TabIndex        =   15
         TabStop         =   0   'False
         ToolTipText     =   "Entidades"
         Top             =   300
         Width           =   255
      End
      Begin VB.CheckBox chkEntidad_Chofer_Todos 
         Caption         =   "#"
         Height          =   315
         Left            =   840
         Style           =   1  'Graphical
         TabIndex        =   26
         TabStop         =   0   'False
         ToolTipText     =   "Mostrar todos los choferes"
         Top             =   2100
         Width           =   330
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Titular 
         Height          =   330
         Left            =   1200
         TabIndex        =   16
         Top             =   300
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Destinatario 
         Height          =   330
         Left            =   1200
         TabIndex        =   18
         Top             =   660
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Transportista 
         Height          =   330
         Left            =   1200
         TabIndex        =   22
         Top             =   1380
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Chofer 
         Height          =   330
         Left            =   1200
         TabIndex        =   27
         Top             =   2100
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblTransportistaCUIT 
         AutoSize        =   -1  'True
         Caption         =   "CUIT:"
         Height          =   210
         Left            =   120
         TabIndex        =   23
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label lblDestinatarioCUIT 
         AutoSize        =   -1  'True
         Caption         =   "CUIT:"
         Height          =   210
         Left            =   120
         TabIndex        =   19
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label lblEntidad_Titular 
         AutoSize        =   -1  'True
         Caption         =   "Titular:"
         Height          =   210
         Left            =   120
         TabIndex        =   14
         Top             =   360
         Width           =   480
      End
      Begin VB.Label lblEntidad_Destinatario 
         AutoSize        =   -1  'True
         Caption         =   "Destinatario:"
         Height          =   210
         Left            =   120
         TabIndex        =   17
         Top             =   720
         Width           =   900
      End
      Begin VB.Label lblEntidad_Transportista 
         AutoSize        =   -1  'True
         Caption         =   "Transportista:"
         Height          =   210
         Left            =   120
         TabIndex        =   21
         Top             =   1440
         Width           =   1005
      End
      Begin VB.Label lblEntidad_Chofer 
         AutoSize        =   -1  'True
         Caption         =   "Chofer:"
         Height          =   210
         Left            =   120
         TabIndex        =   25
         Top             =   2160
         Width           =   540
      End
   End
   Begin VB.Frame fraEncabezado 
      Caption         =   "Encabezado"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4515
      Begin VB.CommandButton cmdCOTNumero 
         Caption         =   "…"
         Height          =   315
         Left            =   3300
         TabIndex        =   76
         TabStop         =   0   'False
         ToolTipText     =   "Entidades"
         Top             =   1380
         Width           =   255
      End
      Begin VB.TextBox txtCOTNumero 
         Height          =   315
         Left            =   1200
         MaxLength       =   8
         TabIndex        =   12
         Tag             =   "STRING|EMPTY|UPPER|16"
         Top             =   1380
         Width           =   2055
      End
      Begin VB.TextBox txtComprobanteNumero 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1200
         MaxLength       =   12
         TabIndex        =   4
         Tag             =   "STRING|NOTEMPTY|NUMBERS|12"
         Top             =   660
         Width           =   1755
      End
      Begin VB.CommandButton cmdFecha_Anterior 
         Height          =   315
         Left            =   1200
         Picture         =   "Movimiento_SubProducto_Detalle.frx":1928
         Style           =   1  'Graphical
         TabIndex        =   7
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   1020
         Width           =   300
      End
      Begin VB.CommandButton cmdFecha_Siguiente 
         Height          =   315
         Left            =   2940
         Picture         =   "Movimiento_SubProducto_Detalle.frx":1EB2
         Style           =   1  'Graphical
         TabIndex        =   9
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   1020
         Width           =   300
      End
      Begin VB.CommandButton cmdFecha_Hoy 
         Height          =   315
         Left            =   3240
         Picture         =   "Movimiento_SubProducto_Detalle.frx":243C
         Style           =   1  'Graphical
         TabIndex        =   10
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   1020
         Width           =   315
      End
      Begin VB.CommandButton cmdVerificarDuplicado 
         Caption         =   "« Verificar"
         Height          =   315
         Left            =   3000
         TabIndex        =   5
         TabStop         =   0   'False
         ToolTipText     =   "Verificar si el comprobante ya existe en el sistema"
         Top             =   660
         Width           =   975
      End
      Begin VB.TextBox txtMovimientoTipo 
         Alignment       =   2  'Center
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
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   300
         Width           =   3195
      End
      Begin MSComCtl2.DTPicker dtpFecha 
         Height          =   315
         Left            =   1500
         TabIndex        =   8
         Top             =   1020
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   116391937
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin VB.Label lblCOTNumero 
         AutoSize        =   -1  'True
         Caption         =   "C.O.T. Nro.:"
         Height          =   210
         Left            =   120
         TabIndex        =   11
         Top             =   1440
         Width           =   840
      End
      Begin VB.Label lblMovimientoTipo 
         AutoSize        =   -1  'True
         Caption         =   "Tipo:"
         Height          =   210
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   345
      End
      Begin VB.Label lblComprobanteNumero 
         AutoSize        =   -1  'True
         Caption         =   "Comprobante:"
         Height          =   210
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   1005
      End
      Begin VB.Label lblFecha 
         AutoSize        =   -1  'True
         Caption         =   "Fecha:"
         Height          =   210
         Left            =   120
         TabIndex        =   6
         Top             =   1080
         Width           =   495
      End
   End
End
Attribute VB_Name = "frmMovimiento_SubProducto_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean
Private mLoading As Boolean

Private mMovimiento_SubProducto As Movimiento_SubProducto

Private Const TABS_KEY_SIMPLE As String = "SIMPLE"
Private Const TABS_KEY_GRILLA As String = "GRILLA"

Public Function Startup(ByRef Movimiento_SubProducto As Movimiento_SubProducto) As Boolean
    Set mMovimiento_SubProducto = Movimiento_SubProducto
    
    mLoading = True
    
    Load Me
    
    Me.Caption = "Detalle del Movimiento de Cereal - Nuevo"
    
    txtMovimientoTipo.Text = mMovimiento_SubProducto.TipoNombre
    
    If mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA Or mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE Then
        'txtComprobanteNumero.Text = mMovimiento_SubProducto.ComprobanteNumero
    End If
    
    'Call EnableAndShowControls
    
    If mMovimiento_SubProducto.IsNew And (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA Or mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE) Then
        mMovimiento_SubProducto.GetProximoComprobanteNumero
        txtComprobanteNumero.Text = mMovimiento_SubProducto.ComprobanteNumero
    End If
    
    dtpFecha.Value = Date
    dtpCotizacionDolarFecha.Value = Date
    
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Lista") Then
        If frmMovimiento_SubProducto_Lista.cboFecha.ListIndex = 1 Then
            dtpFecha.Value = frmMovimiento_SubProducto_Lista.dtpFecha_Desde.Value
        End If
    End If
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Titular, "usp_Entidad_ControlaStock_List 0, 1, 1, " & mMovimiento_SubProducto.IDEntidad_Titular, "IDEntidad", "Nombre", "Titulares", cscpFirstIfUnique)
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Destinatario, "usp_Entidad_ClienteSubProducto_List 0, 1, " & mMovimiento_SubProducto.IDEntidad_Destinatario, "IDEntidad", "Nombre", "Destinatarios", cscpFirstIfUnique)
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Transportista, "usp_Entidad_Transportista_List 0, 1, " & mMovimiento_SubProducto.IDEntidad_Transportista, "IDEntidad", "Nombre", "Transportistas", cscpFirstIfUnique)
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboSubProducto, "usp_SubProducto_List 0, 0, 1, 1, NULL", "IDSubProducto", "Nombre", "SubProductos", cscpFirstIfUnique)
    
    Call datcboSubProducto_Change
    
    Startup = True
    mLoading = False
End Function

Public Function LoadData() As Boolean
    Dim Detalle As Movimiento_SubProducto_Det
    
    mLoading = True
    With mMovimiento_SubProducto
        Me.Caption = "Detalle del Movimiento de SubProducto - ID: " & mMovimiento_SubProducto.IDMovimiento_SubProducto_Formatted
        
        'ENCABEZADO
        txtComprobanteNumero.Text = .ComprobanteNumero
        dtpFecha.Value = .Fecha_Formatted
        txtCOTNumero.Text = .COTNumero
        
        'ENTIDADES
        datcboEntidad_Titular.BoundText = .IDEntidad_Titular
        datcboEntidad_Destinatario.BoundText = .IDEntidad_Destinatario
        datcboEntidad_Transportista.BoundText = .IDEntidad_Transportista
        datcboEntidad_Chofer.BoundText = .IDEntidad_Chofer
        
        'ORIGEN Y DESTINO DE LA MERCADERÍA
        datcboOrigen.BoundText = .IDOrigenDestino_Origen
        datcboDestino.BoundText = .IDOrigenDestino_Destino
        
        'COTIZACIÓN DEL DOLAR
        dtpCotizacionDolarFecha.Value = IIf(.CotizacionDolarFecha = DATE_TIME_FIELD_NULL_VALUE, Date, .CotizacionDolarFecha)
        txtCotizacionDolarImporte.Text = .CotizacionDolarImporte_Formatted
        
        'TRANSPORTE
        txtTransporteCamion.Text = .TransporteDominioCamion
        txtTransporteAcoplado.Text = .TransporteDominioAcoplado
        txtTransporteKilometro.Text = .TransporteKilometro_Formatted
        txtTransporteTarifaReferencia.Text = .TransporteTarifaReferencia_Formatted
        txtTransporteTarifa.Text = .TransporteTarifa_Formatted
        
        'SI ES UN SÓLO ITEM, LO MUESTRO PLANO, SI NO, EN GRILLA
        If Not .IsNew Then
            If .LoadDetalles Then
                If .Detalles.Count = 1 Then
                    Set tabDetalle.SelectedItem = tabDetalle.Tabs(TABS_KEY_SIMPLE)
                    Set Detalle = .Detalles(1)
                    datcboSubProducto.BoundText = Detalle.IDSubProducto
                    datcboSubProducto_Change
                    txtKilogramo.Text = Detalle.Kilogramo_Formatted
                    txtPrecioToneladaDolar.Text = Detalle.PrecioToneladaDolar_Formatted
                    txtPrecioToneladaPeso.Text = Detalle.PrecioToneladaPeso_Formatted
                Else
                    Set tabDetalle.SelectedItem = tabDetalle.Tabs(TABS_KEY_GRILLA)
                End If
                tabDetalle_Click
            End If
        End If
    End With
    
    LoadData = True
    mLoading = False
End Function

Private Sub cmdCOTNumero_Click()
    Dim Entidad_Transportista As Entidad
    Dim Entidad_Destinatario As Entidad
    Dim SubProducto As SubProducto
    
    Load frmCOTInfo
    With frmCOTInfo
        ' TRANSPORTISTA
        If Val(datcboEntidad_Transportista.BoundText) > 0 Then
            Set Entidad_Transportista = New Entidad
            Entidad_Transportista.IDEntidad = Val(datcboEntidad_Transportista.BoundText)
            If Entidad_Transportista.Load() Then
                .txtTransportistaCUIT.Text = Entidad_Transportista.CUIT
            End If
            Set Entidad_Transportista = Nothing
        End If
        .txtTransportistaDominioChasis.Text = txtTransporteCamion.Text
        .txtTransportistaDominioAcoplado.Text = txtTransporteAcoplado.Text
        
        ' DESTINATARIO Y DESTINO
        If Val(datcboEntidad_Destinatario.BoundText) > 0 Then
            Set Entidad_Destinatario = New Entidad
            Entidad_Destinatario.IDEntidad = Val(datcboEntidad_Destinatario.BoundText)
            If Entidad_Destinatario.Load() Then
                .txtDestinatarioCUIT.Text = Entidad_Destinatario.CUIT
            End If
            
            If Not Entidad_Destinatario.Entidad_Domicilio Is Nothing Then
                .txtDestinoDomicilioCalle.Text = Entidad_Destinatario.Entidad_Domicilio.Calle
                .txtDestinoDomicilioNumero.Text = Entidad_Destinatario.Entidad_Domicilio.Numero
                .txtDestinoDomicilioPiso.Text = Entidad_Destinatario.Entidad_Domicilio.Piso
                .txtDestinoDomicilioOficina.Text = Entidad_Destinatario.Entidad_Domicilio.Oficina
                .txtDestinoDomicilioLocalidad.Text = Entidad_Destinatario.Entidad_Domicilio.Localidad.Nombre
            End If
            Set Entidad_Destinatario = Nothing
        End If
        
        ' PRODUCTO
        If Val(datcboSubProducto.BoundText) > 0 Then
            Set SubProducto = New SubProducto
            SubProducto.IDSubProducto = Val(datcboSubProducto.BoundText)
            If SubProducto.Load() Then
                .txtProductoCodigo.Text = IIf(SubProducto.COT_Codigo = 0, "", SubProducto.COT_Codigo)
                Call txtKilogramo_LostFocus
                .txtProductoKilogramo.Text = txtKilogramo.Text
            End If
            Set SubProducto = Nothing
        End If
        
        ' DOCUMENTACIÓN
        .txtDocumentacionNumero.Text = Left(txtComprobanteNumero.Text, 4) & "-" & Mid(txtComprobanteNumero.Text, 5)
        .txtDocumentacionFecha.Text = dtpFecha.Value
        
        Call txtPrecioToneladaPeso_LostFocus
        If Trim(txtKilogramo.Text) <> "" And Trim(txtPrecioToneladaPeso.Text) <> "" Then
            If IsNumeric(txtKilogramo.Text) And IsNumeric(txtPrecioToneladaPeso.Text) Then
                .txtDocumentacionImporte.Text = Format((CLng(txtKilogramo.Text) / 1000) * CCur(txtPrecioToneladaPeso.Text), "Currency")
            End If
        End If
    End With
    frmCOTInfo.Show vbModal, frmMDI
    Set frmCOTInfo = Nothing
End Sub

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mMovimiento_SubProducto = Nothing
    Set frmMovimiento_SubProducto_Detalle = Nothing
End Sub

'============================================================
'COMPROBANTE NUMERO
Private Sub txtComprobanteNumero_GotFocus()
    CSM_Control_TextBox.SelAllText txtComprobanteNumero
End Sub

Private Sub txtComprobanteNumero_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtComprobanteNumero
End Sub

Private Sub cmdVerificarDuplicado_Click()
   If Trim(txtComprobanteNumero.Text) = "" Then
        MsgBox "Debe especificar el Número de Carta de Porte.", vbInformation, App.Title
        txtComprobanteNumero.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtComprobanteNumero.Text)) < 12 Then
        MsgBox "El Número de Carta de Porte debe contener 12 dígitos (sin guiones).", vbInformation, App.Title
        txtComprobanteNumero.SetFocus
        Exit Sub
    End If
    
    mMovimiento_SubProducto.ComprobanteNumero = txtComprobanteNumero.Text
    mMovimiento_SubProducto.NoMatchRaiseError = False
    If mMovimiento_SubProducto.LoadByComprobanteNumero() Then
        If Not mMovimiento_SubProducto.NoMatch Then
            Select Case mMovimiento_SubProducto.Tipo
                Case MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION, MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA
                    MsgBox "Esta " & mMovimiento_SubProducto.TipoNombre & " ya está cargada en el sistema.", vbExclamation, App.Title
                Case MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA, MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE
                    MsgBox "Este " & mMovimiento_SubProducto.TipoNombre & " ya está cargado en el sistema.", vbExclamation, App.Title
            End Select
            Exit Sub
        End If
    End If
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
'COT NUMERO
Private Sub txtCOTNumero_GotFocus()
    CSM_Control_TextBox.SelAllText txtCOTNumero
End Sub

Private Sub txtCOTNumero_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtCOTNumero
End Sub

Private Sub cmdEntidad_Click()
    Screen.MousePointer = vbHourglass
    frmEntidad_Lista.Show
    
    On Error Resume Next
    
    If frmEntidad_Lista.WindowState = vbMinimized Then
        frmEntidad_Lista.WindowState = vbNormal
    End If
    frmEntidad_Lista.SetFocus
    Screen.MousePointer = vbDefault
End Sub

'============================================================
'ENTIDAD TITULAR
Private Sub datcboEntidad_Titular_Change()
    datcboOrigen.BoundText = ""
    
    Select Case mMovimiento_SubProducto.Tipo
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION
            'Call CSM_Control_DataCombo.FillFromSQL(datcboOrigen, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Procedencias", cscpFirstIfUnique)
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA
            Call CSM_Control_DataCombo.FillFromSQL(datcboOrigen, "usp_Entidad_OrigenDestino_List 0, 0, 1, 1, 1, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Orígenes", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA, MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE
            'Call CSM_Control_DataCombo.FillFromSQL(datcboOrigen, "usp_Entidad_OrigenDestino_List 0, 0, 1, 1, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Procedencias", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
    End Select
End Sub

'============================================================
'ENTIDAD DESTINO
Private Sub datcboEntidad_Destinatario_Change()
    Dim Entidad_Destinatario As Entidad
    
    'MUESTRO EL NÚMERO DE CUIT
    Set Entidad_Destinatario = New Entidad
    Entidad_Destinatario.IDEntidad = CLng(datcboEntidad_Destinatario.BoundText)
    If Not Entidad_Destinatario.Load() Then
        txtDestinatarioCUIT.Text = ""
        Set Entidad_Destinatario = Nothing
        Exit Sub
    End If
    txtDestinatarioCUIT.Text = Entidad_Destinatario.CUIT_Formatted
    Set Entidad_Destinatario = Nothing
    
    'LLENO EL COMBO DE DESTINOS
    datcboDestino.BoundText = ""
    Select Case mMovimiento_SubProducto.Tipo
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION
            'Call CSM_Control_DataCombo.FillFromSQL(datcboDestino, "SELECT IDOrigenDestino, Nombre + ISNULL(' - (' + CONVERT(varchar(7), ONCCA_Codigo, 1) + ')', '') AS Nombre FROM Entidad_OrigenDestino WHERE IDEntidad = " & Val(datcboEntidad_Destinatario.BoundText) & " ORDER BY Nombre", "IDOrigenDestino", "Nombre", "Destinos", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA
            Call CSM_Control_DataCombo.FillFromSQL(datcboDestino, "usp_Entidad_OrigenDestino_List 0, 0, 1, 0, 0, " & Val(datcboEntidad_Destinatario.BoundText) & ", " & Val(datcboDestino.BoundText), "ID", "Nombre", "Destinos", cscpFirstIfUnique)
    End Select
End Sub

'============================================================
'ENTIDAD DESTINO CUIT
Private Sub txtDestinatarioCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinatarioCUIT)
End Sub

'============================================================
'ENTIDAD TRANSPORTISTA
Private Sub datcboEntidad_Transportista_Change()
    Dim KeySave As Long
    Dim Entidad_Transportista As Entidad
    
    'MUESTRO EL NÚMERO DE CUIT
    Set Entidad_Transportista = New Entidad
    Entidad_Transportista.IDEntidad = CLng(datcboEntidad_Transportista.BoundText)
    If Not Entidad_Transportista.Load() Then
        txtTransportistaCUIT.Text = ""
        Set Entidad_Transportista = Nothing
        Exit Sub
    End If
    txtTransportistaCUIT.Text = Entidad_Transportista.CUIT_Formatted
    Set Entidad_Transportista = Nothing
    
    'LLENO EL COMBO DE CHOFERES
    KeySave = Val(datcboEntidad_Chofer)
    datcboEntidad_Chofer.BoundText = ""
    txtTransporteCamion.Text = ""
    txtTransporteAcoplado.Text = ""
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Chofer, "usp_Entidad_Chofer_List 0, 1, " & IIf(chkEntidad_Chofer_Todos.Value = vbChecked, "NULL", Val(datcboEntidad_Transportista.BoundText)) & ", " & mMovimiento_SubProducto.IDEntidad_Chofer, "IDEntidad", "Nombre", "Choferes", cscpItemOrFirstIfUnique, KeySave)
End Sub

'============================================================
'ENTIDAD TRANSPORTISTA CUIT
Private Sub txtTransportistaCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransportistaCUIT)
End Sub

'============================================================
'ENTIDAD CHOFER
Private Sub chkEntidad_Chofer_Todos_Click()
    Call datcboEntidad_Transportista_Change
End Sub

Private Sub datcboEntidad_Chofer_Change()
    Dim Entidad_Chofer As Entidad_Chofer
    
    If Val(datcboEntidad_Chofer.BoundText) > 0 Then
        Set Entidad_Chofer = New Entidad_Chofer
        Entidad_Chofer.IDEntidad = Val(datcboEntidad_Chofer.BoundText)
        If Entidad_Chofer.Load() Then
            txtTransporteCamion.Text = Entidad_Chofer.PatenteChasis
            txtTransporteAcoplado.Text = Entidad_Chofer.PatenteAcoplado
        End If
        Set Entidad_Chofer = Nothing
    End If
End Sub

'============================================================
'DESTINO
Private Sub datcboDestino_Change()
    Dim Entidad_OrigDest As Entidad_OrigDest
    
    If Val(datcboDestino.BoundText) = 0 Then
        txtDestinoDireccion.Text = ""
        txtDestinoLocalidad.Text = ""
        txtDestinoProvincia.Text = ""
    Else
        Set Entidad_OrigDest = New Entidad_OrigDest
        If (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION Or mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA) Then
            Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Destinatario.BoundText)
        Else
            Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Titular.BoundText)
        End If
        Entidad_OrigDest.IDOrigenDestino = Val(datcboDestino.BoundText)
        If Entidad_OrigDest.Load Then
            txtDestinoDireccion.Text = Entidad_OrigDest.Direccion
            txtDestinoLocalidad.Text = Entidad_OrigDest.Localidad.Nombre
            txtDestinoProvincia.Text = Entidad_OrigDest.Localidad.Provincia.Nombre
        End If
        Set Entidad_OrigDest = Nothing
    End If
End Sub

Private Sub cmdDestino_Click()
    Screen.MousePointer = vbHourglass
    Load frmEntidad_OrigenDestino_Lista
    On Error Resume Next
    If Val(datcboEntidad_Destinatario.BoundText) > 0 Then
        frmEntidad_OrigenDestino_Lista.cboFilterEntidad.ListIndex = CSM_Control_ComboBox.GetListIndexByItemData(frmEntidad_OrigenDestino_Lista.cboFilterEntidad, Val(datcboEntidad_Destinatario.BoundText), cscpItemOrFirst)
    End If
    frmEntidad_OrigenDestino_Lista.Show
    If frmEntidad_OrigenDestino_Lista.WindowState = vbMinimized Then
        frmEntidad_OrigenDestino_Lista.WindowState = vbNormal
    End If
    frmEntidad_OrigenDestino_Lista.SetFocus
    Screen.MousePointer = vbDefault
End Sub

'============================================================
'TRANSPORTE CAMION
Private Sub txtTransporteCamion_GotFocus()
    CSM_Control_TextBox.SelAllText txtTransporteCamion
End Sub

Private Sub txtTransporteCamion_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtTransporteCamion
End Sub

'============================================================
'TRANSPORTE ACOPLADO
Private Sub txtTransporteAcoplado_GotFocus()
    CSM_Control_TextBox.SelAllText txtTransporteAcoplado
End Sub

Private Sub txtTransporteAcoplado_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtTransporteAcoplado
End Sub

'============================================================
'TRANSPORTE KILOMETRO
Private Sub txtTransporteKilometro_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransporteKilometro)
End Sub

Private Sub txtTransporteKilometro_LostFocus()
    Call FormatValue_ByTag(txtTransporteKilometro)
End Sub

Private Sub cmdTransporteKilometro_Click()
    Dim Entidad_OrigDest As Entidad_OrigDest
    Dim Kilometro As Integer

    If Val(datcboEntidad_Destinatario.BoundText) > 0 Then
        Set Entidad_OrigDest = New Entidad_OrigDest
        Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Destinatario.BoundText)
        Entidad_OrigDest.IDOrigenDestino = Val(datcboDestino.BoundText)
        If Entidad_OrigDest.Load() Then
            Kilometro = Entidad_OrigDest.Kilometro
        End If
        Set Entidad_OrigDest = Nothing
    End If
    
    If Kilometro > 0 Then
        txtTransporteKilometro.Text = Format(Kilometro, "#,###")
    End If
End Sub

'============================================================
'TRANSPORTE TARIFA DE REFERENCIA Y TARIFA
Private Sub txtTransporteTarifaReferencia_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransporteTarifaReferencia)
End Sub

Private Sub txtTransporteTarifaReferencia_LostFocus()
    Call FormatValue_ByTag(txtTransporteTarifaReferencia)
End Sub

Private Sub cmdTransporteTarifa_Click()
    Dim FleteTarifa As FleteTarifa
    
    If IsNumeric(txtTransporteKilometro.Text) Then
        If CInt(txtTransporteKilometro.Text) > 0 Then
            Set FleteTarifa = New FleteTarifa
            FleteTarifa.IDFleteTabla = pParametro.FleteTabla_IDDefault
            FleteTarifa.Kilometro = CInt(txtTransporteKilometro.Text)
            FleteTarifa.NoMatchRaiseError = False
            If FleteTarifa.Load() Then
                If FleteTarifa.NoMatch Then
                    txtTransporteTarifaReferencia.Text = ""
                    txtTransporteTarifa.Text = ""
                Else
                    txtTransporteTarifaReferencia.Text = FleteTarifa.TarifaReferencia_Formatted
                    txtTransporteTarifa.Text = FleteTarifa.Tarifa_Formatted
                    txtTransporteTarifa.SetFocus
                End If
            End If
            Set FleteTarifa = Nothing
        End If
    End If
End Sub

Private Sub txtTransporteTarifa_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransporteTarifa)
End Sub

Private Sub txtTransporteTarifa_LostFocus()
    Call FormatValue_ByTag(txtTransporteTarifa)
End Sub

Private Sub tabDetalle_Click()
    picDetailSingle.Visible = (tabDetalle.SelectedItem.Key = TABS_KEY_SIMPLE)
    picDetailGrid.Visible = (tabDetalle.SelectedItem.Key = TABS_KEY_GRILLA)
End Sub

Private Sub datcboSubProducto_Change()
    Dim SubProducto As SubProducto
    
    If Val(datcboSubProducto.BoundText) > 0 Then
        Set SubProducto = New SubProducto
        SubProducto.IDSubProducto = Val(datcboSubProducto.BoundText)
        If SubProducto.Load() Then
            lblKilogramo.Visible = True
            txtKilogramo.Visible = True
            lblPrecioToneladaDolar.Visible = SubProducto.UtilizaPrecioDolar
            txtPrecioToneladaDolar.Visible = SubProducto.UtilizaPrecioDolar
            lblCotizacionDolarFecha.Visible = SubProducto.UtilizaPrecioDolar
            cmdCotizacionDolarFecha_Anterior.Visible = SubProducto.UtilizaPrecioDolar
            dtpCotizacionDolarFecha.Visible = SubProducto.UtilizaPrecioDolar
            cmdCotizacionDolarFecha_Siguiente.Visible = SubProducto.UtilizaPrecioDolar
            cmdCotizacionDolarFecha_Hoy.Visible = SubProducto.UtilizaPrecioDolar
            txtCotizacionDolarImporte.Visible = SubProducto.UtilizaPrecioDolar
            lblPrecioToneladaPeso.Visible = True
            txtPrecioToneladaPeso.Visible = True
        End If
        Set SubProducto = Nothing
    Else
        lblKilogramo.Visible = False
        txtKilogramo.Visible = False
        lblPrecioToneladaDolar.Visible = False
        txtPrecioToneladaDolar.Visible = False
        lblCotizacionDolarFecha.Visible = False
        cmdCotizacionDolarFecha_Anterior.Visible = False
        dtpCotizacionDolarFecha.Visible = False
        cmdCotizacionDolarFecha_Siguiente.Visible = False
        cmdCotizacionDolarFecha_Hoy.Visible = False
        txtCotizacionDolarImporte.Visible = False
        lblPrecioToneladaPeso.Visible = False
        txtPrecioToneladaPeso.Visible = False
    End If
End Sub

'============================================================
'KILOGRAMO
Private Sub txtKilogramo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtKilogramo)
End Sub

Private Sub txtKilogramo_LostFocus()
    Call FormatValue_ByTag(txtKilogramo)
End Sub

'============================================================
'PRECIO DOLARES
Private Sub txtPrecioToneladaDolar_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPrecioToneladaDolar)
End Sub

Private Sub txtPrecioToneladaDolar_LostFocus()
    Call FormatValue_ByTag(txtPrecioToneladaDolar)
End Sub

'============================================================
'COTIZACION DOLAR FECHA
Private Sub cmdCotizacionDolarFecha_Anterior_Click()
    dtpCotizacionDolarFecha.Value = DateAdd("d", -1, dtpCotizacionDolarFecha.Value)
    dtpCotizacionDolarFecha.SetFocus
End Sub

Private Sub cmdCotizacionDolarFecha_Siguiente_Click()
    dtpCotizacionDolarFecha.Value = DateAdd("d", 1, dtpCotizacionDolarFecha.Value)
    dtpCotizacionDolarFecha.SetFocus
End Sub

Private Sub cmdCotizacionDolarFecha_Hoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpCotizacionDolarFecha.Value
    dtpCotizacionDolarFecha.Value = Date
    dtpCotizacionDolarFecha.SetFocus
End Sub

'============================================================
'COTIZACION DOLAR IMPORTE
Private Sub txtCotizacionDolarImporte_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCotizacionDolarImporte)
End Sub

Private Sub txtCotizacionDolarImporte_LostFocus()
    Call FormatValue_ByTag(txtCotizacionDolarImporte)
End Sub

'============================================================
'PRECIO PESOS
Private Sub txtPrecioToneladaPeso_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPrecioToneladaPeso)
End Sub

Private Sub txtPrecioToneladaPeso_LostFocus()
    Call FormatValue_ByTag(txtPrecioToneladaPeso)
End Sub

'============================================================
'ACEPTAR
Private Sub cmdAceptar_Click()
    Dim Entidad_Destinatario As Entidad
    Dim Movimiento_SubProducto_Detalle As Movimiento_SubProducto_Det
    
    If Trim(txtComprobanteNumero.Text) = "" Then
        MsgBox "Debe especificar el Número de Comprobante.", vbInformation, App.Title
        txtComprobanteNumero.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtComprobanteNumero.Text)) < 12 Then
        MsgBox "El Número de Comprobante debe contener 12 dígitos (sin guiones).", vbInformation, App.Title
        txtComprobanteNumero.SetFocus
        Exit Sub
    End If
    If DateDiff("d", dtpFecha.Value, Date) < 0 Then
        If MsgBox("La Fecha es posterior al día de hoy." & vbCr & vbCr & "¿Desea continuar de todos modos?", vbExclamation + vbYesNo, App.Title) = vbNo Then
            dtpFecha.SetFocus
            Exit Sub
        End If
    End If
    
    If Val(datcboEntidad_Titular.BoundText) = 0 Then
        MsgBox "Debe especificar el Titular del Comprobante.", vbInformation, App.Title
        datcboEntidad_Titular.SetFocus
        Exit Sub
    End If
    
    'VERIFICO QUE EL DESTINATARIO TENGA LOS DATOS COMPLETOS
    Set Entidad_Destinatario = New Entidad
    Entidad_Destinatario.IDEntidad = CLng(datcboEntidad_Destinatario.BoundText)
    If Not Entidad_Destinatario.Load() Then
        Set Entidad_Destinatario = Nothing
        Exit Sub
    End If
    If Entidad_Destinatario.Entidad_Domicilio.Calle = "" Then
        Set Entidad_Destinatario = Nothing
        MsgBox "El Destinatario no tiene los datos del domicilio completos.", vbInformation, App.Title
        datcboEntidad_Destinatario.SetFocus
        Exit Sub
    End If
    If Entidad_Destinatario.Entidad_Impuesto.IDCategoriaIVA = 0 Then
        Set Entidad_Destinatario = Nothing
        MsgBox "El Destinatario no tiene los datos impositivos completos.", vbInformation, App.Title
        datcboEntidad_Destinatario.SetFocus
        Exit Sub
    End If
        
    If Val(datcboEntidad_Transportista.BoundText) = 0 Then
        MsgBox "Debe especificar la Entidad Transportista.", vbInformation, App.Title
        datcboEntidad_Transportista.SetFocus
        Exit Sub
    End If
    If Val(datcboEntidad_Chofer.BoundText) = 0 Then
        MsgBox "Debe especificar el Chofer.", vbInformation, App.Title
        datcboEntidad_Chofer.SetFocus
        Exit Sub
    End If

    If mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA Then
        If Val(datcboEntidad_Destinatario.BoundText) = 0 Then
            MsgBox "Debe especificar la Entidad de Destino.", vbInformation, App.Title
            datcboEntidad_Destinatario.SetFocus
            Exit Sub
        End If
    End If

    If datcboEntidad_Destinatario.Visible Then
        If Val(datcboEntidad_Destinatario.BoundText) = 0 Then
            MsgBox "Debe especificar la Entidad de Destino del SubProducto.", vbInformation, App.Title
            datcboEntidad_Destinatario.SetFocus
            Exit Sub
        End If
    End If
    If Val(datcboOrigen.BoundText) = 0 Then
        MsgBox "Debe especificar el Orígen del SubProducto.", vbInformation, App.Title
        datcboOrigen.SetFocus
        Exit Sub
    End If
    If Val(datcboDestino.BoundText) = 0 Then
        MsgBox "Debe especificar el Destino del SubProducto.", vbInformation, App.Title
        datcboDestino.SetFocus
        Exit Sub
    End If
    
    Select Case tabDetalle.SelectedItem.Key
        Case TABS_KEY_SIMPLE
            If Val(datcboSubProducto.BoundText) = 0 Then
                MsgBox "Debe especificar el SubProducto.", vbInformation, App.Title
                datcboSubProducto.SetFocus
                Exit Sub
            End If
            If Not IsNumeric(txtKilogramo.Text) Then
                If Trim(txtKilogramo.Text) = "" Then
                    MsgBox "Debe especificar los Kilogramos.", vbInformation, App.Title
                    txtKilogramo.SetFocus
                    Exit Sub
                Else
                    MsgBox "Los Kilogramos deben ser un valor numérico.", vbInformation, App.Title
                    txtKilogramo.SetFocus
                    Exit Sub
                End If
            Else
                If CLng(txtKilogramo.Text) < 0 Then
                    MsgBox "Los Kilogramos deben ser mayores o igual a cero.", vbInformation, App.Title
                    txtKilogramo.SetFocus
                    Exit Sub
                End If
                If CLng(txtKilogramo.Text) <= 500 Then
                    If MsgBox("Está ingresando menos de 500 kilogramos." & vbCr & "¿Es correcto?", vbQuestion + vbYesNo, App.Title) = vbNo Then
                        txtKilogramo.SetFocus
                        Exit Sub
                    End If
                End If
            End If
        
        Case TABS_KEY_GRILLA
            If tdbgrdData.BOF And tdbgrdData.EOF Then
                MsgBox "Debe especificar el detalle del Comprobante.", vbInformation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
    End Select

    With mMovimiento_SubProducto
        'ENCABEZADO
        .ComprobanteNumero = Trim(txtComprobanteNumero.Text)
        .Fecha = dtpFecha.Value
        .COTNumero = txtCOTNumero.Text
        
        'ENTIDADES
        .IDEntidad_Titular = Val(datcboEntidad_Titular.BoundText)
        .IDEntidad_Destinatario = Val(datcboEntidad_Destinatario.BoundText)
        .IDEntidad_Transportista = Val(datcboEntidad_Transportista.BoundText)
        .IDEntidad_Chofer = Val(datcboEntidad_Chofer.BoundText)

        'ORIGEN / DESTINO
        .IDOrigenDestino_Origen = Val(datcboOrigen.BoundText)
        .IDOrigenDestino_Destino = Val(datcboDestino.BoundText)
        
        'DÓLAR
        Select Case tabDetalle.SelectedItem.Key
            Case TABS_KEY_SIMPLE
                If txtPrecioToneladaDolar.Visible Then
                    .CotizacionDolarFecha = dtpCotizacionDolarFecha.Value
                    If IsNumeric(txtCotizacionDolarImporte.Text) Then
                        .CotizacionDolarImporte = CCur(txtCotizacionDolarImporte.Text)
                    Else
                        .CotizacionDolarImporte = 0
                    End If
                End If
        End Select
        
        'TRANSPORTE
        .TransporteDominioCamion = Trim(txtTransporteCamion.Text)
        .TransporteDominioAcoplado = Trim(txtTransporteAcoplado.Text)
        .TransporteKilometro_Formatted = txtTransporteKilometro.Text
        .TransporteTarifaReferencia_Formatted = txtTransporteTarifaReferencia.Text
        .TransporteTarifa_Formatted = txtTransporteTarifa.Text

        'EXTRAS
        '.Notas = txtNotas.Text

        'DETALLE DE SUBPRODUCTOS
        Select Case tabDetalle.SelectedItem.Key
            Case TABS_KEY_SIMPLE
                Set Movimiento_SubProducto_Detalle = New Movimiento_SubProducto_Det
                Movimiento_SubProducto_Detalle.IDSubProducto = Val(datcboSubProducto.BoundText)
                Movimiento_SubProducto_Detalle.Kilogramo = CLng(txtKilogramo.Text)
                If txtPrecioToneladaDolar.Visible Then
                    If IsNumeric(txtPrecioToneladaDolar.Text) Then
                        Movimiento_SubProducto_Detalle.PrecioToneladaDolar = CCur(txtPrecioToneladaDolar.Text)
                    Else
                        Movimiento_SubProducto_Detalle.PrecioToneladaDolar = 0
                    End If
                End If
                If IsNumeric(txtPrecioToneladaPeso.Text) Then
                    Movimiento_SubProducto_Detalle.PrecioToneladaPeso = CCur(txtPrecioToneladaPeso.Text)
                Else
                    Movimiento_SubProducto_Detalle.PrecioToneladaPeso = 0
                End If
                Call .Movimiento_SubProducto_Detalle_Add(Movimiento_SubProducto_Detalle)
                Set Movimiento_SubProducto_Detalle = Nothing
                
            Case TABS_KEY_GRILLA
                Set Movimiento_SubProducto_Detalle = New Movimiento_SubProducto_Det
                Movimiento_SubProducto_Detalle.IDSubProducto = tdbgrdData.Columns("IDSubProducto").Value
                Movimiento_SubProducto_Detalle.Kilogramo = CLng(tdbgrdData.Columns("Kilogramo").Value)
                If txtPrecioToneladaDolar.Visible Then
                    Movimiento_SubProducto_Detalle.PrecioToneladaDolar = CCur(tdbgrdData.Columns("PrecioToneladaDolar").Value)
                End If
                Movimiento_SubProducto_Detalle.Kilogramo = CLng(tdbgrdData.Columns("Kilogramo").Value)
                Set Movimiento_SubProducto_Detalle = Nothing
        End Select

        If Not .Update Then
            Exit Sub
        End If
    End With

    Unload Me
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Public Function FillComboBox_Entidad_Titular() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboEntidad_Titular.BoundText)
    Set recData = datcboEntidad_Titular.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Titular.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Destino() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboEntidad_Destinatario.BoundText)
    Set recData = datcboEntidad_Destinatario.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Destinatario.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Transportista() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboEntidad_Transportista.BoundText)
    Set recData = datcboEntidad_Transportista.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Transportista.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Chofer() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    On Error Resume Next
    KeySave = Val(datcboEntidad_Chofer.BoundText)
    Set recData = datcboEntidad_Chofer.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Chofer.BoundText = KeySave
End Function

Public Function FillComboBox_SubProducto() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboSubProducto.BoundText)
    Set recData = datcboSubProducto.RowSource
    recData.Requery
    Set recData = Nothing
    datcboSubProducto.BoundText = KeySave
End Function

Public Function FillComboBox_Destino() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    On Error Resume Next
    KeySave = Val(datcboDestino.BoundText)
    Set recData = datcboDestino.RowSource
    recData.Requery
    Set recData = Nothing
    datcboDestino.BoundText = KeySave
End Function

Private Sub EnableAndShowControls()
    lblCOTNumero.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    txtCOTNumero.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    
    lblEntidad_Destinatario.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    datcboEntidad_Destinatario.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    lblEntidad_Transportista.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    datcboEntidad_Transportista.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    lblEntidad_Chofer.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    datcboEntidad_Chofer.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    chkEntidad_Chofer_Todos.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    
    fraOrigenDestino.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
    fraDatosTransporte.Visible = (mMovimiento_SubProducto.Tipo = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA)
End Sub
