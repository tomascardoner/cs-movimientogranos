VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmFormularioB_Lista 
   Caption         =   "Liquidaciones"
   ClientHeight    =   5820
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11385
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FormularioB_Lista.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   5820
   ScaleWidth      =   11385
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3255
      Left            =   360
      TabIndex        =   21
      Top             =   1920
      Width           =   9615
      _ExtentX        =   16960
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDFormulario1116B"
      Columns(0).DataField=   "IDFormulario1116B"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Número"
      Columns(1).DataField=   "FormularioNumero"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Fecha"
      Columns(2).DataField=   "Fecha"
      Columns(2).NumberFormat=   "Short Date"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   16
      Columns(3)._MaxComboItems=   5
      Columns(3).ValueItems(0)._DefaultItem=   0
      Columns(3).ValueItems(0).Value=   "V"
      Columns(3).ValueItems(0).Value.vt=   8
      Columns(3).ValueItems(0).DisplayValue=   "Compra/Venta"
      Columns(3).ValueItems(0).DisplayValue.vt=   8
      Columns(3).ValueItems(0)._PropDict=   "_DefaultItem,517,2"
      Columns(3).ValueItems(1)._DefaultItem=   0
      Columns(3).ValueItems(1).Value=   "C"
      Columns(3).ValueItems(1).Value.vt=   8
      Columns(3).ValueItems(1).DisplayValue=   "Canje"
      Columns(3).ValueItems(1).DisplayValue.vt=   8
      Columns(3).ValueItems(1)._PropDict=   "_DefaultItem,517,2"
      Columns(3).ValueItems.Count=   2
      Columns(3).Caption=   "Tipo"
      Columns(3).DataField=   "OperacionTipo"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Cereal"
      Columns(4).DataField=   "Cereal"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Vendedor"
      Columns(5).DataField=   "DepositanteRazonSocial"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Kgs."
      Columns(6).DataField=   "OperacionCantidad"
      Columns(6).NumberFormat=   "#,###"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).Caption=   "Precio/Tn."
      Columns(7).DataField=   "CondicionOperacionPrecioTonelada"
      Columns(7).NumberFormat=   "Currency"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   8
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=8"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=2302"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2223"
      Splits(0)._ColumnProps(12)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8708"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(16)=   "Column(2).Width=1773"
      Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=1693"
      Splits(0)._ColumnProps(19)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8705"
      Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(23)=   "Column(3).Width=2117"
      Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=2037"
      Splits(0)._ColumnProps(26)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(27)=   "Column(3)._ColStyle=8705"
      Splits(0)._ColumnProps(28)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(29)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(30)=   "Column(4).Width=2725"
      Splits(0)._ColumnProps(31)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(4)._WidthInPix=2646"
      Splits(0)._ColumnProps(33)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(34)=   "Column(4)._ColStyle=8704"
      Splits(0)._ColumnProps(35)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(36)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(37)=   "Column(5).Width=4577"
      Splits(0)._ColumnProps(38)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(5)._WidthInPix=4498"
      Splits(0)._ColumnProps(40)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(41)=   "Column(5)._ColStyle=8704"
      Splits(0)._ColumnProps(42)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(43)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(44)=   "Column(6).Width=1402"
      Splits(0)._ColumnProps(45)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(46)=   "Column(6)._WidthInPix=1323"
      Splits(0)._ColumnProps(47)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(48)=   "Column(6)._ColStyle=8706"
      Splits(0)._ColumnProps(49)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(50)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(51)=   "Column(7).Width=2117"
      Splits(0)._ColumnProps(52)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(53)=   "Column(7)._WidthInPix=2037"
      Splits(0)._ColumnProps(54)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(55)=   "Column(7)._ColStyle=8706"
      Splits(0)._ColumnProps(56)=   "Column(7).AllowFocus=0"
      Splits(0)._ColumnProps(57)=   "Column(7).Order=8"
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
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=46,.parent=13,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=44,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=45,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=82,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=80,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=81,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=54,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=51,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=52,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=53,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=66,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=63,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=64,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=65,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=50,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=48,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=49,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=62,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=59,.parent=14,.alignment=2"
      _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=60,.parent=15"
      _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=61,.parent=17"
      _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=58,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=55,.parent=14,.alignment=2"
      _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=56,.parent=15"
      _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=57,.parent=17"
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
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   1410
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11385
      _ExtentX        =   20082
      _ExtentY        =   2487
      BandCount       =   6
      FixedOrder      =   -1  'True
      _CBWidth        =   11385
      _CBHeight       =   1410
      _Version        =   "6.7.9782"
      Child1          =   "tlbMain"
      MinWidth1       =   6600
      MinHeight1      =   570
      Width1          =   6600
      FixedBackground1=   0   'False
      Key1            =   "Toolbar"
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "picPlanta"
      MinWidth2       =   3870
      MinHeight2      =   360
      Width2          =   3870
      FixedBackground2=   0   'False
      Key2            =   "Planta"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picEntidad"
      MinWidth3       =   4950
      MinHeight3      =   360
      Width3          =   4950
      FixedBackground3=   0   'False
      Key3            =   "Entidad"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Child4          =   "picCosecha"
      MinWidth4       =   3030
      MinHeight4      =   360
      Width4          =   3030
      FixedBackground4=   0   'False
      Key4            =   "Cosecha"
      NewRow4         =   0   'False
      AllowVertical4  =   0   'False
      Child5          =   "picCereal"
      MinWidth5       =   3090
      MinHeight5      =   360
      Width5          =   3090
      FixedBackground5=   0   'False
      Key5            =   "Producto"
      NewRow5         =   0   'False
      AllowVertical5  =   0   'False
      Child6          =   "picFecha"
      MinWidth6       =   6690
      MinHeight6      =   360
      Width6          =   6690
      FixedBackground6=   0   'False
      Key6            =   "Fecha"
      NewRow6         =   0   'False
      AllowVertical6  =   0   'False
      Begin VB.PictureBox picPlanta 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   7425
         ScaleHeight     =   360
         ScaleWidth      =   3870
         TabIndex        =   26
         Top             =   135
         Width           =   3870
         Begin VB.ComboBox cboPlanta 
            Height          =   330
            Left            =   660
            Style           =   2  'Dropdown List
            TabIndex        =   27
            Top             =   0
            Width           =   3195
         End
         Begin VB.Label lblPlanta 
            AutoSize        =   -1  'True
            Caption         =   "Planta:"
            Height          =   210
            Left            =   0
            TabIndex        =   28
            Top             =   60
            Width           =   480
         End
      End
      Begin VB.PictureBox picCosecha 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   8265
         ScaleHeight     =   360
         ScaleWidth      =   3030
         TabIndex        =   23
         Top             =   630
         Width           =   3030
         Begin VB.ComboBox cboCosecha 
            Height          =   330
            Left            =   840
            Style           =   2  'Dropdown List
            TabIndex        =   24
            Top             =   0
            Width           =   2175
         End
         Begin VB.Label lblCosecha 
            AutoSize        =   -1  'True
            Caption         =   "Cosecha:"
            Height          =   210
            Left            =   0
            TabIndex        =   25
            Top             =   60
            Width           =   690
         End
      End
      Begin VB.PictureBox picCereal 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   3090
         TabIndex        =   5
         Top             =   1020
         Width           =   3090
         Begin VB.ComboBox cboCereal 
            Height          =   330
            Left            =   660
            Style           =   2  'Dropdown List
            TabIndex        =   7
            Top             =   0
            Width           =   2415
         End
         Begin VB.Label lblCereal 
            AutoSize        =   -1  'True
            Caption         =   "Cereal:"
            Height          =   210
            Left            =   0
            TabIndex        =   6
            Top             =   60
            Width           =   510
         End
      End
      Begin VB.PictureBox picEntidad 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   7875
         TabIndex        =   2
         Top             =   630
         Width           =   7875
         Begin VB.ComboBox cboEntidad 
            Height          =   330
            Left            =   660
            Style           =   2  'Dropdown List
            TabIndex        =   4
            Top             =   0
            Width           =   4275
         End
         Begin VB.Label lblEntidad 
            AutoSize        =   -1  'True
            Caption         =   "Entidad:"
            Height          =   210
            Left            =   0
            TabIndex        =   3
            Top             =   60
            Width           =   570
         End
      End
      Begin VB.PictureBox picFecha 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   3480
         ScaleHeight     =   360
         ScaleWidth      =   7815
         TabIndex        =   8
         Top             =   1020
         Width           =   7815
         Begin VB.ComboBox cboFecha 
            Height          =   330
            Left            =   600
            Style           =   2  'Dropdown List
            TabIndex        =   10
            Top             =   0
            Width           =   1035
         End
         Begin VB.CommandButton cmdFechaDesdeAnterior 
            Height          =   315
            Left            =   1680
            Picture         =   "FormularioB_Lista.frx":0CCA
            Style           =   1  'Graphical
            TabIndex        =   11
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaDesdeSiguiente 
            Height          =   315
            Left            =   3420
            Picture         =   "FormularioB_Lista.frx":1254
            Style           =   1  'Graphical
            TabIndex        =   14
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaDesdeHoy 
            Height          =   315
            Left            =   3720
            Picture         =   "FormularioB_Lista.frx":17DE
            Style           =   1  'Graphical
            TabIndex        =   15
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.CommandButton cmdFechaHastaAnterior 
            Height          =   315
            Left            =   4320
            Picture         =   "FormularioB_Lista.frx":1928
            Style           =   1  'Graphical
            TabIndex        =   17
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaHastaSiguiente 
            Height          =   315
            Left            =   6060
            Picture         =   "FormularioB_Lista.frx":1EB2
            Style           =   1  'Graphical
            TabIndex        =   19
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaHastaHoy 
            Height          =   315
            Left            =   6360
            Picture         =   "FormularioB_Lista.frx":243C
            Style           =   1  'Graphical
            TabIndex        =   20
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.TextBox txtDiaSemana 
            Height          =   315
            Left            =   1680
            Locked          =   -1  'True
            TabIndex        =   12
            TabStop         =   0   'False
            Top             =   0
            Visible         =   0   'False
            Width           =   1050
         End
         Begin MSComCtl2.DTPicker dtpFechaDesde 
            Height          =   315
            Left            =   1980
            TabIndex        =   13
            Top             =   0
            Visible         =   0   'False
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
            Format          =   98566145
            CurrentDate     =   36950
         End
         Begin MSComCtl2.DTPicker dtpFechaHasta 
            Height          =   315
            Left            =   4620
            TabIndex        =   18
            Top             =   0
            Visible         =   0   'False
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
            Format          =   98566145
            CurrentDate     =   36950
         End
         Begin VB.Label lblFecha 
            AutoSize        =   -1  'True
            Caption         =   "Fecha:"
            Height          =   210
            Left            =   0
            TabIndex        =   9
            Top             =   60
            Width           =   495
         End
         Begin VB.Label lblFechaY 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   4140
            TabIndex        =   16
            Top             =   60
            Visible         =   0   'False
            Width           =   90
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   1
         Top             =   30
         Width           =   7170
         _ExtentX        =   12647
         _ExtentY        =   1005
         ButtonWidth     =   2170
         ButtonHeight    =   1005
         ToolTips        =   0   'False
         AllowCustomize  =   0   'False
         Wrappable       =   0   'False
         Style           =   1
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   5
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Nuevo"
               Key             =   "NEW"
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Propiedades"
               Key             =   "PROPERTIES"
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Eliminar"
               Key             =   "DELETE"
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Imprimir"
               Key             =   "PRINT"
               Style           =   5
            EndProperty
            BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Seleccionar"
               Key             =   "SELECT"
               ImageIndex      =   5
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   360
      Left            =   0
      TabIndex        =   22
      Top             =   5460
      Width           =   11385
      _ExtentX        =   20082
      _ExtentY        =   635
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
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
Attribute VB_Name = "frmFormularioB_Lista"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mLoading As Boolean

