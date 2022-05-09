VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmFormularioB_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle de la Liquidación"
   ClientHeight    =   8310
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10620
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FormularioB_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   8310
   ScaleWidth      =   10620
   Begin VB.Frame fraCondicion 
      Caption         =   "Operación:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2355
      Left            =   60
      TabIndex        =   29
      Top             =   5880
      Width           =   3795
      Begin VB.TextBox txtOperacionPrecioKilogramo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1260
         Locked          =   -1  'True
         TabIndex        =   42
         TabStop         =   0   'False
         Top             =   1920
         Width           =   1395
      End
      Begin VB.TextBox txtCondicionOperacionFlete 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1260
         MaxLength       =   16
         TabIndex        =   38
         Tag             =   "CURRENCY|NOTEMPTY|ZERO|POSITIVE"
         Top             =   1080
         Width           =   1395
      End
      Begin VB.TextBox txtCondicionOperacionPrecioTonelada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1260
         MaxLength       =   16
         TabIndex        =   36
         Tag             =   "CURRENCY|NOTEMPTY|NOTZERO|POSITIVE"
         Top             =   660
         Width           =   1395
      End
      Begin VB.CommandButton cmdCondicionOperacionFecha_Anterior 
         Height          =   315
         Left            =   1260
         Picture         =   "FormularioB_Detalle.frx":0CCA
         Style           =   1  'Graphical
         TabIndex        =   31
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   240
         Width           =   300
      End
      Begin VB.CommandButton cmdCondicionOperacionFecha_Siguiente 
         Height          =   315
         Left            =   3000
         Picture         =   "FormularioB_Detalle.frx":1254
         Style           =   1  'Graphical
         TabIndex        =   33
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   240
         Width           =   300
      End
      Begin VB.CommandButton cmdCondicionOperacionFecha_Hoy 
         Height          =   315
         Left            =   3300
         Picture         =   "FormularioB_Detalle.frx":17DE
         Style           =   1  'Graphical
         TabIndex        =   34
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   240
         Width           =   315
      End
      Begin VB.TextBox txtOperacionCantidad 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1260
         Locked          =   -1  'True
         MaxLength       =   7
         TabIndex        =   40
         TabStop         =   0   'False
         Top             =   1500
         Width           =   1410
      End
      Begin MSComCtl2.DTPicker dtpCondicionOperacionFecha 
         Height          =   315
         Left            =   1560
         TabIndex        =   32
         Top             =   240
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   110297089
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin VB.Label lblOperacionPrecioKilogramo 
         AutoSize        =   -1  'True
         Caption         =   "Precio x Kg.:"
         Height          =   210
         Left            =   120
         TabIndex        =   41
         Top             =   1980
         Width           =   915
      End
      Begin VB.Label lblCondicionOperacionFlete 
         AutoSize        =   -1  'True
         Caption         =   "Flete por TN:"
         Height          =   210
         Left            =   120
         TabIndex        =   37
         Top             =   1140
         Width           =   915
      End
      Begin VB.Label lblCondicionOperacionPrecioTonelada 
         AutoSize        =   -1  'True
         Caption         =   "Precio/TN:"
         Height          =   210
         Left            =   120
         TabIndex        =   35
         Top             =   720
         Width           =   735
      End
      Begin VB.Label lblCondicionOperacionFecha 
         AutoSize        =   -1  'True
         Caption         =   "Fecha:"
         Height          =   210
         Left            =   120
         TabIndex        =   30
         Top             =   300
         Width           =   495
      End
      Begin VB.Label lblOperacionCantidad 
         AutoSize        =   -1  'True
         Caption         =   "Kgs. operac.:"
         Height          =   210
         Left            =   120
         TabIndex        =   39
         Top             =   1560
         Width           =   975
      End
   End
   Begin VB.Frame fraTotales 
      Caption         =   "Importes Totales de la Liquidación:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   3960
      TabIndex        =   43
      Top             =   5880
      Width           =   6555
      Begin VB.TextBox txtOperacionTotal 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   45
         TabStop         =   0   'False
         Top             =   300
         Width           =   1515
      End
      Begin VB.TextBox txtRetencionImporteOtra 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   47
         TabStop         =   0   'False
         Top             =   720
         Width           =   1515
      End
      Begin VB.TextBox txtRetencionImporteAFIP 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   49
         TabStop         =   0   'False
         Top             =   1140
         Width           =   1515
      End
      Begin VB.TextBox txtTotalImporteNetoAPagar 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   4920
         Locked          =   -1  'True
         TabIndex        =   51
         TabStop         =   0   'False
         Top             =   300
         Width           =   1515
      End
      Begin VB.TextBox txtTotalIVARG 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   4920
         Locked          =   -1  'True
         TabIndex        =   53
         TabStop         =   0   'False
         Top             =   720
         Width           =   1515
      End
      Begin VB.TextBox txtTotalPagoSegunCondicion 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   4920
         Locked          =   -1  'True
         TabIndex        =   55
         TabStop         =   0   'False
         Top             =   1140
         Width           =   1515
      End
      Begin VB.Label lblOperacionTotal 
         AutoSize        =   -1  'True
         Caption         =   "Total Operación:"
         Height          =   210
         Left            =   120
         TabIndex        =   44
         Top             =   360
         Width           =   1185
      End
      Begin VB.Label lblRetencionImporteOtra 
         AutoSize        =   -1  'True
         Caption         =   "Otras Retenciones:"
         Height          =   210
         Left            =   120
         TabIndex        =   46
         Top             =   780
         Width           =   1395
      End
      Begin VB.Label lblRetencionImporteAFIP 
         AutoSize        =   -1  'True
         Caption         =   "Retenciones AFIP:"
         Height          =   210
         Left            =   120
         TabIndex        =   48
         Top             =   1200
         Width           =   1320
      End
      Begin VB.Label lblTotalImporteNetoAPagar 
         AutoSize        =   -1  'True
         Caption         =   "Importe Neto:"
         Height          =   210
         Left            =   3360
         TabIndex        =   50
         Top             =   360
         Width           =   945
      End
      Begin VB.Label lblTotalIVARG 
         AutoSize        =   -1  'True
         Caption         =   "IVA RG 2003/2207:"
         Height          =   210
         Left            =   3360
         TabIndex        =   52
         Top             =   780
         Width           =   1395
      End
      Begin VB.Label lblTotalPagoSegunCondicion 
         AutoSize        =   -1  'True
         Caption         =   "Pago según Condic.:"
         Height          =   210
         Left            =   3360
         TabIndex        =   54
         Top             =   1200
         Width           =   1485
      End
   End
   Begin VB.Frame fraCertificados 
      Caption         =   "Certificados:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3855
      Left            =   60
      TabIndex        =   21
      Top             =   1920
      Width           =   10455
      Begin VB.TextBox txtFormulario1116Seleccionado 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   7080
         Locked          =   -1  'True
         TabIndex        =   26
         TabStop         =   0   'False
         Top             =   3360
         Width           =   495
      End
      Begin VB.TextBox txtKilogramoNetoSeleccionado 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   9540
         Locked          =   -1  'True
         TabIndex        =   28
         TabStop         =   0   'False
         Top             =   3360
         Width           =   795
      End
      Begin VB.TextBox txtFormulario1116Total 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   24
         TabStop         =   0   'False
         Top             =   3360
         Width           =   495
      End
      Begin TrueOleDBGrid80.TDBGrid tdbgrdFormulario1116 
         Height          =   2955
         Left            =   120
         TabIndex        =   22
         Top             =   300
         Width           =   10215
         _ExtentX        =   18018
         _ExtentY        =   5212
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "IDFormulario1116"
         Columns(0).DataField=   "IDFormulario1116"
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "Origen_IDPartido"
         Columns(1).DataField=   "Origen_IDPartido"
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "Tipo"
         Columns(2).DataField=   "FormularioTipo"
         Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(3)._VlistStyle=   0
         Columns(3)._MaxComboItems=   5
         Columns(3).Caption=   "N° Certificado"
         Columns(3).DataField=   "FormularioNumero"
         Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(4)._VlistStyle=   0
         Columns(4)._MaxComboItems=   5
         Columns(4).Caption=   "Fecha"
         Columns(4).DataField=   "Fecha"
         Columns(4).NumberFormat=   "Short Date"
         Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(5)._VlistStyle=   0
         Columns(5)._MaxComboItems=   5
         Columns(5).Caption=   "Kgs. Total"
         Columns(5).DataField=   "KilogramoTotal"
         Columns(5).NumberFormat=   "#,###"
         Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(6)._VlistStyle=   0
         Columns(6)._MaxComboItems=   5
         Columns(6).Caption=   "Kgs. Pendientes"
         Columns(6).DataField=   "KilogramoPendiente"
         Columns(6).NumberFormat=   "#,###"
         Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(7)._VlistStyle=   0
         Columns(7)._MaxComboItems=   5
         Columns(7).Caption=   "Kgs. a Liquidar"
         Columns(7).DataField=   "KilogramoLiquidar"
         Columns(7).NumberFormat=   "#,###"
         Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   8
         Splits(0)._UserFlags=   0
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   688
         Splits(0)._SavedRecordSelectors=   0   'False
         Splits(0).AlternatingRowStyle=   -1  'True
         Splits(0).DividerColor=   14215660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=8"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=3254"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=3175"
         Splits(0)._ColumnProps(4)=   "Column(0).AllowSizing=0"
         Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
         Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
         Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
         Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(9)=   "Column(1).Width=2725"
         Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2646"
         Splits(0)._ColumnProps(12)=   "Column(1)._ColStyle=8196"
         Splits(0)._ColumnProps(13)=   "Column(1).Visible=0"
         Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
         Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(16)=   "Column(2).Width=873"
         Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=794"
         Splits(0)._ColumnProps(19)=   "Column(2)._ColStyle=8705"
         Splits(0)._ColumnProps(20)=   "Column(2).AllowFocus=0"
         Splits(0)._ColumnProps(21)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(22)=   "Column(3).Width=2805"
         Splits(0)._ColumnProps(23)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(24)=   "Column(3)._WidthInPix=2725"
         Splits(0)._ColumnProps(25)=   "Column(3)._ColStyle=8704"
         Splits(0)._ColumnProps(26)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(27)=   "Column(4).Width=2249"
         Splits(0)._ColumnProps(28)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(29)=   "Column(4)._WidthInPix=2170"
         Splits(0)._ColumnProps(30)=   "Column(4)._ColStyle=8708"
         Splits(0)._ColumnProps(31)=   "Column(4).AllowFocus=0"
         Splits(0)._ColumnProps(32)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(33)=   "Column(5).Width=1773"
         Splits(0)._ColumnProps(34)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(35)=   "Column(5)._WidthInPix=1693"
         Splits(0)._ColumnProps(36)=   "Column(5)._ColStyle=8706"
         Splits(0)._ColumnProps(37)=   "Column(5).AllowFocus=0"
         Splits(0)._ColumnProps(38)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(39)=   "Column(6).Width=2461"
         Splits(0)._ColumnProps(40)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(41)=   "Column(6)._WidthInPix=2381"
         Splits(0)._ColumnProps(42)=   "Column(6)._ColStyle=8706"
         Splits(0)._ColumnProps(43)=   "Column(6).AllowFocus=0"
         Splits(0)._ColumnProps(44)=   "Column(6).Order=7"
         Splits(0)._ColumnProps(45)=   "Column(7).Width=2461"
         Splits(0)._ColumnProps(46)=   "Column(7).DividerColor=0"
         Splits(0)._ColumnProps(47)=   "Column(7)._WidthInPix=2381"
         Splits(0)._ColumnProps(48)=   "Column(7)._ColStyle=514"
         Splits(0)._ColumnProps(49)=   "Column(7).Order=8"
         Splits.Count    =   1
         PrintInfos(0)._StateFlags=   3
         PrintInfos(0).Name=   "piInternal 0"
         PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
         PrintInfos(0).PageHeaderHeight=   0
         PrintInfos(0).PageFooterHeight=   0
         PrintInfos.Count=   1
         DataMode        =   4
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
         _StyleDefs(36)  =   "Splits(0).Columns(0).Style:id=106,.parent=13,.locked=-1"
         _StyleDefs(37)  =   "Splits(0).Columns(0).HeadingStyle:id=103,.parent=14"
         _StyleDefs(38)  =   "Splits(0).Columns(0).FooterStyle:id=104,.parent=15"
         _StyleDefs(39)  =   "Splits(0).Columns(0).EditorStyle:id=105,.parent=17"
         _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=50,.parent=13,.locked=-1"
         _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=47,.parent=14"
         _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=48,.parent=15"
         _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=49,.parent=17"
         _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=28,.parent=13,.alignment=2,.locked=-1"
         _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=25,.parent=14,.alignment=2"
         _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=26,.parent=15"
         _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=27,.parent=17"
         _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=90,.parent=13,.alignment=0,.locked=-1"
         _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=87,.parent=14,.alignment=2"
         _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=88,.parent=15"
         _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=89,.parent=17"
         _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=46,.parent=13,.locked=-1"
         _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=43,.parent=14,.alignment=2"
         _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=44,.parent=15"
         _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=45,.parent=17"
         _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=58,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=55,.parent=14,.alignment=2"
         _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=56,.parent=15"
         _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=57,.parent=17"
         _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=32,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=29,.parent=14,.alignment=2"
         _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=30,.parent=15"
         _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=31,.parent=17"
         _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=54,.parent=13,.alignment=1"
         _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=51,.parent=14,.alignment=2"
         _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=52,.parent=15"
         _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=53,.parent=17"
         _StyleDefs(68)  =   "Named:id=33:Normal"
         _StyleDefs(69)  =   ":id=33,.parent=0"
         _StyleDefs(70)  =   "Named:id=34:Heading"
         _StyleDefs(71)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(72)  =   ":id=34,.wraptext=-1"
         _StyleDefs(73)  =   "Named:id=35:Footing"
         _StyleDefs(74)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(75)  =   "Named:id=36:Selected"
         _StyleDefs(76)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(77)  =   "Named:id=37:Caption"
         _StyleDefs(78)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(79)  =   "Named:id=38:HighlightRow"
         _StyleDefs(80)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(81)  =   "Named:id=39:EvenRow"
         _StyleDefs(82)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(83)  =   "Named:id=40:OddRow"
         _StyleDefs(84)  =   ":id=40,.parent=33"
         _StyleDefs(85)  =   "Named:id=41:RecordSelector"
         _StyleDefs(86)  =   ":id=41,.parent=34"
         _StyleDefs(87)  =   "Named:id=42:FilterBar"
         _StyleDefs(88)  =   ":id=42,.parent=33"
      End
      Begin VB.Label lblFormulario1116Seleccionado 
         Caption         =   "Form. 1116 Seleccionadas:"
         Height          =   195
         Left            =   4920
         TabIndex        =   25
         Top             =   3420
         Width           =   2115
      End
      Begin VB.Label lblKilogramoNetoSeleccionado 
         Caption         =   "Total Kgs. a Liquidar:"
         Height          =   195
         Left            =   7860
         TabIndex        =   27
         Top             =   3420
         Width           =   1635
      End
      Begin VB.Label lblFormulario1116Total 
         Caption         =   "Form. 1116 Total:"
         Height          =   195
         Left            =   2700
         TabIndex        =   23
         Top             =   3420
         Width           =   1335
      End
   End
   Begin VB.TextBox txtDepositanteCUIT 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   6060
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   480
      Width           =   1455
   End
   Begin VB.OptionButton optOperacionTipo_CompraVenta 
      Caption         =   "Compra/Venta"
      Height          =   210
      Left            =   6060
      TabIndex        =   19
      Top             =   1620
      Value           =   -1  'True
      Width           =   1455
   End
   Begin VB.OptionButton optOperacionTipo_Canje 
      Caption         =   "Canje"
      Height          =   210
      Left            =   7740
      TabIndex        =   20
      Top             =   1620
      Width           =   855
   End
   Begin VB.CommandButton cmdFecha_Anterior 
      Height          =   315
      Left            =   1260
      Picture         =   "FormularioB_Detalle.frx":1928
      Style           =   1  'Graphical
      TabIndex        =   1
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   120
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Siguiente 
      Height          =   315
      Left            =   3000
      Picture         =   "FormularioB_Detalle.frx":1EB2
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   120
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Hoy 
      Height          =   315
      Left            =   3300
      Picture         =   "FormularioB_Detalle.frx":243C
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtFormularioNumero 
      Height          =   315
      Left            =   1260
      MaxLength       =   12
      TabIndex        =   8
      Tag             =   "STRING|NOTEMPTY|NUMBERS|13"
      Top             =   840
      Width           =   1455
   End
   Begin VB.CheckBox chkActuoCorredor 
      Alignment       =   1  'Right Justify
      Caption         =   "Actuó Corredor:"
      Height          =   210
      Left            =   90
      TabIndex        =   9
      Top             =   1260
      Width           =   1515
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   9600
      TabIndex        =   57
      Top             =   7860
      Width           =   915
   End
   Begin VB.CommandButton cmdFinalizar 
      Caption         =   "Finalizar"
      Height          =   375
      Left            =   8400
      TabIndex        =   56
      Top             =   7860
      Width           =   1095
   End
   Begin MSComCtl2.DTPicker dtpFecha 
      Height          =   315
      Left            =   1560
      TabIndex        =   2
      Top             =   120
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   110297089
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin MSDataListLib.DataCombo datcboPlanta 
      Height          =   330
      Left            =   1260
      TabIndex        =   6
      Top             =   480
      Width           =   3195
      _ExtentX        =   5636
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
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
   Begin MSDataListLib.DataCombo datcboDepositante 
      Height          =   330
      Left            =   6060
      TabIndex        =   11
      Top             =   120
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
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
   Begin MSDataListLib.DataCombo datcboCosecha 
      Height          =   330
      Left            =   6060
      TabIndex        =   15
      Top             =   840
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
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
   Begin MSDataListLib.DataCombo datcboCereal 
      Height          =   330
      Left            =   6060
      TabIndex        =   17
      Top             =   1200
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
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
   Begin VB.Label lblDepositanteCUIT 
      AutoSize        =   -1  'True
      Caption         =   "CUIT:"
      Height          =   210
      Left            =   4980
      TabIndex        =   12
      Top             =   540
      Width           =   375
   End
   Begin VB.Label lblCereal 
      AutoSize        =   -1  'True
      Caption         =   "Cereal:"
      Height          =   210
      Left            =   4980
      TabIndex        =   16
      Top             =   1260
      Width           =   510
   End
   Begin VB.Label lblCosecha 
      AutoSize        =   -1  'True
      Caption         =   "Cosecha:"
      Height          =   210
      Left            =   4980
      TabIndex        =   14
      Top             =   900
      Width           =   690
   End
   Begin VB.Label lblDepositante 
      AutoSize        =   -1  'True
      Caption         =   "Vendedor:"
      Height          =   210
      Left            =   4980
      TabIndex        =   10
      Top             =   180
      Width           =   765
   End
   Begin VB.Label lblOperacionTipo 
      AutoSize        =   -1  'True
      Caption         =   "Tipo de Op.:"
      Height          =   210
      Left            =   4980
      TabIndex        =   18
      Top             =   1620
      Width           =   870
   End
   Begin VB.Label lblFormularioNumero 
      AutoSize        =   -1  'True
      Caption         =   "Formulario Nº:"
      Height          =   210
      Left            =   120
      TabIndex        =   7
      Top             =   900
      Width           =   1020
   End
   Begin VB.Label lblFechaFormulario 
      AutoSize        =   -1  'True
      Caption         =   "Fecha:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   495
   End
   Begin VB.Label lblPlanta 
      AutoSize        =   -1  'True
      Caption         =   "Planta:"
      Height          =   210
      Left            =   120
      TabIndex        =   5
      Top             =   540
      Width           =   480
   End
