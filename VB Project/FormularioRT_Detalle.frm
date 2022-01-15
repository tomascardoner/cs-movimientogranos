VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmFormularioRT_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Certificado de Retiro / Transferencia"
   ClientHeight    =   6660
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9540
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FormularioRT_Detalle.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   6660
   ScaleWidth      =   9540
   Begin VB.TextBox txtDepositanteCUIT 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   6060
      Locked          =   -1  'True
      TabIndex        =   14
      Top             =   480
      Width           =   1455
   End
   Begin VB.Frame fraCycleEncabezado 
      Height          =   4455
      Left            =   60
      TabIndex        =   19
      Top             =   1620
      Width           =   9375
      Begin VB.Frame fraTransfiere 
         Caption         =   "Transferencia:"
         Height          =   735
         Left            =   120
         TabIndex        =   21
         Top             =   3600
         Width           =   9135
         Begin VB.TextBox txtReceptorCUIT 
            Alignment       =   2  'Center
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4980
            Locked          =   -1  'True
            TabIndex        =   25
            Top             =   300
            Width           =   1455
         End
         Begin VB.TextBox txtKilogramoTransferencia 
            Height          =   315
            Left            =   8040
            MaxLength       =   7
            TabIndex        =   27
            Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
            Top             =   300
            Width           =   990
         End
         Begin MSDataListLib.DataCombo datcboReceptor 
            Height          =   330
            Left            =   1020
            TabIndex        =   23
            Top             =   300
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
         Begin VB.Label lblReceptorCUIT 
            AutoSize        =   -1  'True
            Caption         =   "CUIT:"
            Height          =   210
            Left            =   4380
            TabIndex        =   24
            Top             =   360
            Width           =   375
         End
         Begin VB.Label lblKilogramoTransferencia 
            AutoSize        =   -1  'True
            Caption         =   "Kgs. a transferir:"
            Height          =   210
            Left            =   6660
            TabIndex        =   26
            Top             =   360
            Width           =   1230
         End
         Begin VB.Label lblReceptor 
            AutoSize        =   -1  'True
            Caption         =   "Receptor:"
            Height          =   210
            Left            =   120
            TabIndex        =   22
            Top             =   360
            Width           =   705
         End
      End
      Begin TrueOleDBGrid80.TDBGrid tdbgrdFormulario1116 
         Height          =   3315
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   9135
         _ExtentX        =   16113
         _ExtentY        =   5847
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
         Columns.Count   =   7
         Splits(0)._UserFlags=   0
         Splits(0).MarqueeStyle=   3
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   688
         Splits(0)._SavedRecordSelectors=   0   'False
         Splits(0).AlternatingRowStyle=   -1  'True
         Splits(0).DividerColor=   14215660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=7"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=3254"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=3175"
         Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
         Splits(0)._ColumnProps(5)=   "Column(0).AllowSizing=0"
         Splits(0)._ColumnProps(6)=   "Column(0)._ColStyle=8196"
         Splits(0)._ColumnProps(7)=   "Column(0).Visible=0"
         Splits(0)._ColumnProps(8)=   "Column(0).AllowFocus=0"
         Splits(0)._ColumnProps(9)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(10)=   "Column(1).Width=2725"
         Splits(0)._ColumnProps(11)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(12)=   "Column(1)._WidthInPix=2646"
         Splits(0)._ColumnProps(13)=   "Column(1)._EditAlways=0"
         Splits(0)._ColumnProps(14)=   "Column(1)._ColStyle=8196"
         Splits(0)._ColumnProps(15)=   "Column(1).Visible=0"
         Splits(0)._ColumnProps(16)=   "Column(1).AllowFocus=0"
         Splits(0)._ColumnProps(17)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(18)=   "Column(2).Width=873"
         Splits(0)._ColumnProps(19)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(20)=   "Column(2)._WidthInPix=794"
         Splits(0)._ColumnProps(21)=   "Column(2)._EditAlways=0"
         Splits(0)._ColumnProps(22)=   "Column(2)._ColStyle=8705"
         Splits(0)._ColumnProps(23)=   "Column(2).AllowFocus=0"
         Splits(0)._ColumnProps(24)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(25)=   "Column(3).Width=2805"
         Splits(0)._ColumnProps(26)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(27)=   "Column(3)._WidthInPix=2725"
         Splits(0)._ColumnProps(28)=   "Column(3)._EditAlways=0"
         Splits(0)._ColumnProps(29)=   "Column(3)._ColStyle=8704"
         Splits(0)._ColumnProps(30)=   "Column(3).AllowFocus=0"
         Splits(0)._ColumnProps(31)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(32)=   "Column(4).Width=2249"
         Splits(0)._ColumnProps(33)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(34)=   "Column(4)._WidthInPix=2170"
         Splits(0)._ColumnProps(35)=   "Column(4)._EditAlways=0"
         Splits(0)._ColumnProps(36)=   "Column(4)._ColStyle=8708"
         Splits(0)._ColumnProps(37)=   "Column(4).AllowFocus=0"
         Splits(0)._ColumnProps(38)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(39)=   "Column(5).Width=1773"
         Splits(0)._ColumnProps(40)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(41)=   "Column(5)._WidthInPix=1693"
         Splits(0)._ColumnProps(42)=   "Column(5)._EditAlways=0"
         Splits(0)._ColumnProps(43)=   "Column(5)._ColStyle=8706"
         Splits(0)._ColumnProps(44)=   "Column(5).AllowFocus=0"
         Splits(0)._ColumnProps(45)=   "Column(5).Order=6"
         Splits(0)._ColumnProps(46)=   "Column(6).Width=2461"
         Splits(0)._ColumnProps(47)=   "Column(6).DividerColor=0"
         Splits(0)._ColumnProps(48)=   "Column(6)._WidthInPix=2381"
         Splits(0)._ColumnProps(49)=   "Column(6)._EditAlways=0"
         Splits(0)._ColumnProps(50)=   "Column(6)._ColStyle=8706"
         Splits(0)._ColumnProps(51)=   "Column(6).AllowFocus=0"
         Splits(0)._ColumnProps(52)=   "Column(6).Order=7"
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
         _StyleDefs(64)  =   "Named:id=33:Normal"
         _StyleDefs(65)  =   ":id=33,.parent=0"
         _StyleDefs(66)  =   "Named:id=34:Heading"
         _StyleDefs(67)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(68)  =   ":id=34,.wraptext=-1"
         _StyleDefs(69)  =   "Named:id=35:Footing"
         _StyleDefs(70)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
         _StyleDefs(71)  =   "Named:id=36:Selected"
         _StyleDefs(72)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(73)  =   "Named:id=37:Caption"
         _StyleDefs(74)  =   ":id=37,.parent=34,.alignment=2"
         _StyleDefs(75)  =   "Named:id=38:HighlightRow"
         _StyleDefs(76)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
         _StyleDefs(77)  =   "Named:id=39:EvenRow"
         _StyleDefs(78)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
         _StyleDefs(79)  =   "Named:id=40:OddRow"
         _StyleDefs(80)  =   ":id=40,.parent=33"
         _StyleDefs(81)  =   "Named:id=41:RecordSelector"
         _StyleDefs(82)  =   ":id=41,.parent=34"
         _StyleDefs(83)  =   "Named:id=42:FilterBar"
         _StyleDefs(84)  =   ":id=42,.parent=33"
      End
   End
   Begin VB.CommandButton cmdFecha_Anterior 
      Height          =   315
      Left            =   1260
      Picture         =   "FormularioRT_Detalle.frx":0CCA
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
      Picture         =   "FormularioRT_Detalle.frx":1254
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
      Picture         =   "FormularioRT_Detalle.frx":17DE
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtRetiraOTransfiere 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   1260
      Locked          =   -1  'True
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   840
      Width           =   2415
   End
   Begin VB.TextBox txtFormularioNumero 
      Height          =   315
      Left            =   1260
      MaxLength       =   12
      TabIndex        =   10
      Tag             =   "STRING|NOTEMPTY|NUMBERS|13"
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton cmdAnterior 
      Caption         =   "<< Anterior"
      Height          =   375
      Left            =   6120
      TabIndex        =   56
      Top             =   6180
      Width           =   1095
   End
   Begin VB.CommandButton cmdSiguiente 
      Caption         =   "Siguiente >>"
      Height          =   375
      Left            =   7320
      TabIndex        =   57
      Top             =   6180
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   8520
      TabIndex        =   59
      Top             =   6180
      Width           =   915
   End
   Begin VB.CommandButton cmdFinalizar 
      Caption         =   "Finalizar"
      Height          =   375
      Left            =   7320
      TabIndex        =   58
      Top             =   6180
      Width           =   1095
   End
   Begin MSDataListLib.DataCombo datcboDepositante 
      Height          =   330
      Left            =   6060
      TabIndex        =   12
      Top             =   120
      Width           =   3375
      _ExtentX        =   5953
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
      TabIndex        =   16
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
      TabIndex        =   18
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
   Begin MSComCtl2.DTPicker dtpFecha 
      Height          =   315
      Left            =   1560
      TabIndex        =   2
      Top             =   120
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   86638593
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
   Begin VB.Frame fraCycleRetiros 
      Height          =   4455
      Left            =   60
      TabIndex        =   28
      Top             =   1620
      Width           =   9375
      Begin VB.TextBox txtFormularioOrigen_Fecha 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   4140
         Locked          =   -1  'True
         TabIndex        =   33
         TabStop         =   0   'False
         Top             =   240
         Width           =   1035
      End
      Begin VB.CommandButton cmdFechaDescarga_HastaHoy 
         Height          =   315
         Left            =   6840
         Picture         =   "FormularioRT_Detalle.frx":1928
         Style           =   1  'Graphical
         TabIndex        =   47
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   720
         Width           =   315
      End
      Begin VB.CommandButton cmdFechaDescarga_HastaSiguiente 
         Height          =   315
         Left            =   6540
         Picture         =   "FormularioRT_Detalle.frx":1A72
         Style           =   1  'Graphical
         TabIndex        =   46
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   720
         Width           =   300
      End
      Begin VB.CommandButton cmdFechaDescarga_HastaAnterior 
         Height          =   315
         Left            =   4800
         Picture         =   "FormularioRT_Detalle.frx":1FFC
         Style           =   1  'Graphical
         TabIndex        =   44
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   720
         Width           =   300
      End
      Begin VB.CommandButton cmdFechaDescarga_DesdeAnterior 
         Height          =   315
         Left            =   1560
         Picture         =   "FormularioRT_Detalle.frx":2586
         Style           =   1  'Graphical
         TabIndex        =   39
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   720
         Width           =   300
      End
      Begin VB.CommandButton cmdFechaDescarga_DesdeHoy 
         Height          =   315
         Left            =   3600
         Picture         =   "FormularioRT_Detalle.frx":2B10
         Style           =   1  'Graphical
         TabIndex        =   42
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   720
         Width           =   315
      End
      Begin VB.CommandButton cmdFechaDescarga_DesdeSiguiente 
         Height          =   315
         Left            =   3300
         Picture         =   "FormularioRT_Detalle.frx":2C5A
         Style           =   1  'Graphical
         TabIndex        =   41
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   720
         Width           =   300
      End
      Begin VB.TextBox txtFormularioOrigen_PesoNeto 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   6060
         Locked          =   -1  'True
         TabIndex        =   35
         TabStop         =   0   'False
         Top             =   240
         Width           =   1035
      End
      Begin VB.TextBox txtFormularioOrigen_KilogramoPendiente 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   8220
         Locked          =   -1  'True
         TabIndex        =   37
         TabStop         =   0   'False
         Top             =   240
         Width           =   1035
      End
      Begin VB.TextBox txtFormularioOrigen_TipoNumero 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   31
         Top             =   240
         Width           =   1635
      End
      Begin VB.CheckBox chkGeneraNuevoF1116A 
         Caption         =   "Genera nuevo Formulario 1116A"
         Height          =   210
         Left            =   180
         TabIndex        =   49
         Top             =   4080
         Value           =   1  'Checked
         Width           =   2775
      End
      Begin VB.TextBox txtMovimientoSeleccionado 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   6120
         Locked          =   -1  'True
         TabIndex        =   53
         TabStop         =   0   'False
         Top             =   4020
         Width           =   495
      End
      Begin VB.TextBox txtKilogramoNetoSeleccionado 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   8460
         Locked          =   -1  'True
         TabIndex        =   55
         TabStop         =   0   'False
         Top             =   4020
         Width           =   795
      End
      Begin VB.TextBox txtMovimientoTotal 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   3900
         Locked          =   -1  'True
         TabIndex        =   51
         TabStop         =   0   'False
         Top             =   4020
         Width           =   495
      End
      Begin TrueOleDBGrid80.TDBGrid tdbgrdCartaPorte 
         Height          =   2775
         Left            =   120
         TabIndex        =   48
         Top             =   1140
         Width           =   9135
         _ExtentX        =   16113
         _ExtentY        =   4895
         _LayoutType     =   4
         _RowHeight      =   -2147483647
         _WasPersistedAsPixels=   0
         Columns(0)._VlistStyle=   0
         Columns(0)._MaxComboItems=   5
         Columns(0).Caption=   "IDMovimiento"
         Columns(0).DataField=   "IDMovimiento"
         Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(1)._VlistStyle=   0
         Columns(1)._MaxComboItems=   5
         Columns(1).Caption=   "N° Comprobante"
         Columns(1).DataField=   "ComprobanteNumero"
         Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(2)._VlistStyle=   0
         Columns(2)._MaxComboItems=   5
         Columns(2).Caption=   "Fecha Carga"
         Columns(2).DataField=   "FechaCarga"
         Columns(2).NumberFormat=   "Short Date"
         Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(3)._VlistStyle=   0
         Columns(3)._MaxComboItems=   5
         Columns(3).Caption=   "Kgs. C.P."
         Columns(3).DataField=   "PesoNeto"
         Columns(3).NumberFormat=   "#,###"
         Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(4)._VlistStyle=   0
         Columns(4)._MaxComboItems=   5
         Columns(4).Caption=   "Kgs. Pendientes"
         Columns(4).DataField=   "KilogramoAsignado"
         Columns(4).NumberFormat=   "#,###"
         Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns(5)._VlistStyle=   0
         Columns(5)._MaxComboItems=   5
         Columns(5).Caption=   "Kgs. a Asignar"
         Columns(5).DataField=   "KilogramoAsignar"
         Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
         Columns.Count   =   6
         Splits(0)._UserFlags=   0
         Splits(0).AllowRowSizing=   0   'False
         Splits(0).RecordSelectors=   0   'False
         Splits(0).RecordSelectorWidth=   688
         Splits(0)._SavedRecordSelectors=   0   'False
         Splits(0).AlternatingRowStyle=   -1  'True
         Splits(0).DividerColor=   14215660
         Splits(0).SpringMode=   0   'False
         Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
         Splits(0)._ColumnProps(0)=   "Columns.Count=6"
         Splits(0)._ColumnProps(1)=   "Column(0).Width=3254"
         Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
         Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=3175"
         Splits(0)._ColumnProps(4)=   "Column(0).AllowSizing=0"
         Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
         Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
         Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
         Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
         Splits(0)._ColumnProps(9)=   "Column(1).Width=2805"
         Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
         Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2725"
         Splits(0)._ColumnProps(12)=   "Column(1)._ColStyle=8704"
         Splits(0)._ColumnProps(13)=   "Column(1).Order=2"
         Splits(0)._ColumnProps(14)=   "Column(2).Width=2249"
         Splits(0)._ColumnProps(15)=   "Column(2).DividerColor=0"
         Splits(0)._ColumnProps(16)=   "Column(2)._WidthInPix=2170"
         Splits(0)._ColumnProps(17)=   "Column(2)._ColStyle=8708"
         Splits(0)._ColumnProps(18)=   "Column(2).AllowFocus=0"
         Splits(0)._ColumnProps(19)=   "Column(2).Order=3"
         Splits(0)._ColumnProps(20)=   "Column(3).Width=1402"
         Splits(0)._ColumnProps(21)=   "Column(3).DividerColor=0"
         Splits(0)._ColumnProps(22)=   "Column(3)._WidthInPix=1323"
         Splits(0)._ColumnProps(23)=   "Column(3)._ColStyle=8706"
         Splits(0)._ColumnProps(24)=   "Column(3).AllowFocus=0"
         Splits(0)._ColumnProps(25)=   "Column(3).Order=4"
         Splits(0)._ColumnProps(26)=   "Column(4).Width=2461"
         Splits(0)._ColumnProps(27)=   "Column(4).DividerColor=0"
         Splits(0)._ColumnProps(28)=   "Column(4)._WidthInPix=2381"
         Splits(0)._ColumnProps(29)=   "Column(4)._ColStyle=8706"
         Splits(0)._ColumnProps(30)=   "Column(4).AllowFocus=0"
         Splits(0)._ColumnProps(31)=   "Column(4).Order=5"
         Splits(0)._ColumnProps(32)=   "Column(5).Width=2461"
         Splits(0)._ColumnProps(33)=   "Column(5).DividerColor=0"
         Splits(0)._ColumnProps(34)=   "Column(5)._WidthInPix=2381"
         Splits(0)._ColumnProps(35)=   "Column(5)._ColStyle=8706"
         Splits(0)._ColumnProps(36)=   "Column(5).Order=6"
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
         TabAction       =   2
         MultipleLines   =   0
         CellTipsWidth   =   0
         MultiSelect     =   0
         DeadAreaBackColor=   -2147483636
         RowDividerColor =   14215660
         RowSubDividerColor=   14215660
         DirectionAfterEnter=   2
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
         _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=90,.parent=13,.alignment=0,.locked=-1"
         _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=87,.parent=14,.alignment=2"
         _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=88,.parent=15"
         _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=89,.parent=17"
         _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=46,.parent=13,.locked=-1"
         _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14,.alignment=2"
         _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
         _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
         _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=58,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=55,.parent=14,.alignment=2"
         _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=56,.parent=15"
         _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=57,.parent=17"
         _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=32,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=29,.parent=14,.alignment=2"
         _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=30,.parent=15"
         _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=31,.parent=17"
         _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=28,.parent=13,.alignment=1,.locked=-1"
         _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=25,.parent=14,.alignment=2"
         _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=26,.parent=15"
         _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=27,.parent=17"
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
      Begin MSComCtl2.DTPicker dtpFechaDescarga_Desde 
         Height          =   315
         Left            =   1860
         TabIndex        =   40
         Top             =   720
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   86638593
         CurrentDate     =   40544
         MinDate         =   40179
      End
      Begin MSComCtl2.DTPicker dtpFechaDescarga_Hasta 
         Height          =   315
         Left            =   5100
         TabIndex        =   45
         Top             =   720
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   86638593
         CurrentDate     =   42480.5029861111
         MinDate         =   40179
      End
      Begin VB.Label lblFormularioOrigen_Fecha 
         AutoSize        =   -1  'True
         Caption         =   "Fecha:"
         Height          =   210
         Left            =   3540
         TabIndex        =   32
         Top             =   300
         Width           =   495
      End
      Begin VB.Label lblFechaDescargaHasta 
         AutoSize        =   -1  'True
         Caption         =   "hasta:"
         Height          =   210
         Left            =   4200
         TabIndex        =   43
         Top             =   780
         Width           =   450
      End
      Begin VB.Label lblFechaDescargaDesde 
         AutoSize        =   -1  'True
         Caption         =   "Descarga desde:"
         Height          =   210
         Left            =   180
         TabIndex        =   38
         Top             =   780
         Width           =   1245
      End
      Begin VB.Label lblFormularioOrigen_PesoNeto 
         Caption         =   "Kgs. Netos:"
         Height          =   390
         Left            =   5460
         TabIndex        =   34
         Top             =   120
         Width           =   780
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblFormularioOrigen_KilogramoPendiente 
         Caption         =   "Kgs. Pendientes:"
         Height          =   390
         Left            =   7320
         TabIndex        =   36
         Top             =   120
         Width           =   855
         WordWrap        =   -1  'True
      End
      Begin VB.Line linFormularioA 
         X1              =   120
         X2              =   9240
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Label lblFormularioOrigen 
         AutoSize        =   -1  'True
         Caption         =   "Form.:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   180
         TabIndex        =   29
         Top             =   300
         Width           =   525
      End
      Begin VB.Label lblFormularioOrigen_TipoNumero 
         AutoSize        =   -1  'True
         Caption         =   "Tipo y Nº:"
         Height          =   210
         Left            =   900
         TabIndex        =   30
         Top             =   300
         Width           =   705
      End
      Begin VB.Label lblMovimientoSeleccionado 
         Caption         =   "C.P. Seleccionadas:"
         Height          =   195
         Left            =   4560
         TabIndex        =   52
         Top             =   4080
         Width           =   1515
      End
      Begin VB.Label lblKilogramoNetoSeleccionado 
         Caption         =   "Kgs. Netos Selecc.:"
         Height          =   195
         Left            =   6840
         TabIndex        =   54
         Top             =   4080
         Width           =   1575
      End
      Begin VB.Label lblMovimientoTotal 
         Caption         =   "C.P. Total:"
         Height          =   195
         Left            =   3060
         TabIndex        =   50
         Top             =   4080
         Width           =   795
      End
   End
   Begin VB.Label lblDepositanteCUIT 
      AutoSize        =   -1  'True
      Caption         =   "CUIT:"
      Height          =   210
      Left            =   4980
      TabIndex        =   13
      Top             =   540
      Width           =   375
   End
   Begin VB.Label lblFormularioNumero 
      AutoSize        =   -1  'True
      Caption         =   "Certificado Nº:"
      Height          =   210
      Left            =   120
      TabIndex        =   9
      Top             =   1260
      Width           =   1050
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
   Begin VB.Label lblCereal 
      AutoSize        =   -1  'True
      Caption         =   "Cereal:"
      Height          =   210
      Left            =   4980
      TabIndex        =   17
      Top             =   1260
      Width           =   510
   End
   Begin VB.Label lblCosecha 
      AutoSize        =   -1  'True
      Caption         =   "Cosecha:"
      Height          =   210
      Left            =   4980
      TabIndex        =   15
      Top             =   900
      Width           =   690
   End
   Begin VB.Label lblDepositante 
      AutoSize        =   -1  'True
      Caption         =   "Depositante:"
      Height          =   210
      Left            =   4980
      TabIndex        =   11
      Top             =   180
      Width           =   900
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
   Begin VB.Label lblRetiraOTransfiere 
      AutoSize        =   -1  'True
      Caption         =   "Tipo de Form.:"
      Height          =   210
      Left            =   120
      TabIndex        =   7
      Top             =   900
      Width           =   1020
   End