Private mColumnsResized As Boolean
Private mOrderColumn As Long
Private mOrderAscending As Boolean

Private mRecordSelectionFormula As String

Private Const REPORT_FILENAME_PREFIX As String = "Liquidación - "

Public Function Startup() As Boolean
    mLoading = True

    Load Me
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal IDFormulario1116B As Long) As Boolean
    Dim recData As ADODB.Recordset
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim strSQLWhere As String
    
    Dim SaveIDFormulario1116B As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDFormulario1116B = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDFormulario1116B = tdbgrdData.Columns("IDFormulario1116B").Value
        End If
    Else
        SaveIDFormulario1116B = IDFormulario1116B
    End If
    
    Set recData = New ADODB.Recordset
    
    strSQLSelect = "SELECT Formulario1116B_Cabecera.IDFormulario1116B, Formulario1116B_Cabecera.FormularioNumero, Formulario1116B_Cabecera.Fecha, Formulario1116B_Cabecera.OperacionTipo, Cereal.Nombre AS Cereal, Formulario1116B_Cabecera.DepositanteRazonSocial, Formulario1116B_Cabecera.OperacionCantidad, Formulario1116B_Cabecera.CondicionOperacionPrecioTonelada" & vbCr
    
    strSQLFrom = "FROM Formulario1116B_Cabecera INNER JOIN Cereal ON Formulario1116B_Cabecera.IDCereal = Cereal.IDCereal" & vbCr
    
    '--------------------------------------------------------
    'WHERE
    '--------------------------------------------------------
    strSQLWhere = ""
    mRecordSelectionFormula = ""
    
    'PLANTA
    If cboPlanta.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.DepositarioIDEntidad = " & Left(CStr(cboPlanta.ItemData(cboPlanta.ListIndex)), Len(CStr(cboPlanta.ItemData(cboPlanta.ListIndex))) - 5) & " AND Formulario1116B_Cabecera.DepositarioIDPlanta = " & Right(CStr(cboPlanta.ItemData(cboPlanta.ListIndex)), 5)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.DepositarioIDEntidad} = " & Left(CStr(cboPlanta.ItemData(cboPlanta.ListIndex)), Len(CStr(cboPlanta.ItemData(cboPlanta.ListIndex))) - 5) & " AND {Formulario1116B_Cabecera.DepositarioIDPlanta} = " & Right(CStr(cboPlanta.ItemData(cboPlanta.ListIndex)), 5)
    End If
        
    'ENTIDAD
    If cboEntidad.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.DepositanteIDEntidad = " & cboEntidad.ItemData(cboEntidad.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.DepositanteIDEntidad} = " & cboEntidad.ItemData(cboEntidad.ListIndex)
    End If
        
    'COSECHA
    If cboCosecha.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.IDCosecha = " & cboCosecha.ItemData(cboCosecha.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.IDCosecha} = " & cboCosecha.ItemData(cboCosecha.ListIndex)
    End If
    
    'CEREAL
    If cboCereal.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.IDCereal = " & cboCereal.ItemData(cboCereal.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.IDCereal} = " & cboCereal.ItemData(cboCereal.ListIndex)
    End If
    
    'DATE FILTER
    Select Case cboFecha.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha = '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & "'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Formulario1116A_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 2  'GREATER
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha > '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} > CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 3  'GREATER OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha >= '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 4  'MINOR
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha < '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} < CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 5  'MINOR OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha <= '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 6  'NOT EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha NOT BETWEEN '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} <> CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 7  'BETWEEN
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116B_Cabecera.Fecha BETWEEN '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaHasta.Value, "yyyy/mm/dd") & " 23:59:59'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Formulario1116B_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Formulario1116B_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaHasta.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
    End Select
    
    If strSQLWhere <> "" Then
        strSQLWhere = strSQLWhere & vbCr
    End If
    
    '--------------------------------------------------------
    'OPEN
    '--------------------------------------------------------
    recData.Open strSQLSelect & strSQLFrom & strSQLWhere, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    Set tdbgrdData.DataSource = recData
    
    Call SortColumn(mOrderColumn)

    recData.Find "IDFormulario1116B = " & SaveIDFormulario1116B
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Liquidaciones."
        Case 1
            stbMain.SimpleText = "1 Liquidación."
        Case Else
            stbMain.SimpleText = RecordCount & " Liquidaciones."
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
    ShowErrorMessage "Forms.FormularioB_Lista.LoadData", "Error al leer la Lista de Liquidaciones."
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
    Dim CReports As Collection
    Dim ReportName As Variant
    
    mLoading = True
    
    cbrMain.Bands("Toolbar").MinWidth = CSM_Control_Toolbar.GetTotalWidth(tlbMain)

    CSM_Forms.ResizeAndPosition frmMDI, Me
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS ICONOS AL TOOLBAR
    Set tlbMain.ImageList = frmMDI.ilsFormToolbar
    Set tlbMain.HotImageList = frmMDI.ilsFormToolbarHot
    tlbMain.buttons("NEW").Image = "NEW"
    tlbMain.buttons("PROPERTIES").Image = "PROPERTIES"
    tlbMain.buttons("DELETE").Image = "DELETE"
    tlbMain.buttons("PRINT").Image = "PRINT"
    tlbMain.buttons("SELECT").Image = "SELECT"
    '//////////////////////////////////////////////////////////
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS REPORTES AL SUBMENU DE IMPRIMIR
    Set CReports = CSM_File.GetCollectionOfFiles(pDatabase.ReportsPath, REPORT_FILENAME_PREFIX & "*.rpt", False, True, False)
    For Each ReportName In CReports
        tlbMain.buttons("PRINT").ButtonMenus.Add , CStr(ReportName) & ".rpt", Mid(CStr(ReportName), Len(REPORT_FILENAME_PREFIX) + 1)
    Next ReportName
    
    Call CSM_Parameter_CoolBar.GetSettings(Mid(Me.Name, 4), cbrMain)
    
    Call FillComboBox_Planta
    Call FillComboBox_Entidad
    Call FillComboBox_Cosecha
    Call FillComboBox_Cereal
    
    cboFecha.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboFecha.AddItem "="
    cboFecha.AddItem ">"
    cboFecha.AddItem ">="
    cboFecha.AddItem "<"
    cboFecha.AddItem "<="
    cboFecha.AddItem "<>"
    cboFecha.AddItem "Entre"
    cboFecha.ListIndex = 7
    
    dtpFechaDesde.Value = DateAdd("d", -7, Date)
    dtpFechaDesde_Change
    dtpFechaHasta.Value = Date
        
    Call SetTrueDBGridAppearance
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4), tdbgrdData)
    
    mOrderColumn = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn(1)
    
    Call CSM_Control_TextBox.PrepareAll(Me)
    
    mLoading = False
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
        tdbgrdData_KeyDown KeyCode, Shift
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If mColumnsResized Then
        Call CSM_Parameter_TrueDBGrid.SaveSettings(Mid(Me.Name, 4), tdbgrdData)
    End If
    Call CSM_Parameter_CoolBar.SaveSettings(Mid(Me.Name, 4), cbrMain)
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Formulario1116B_Cabecera As F1116B_Cabecera
    
    Select Case Button.Key
           
        Case "NEW"
            Set Formulario1116B_Cabecera = New F1116B_Cabecera
            If frmFormularioB_Detalle.Startup(Formulario1116B_Cabecera) Then