End
Attribute VB_Name = "frmFormularioB_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mColumnsResized As Boolean

Private mKeyDecimal As Boolean

Private maDataTypes() As ADODB.DataTypeEnum
Private mOrderColumn  As Long
Private mOrderAscending As Boolean

Private mTotal As Long
Private mSelectedCount As Long
Private mSelectedKgsTotal As Long

Private mFormulario1116B_Cabecera As F1116B_Cabecera

Private Const GRID_F1116_COLUMN_IDFORMULARIO1116 As Integer = 0
Private Const GRID_F1116_COLUMN_ORIGEN_IDPARTIDO As Integer = 1
Private Const GRID_F1116_COLUMN_FORMULARIOTIPO As Integer = 2
Private Const GRID_F1116_COLUMN_FORMULARIONUMERO As Integer = 3
Private Const GRID_F1116_COLUMN_FORMULARIOFECHA As Integer = 4
Private Const GRID_F1116_COLUMN_KILOGRAMOTOTAL As Integer = 5
Private Const GRID_F1116_COLUMN_KILOGRAMOPENDIENTE As Integer = 6
Private Const GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR As Integer = 7

Public Function Startup(ByRef Formulario1116B_Cabecera As F1116B_Cabecera) As Boolean
    Set mFormulario1116B_Cabecera = Formulario1116B_Cabecera
    
    Load Me
    
    Me.Caption = "Detalle del Liquidación - Nuevo"
        
    dtpFecha.Value = Date
    dtpCondicionOperacionFecha.Value = Date
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL", "ID", "Nombre", "Plantas", cscpItemOrFirstIfUnique, pParametro.Planta_IDDefault)
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboDepositante, "usp_Entidad_Titular_List 0, 1, NULL", "IDEntidad", "Nombre", "Depositantes", cscpNone)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCosecha, "usp_Cosecha_List 0, 1, NULL", "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirst, pParametro.Cosecha_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "SELECT IDCereal, Nombre FROM Cereal WHERE (Activo = 1) ORDER BY Nombre DESC", "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mFormulario1116B_Cabecera
        Me.Caption = "Detalle del Formulario 1116A"
    End With
    
    LoadData = True