End
Attribute VB_Name = "frmFormularioRT_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mColumnsResized As Boolean

Private mKeyDecimal As Boolean

Private mtdbgrdFormulario1116A_OrderColumn  As Long
Private mtdbgrdFormulario1116A_OrderAscending As Boolean

Private maDataTypes() As ADODB.DataTypeEnum
Private mtdbgrdCartaPorte_OrderColumn As Long
Private mtdbgrdCartaPorte_OrderAscending As Boolean

Private mTotal As Long
Private mSelectedCount As Long
Private mSelectedKgsTotal As Long

Private mFormulario1116RT_Cabecera As F1116RT_Cabecera

Private mFormCycleNumber As Byte

Private Const GRID_F1116_COLUMN_IDFORMULARIO1116 As String = "IDFormulario1116"
Private Const GRID_F1116_COLUMN_ORIGEN_IDPARTIDO As String = "Origen_IDPartido"
Private Const GRID_F1116_COLUMN_FORMULARIOTIPO As String = "FormularioTipo"
Private Const GRID_F1116_COLUMN_FORMULARIONUMERO As String = "FormularioNumero"
Private Const GRID_F1116_COLUMN_FORMULARIOFECHA As String = "Fecha"
Private Const GRID_F1116_COLUMN_KILOGRAMOTOTAL As String = "KilogramoTotal"
Private Const GRID_F1116_COLUMN_KILOGRAMOPENDIENTE As String = "KilogramoPendiente"