'                If cboEntidad_Remitente.ListIndex > 0 Then
'                    frmMovimiento_Detalle.datcboEntidad_Titular.BoundText = cboEntidad_Remitente.ItemData(cboEntidad_Remitente.ListIndex)
'                End If
                frmFormularioB_Detalle.Show
                frmFormularioB_Detalle.SetFocus
            Else
                Unload frmFormularioB_Detalle
                Set frmFormularioB_Detalle = Nothing
            End If
        Case "PROPERTIES"
'            If tdbgrdData.FirstRow = "" Then
'                MsgBox "No hay ningún Formulario 1116A seleccionado para modificar.", vbExclamation, App.Title
'                tdbgrdData.SetFocus
'                Exit Sub
'            End If
'            Set Formulario1116A_Cabecera = New F1116A_Cabecera
'            Set Formulario1116A_Cabecera.Database = pDatabase
'            Formulario1116A_Cabecera.IDFormulario1116A = tdbgrdData.Columns("IDFormulario1116A").Value
'            If Formulario1116A_Cabecera.Load() Then
'                If frmFormularioA_Detalle.Startup(Formulario1116A_Cabecera) Then
'                    If frmFormularioA_Detalle.LoadData() Then
'                        frmFormularioA_Detalle.Show
'                        frmFormularioA_Detalle.SetFocus
'                    Else
'                        Unload frmFormularioA_Detalle
'                        Set frmFormularioA_Detalle = Nothing
'                    End If
'                Else
'                    Unload frmFormularioA_Detalle
'                    Set frmFormularioA_Detalle = Nothing
'                End If
'            End If
'            Set Formulario1116A_Cabecera = Nothing
        
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Liquidación seleccionada para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
        
            If MsgBox("¿Desea eliminar el Liquidación.?", vbExclamation + vbYesNo + vbDefaultButton2) = vbYes Then
                Set Formulario1116B_Cabecera = New F1116B_Cabecera
                Formulario1116B_Cabecera.IDFormulario1116B = tdbgrdData.Columns("IDFormulario1116B").Value
                Call Formulario1116B_Cabecera.Delete
                Set Formulario1116B_Cabecera = Nothing
            End If
            
        Case "PRINT"
            If tlbMain.buttons("PRINT").ButtonMenus.Count = 1 Then
                Call tlbMain_ButtonMenuClick(tlbMain.buttons("PRINT").ButtonMenus(1))
            End If
            
        Case "SELECT"
    End Select