End Function

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    Call SetTrueDBGridAppearance
    
    mOrderColumn = 4
    mOrderAscending = True
    
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode <> vbFormCode Then
        If MsgBox("¿Desea cancelar la carga del Liquidación?", vbQuestion + vbYesNo, App.Title) = vbNo Then
            Cancel = True
        End If
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mFormulario1116B_Cabecera = Nothing
    Set frmFormularioB_Detalle = Nothing
End Sub

'============================================================
'FECHA CARGA
Private Sub cmdFecha_Anterior_Click()
    dtpFecha.Value = DateAdd("d", -1, dtpFecha.Value)
    dtpFecha.SetFocus
    Call dtpFecha_Change
End Sub

Private Sub dtpFecha_Change()
    dtpCondicionOperacionFecha.Value = dtpFecha.Value
End Sub

Private Sub cmdFecha_Siguiente_Click()
    dtpFecha.Value = DateAdd("d", 1, dtpFecha.Value)
    dtpFecha.SetFocus
    Call dtpFecha_Change
End Sub

Private Sub cmdFecha_Hoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFecha.Value
    dtpFecha.Value = Date
    dtpFecha.SetFocus
    Call dtpFecha_Change
End Sub

'============================================================
'PLANTA
Private Sub datcboPlanta_Change()
    Call tdbgrdFormulario1116_Fill