Private Const GRID_CARTAPORTE_COLUMN_IDMOVIMIENTO_CEREAL As Integer = 0
Private Const GRID_CARTAPORTE_COLUMN_COMPROBANTENUMERO As Integer = 1
Private Const GRID_CARTAPORTE_COLUMN_FECHACARGA As Integer = 2
Private Const GRID_CARTAPORTE_COLUMN_PESONETO As Integer = 3
Private Const GRID_CARTAPORTE_COLUMN_KILOGRAMOPENDIENTE As Integer = 4
Private Const GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR As Integer = 5

Public Function Startup(ByRef Formulario1116RT_Cabecera As F1116RT_Cabecera) As Boolean
    Set mFormulario1116RT_Cabecera = Formulario1116RT_Cabecera
    
    Load Me
    
    mFormCycleNumber = 1
    Call CycleForms
    
    Me.Caption = "Detalle del Certificado de Retiro / Transferencia - Nuevo"
        
    dtpFecha.Value = Date
    
'    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
'        If frmMovimiento_Cereal_Lista.cboFechaCarga.ListIndex = 1 Then
'            dtpFecha.Value = frmMovimiento_Cereal_Lista.dtpFechaCarga_Desde.Value
'        End If
'    End If

    Call CSM_Control_DataCombo.FillFromSQL(datcboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL ", "ID", "Nombre", "Plantas", cscpItemOrFirstIfUnique, pParametro.Planta_IDDefault)
    
    'TO FIX:  & mFormulario1116RT_Cabecera.Formulario1116A_Cabecera.DepositanteIDEntidad
    Call CSM_Control_DataCombo.FillFromSQL(datcboDepositante, "usp_Entidad_Titular_List 0, 1, NULL", "IDEntidad", "Nombre", "Depositantes", cscpNone)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCosecha, "usp_Cosecha_List 0, 1, NULL", "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirst, pParametro.Cosecha_IDDefault)
    'TO FIX:  OR IDCereal = " & mFormulario1116RT_Cabecera.Formulario1116A_Cabecera.IDCereal & "
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "usp_Cereal_List 0, 1, 1, " & mFormulario1116RT_Cabecera.IDCereal, "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
    
    Select Case mFormulario1116RT_Cabecera.RetiroOTransferencia
        Case FORMULARIO_RT_RETIRO
            txtRetiraOTransfiere.Text = FORMULARIO_RT_RETIRO_NOMBRE
            fraTransfiere.Visible = False
        Case FORMULARIO_RT_TRANSFERENCIA
            txtRetiraOTransfiere.Text = FORMULARIO_RT_TRANSFERENCIA_NOMBRE
            fraTransfiere.Visible = True
            Call CSM_Control_DataCombo.FillFromSQL(datcboReceptor, "usp_Entidad_Titular_List 0, 1, " & mFormulario1116RT_Cabecera.ReceptorIDEntidad, "IDEntidad", "Nombre", "Receptores", cscpNone)
    End Select
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mFormulario1116RT_Cabecera
        Me.Caption = "Detalle del Certificado de Retiro / Transferencia"
        
        'ENCABEZADO
'        txtComprobanteNumero.Text = .ComprobanteNumero
'        datcboFormularioTalonario.BoundText = .IDCartaPorteTalonario
'        txtCTGNumero.Text = .CTGNumero_Formatted
'        dtpFecha.Value = .FechaCarga_Formatted
'
'        datcboDepositante.BoundText = .IDEntidad_Titular
'        datcboCosecha.BoundText = .IDCosecha
'        datcboCereal.BoundText = .IDCereal
'        txtContratoNumero.Text = .ContratoNumero
'        txtPesoBruto.Text = .PesoBruto_Formatted
'        txtPesoTara.Text = .PesoTara_Formatted
'
    End With
    
    LoadData = True
End Function

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    Call SetTrueDBGridAppearance
    
    mtdbgrdFormulario1116A_OrderColumn = 4
    mtdbgrdFormulario1116A_OrderAscending = True
    
    mtdbgrdCartaPorte_OrderColumn = 2
    mtdbgrdCartaPorte_OrderAscending = True
    
    Call CSM_Control_TextBox.PrepareAll(Me)
    
    dtpFechaDescarga_Desde.Value = DateAdd("d", -15, Date)
    dtpFechaDescarga_Hasta.Value = Date
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode <> vbFormCode Then
        If MsgBox("¿Desea cancelar la carga del Certificado de Retiro / Transferencia?", vbQuestion + vbYesNo, App.Title) = vbNo Then
            Cancel = True
        End If
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mFormulario1116RT_Cabecera = Nothing
    Set frmFormularioRT_Detalle = Nothing
End Sub

'============================================================
'FECHA CARGA
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
'PLANTA
Private Sub datcboPlanta_Change()
    Call tdbgrdFormulario1116_Fill
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

'============================================================
'FECHA DESCARGA DESDE
Private Sub cmdFechaDescarga_DesdeAnterior_Click()
    dtpFechaDescarga_Desde.Value = DateAdd("d", -1, dtpFechaDescarga_Desde.Value)
    dtpFechaDescarga_Desde.SetFocus
    dtpFechaDescarga_Desde_Change
End Sub

Private Sub dtpFechaDescarga_Desde_Change()
    Call tdbgrdCartaPorte_Fill
End Sub

Private Sub cmdFechaDescarga_DesdeSiguiente_Click()
    dtpFechaDescarga_Desde.Value = DateAdd("d", 1, dtpFechaDescarga_Desde.Value)
    dtpFechaDescarga_Desde.SetFocus
    dtpFechaDescarga_Desde_Change
End Sub

Private Sub cmdFechaDescarga_DesdeHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaDescarga_Desde.Value
    dtpFechaDescarga_Desde.Value = Date
    dtpFechaDescarga_Desde.SetFocus
    If OldValue <> dtpFechaDescarga_Desde.Value Then
        dtpFechaDescarga_Desde_Change
    End If
End Sub

'============================================================
'FECHA DESCARGA HASTA
Private Sub cmdFechaDescarga_HastaAnterior_Click()
    dtpFechaDescarga_Hasta.Value = DateAdd("d", -1, dtpFechaDescarga_Hasta.Value)
    dtpFechaDescarga_Hasta.SetFocus
    dtpFechaDescarga_Hasta_Change
End Sub

Private Sub dtpFechaDescarga_Hasta_Change()
    Call tdbgrdCartaPorte_Fill
End Sub

Private Sub cmdFechaDescarga_HastaSiguiente_Click()
    dtpFechaDescarga_Hasta.Value = DateAdd("d", 1, dtpFechaDescarga_Hasta.Value)
    dtpFechaDescarga_Hasta.SetFocus
    dtpFechaDescarga_Hasta_Change
End Sub

Private Sub cmdFechaDescarga_HastaHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaDescarga_Hasta.Value
    dtpFechaDescarga_Hasta.Value = Date
    dtpFechaDescarga_Hasta.SetFocus
    If OldValue <> dtpFechaDescarga_Hasta.Value Then
        dtpFechaDescarga_Hasta_Change
    End If
End Sub

Private Sub tdbgrdFormulario1116_Fill()
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    
    If Val(datcboPlanta.BoundText) = 0 Or Val(datcboDepositante.BoundText) = 0 Or Val(datcboCosecha.BoundText) = 0 Or Val(datcboCereal.BoundText) = 0 Then
        Set tdbgrdFormulario1116.DataSource = recData
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

        .Parameters.Append .CreateParameter("IDEntidad_Destino", adInteger, adParamInput, , Val(Left(datcboPlanta.BoundText, Len(datcboPlanta.BoundText) - 5)))
        .Parameters.Append .CreateParameter("IDPlanta", adInteger, adParamInput, , Val(Right(datcboPlanta.BoundText, 5)))
        .Parameters.Append .CreateParameter("IDEntidad_Depositante", adInteger, adParamInput, , Val(datcboDepositante.BoundText))
        .Parameters.Append .CreateParameter("IDCosecha", adSmallInt, adParamInput, , Val(datcboCosecha.BoundText))
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , Val(datcboCereal.BoundText))
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenStatic, adLockReadOnly, adCmdStoredProc
    
    Set tdbgrdFormulario1116.DataSource = recData
    
    If Not recData.EOF Then
        Call tdbgrdFormulario1116_SortColumn(mtdbgrdFormulario1116A_OrderColumn)
    End If
    
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.FormularioRT_Detalle.tdbgrdFormulario1116_Fill", "Error al listar los Certificados de Depósito y RT pendientes.")
End Sub