End Sub

Private Sub tlbMain_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Dim Formulario1116B_Cabecera As F1116RT_Cabecera
    Dim Report As CSC_Report
    
    Select Case ButtonMenu.Parent.Key
        Case "PRINT"
            Select Case ButtonMenu.Key
                Case "PREDEFINED"
                Case Else   'REPORTES DE FORMULARIOS
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ninguna Liquidación seleccionada para imprimir.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                
                    Screen.MousePointer = vbHourglass
                    
                    Set Report = New CSC_Report
                    With Report
                        .ParentForm_hWnd = frmMDI.hwnd
                        .FILENAME = pDatabase.ReportsPath & ButtonMenu.Key
                        .WindowTitle = ButtonMenu.Text & " - Liquidación Nº " & tdbgrdData.Columns("FormularioNumero").Value
                        .ParameterAdd("@IDFormulario1116B", "", csrpdtNumberInteger, False, False, True).ParameterValue = tdbgrdData.Columns(0).Value
                        If .OpenReport(True) Then
                            Call .PreviewReport(False)
                        End If
                    End With
                    
                    Screen.MousePointer = vbDefault
            End Select
    End Select
End Sub

Private Sub cboPlanta_Click()
    Call LoadData(0)
End Sub

Private Sub cboEntidad_Click()
    Call LoadData(0)