End Sub

'============================================================
'PRECIO OPERACION
Private Sub txtCondicionOperacionPrecioTonelada_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCondicionOperacionPrecioTonelada)
End Sub

Private Sub txtCondicionOperacionPrecioTonelada_Change()
    Call CalcularDatos
End Sub

Private Sub txtCondicionOperacionPrecioTonelada_LostFocus()
    Call FormatValue_ByTag(txtCondicionOperacionPrecioTonelada)
End Sub

'============================================================
'IMPORTE FLETE
Private Sub txtCondicionOperacionFlete_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCondicionOperacionFlete)
End Sub

Private Sub txtCondicionOperacionFlete_Change()
    Call CalcularDatos
End Sub

Private Sub txtCondicionOperacionFlete_LostFocus()
    Call FormatValue_ByTag(txtCondicionOperacionFlete)
End Sub

'============================================================
'FORMULARIO NUMERO
Private Sub txtFormularioNumero_GotFocus()
    CSM_Control_TextBox.SelAllText txtFormularioNumero
End Sub

Private Sub txtFormularioNumero_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtFormularioNumero
End Sub

'============================================================
'DEPOSITANTE
Private Sub datcboDepositante_Change()
    Dim Entidad_Depositante As Entidad
    
    'MUESTRO EL NÚMERO DE CUIT
    Set Entidad_Depositante = New Entidad
    Entidad_Depositante.IDEntidad = CLng(datcboDepositante.BoundText)
    If Not Entidad_Depositante.Load() Then
        txtDepositanteCUIT.Text = ""
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    txtDepositanteCUIT.Text = Entidad_Depositante.CUIT
    Set Entidad_Depositante = Nothing

    Call tdbgrdFormulario1116_Fill