Private Sub tdbgrdFormulario1116_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdFormulario1116.SelStartCol <> tdbgrdFormulario1116.SelEndCol Then
        tdbgrdFormulario1116.SelEndCol = tdbgrdFormulario1116.SelStartCol
    End If
    If tdbgrdFormulario1116.SelStartCol + 1 = mtdbgrdFormulario1116A_OrderColumn Then
        mtdbgrdFormulario1116A_OrderAscending = Not mtdbgrdFormulario1116A_OrderAscending
    Else
        mtdbgrdFormulario1116A_OrderAscending = True
    End If
    OldOrderColumn = mtdbgrdFormulario1116A_OrderColumn
    mtdbgrdFormulario1116A_OrderColumn = tdbgrdFormulario1116.SelStartCol + 1
    tdbgrdFormulario1116.SelStartCol = -1
    tdbgrdFormulario1116.SelEndCol = -1
    
    tdbgrdFormulario1116_SortColumn OldOrderColumn
End Sub

Private Sub tdbgrdFormulario1116_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized = True
End Sub

Private Sub tdbgrdFormulario1116_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdFormulario1116.MoveFirst
        Case vbKeyEnd
            tdbgrdFormulario1116.MoveLast
    End Select
End Sub

Private Sub tdbgrdFormulario1116_SortColumn(ByVal OldOrderColumn As Long)
    Dim recData As ADODB.Recordset

    Set recData = tdbgrdFormulario1116.DataSource
    If Not recData Is Nothing Then
        recData.Sort = tdbgrdFormulario1116.Columns(mtdbgrdFormulario1116A_OrderColumn - 1).DataField & IIf(mtdbgrdFormulario1116A_OrderAscending, " ASC", " DESC")
    End If
    
    'ICONOS
    tdbgrdFormulario1116.Columns(OldOrderColumn - 1).HeadingStyle.ForegroundPicture = 0
    tdbgrdFormulario1116.Columns(mtdbgrdFormulario1116A_OrderColumn - 1).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdFormulario1116.Columns(mtdbgrdFormulario1116A_OrderColumn - 1).HeadingStyle.TransparentForegroundPicture = True
    If mtdbgrdFormulario1116A_OrderAscending Then
        Set tdbgrdFormulario1116.Columns(mtdbgrdFormulario1116A_OrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdFormulario1116.Columns(mtdbgrdFormulario1116A_OrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

'============================================================
'KILOGRAMO TRANSFERENCIA
Private Sub txtKilogramoTransferencia_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtKilogramoTransferencia)
End Sub

Private Sub txtKilogramoTransferencia_Change()
    'Call CalcularPesoNeto
End Sub

Private Sub txtKilogramoTransferencia_LostFocus()
    Call FormatValue_ByTag(txtKilogramoTransferencia)
End Sub

Private Sub tdbgrdCartaPorte_Fill()
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
        .CommandText = "usp_Movimiento_Cereal_Salida_SinAplicar_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad_Depositario", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 1))
        .Parameters.Append .CreateParameter("IDPlanta", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 2))
        .Parameters.Append .CreateParameter("IDEntidad_Depositante", adInteger, adParamInput, , Val(datcboDepositante.BoundText))
        .Parameters.Append .CreateParameter("IDCosecha", adSmallInt, adParamInput, , Val(datcboCosecha.BoundText))
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , Val(datcboCereal.BoundText))
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , dtpFechaDescarga_Desde.Value)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , dtpFechaDescarga_Hasta.Value)
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    If Not recData.EOF Then
        Call XArrayDB.LoadRows(recData.GetRows())
    End If
    Set tdbgrdCartaPorte.Array = XArrayDB
    tdbgrdCartaPorte.ReBind
    
    mTotal = XArrayDB.Count(1)
    mSelectedCount = 0
    mSelectedKgsTotal = 0
    Call RefreshTotals
    
    maDataTypes = pDatabase.GetDataTypeArrayFromRecordset(recData)
    
    If Not (recData.BOF And recData.EOF) Then
        Call tdbgrdCartaPorte_SortColumn(mtdbgrdCartaPorte_OrderColumn)
    End If
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.FormularioRT_Detalle.tdbgrdCartaPorte_Fill", "Error al listar las Cartas de Porte.")
End Sub