End Sub

Private Sub cboCosecha_Click()
    Call LoadData(0)
End Sub

Private Sub cboCereal_Click()
    Call LoadData(0)
End Sub

Private Sub cboFecha_Click()
    txtDiaSemana.Visible = (cboFecha.ListIndex > 0 And cboFecha.ListIndex < 7)
    cmdFechaDesdeAnterior.Visible = (cboFecha.ListIndex > 0)
    dtpFechaDesde.Visible = (cboFecha.ListIndex > 0)
    cmdFechaDesdeSiguiente.Visible = (cboFecha.ListIndex > 0)
    cmdFechaDesdeHoy.Visible = (cboFecha.ListIndex > 0)
    
    lblFechaY.Visible = (cboFecha.ListIndex = 7)
    
    cmdFechaHastaAnterior.Visible = (cboFecha.ListIndex = 7)
    dtpFechaHasta.Visible = (cboFecha.ListIndex = 7)
    cmdFechaHastaSiguiente.Visible = (cboFecha.ListIndex = 7)
    cmdFechaHastaHoy.Visible = (cboFecha.ListIndex = 7)
    
    cmdFechaDesdeAnterior.Left = 1680
    dtpFechaDesde.Left = 1980
    cmdFechaDesdeSiguiente.Left = 3420
    cmdFechaDesdeHoy.Left = 3720
    
    If cboFecha.ListIndex > 0 And cboFecha.ListIndex < 7 Then
        cmdFechaDesdeAnterior.Left = cmdFechaDesdeAnterior.Left + txtDiaSemana.Width
        dtpFechaDesde.Left = dtpFechaDesde.Left + txtDiaSemana.Width
        cmdFechaDesdeSiguiente.Left = cmdFechaDesdeSiguiente.Left + txtDiaSemana.Width
        cmdFechaDesdeHoy.Left = cmdFechaDesdeHoy.Left + txtDiaSemana.Width
    End If
    
    Call LoadData(0)