End Sub

'============================================================
'CUIT
Private Sub txtDepositanteCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDepositanteCUIT)
End Sub

'============================================================
'COSECHA
Private Sub datcboCosecha_Change()
    Call tdbgrdFormulario1116_Fill
End Sub

'============================================================
'CEREAL
Private Sub datcboCereal_Change()
    Call tdbgrdFormulario1116_Fill
End Sub

Private Sub tdbgrdFormulario1116_Fill()
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim XArrayDB As XArrayDBObject.XArrayDB
    
    Set XArrayDB = New XArrayDBObject.XArrayDB
    
    If Val(datcboPlanta.BoundText) = 0 Or Val(datcboDepositante.BoundText) = 0 Or Val(datcboCosecha.BoundText) = 0 Or Val(datcboCereal.BoundText) = 0 Then
        Set tdbgrdFormulario1116.Array = XArrayDB
        tdbgrdFormulario1116.ReBind
        
        mTotal = 0
        mSelectedCount = 0
        mSelectedKgsTotal = 0
        
        Call RefreshTotals
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pIsCompiled Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116_PendienteAsignar_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad_Destino", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 1))
        .Parameters.Append .CreateParameter("IDPlanta", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 2))
        .Parameters.Append .CreateParameter("IDEntidad_Depositante", adInteger, adParamInput, , Val(datcboDepositante.BoundText))
        .Parameters.Append .CreateParameter("IDCosecha", adSmallInt, adParamInput, , Val(datcboCosecha.BoundText))
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , Val(datcboCereal.BoundText))
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    If Not recData.EOF Then
        Call XArrayDB.LoadRows(recData.GetRows())
    End If
    Set tdbgrdFormulario1116.Array = XArrayDB
    tdbgrdFormulario1116.ReBind
    
    mTotal = XArrayDB.Count(1)
    mSelectedCount = 0
    mSelectedKgsTotal = 0
    Call RefreshTotals
    
    maDataTypes = pDatabase.GetDataTypeArrayFromRecordset(recData)
    
    If Not (recData.BOF And recData.EOF) Then
        Call tdbgrdFormulario1116_SortColumn(mOrderColumn)
    End If
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.FormularioB_Detalle.tdbgrdFormulario1116_Fill", "Error al listar los Formularios 1116A y 1116RT pendientes.")
End Sub