Private Sub tdbgrdCartaPorte_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdCartaPorte.SelStartCol <> tdbgrdCartaPorte.SelEndCol Then
        tdbgrdCartaPorte.SelEndCol = tdbgrdCartaPorte.SelStartCol
    End If
    If tdbgrdCartaPorte.SelStartCol = mtdbgrdCartaPorte_OrderColumn Then
        mtdbgrdCartaPorte_OrderAscending = Not mtdbgrdCartaPorte_OrderAscending
    Else
        mtdbgrdCartaPorte_OrderAscending = True
    End If
    OldOrderColumn = mtdbgrdCartaPorte_OrderColumn
    mtdbgrdCartaPorte_OrderColumn = tdbgrdCartaPorte.SelStartCol
    tdbgrdCartaPorte.SelStartCol = -1
    tdbgrdCartaPorte.SelEndCol = -1
    
    tdbgrdCartaPorte_SortColumn OldOrderColumn
End Sub

Private Sub tdbgrdCartaPorte_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized = True
End Sub

Private Sub tdbgrdCartaPorte_DblClick()
    If tdbgrdCartaPorte.Col = GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR And (CLng(txtFormularioOrigen_KilogramoPendiente.Text) - CLng(txtKilogramoNetoSeleccionado.Text)) > 0 Then
        tdbgrdCartaPorte.EditActive = True
        If tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOPENDIENTE).Value > (CLng(txtFormularioOrigen_KilogramoPendiente.Text) - CLng(txtKilogramoNetoSeleccionado.Text)) Then
            tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value = (CLng(txtFormularioOrigen_KilogramoPendiente.Text) - CLng(txtKilogramoNetoSeleccionado.Text))
        Else
            tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value = tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOPENDIENTE).Value
        End If
        tdbgrdCartaPorte.EditActive = False
        
        mSelectedCount = mSelectedCount + 1
        mSelectedKgsTotal = mSelectedKgsTotal + CLng(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value)
        
        Call RefreshTotals
    End If