End Sub

Private Sub cmdFechaDesdeAnterior_Click()
    dtpFechaDesde.Value = DateAdd("d", -1, dtpFechaDesde.Value)
    dtpFechaDesde.SetFocus
    dtpFechaDesde_Change
End Sub

Private Sub dtpFechaDesde_Change()
    txtDiaSemana.Text = WeekdayName(Weekday(dtpFechaDesde.Value))
    Call LoadData(0)
End Sub

Private Sub cmdFechaDesdeSiguiente_Click()
    dtpFechaDesde.Value = DateAdd("d", 1, dtpFechaDesde.Value)
    dtpFechaDesde.SetFocus
    dtpFechaDesde_Change
End Sub

Private Sub cmdFechaDesdeHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaDesde.Value
    dtpFechaDesde.Value = Date
    dtpFechaDesde.SetFocus
    If OldValue <> dtpFechaDesde.Value Then
        dtpFechaDesde_Change
    End If
End Sub

Private Sub cmdFechaHastaAnterior_Click()
    dtpFechaHasta.Value = DateAdd("d", -1, dtpFechaHasta.Value)
    dtpFechaHasta.SetFocus
    dtpFechaHasta_Change
End Sub

Private Sub dtpFechaHasta_Change()
    Call LoadData(0)
End Sub