Private Sub tdbgrdFormulario1116_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdFormulario1116.SelStartCol <> tdbgrdFormulario1116.SelEndCol Then
        tdbgrdFormulario1116.SelEndCol = tdbgrdFormulario1116.SelStartCol
    End If
    If tdbgrdFormulario1116.SelStartCol + 1 = mOrderColumn Then
        mOrderAscending = Not mOrderAscending
    Else
        mOrderAscending = True
    End If
    OldOrderColumn = mOrderColumn
    mOrderColumn = tdbgrdFormulario1116.SelStartCol + 1
    tdbgrdFormulario1116.SelStartCol = -1
    tdbgrdFormulario1116.SelEndCol = -1
    
    tdbgrdFormulario1116_SortColumn OldOrderColumn
End Sub

Private Sub tdbgrdFormulario1116_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized = True
End Sub

Private Sub tdbgrdFormulario1116_DblClick()
    If tdbgrdFormulario1116.Col = GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR Then
        tdbgrdFormulario1116.EditActive = True
        tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOPENDIENTE).Value
        tdbgrdFormulario1116.EditActive = False
    End If
End Sub

Private Sub tdbgrdFormulario1116_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdFormulario1116.MoveFirst
        Case vbKeyEnd
            tdbgrdFormulario1116.MoveLast
    End Select
End Sub

Private Sub tdbgrdFormulario1116_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
    If ColIndex = GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR Then
        If tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value <> "" Then
            If IsNumeric(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value) Then
            
                Select Case CLng(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value)
                
                    Case 0  'INGRESÓ CERO
                        If Val(OldValue) > 0 Then
                            mSelectedCount = mSelectedCount - 1
                            mSelectedKgsTotal = mSelectedKgsTotal - Val(OldValue)
                        End If
                        
                    Case Is < 0
                        'EL VALOR INGRESADO ES MENOR A CERO, RESTAURO EL VALOR ORIGINAL
                        tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value = OldValue
                        
                    Case Is > CLng(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOPENDIENTE).Value)
                        'EL VALOR INGRESADO ES MAYOR AL PENDIENTE, RESTAURO EL VALOR ORIGINAL
                        tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value = OldValue
                    
                    Case Else
                        'EL VALOR INGRESADO ES CORRECTO
                        If Val(OldValue) = 0 Then
                            mSelectedCount = mSelectedCount + 1
                        End If
                        mSelectedKgsTotal = mSelectedKgsTotal + CLng(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value) - Val(OldValue)
                End Select
            Else
                'EL VALOR NO ES NUMÉRICO, RESTAURO EL VALOR ORIGINAL
                tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value = OldValue
            End If
        Else
            'SE ELIMINÓ EL VALOR, ASÍ QUE RESTO TODO
            mSelectedCount = mSelectedCount - 1
            mSelectedKgsTotal = mSelectedKgsTotal - Val(OldValue)
        End If
        
        Call RefreshTotals
    End If
End Sub

Private Sub tdbgrdFormulario1116_SortColumn(ByVal OldOrderColumn As Long)
    Dim XArrayDB As XArrayDBObject.XArrayDB

    Set XArrayDB = tdbgrdFormulario1116.Array
    If Not XArrayDB Is Nothing Then
        Call XArrayDB.QuickSort(0, XArrayDB.UpperBound(1), mOrderColumn - 1, IIf(mOrderAscending, XORDER_ASCEND, XORDER_DESCEND), CSM_XArrayDB.ConvertADOTypeToXTYPE(maDataTypes(mOrderColumn - 1)))
        tdbgrdFormulario1116.ReBind
    End If

    'ICONOS
    tdbgrdFormulario1116.Columns(OldOrderColumn - 1).HeadingStyle.ForegroundPicture = 0
    tdbgrdFormulario1116.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdFormulario1116.Columns(mOrderColumn - 1).HeadingStyle.TransparentForegroundPicture = True
    If mOrderAscending Then
        Set tdbgrdFormulario1116.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdFormulario1116.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

'============================================================
'FECHA OPERACION
Private Sub cmdCondicionOperacionFecha_Anterior_Click()
    dtpCondicionOperacionFecha.Value = DateAdd("d", -1, dtpCondicionOperacionFecha.Value)
    dtpCondicionOperacionFecha.SetFocus
End Sub