End Sub

Private Sub tdbgrdCartaPorte_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdCartaPorte.MoveFirst
        Case vbKeyEnd
            tdbgrdCartaPorte.MoveLast
    End Select
End Sub

'Private Sub tdbgrdCartaPorte_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
'    If ColIndex = GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR Then
'        If tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value <> "" Then
'            If IsNumeric(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value) Then
'
'                Select Case CLng(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value)
'
'                    Case 0  'INGRESÓ CERO
'                        If Val(OldValue) > 0 Then
'                            mSelectedCount = mSelectedCount - 1
'                            mSelectedKgsTotal = mSelectedKgsTotal - Val(OldValue)
'                        End If
'
'                    Case Is < 0
'                        'EL VALOR INGRESADO ES MENOR A CERO, RESTAURO EL VALOR ORIGINAL
'                        tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value = OldValue
'
'                    Case Is > CLng(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOPENDIENTE).Value)
'                        'EL VALOR INGRESADO ES MAYOR AL PENDIENTE, RESTAURO EL VALOR ORIGINAL
'                        tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value = OldValue
'
'                    Case Else
'                        'EL VALOR INGRESADO ES CORRECTO
'                        If Val(OldValue) = 0 Then
'                            mSelectedCount = mSelectedCount + 1
'                        End If
'                        mSelectedKgsTotal = mSelectedKgsTotal + CLng(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value) - Val(OldValue)
'                End Select
'            Else
'                'EL VALOR NO ES NUMÉRICO, RESTAURO EL VALOR ORIGINAL
'                tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value = OldValue
'            End If
'        Else
'            'SE ELIMINÓ EL VALOR, ASÍ QUE RESTO TODO
'            mSelectedCount = mSelectedCount - 1
'            mSelectedKgsTotal = mSelectedKgsTotal - Val(OldValue)
'        End If
'
'        Call RefreshTotals
'    End If
'End Sub

Private Sub tdbgrdCartaPorte_SortColumn(ByVal OldOrderColumn As Long)
    Dim XArrayDB As XArrayDBObject.XArrayDB

    Set XArrayDB = tdbgrdCartaPorte.Array
    If Not XArrayDB Is Nothing Then
        Call XArrayDB.QuickSort(0, XArrayDB.UpperBound(1), mtdbgrdCartaPorte_OrderColumn, IIf(mtdbgrdCartaPorte_OrderAscending, XORDER_ASCEND, XORDER_DESCEND), CSM_XArrayDB.ConvertADOTypeToXTYPE(maDataTypes(mtdbgrdCartaPorte_OrderColumn)))
        tdbgrdCartaPorte.ReBind
    End If

    'ICONOS
    If OldOrderColumn <> mtdbgrdCartaPorte_OrderColumn Then
        tdbgrdCartaPorte.Columns(OldOrderColumn).HeadingStyle.ForegroundPicture = 0
    End If
    tdbgrdCartaPorte.Columns(mtdbgrdCartaPorte_OrderColumn).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdCartaPorte.Columns(mtdbgrdCartaPorte_OrderColumn).HeadingStyle.TransparentForegroundPicture = True
    If mtdbgrdCartaPorte_OrderAscending Then
        Set tdbgrdCartaPorte.Columns(mtdbgrdCartaPorte_OrderColumn).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdCartaPorte.Columns(mtdbgrdCartaPorte_OrderColumn).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

'============================================================
'RECEPTOR
Private Sub datcboReceptor_Change()
    Dim Entidad_Receptor As Entidad
    
    Set Entidad_Receptor = New Entidad
    Entidad_Receptor.IDEntidad = CLng(datcboReceptor.BoundText)
    If Not Entidad_Receptor.Load() Then
        txtReceptorCUIT.Text = ""
        Set Entidad_Receptor = Nothing
        Exit Sub
    End If
    txtReceptorCUIT.Text = Entidad_Receptor.CUIT
    Set Entidad_Receptor = Nothing
End Sub

'============================================================
'CUIT
Private Sub txtReceptorCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtReceptorCUIT)
End Sub

Private Sub cmdAnterior_Click()
    mFormCycleNumber = mFormCycleNumber - 1
    Call CycleForms
End Sub