Private Sub cmdFechaHastaSiguiente_Click()
    dtpFechaHasta.Value = DateAdd("d", 1, dtpFechaHasta.Value)
    dtpFechaHasta.SetFocus
    dtpFechaHasta_Change
End Sub

Private Sub cmdFechaHastaHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaHasta.Value
    dtpFechaHasta.Value = Date
    dtpFechaHasta.SetFocus
    If OldValue <> dtpFechaHasta.Value Then
        dtpFechaHasta_Change
    End If
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
    
    Call SortColumn(OldOrderColumn)
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
    'tlbMain_ButtonClick tlbMain.Buttons("PROPERTIES")
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

Public Function FillComboBox_Planta() As Boolean
    Dim SaveItemData As Long
    
    If cboPlanta.ListIndex > -1 Then
        SaveItemData = cboPlanta.ItemData(cboPlanta.ListIndex)
    Else
        SaveItemData = 0
    End If
    cboPlanta.Clear
    cboPlanta.AddItem ITEM_ALL_FEMALE
    Call CSM_Control_ComboBox.FillFromSQL(cboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL ", "ID", "Nombre", "Plantas", cscpItemOrFirstIfUnique, SaveItemData, False)
End Function

Public Function FillComboBox_Entidad() As Boolean
    Dim SaveItemData As Long
    
    If cboEntidad.ListIndex > -1 Then
        SaveItemData = cboEntidad.ItemData(cboEntidad.ListIndex)
    End If
    cboEntidad.Clear
    cboEntidad.AddItem ITEM_ALL_FEMALE
    Call CSM_Control_ComboBox.FillFromSQL(cboEntidad, "SELECT IDEntidad, Nombre FROM Entidad WHERE EsTitular = 1 AND Activo = 1 ORDER BY Nombre", "IDEntidad", "Nombre", "Entidades", cscpItemOrNone, SaveItemData, False)
End Function

Public Function FillComboBox_Cosecha() As Boolean
    Dim SaveItemData As Byte
    
    cboCosecha.Clear
    cboCosecha.AddItem ITEM_ALL_FEMALE
    
    If cboCosecha.ListIndex > -1 Then
        SaveItemData = cboCosecha.ItemData(cboCosecha.ListIndex)
    Else
        SaveItemData = pParametro.Cosecha_IDDefault
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboCosecha, "usp_Cosecha_List 0, 1, NULL", "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Cereal() As Boolean
    Dim SaveItemData As Long
    
    cboCereal.Clear
    cboCereal.AddItem ITEM_ALL_MALE
    
    If cboCereal.ListIndex > -1 Then
        SaveItemData = cboCereal.ItemData(cboCereal.ListIndex)
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboCereal, "SELECT IDCereal, Nombre FROM Cereal WHERE Activo = 1 ORDER BY Nombre", "IDCereal", "Nombre", "Cereales", cscpItemOrFirst, SaveItemData, False)
End Function