Private Sub cmdCondicionOperacionFecha_Siguiente_Click()
    dtpCondicionOperacionFecha.Value = DateAdd("d", 1, dtpCondicionOperacionFecha.Value)
    dtpCondicionOperacionFecha.SetFocus
End Sub

Private Sub cmdCondicionOperacionFecha_Hoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpCondicionOperacionFecha.Value
    dtpCondicionOperacionFecha.Value = Date
    dtpCondicionOperacionFecha.SetFocus
End Sub

'============================================================
'KILOGRAMO TRANSFERENCIA
Private Sub txtOperacionCantidad_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtOperacionCantidad)
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Private Sub cmdFinalizar_Click()
    Dim Formulario1116A_Cabecera As F1116A_Cabecera
    Dim Formulario1116B_Cabecera_VerificaNumero As F1116B_Cabecera
    Dim Formulario1116B_Detalle As F1116B_Detalle
    
    Dim Entidad_Depositante As Entidad
    
    If Trim(txtFormularioNumero.Text) = "" Then
        MsgBox "Debe ingresar el Número de Liquidación.", vbInformation, App.Title
        txtFormularioNumero.SetFocus
        Exit Sub
    End If
    If tdbgrdFormulario1116.FirstRow = "" Then
        MsgBox "No hay ningún Certificado de Depósito o RT (Transferencia) disponible para aplicar al Liquidación.", vbInformation, App.Title
        tdbgrdFormulario1116.SetFocus
        Exit Sub
    End If
    If CLng(txtKilogramoNetoSeleccionado.Text) <= 0 Then
        MsgBox "No se han asignado kilogramos a ningún Certificado.", vbInformation, App.Title
        tdbgrdFormulario1116.SetFocus
        Exit Sub
    End If
    
    'VERIFICO SI NO EXISTE EL NÚMERO DE FORMULARIO
    Set Formulario1116B_Cabecera_VerificaNumero = New F1116B_Cabecera
    Formulario1116B_Cabecera_VerificaNumero.NoMatchRaiseError = False
    Formulario1116B_Cabecera_VerificaNumero.FormularioNumero = txtFormularioNumero.Text
    If Formulario1116B_Cabecera_VerificaNumero.LoadByFormularioNumero() Then
        If Not Formulario1116B_Cabecera_VerificaNumero.NoMatch Then
            MsgBox "El Número de Liquidación ya existe.", vbExclamation, App.Title
            Set Formulario1116B_Cabecera_VerificaNumero = Nothing
            Exit Sub
        End If
    End If
    Set Formulario1116B_Cabecera_VerificaNumero = Nothing
    
    'VERIFICO QUE EL DEPOSITANTE TENGA LOS DATOS COMPLETOS
    Set Entidad_Depositante = New Entidad
    Entidad_Depositante.IDEntidad = CLng(datcboDepositante.BoundText)
    If Not Entidad_Depositante.Load() Then
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    If Entidad_Depositante.Entidad_Domicilio.Calle = "" Then
        Set Entidad_Depositante = Nothing
        MsgBox "El Vendedor no tiene los datos del domicilio completos.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Exit Sub
    End If
    If Entidad_Depositante.Entidad_Impuesto.IDCategoriaIVA = 0 Or Entidad_Depositante.Entidad_Impuesto.GananciaInscripto = -1 Or Entidad_Depositante.Entidad_Impuesto.ReFOG_Situacion = "" Then
        Set Entidad_Depositante = Nothing
        MsgBox "El Vendedor no tiene los datos impositivos completos.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Exit Sub
    End If
    
    If MsgBox("¿Desea generar la Liquidación?", vbQuestion + vbYesNo, App.Title) = vbNo Then
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    
    With mFormulario1116B_Cabecera
        .OperacionTipo = IIf(optOperacionTipo_CompraVenta.Value, FORMULARIO_B_COMPRAVENTA, FORMULARIO_B_CANJE)
        .FormularioNumero = txtFormularioNumero.Text
        .Fecha = dtpFecha.Value
    
        .DepositarioIDEntidad = Val(Left(datcboPlanta.BoundText, Len(datcboPlanta.BoundText) - 5))
        .DepositarioIDPlanta = Val(Right(datcboPlanta.BoundText, 5))
        
        .DepositanteIDEntidad = Entidad_Depositante.IDEntidad
        .DepositanteRazonSocial = Entidad_Depositante.Nombre
        .DepositanteDomicilioTipo = Entidad_Depositante.Entidad_Domicilio.Tipo
        .DepositanteDomicilioCalle = Entidad_Depositante.Entidad_Domicilio.Calle
        .DepositanteDomicilioNumero = Entidad_Depositante.Entidad_Domicilio.Numero
        .DepositanteDomicilioPiso = Entidad_Depositante.Entidad_Domicilio.Piso
        .DepositanteDomicilioOficina = Entidad_Depositante.Entidad_Domicilio.Oficina
        .DepositanteDomicilioCodigoPostal = Entidad_Depositante.Entidad_Domicilio.CodigoPostal
        .DepositanteDomicilioIDLocalidad = Entidad_Depositante.Entidad_Domicilio.IDLocalidad
        .DepositanteCUIT = Entidad_Depositante.CUIT
        .DepositanteIIBB = Entidad_Depositante.Entidad_Impuesto.IIBB
        .DepositanteIDCategoriaIVA = Entidad_Depositante.Entidad_Impuesto.IDCategoriaIVA
        .DepositanteGanancia_Inscripto = Entidad_Depositante.Entidad_Impuesto.GananciaInscripto
        .DepositanteReFOG_Situacion = Entidad_Depositante.Entidad_Impuesto.ReFOG_Situacion
        .DepositanteCBU = Entidad_Depositante.Entidad_Impuesto.CBU
        Set Entidad_Depositante = Nothing
                
        'CEREAL
        .IDCosecha = Val(datcboCosecha.BoundText)
        .IDCereal = Val(datcboCereal.BoundText)
                
        .ActuoCorredor = (chkActuoCorredor.Value = vbChecked)
        .CondicionOperacionFecha = dtpCondicionOperacionFecha.Value
        .CondicionOperacionPrecioTonelada = CCur(txtCondicionOperacionPrecioTonelada.Text)
        .CondicionOperacionFlete = CCur(txtCondicionOperacionFlete.Text)
        
        'AGREGO LOS DETALLES DE LOS FORMULARIOS ASOCIADOS
        tdbgrdFormulario1116.Visible = False
        tdbgrdFormulario1116.MoveFirst
        Set .CFormulario1116B_Detalle = New Collection
        Do While Not tdbgrdFormulario1116.EOF
            If Val(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value) > 0 Then
                Set Formulario1116B_Detalle = New F1116B_Detalle
                Formulario1116B_Detalle.FormularioTipo = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOTIPO).Value
                Formulario1116B_Detalle.FormularioNumero = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIONUMERO).Value
                Formulario1116B_Detalle.FormularioFecha = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOFECHA).Value
                If tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOTIPO).Value = "A" Then
                    Formulario1116B_Detalle.IDFormulario1116A = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_IDFORMULARIO1116).Value
                Else
                    Formulario1116B_Detalle.IDFormulario1116RT = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_IDFORMULARIO1116).Value
                End If
                Formulario1116B_Detalle.KilogramoAplicado = CLng(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOLIQUIDAR).Value)
                'FIX
                Formulario1116B_Detalle.IDLocalidad = 8842
                .CFormulario1116B_Detalle.Add Formulario1116B_Detalle
            End If
            tdbgrdFormulario1116.MoveNext
        Loop
        Set Formulario1116B_Detalle = Nothing
        tdbgrdFormulario1116.MoveFirst
        tdbgrdFormulario1116.Visible = True
        tdbgrdFormulario1116.ReBind
        
        .OperacionCantidad = CLng(txtOperacionCantidad.Text)
        .OperacionPrecioKilogramo = CCur(txtOperacionPrecioKilogramo.Text)
        .OperacionAlicuotaIVA = 10.5
        
        .RefreshListSkip = True
        If Not .Update Then
            Exit Sub
        End If
    End With
    
    MsgBox "Se ha generado la Liquidación.", vbInformation, App.Title
    
    Call RefreshList_Module.Formulario1116B(0)
    
    Unload Me