Private Sub cmdSiguiente_Click()
    If tdbgrdFormulario1116.FirstRow = "" Then
        MsgBox "No hay ningún Certificado de Depósito o RT (Transferencia) disponible para aplicar al Certificado de Retiro / Transferencia.", vbInformation, App.Title
        tdbgrdFormulario1116.SetFocus
        Exit Sub
    End If
    
    mFormCycleNumber = mFormCycleNumber + 1
    
    Call CycleForms
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Private Sub cmdFinalizar_Click()
    Dim Formulario1116RT_Cabecera_VerificaNumero As F1116RT_Cabecera
    Dim Formulario1116RT_Detalle As F1116RT_Detalle
    
    Dim Entidad_Depositante As Entidad
    Dim Entidad_Receptor As Entidad
    
    If Trim(txtFormularioNumero.Text) = "" Then
        MsgBox "Debe ingresar el Número de Certificado.", vbInformation, App.Title
        txtFormularioNumero.SetFocus
        Exit Sub
    End If
        
    Select Case mFormulario1116RT_Cabecera.RetiroOTransferencia
        Case FORMULARIO_RT_TRANSFERENCIA
            If datcboReceptor.BoundText = "" Then
                mFormCycleNumber = 1
                Call CycleForms
                MsgBox "Debe seleccionar el Receptor de la mercadería.", vbInformation, App.Title
                datcboReceptor.SetFocus
                Exit Sub
            End If
            If datcboDepositante.BoundText = datcboReceptor.BoundText Then
                mFormCycleNumber = 1
                Call CycleForms
                MsgBox "El Receptor de la mercadería debe ser diferente al Depositante.", vbInformation, App.Title
                datcboReceptor.SetFocus
                Exit Sub
            End If
            If Trim(txtKilogramoTransferencia.Text) = "" Then
                mFormCycleNumber = 1
                Call CycleForms
                MsgBox "Debe especificar los kgs. a transferir.", vbInformation, App.Title
                txtKilogramoTransferencia.SetFocus
                Exit Sub
            End If
            If Not IsNumeric(Trim(txtKilogramoTransferencia.Text)) Then
                mFormCycleNumber = 1
                Call CycleForms
                MsgBox "Los kgs. a transferir ingresados no son válidos.", vbInformation, App.Title
                txtKilogramoTransferencia.SetFocus
                Exit Sub
            End If
            If CLng(Trim(txtKilogramoTransferencia.Text)) > CLng(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOPENDIENTE).Text) Then
                mFormCycleNumber = 1
                Call CycleForms
                MsgBox "Los kgs. a transferir ingresados, superan los kgs. disponibles en el Certificado seleccionado.", vbInformation, App.Title
                txtKilogramoTransferencia.SetFocus
                Exit Sub
            End If
            
        Case FORMULARIO_RT_RETIRO
            If mSelectedCount = 0 Then
                mFormCycleNumber = 2
                'Call CycleForms
                MsgBox "No hay ninguna Carta de Porte seleccionada para asignar al Certificado de Retiro / Transferencia.", vbInformation, App.Title
                tdbgrdCartaPorte.SetFocus
                Exit Sub
            End If
            If mSelectedCount > pParametro.Formulario1116RT_RemesasMaximo Then
                mFormCycleNumber = 2
                MsgBox "Ha seleccionado " & mSelectedCount & " Cartas de Porte. El máximo permitido es " & pParametro.Formulario1116RT_RemesasMaximo, vbInformation, App.Title
                'Call CycleForms
                tdbgrdCartaPorte.SetFocus
                Exit Sub
            End If
            
            'VERIFICO LAS FECHAS DE LAS CARTAS DE PORTE
            tdbgrdCartaPorte.Visible = False
            tdbgrdCartaPorte.MoveFirst
            Do While Not tdbgrdCartaPorte.EOF
                If Val(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value) > 0 Then
                    If DateDiff("d", CDate(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_FECHACARGA).Value), dtpFecha.Value) < 0 Then
                        mFormCycleNumber = 2
                        'Call CycleForms
                        MsgBox "Hay al menos una Carta de Porte seleccionada que tiene Fecha de Carga mayor a la Fecha del Certificado.", vbInformation, App.Title
                        tdbgrdCartaPorte.MoveFirst
                        tdbgrdCartaPorte.Visible = True
                        tdbgrdCartaPorte.ReBind
                        Exit Sub
                    End If
                End If
                tdbgrdCartaPorte.MoveNext
            Loop
            tdbgrdCartaPorte.MoveFirst
            tdbgrdCartaPorte.Visible = True
            tdbgrdCartaPorte.ReBind
    End Select

    'VERIFICO SI NO EXISTE EL NÚMERO DE FORMULARIO
    Set Formulario1116RT_Cabecera_VerificaNumero = New F1116RT_Cabecera
    Formulario1116RT_Cabecera_VerificaNumero.NoMatchRaiseError = False
    Formulario1116RT_Cabecera_VerificaNumero.FormularioNumero = txtFormularioNumero.Text
    If Formulario1116RT_Cabecera_VerificaNumero.LoadByFormularioNumero() Then
        If Not Formulario1116RT_Cabecera_VerificaNumero.NoMatch Then
            MsgBox "El Número de Certificado ya existe.", vbExclamation, App.Title
            Set Formulario1116RT_Cabecera_VerificaNumero = Nothing
            Exit Sub
        End If
    End If
    Set Formulario1116RT_Cabecera_VerificaNumero = Nothing
    
    'VERIFICO QUE EL DEPOSITANTE TENGA LOS DATOS COMPLETOS
    Set Entidad_Depositante = New Entidad
    Entidad_Depositante.IDEntidad = CLng(datcboDepositante.BoundText)
    If Not Entidad_Depositante.Load() Then
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    If Entidad_Depositante.Entidad_Domicilio.Calle = "" Then
        Set Entidad_Depositante = Nothing
        mFormCycleNumber = 1
        Call CycleForms
        MsgBox "El Depositante no tiene los datos del domicilio completos.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Exit Sub
    End If
    If Entidad_Depositante.Entidad_Impuesto.IDCategoriaIVA = 0 Then
        Set Entidad_Depositante = Nothing
        mFormCycleNumber = 1
        Call CycleForms
        MsgBox "El Depositante no tiene los datos impositivos completos.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Exit Sub
    End If
    
    If mFormulario1116RT_Cabecera.RetiroOTransferencia = FORMULARIO_RT_TRANSFERENCIA Then
        'SI ES TRANSFERENCIA, VERIFICO QUE EL RECEPTOR TENGA LOS DATOS COMPLETOS
        Set Entidad_Receptor = New Entidad
        Entidad_Receptor.IDEntidad = CLng(datcboReceptor.BoundText)
        If Not Entidad_Receptor.Load() Then
            Set Entidad_Depositante = Nothing
            Set Entidad_Receptor = Nothing
            Exit Sub
        End If
        If Entidad_Receptor.Entidad_Domicilio.Calle = "" Then
            Set Entidad_Depositante = Nothing
            Set Entidad_Receptor = Nothing
            mFormCycleNumber = 1
            Call CycleForms
            MsgBox "El Receptor no tiene los datos del domicilio completos.", vbInformation, App.Title
            datcboDepositante.SetFocus
            Exit Sub
        End If
        If Entidad_Receptor.Entidad_Impuesto.IDCategoriaIVA = 0 Then
            Set Entidad_Depositante = Nothing
            Set Entidad_Receptor = Nothing
            mFormCycleNumber = 1
            Call CycleForms
            MsgBox "El Receptor no tiene los datos impositivos completos.", vbInformation, App.Title
            datcboDepositante.SetFocus
            Exit Sub
        End If
    End If
    
    If MsgBox("¿Desea generar el Certificado de Depósito?", vbQuestion + vbYesNo, App.Title) = vbNo Then
        Set Entidad_Depositante = Nothing
        Set Entidad_Receptor = Nothing
        Exit Sub
    End If
    
    With mFormulario1116RT_Cabecera
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
        Set Entidad_Depositante = Nothing
        
        'ORIGEN
        .Origen_FormularioTipo = Left(tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOTIPO).Value, 1)
        .Origen_FormularioNumero = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIONUMERO).Value
        .Origen_FormularioFecha = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOFECHA).Value
        If .Origen_FormularioTipo = "A" Then
            .Origen_IDFormulario1116A = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_IDFORMULARIO1116).Value
        Else
            .Origen_IDFormulario1116RT = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_IDFORMULARIO1116).Value
        End If
        .Origen_IDPartido = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_ORIGEN_IDPARTIDO).Value
        
        'CEREAL
        .IDCosecha = Val(datcboCosecha.BoundText)
        .IDCereal = Val(datcboCereal.BoundText)
        
        If .RetiroOTransferencia = FORMULARIO_RT_RETIRO Then
            .TotalKilogramo = 0
        Else
            .TotalKilogramo = CLng(txtKilogramoTransferencia.Text)
        End If
        .GeneraNuevoF1116A = (chkGeneraNuevoF1116A.Value = vbChecked)
        
        If .RetiroOTransferencia = FORMULARIO_RT_TRANSFERENCIA Then
            .ReceptorIDEntidad = CLng(datcboReceptor.BoundText)
            .ReceptorRazonSocial = Entidad_Receptor.Nombre
            .ReceptorDomicilioTipo = Entidad_Receptor.Entidad_Domicilio.Tipo
            .ReceptorDomicilioCalle = Entidad_Receptor.Entidad_Domicilio.Calle
            .ReceptorDomicilioNumero = Entidad_Receptor.Entidad_Domicilio.Numero
            .ReceptorDomicilioPiso = Entidad_Receptor.Entidad_Domicilio.Piso
            .ReceptorDomicilioOficina = Entidad_Receptor.Entidad_Domicilio.Oficina
            .ReceptorDomicilioCodigoPostal = Entidad_Receptor.Entidad_Domicilio.CodigoPostal
            .ReceptorDomicilioIDLocalidad = Entidad_Receptor.Entidad_Domicilio.IDLocalidad
            .ReceptorCUIT = Entidad_Receptor.CUIT
            .ReceptorIIBB = Entidad_Receptor.Entidad_Impuesto.IIBB
            .ReceptorIDCategoriaIVA = Entidad_Receptor.Entidad_Impuesto.IDCategoriaIVA
            Set Entidad_Receptor = Nothing
        Else
            'AGREGO LOS ID DE LOS MOVIMIENTOS
            tdbgrdCartaPorte.Visible = False
            tdbgrdCartaPorte.MoveFirst
            Set .CFormulario1116RT_Detalle = New Collection
            Do While Not tdbgrdCartaPorte.EOF
                If Val(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value) > 0 Then
                    Set Formulario1116RT_Detalle = New F1116RT_Detalle
                    Formulario1116RT_Detalle.IDMovimiento_Cereal = CLng(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_IDMOVIMIENTO_CEREAL).Value)
                    Formulario1116RT_Detalle.KilogramoAplicado = CLng(tdbgrdCartaPorte.Columns(GRID_CARTAPORTE_COLUMN_KILOGRAMOASIGNAR).Value)
                    .CFormulario1116RT_Detalle.Add Formulario1116RT_Detalle
                End If
                tdbgrdCartaPorte.MoveNext
            Loop
            Set Formulario1116RT_Detalle = Nothing
            tdbgrdCartaPorte.MoveFirst
            tdbgrdCartaPorte.Visible = True
            tdbgrdCartaPorte.ReBind
        End If
           
        If Not .Update Then
            Exit Sub
        End If
    End With
    
    MsgBox "Se ha generado el Certificado de Retiro / Transferencia.", vbInformation, App.Title
    
    Unload Me
End Sub

Private Sub RefreshTotals()
    txtMovimientoTotal.Text = mTotal
    txtMovimientoSeleccionado.Text = mSelectedCount
    txtKilogramoNetoSeleccionado.Text = Format(mSelectedKgsTotal, "#,##0")
End Sub

Public Sub SetTrueDBGridAppearance()
    With tdbgrdFormulario1116
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
        
        '.MultipleLines = IIf(pParametro.GridMultipleLines, TrueOleDBGrid80.MultipleLinesConstants.dbgMultipleVariable, TrueOleDBGrid80.MultipleLinesConstants.dbgDisabled)
        
        '.Columns("KilogramoFinal").Visible = pParametro.Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar
    End With
    With tdbgrdCartaPorte
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
        
        '.MultipleLines = IIf(pParametro.GridMultipleLines, TrueOleDBGrid80.MultipleLinesConstants.dbgMultipleVariable, TrueOleDBGrid80.MultipleLinesConstants.dbgDisabled)
        
        '.Columns("KilogramoFinal").Visible = pParametro.Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar
    End With
End Sub

Private Sub CycleForms()
    fraCycleEncabezado.Visible = (mFormCycleNumber = 1)
    fraCycleRetiros.Visible = (mFormCycleNumber = 2)
    
    cmdFecha_Anterior.Enabled = (mFormCycleNumber = 1)
    dtpFecha.Enabled = (mFormCycleNumber = 1)
    cmdFecha_Siguiente.Enabled = (mFormCycleNumber = 1)
    cmdFecha_Hoy.Enabled = (mFormCycleNumber = 1)
    
    datcboPlanta.Enabled = (mFormCycleNumber = 1)
    datcboDepositante.Enabled = (mFormCycleNumber = 1)
    datcboCosecha.Enabled = (mFormCycleNumber = 1)
    datcboCereal.Enabled = (mFormCycleNumber = 1)
    
    If mFormCycleNumber = 2 Then
        txtFormularioOrigen_TipoNumero.Text = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOTIPO).Text & " - " & tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIONUMERO).Text
        txtFormularioOrigen_Fecha.Text = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_FORMULARIOFECHA).Text
        txtFormularioOrigen_PesoNeto.Text = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOTOTAL).Text
        txtFormularioOrigen_KilogramoPendiente.Text = tdbgrdFormulario1116.Columns(GRID_F1116_COLUMN_KILOGRAMOPENDIENTE).Text
        
        Call tdbgrdCartaPorte_Fill
    End If
    
    cmdAnterior.Visible = (mFormCycleNumber > 1)
    cmdSiguiente.Visible = (mFormulario1116RT_Cabecera.RetiroOTransferencia = FORMULARIO_RT_RETIRO And mFormCycleNumber < 2)
    cmdFinalizar.Visible = (mFormulario1116RT_Cabecera.RetiroOTransferencia = FORMULARIO_RT_TRANSFERENCIA Or mFormCycleNumber = 2)
End Sub