End Sub

Private Sub RefreshTotals()
    txtFormulario1116Total.Text = mTotal
    txtFormulario1116Seleccionado.Text = mSelectedCount
    txtKilogramoNetoSeleccionado.Text = Format(mSelectedKgsTotal, "#,##0")
    txtOperacionCantidad.Text = Format(mSelectedKgsTotal, "#,##0")
    
    Call CalcularDatos
End Sub

Public Sub SetTrueDBGridAppearance()
    With tdbgrdFormulario1116
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
    End With
End Sub

Private Sub CalcularDatos()
    Dim CondicionOperacionPrecioTonelada As Currency
    Dim CondicionOperacionFlete As Currency
    Dim OperacionCantidad As Long
    
    If IsNumeric(txtCondicionOperacionPrecioTonelada.Text) Then
        CondicionOperacionPrecioTonelada = CCur(txtCondicionOperacionPrecioTonelada.Text)
    Else
        CondicionOperacionPrecioTonelada = 0
    End If
    If IsNumeric(txtCondicionOperacionFlete.Text) Then
        CondicionOperacionFlete = CCur(txtCondicionOperacionFlete.Text)
    Else
        CondicionOperacionFlete = 0
    End If
    If IsNumeric(txtOperacionCantidad.Text) Then
        OperacionCantidad = CLng(txtOperacionCantidad.Text)
    Else
        OperacionCantidad = 0
    End If
    
    txtOperacionPrecioKilogramo.Text = Format(Round((CondicionOperacionPrecioTonelada - CondicionOperacionFlete) / 1000, 3), "$ #,###.##0")
    
    txtOperacionTotal.Text = Format(Round(OperacionCantidad * (CondicionOperacionPrecioTonelada + CondicionOperacionFlete) / 1000, 2), "Currency")
    txtRetencionImporteOtra.Text = Format(0, "Currency")
    txtRetencionImporteAFIP.Text = Format(0, "Currency")
    
    txtTotalImporteNetoAPagar.Text = Format(CCur(txtOperacionTotal.Text) - CCur(txtRetencionImporteOtra.Text) - CCur(txtRetencionImporteAFIP.Text), "Currency")
    txtTotalIVARG.Text = Format(0, "Currency")
    txtTotalPagoSegunCondicion.Text = Format(CCur(txtTotalImporteNetoAPagar.Text) - CCur(txtTotalIVARG.Text), "Currency")
End Sub
