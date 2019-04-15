VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmContrato_Lista 
   Caption         =   "Contratos"
   ClientHeight    =   6435
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   14820
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Contrato_Lista.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   6435
   ScaleWidth      =   14820
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3255
      Left            =   180
      TabIndex        =   15
      Top             =   2400
      Width           =   14175
      _ExtentX        =   25003
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDContrato"
      Columns(0).DataField=   "IDContrato"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Número"
      Columns(1).DataField=   "Numero"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "N° Comprador"
      Columns(2).DataField=   "NumeroComprador"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Fecha"
      Columns(3).DataField=   "Fecha"
      Columns(3).NumberFormat=   "Short Date"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Cosecha"
      Columns(4).DataField=   "Cosecha"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Cereal"
      Columns(5).DataField=   "Cereal"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Comprador"
      Columns(6).DataField=   "Comprador"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).Caption=   "Kgs."
      Columns(7).DataField=   "Kilogramo"
      Columns(7).NumberFormat=   "#,###"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   0
      Columns(8)._MaxComboItems=   5
      Columns(8).Caption=   "Kgs. Entregados"
      Columns(8).DataField=   "KilogramoEntregado"
      Columns(8).NumberFormat=   "#,##0"
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   0
      Columns(9)._MaxComboItems=   5
      Columns(9).Caption=   "Pendientes de Entrega"
      Columns(9).DataField=   "KilogramoPendienteEntregar"
      Columns(9).NumberFormat=   "#,##0"
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(10)._VlistStyle=   0
      Columns(10)._MaxComboItems=   5
      Columns(10).Caption=   "Kgs. Liquidados"
      Columns(10).DataField=   "KilogramoLiquidado"
      Columns(10).NumberFormat=   "#,##0"
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(11)._VlistStyle=   0
      Columns(11)._MaxComboItems=   5
      Columns(11).Caption=   "Pendientes de Liquidar"
      Columns(11).DataField=   "KilogramoPendienteLiquidar"
      Columns(11).NumberFormat=   "#,##0"
      Columns(11)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   12
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=12"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=1349"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=1270"
      Splits(0)._ColumnProps(12)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8705"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(16)=   "Column(2).Width=2434"
      Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=2355"
      Splits(0)._ColumnProps(19)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8708"
      Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(23)=   "Column(3).Width=2117"
      Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=2037"
      Splits(0)._ColumnProps(26)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(27)=   "Column(3)._ColStyle=8705"
      Splits(0)._ColumnProps(28)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(29)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(30)=   "Column(4).Width=1931"
      Splits(0)._ColumnProps(31)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(4)._WidthInPix=1852"
      Splits(0)._ColumnProps(33)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(34)=   "Column(4)._ColStyle=8708"
      Splits(0)._ColumnProps(35)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(36)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(37)=   "Column(5).Width=1746"
      Splits(0)._ColumnProps(38)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(5)._WidthInPix=1667"
      Splits(0)._ColumnProps(40)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(41)=   "Column(5)._ColStyle=8708"
      Splits(0)._ColumnProps(42)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(43)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(44)=   "Column(6).Width=5741"
      Splits(0)._ColumnProps(45)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(46)=   "Column(6)._WidthInPix=5662"
      Splits(0)._ColumnProps(47)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(48)=   "Column(6)._ColStyle=8704"
      Splits(0)._ColumnProps(49)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(50)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(51)=   "Column(7).Width=1588"
      Splits(0)._ColumnProps(52)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(53)=   "Column(7)._WidthInPix=1508"
      Splits(0)._ColumnProps(54)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(55)=   "Column(7)._ColStyle=8706"
      Splits(0)._ColumnProps(56)=   "Column(7).AllowFocus=0"
      Splits(0)._ColumnProps(57)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(58)=   "Column(8).Width=1773"
      Splits(0)._ColumnProps(59)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(60)=   "Column(8)._WidthInPix=1693"
      Splits(0)._ColumnProps(61)=   "Column(8)._EditAlways=0"
      Splits(0)._ColumnProps(62)=   "Column(8)._ColStyle=8706"
      Splits(0)._ColumnProps(63)=   "Column(8).AllowFocus=0"
      Splits(0)._ColumnProps(64)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(65)=   "Column(9).Width=1773"
      Splits(0)._ColumnProps(66)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(67)=   "Column(9)._WidthInPix=1693"
      Splits(0)._ColumnProps(68)=   "Column(9)._EditAlways=0"
      Splits(0)._ColumnProps(69)=   "Column(9)._ColStyle=8706"
      Splits(0)._ColumnProps(70)=   "Column(9).AllowFocus=0"
      Splits(0)._ColumnProps(71)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(72)=   "Column(10).Width=1773"
      Splits(0)._ColumnProps(73)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(74)=   "Column(10)._WidthInPix=1693"
      Splits(0)._ColumnProps(75)=   "Column(10)._EditAlways=0"
      Splits(0)._ColumnProps(76)=   "Column(10)._ColStyle=8706"
      Splits(0)._ColumnProps(77)=   "Column(10).AllowFocus=0"
      Splits(0)._ColumnProps(78)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(79)=   "Column(11).Width=1773"
      Splits(0)._ColumnProps(80)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(81)=   "Column(11)._WidthInPix=1693"
      Splits(0)._ColumnProps(82)=   "Column(11)._EditAlways=0"
      Splits(0)._ColumnProps(83)=   "Column(11)._ColStyle=8706"
      Splits(0)._ColumnProps(84)=   "Column(11).AllowFocus=0"
      Splits(0)._ColumnProps(85)=   "Column(11).Order=12"
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
      HeadLines       =   2
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
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=46,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=44,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=45,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=90,.parent=13,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=87,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=88,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=89,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=82,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=80,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=81,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=28,.parent=13,.alignment=3,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=26,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=27,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=86,.parent=13,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=83,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=84,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=85,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=54,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=51,.parent=14,.alignment=2"
      _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=52,.parent=15"
      _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=53,.parent=17"
      _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=50,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=48,.parent=15"
      _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=49,.parent=17"
      _StyleDefs(68)  =   "Splits(0).Columns(8).Style:id=58,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(69)  =   "Splits(0).Columns(8).HeadingStyle:id=55,.parent=14,.alignment=2"
      _StyleDefs(70)  =   "Splits(0).Columns(8).FooterStyle:id=56,.parent=15"
      _StyleDefs(71)  =   "Splits(0).Columns(8).EditorStyle:id=57,.parent=17"
      _StyleDefs(72)  =   "Splits(0).Columns(9).Style:id=70,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(73)  =   "Splits(0).Columns(9).HeadingStyle:id=67,.parent=14,.alignment=2"
      _StyleDefs(74)  =   "Splits(0).Columns(9).FooterStyle:id=68,.parent=15"
      _StyleDefs(75)  =   "Splits(0).Columns(9).EditorStyle:id=69,.parent=17"
      _StyleDefs(76)  =   "Splits(0).Columns(10).Style:id=62,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(77)  =   "Splits(0).Columns(10).HeadingStyle:id=59,.parent=14,.alignment=2"
      _StyleDefs(78)  =   "Splits(0).Columns(10).FooterStyle:id=60,.parent=15"
      _StyleDefs(79)  =   "Splits(0).Columns(10).EditorStyle:id=61,.parent=17"
      _StyleDefs(80)  =   "Splits(0).Columns(11).Style:id=66,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(81)  =   "Splits(0).Columns(11).HeadingStyle:id=63,.parent=14,.alignment=2"
      _StyleDefs(82)  =   "Splits(0).Columns(11).FooterStyle:id=64,.parent=15"
      _StyleDefs(83)  =   "Splits(0).Columns(11).EditorStyle:id=65,.parent=17"
      _StyleDefs(84)  =   "Named:id=33:Normal"
      _StyleDefs(85)  =   ":id=33,.parent=0"
      _StyleDefs(86)  =   "Named:id=34:Heading"
      _StyleDefs(87)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(88)  =   ":id=34,.wraptext=-1"
      _StyleDefs(89)  =   "Named:id=35:Footing"
      _StyleDefs(90)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(91)  =   "Named:id=36:Selected"
      _StyleDefs(92)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(93)  =   "Named:id=37:Caption"
      _StyleDefs(94)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(95)  =   "Named:id=38:HighlightRow"
      _StyleDefs(96)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(97)  =   "Named:id=39:EvenRow"
      _StyleDefs(98)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(99)  =   "Named:id=40:OddRow"
      _StyleDefs(100) =   ":id=40,.parent=33"
      _StyleDefs(101) =   "Named:id=41:RecordSelector"
      _StyleDefs(102) =   ":id=41,.parent=34"
      _StyleDefs(103) =   "Named:id=42:FilterBar"
      _StyleDefs(104) =   ":id=42,.parent=33"
   End
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   1410
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   14820
      _ExtentX        =   26141
      _ExtentY        =   2487
      BandCount       =   7
      FixedOrder      =   -1  'True
      _CBWidth        =   14820
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
      Child2          =   "picContratoNumero"
      MinWidth2       =   5235
      MinHeight2      =   360
      Width2          =   5235
      FixedBackground2=   0   'False
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picCosecha"
      MinWidth3       =   3030
      MinHeight3      =   360
      Width3          =   3030
      FixedBackground3=   0   'False
      Key3            =   "Cosecha"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Child4          =   "picCereal"
      MinWidth4       =   3090
      MinHeight4      =   360
      Width4          =   3090
      FixedBackground4=   0   'False
      Key4            =   "Cereal"
      NewRow4         =   0   'False
      AllowVertical4  =   0   'False
      Child5          =   "picFecha"
      MinWidth5       =   6690
      MinHeight5      =   360
      Width5          =   6690
      FixedBackground5=   0   'False
      Key5            =   "Fecha"
      NewRow5         =   0   'False
      AllowVertical5  =   0   'False
      Child6          =   "picComprador"
      MinWidth6       =   4935
      MinHeight6      =   360
      Width6          =   4935
      FixedBackground6=   0   'False
      Key6            =   "Comprador"
      NewRow6         =   0   'False
      AllowVertical6  =   0   'False
      Child7          =   "picCerrado"
      MinWidth7       =   1845
      MinHeight7      =   330
      Width7          =   1845
      FixedBackground7=   0   'False
      Key7            =   "Cerrado"
      NewRow7         =   0   'False
      AllowVertical7  =   0   'False
      Begin VB.PictureBox picContratoNumero 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   9495
         ScaleHeight     =   360
         ScaleWidth      =   5235
         TabIndex        =   29
         Top             =   135
         Width           =   5235
         Begin VB.TextBox txtContratoNumero_Hasta 
            Height          =   315
            Left            =   3900
            MaxLength       =   20
            TabIndex        =   32
            Tag             =   "STRING|EMPTY|NONE|20"
            Top             =   0
            Width           =   1335
         End
         Begin VB.ComboBox cboContratoNumero 
            Height          =   330
            Left            =   1020
            Style           =   2  'Dropdown List
            TabIndex        =   31
            Top             =   0
            Width           =   1215
         End
         Begin VB.TextBox txtContratoNumero_Desde 
            Height          =   315
            Left            =   2280
            MaxLength       =   20
            TabIndex        =   30
            Tag             =   "STRING|EMPTY|NONE|20"
            Top             =   0
            Width           =   1335
         End
         Begin VB.Label lblContratoNumero 
            AutoSize        =   -1  'True
            Caption         =   "Contrato N°:"
            Height          =   210
            Left            =   60
            TabIndex        =   34
            Top             =   60
            Width           =   870
         End
         Begin VB.Label lblContratoNumero_Y 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   3720
            TabIndex        =   33
            Top             =   60
            Width           =   90
         End
      End
      Begin VB.PictureBox picCerrado 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   12885
         ScaleHeight     =   330
         ScaleWidth      =   1845
         TabIndex        =   26
         Top             =   1035
         Width           =   1845
         Begin VB.ComboBox cboCerrado 
            Height          =   330
            Left            =   780
            Style           =   2  'Dropdown List
            TabIndex        =   27
            Top             =   0
            Width           =   1095
         End
         Begin VB.Label lblCerrado 
            Caption         =   "Cerrado:"
            Height          =   195
            Left            =   60
            TabIndex        =   28
            Top             =   60
            Width           =   660
         End
      End
      Begin VB.PictureBox picComprador 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   12495
         TabIndex        =   23
         Top             =   1020
         Width           =   12495
         Begin VB.ComboBox cboComprador 
            Height          =   330
            Left            =   1020
            Style           =   2  'Dropdown List
            TabIndex        =   24
            Top             =   0
            Width           =   3915
         End
         Begin VB.Label lblComprador 
            AutoSize        =   -1  'True
            Caption         =   "Comprador:"
            Height          =   210
            Left            =   0
            TabIndex        =   25
            Top             =   60
            Width           =   840
         End
      End
      Begin VB.PictureBox picCereal 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   3420
         ScaleHeight     =   360
         ScaleWidth      =   3090
         TabIndex        =   20
         Top             =   630
         Width           =   3090
         Begin VB.ComboBox cboCereal 
            Height          =   330
            Left            =   660
            Style           =   2  'Dropdown List
            TabIndex        =   21
            Top             =   0
            Width           =   2415
         End
         Begin VB.Label lblCereal 
            AutoSize        =   -1  'True
            Caption         =   "Cereal:"
            Height          =   210
            Left            =   0
            TabIndex        =   22
            Top             =   60
            Width           =   510
         End
      End
      Begin VB.PictureBox picCosecha 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   3030
         TabIndex        =   17
         Top             =   630
         Width           =   3030
         Begin VB.ComboBox cboCosecha 
            Height          =   330
            Left            =   840
            Style           =   2  'Dropdown List
            TabIndex        =   18
            Top             =   0
            Width           =   2175
         End
         Begin VB.Label lblCosecha 
            AutoSize        =   -1  'True
            Caption         =   "Cosecha:"
            Height          =   210
            Left            =   0
            TabIndex        =   19
            Top             =   60
            Width           =   690
         End
      End
      Begin VB.PictureBox picFecha 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   6735
         ScaleHeight     =   360
         ScaleWidth      =   7995
         TabIndex        =   2
         Top             =   630
         Width           =   7995
         Begin VB.ComboBox cboFecha 
            Height          =   330
            Left            =   600
            Style           =   2  'Dropdown List
            TabIndex        =   4
            Top             =   0
            Width           =   1035
         End
         Begin VB.CommandButton cmdFechaDesdeAnterior 
            Height          =   315
            Left            =   1680
            Picture         =   "Contrato_Lista.frx":08CA
            Style           =   1  'Graphical
            TabIndex        =   5
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaDesdeSiguiente 
            Height          =   315
            Left            =   3420
            Picture         =   "Contrato_Lista.frx":0E54
            Style           =   1  'Graphical
            TabIndex        =   8
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaDesdeHoy 
            Height          =   315
            Left            =   3720
            Picture         =   "Contrato_Lista.frx":13DE
            Style           =   1  'Graphical
            TabIndex        =   9
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.CommandButton cmdFechaHastaAnterior 
            Height          =   315
            Left            =   4320
            Picture         =   "Contrato_Lista.frx":1528
            Style           =   1  'Graphical
            TabIndex        =   11
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaHastaSiguiente 
            Height          =   315
            Left            =   6060
            Picture         =   "Contrato_Lista.frx":1AB2
            Style           =   1  'Graphical
            TabIndex        =   13
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaHastaHoy 
            Height          =   315
            Left            =   6360
            Picture         =   "Contrato_Lista.frx":203C
            Style           =   1  'Graphical
            TabIndex        =   14
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
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   0
            Visible         =   0   'False
            Width           =   1050
         End
         Begin MSComCtl2.DTPicker dtpFechaDesde 
            Height          =   315
            Left            =   1980
            TabIndex        =   7
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
            Format          =   74252289
            CurrentDate     =   36950
         End
         Begin MSComCtl2.DTPicker dtpFechaHasta 
            Height          =   315
            Left            =   4620
            TabIndex        =   12
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
            Format          =   74252289
            CurrentDate     =   36950
         End
         Begin VB.Label lblFecha 
            AutoSize        =   -1  'True
            Caption         =   "Fecha:"
            Height          =   210
            Left            =   0
            TabIndex        =   3
            Top             =   60
            Width           =   495
         End
         Begin VB.Label lblFechaY 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   4140
            TabIndex        =   10
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
         Width           =   9240
         _ExtentX        =   16298
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
               Caption         =   "&Nuevo"
               Key             =   "NEW"
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Propiedades"
               Key             =   "PROPERTIES"
               BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
                  NumButtonMenus  =   1
                  BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  EndProperty
               EndProperty
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Eliminar"
               Key             =   "DELETE"
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Copiar"
               Key             =   "COPY"
            EndProperty
            BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Liquidaciones"
               Key             =   "LIQUIDACIONES"
            EndProperty
            BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Imprimir"
               Key             =   "PRINT"
               Style           =   5
            EndProperty
            BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
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
      TabIndex        =   16
      Top             =   6075
      Width           =   14820
      _ExtentX        =   26141
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
Attribute VB_Name = "frmContrato_Lista"
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
Private mSQLWhere As String

Private Const REPORT_FILENAME_PREFIX As String = "Contrato - "

Public Function Startup() As Boolean
    mLoading = True

    Load Me
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal IDContrato As Long) As Boolean
    Dim recData As ADODB.Recordset
    Dim SQLSelect As String
    Dim SQLFrom As String
    Dim SQLGroupBy As String
    
    Dim SaveIDContrato As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDContrato = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDContrato = tdbgrdData.Columns("IDContrato").Value
        End If
    Else
        SaveIDContrato = IDContrato
    End If
    
    Set recData = New ADODB.Recordset
    
    SQLSelect = "SELECT Contrato.IDContrato, Contrato.Numero, Contrato.NumeroComprador, Contrato.Fecha, Cosecha.Nombre AS Cosecha, Cereal.Nombre AS Cereal, Comprador.Nombre AS Comprador, Contrato.Kilogramo, ISNULL(SUM(Movimiento_Cereal.PesoNeto), 0) AS KilogramoEntregado, Contrato.Kilogramo - ISNULL(SUM(Movimiento_Cereal.PesoNeto), 0) AS KilogramoPendienteEntregar, ISNULL(SUM(ContratoLiquidacion.Kilogramo), 0) AS KilogramoLiquidado, Contrato.Kilogramo - ISNULL(SUM(ContratoLiquidacion.Kilogramo), 0) AS KilogramoPendienteLiquidar" & vbCr
    SQLFrom = "FROM ((((Contrato INNER JOIN Cosecha ON Contrato.IDCosecha = Cosecha.IDCosecha) INNER JOIN Cereal ON Contrato.IDCereal = Cereal.IDCereal) INNER JOIN Entidad AS Comprador ON Contrato.IDEntidad_Comprador = Comprador.IDEntidad) LEFT JOIN Movimiento_Cereal ON Contrato.IDContrato = Movimiento_Cereal.IDContrato) LEFT JOIN ContratoLiquidacion ON Contrato.IDContrato = ContratoLiquidacion.IDContrato" & vbCr
    SQLGroupBy = "GROUP BY Contrato.IDContrato, Contrato.Numero, Contrato.NumeroComprador, Contrato.Fecha, Cosecha.Nombre, Cereal.Nombre, Comprador.Nombre, Contrato.Kilogramo" & vbCr
    
    '--------------------------------------------------------
    'WHERE
    '--------------------------------------------------------
    mSQLWhere = ""
    mRecordSelectionFormula = ""
    
    'NUMERO DE CONTRATO
    Select Case cboContratoNumero.ListIndex
        Case 0  'ALL
        Case 1 To 6
            If Len(Trim(txtContratoNumero_Desde.Text)) > 0 Then
                mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Numero " & cboContratoNumero.Text & " '" & CSM_String.ReplaceQuote(txtContratoNumero_Desde.Text) & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Numero} " & cboContratoNumero.Text & " '" & CSM_String.ReplaceQuote(txtContratoNumero_Desde.Text) & "'"
            End If
        Case 7  'BETWEEN
            If Len(Trim(txtContratoNumero_Desde.Text)) > 0 And Len(Trim(txtContratoNumero_Hasta.Text)) > 0 Then
                mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Numero BETWEEN '" & CSM_String.ReplaceQuote(txtContratoNumero_Desde.Text) & "' AND '" & CSM_String.ReplaceQuote(txtContratoNumero_Hasta.Text) & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Numero} >= '" & CSM_String.ReplaceQuote(txtContratoNumero_Desde.Text) & "' AND {Contrato.Numero} <= '" & CSM_String.ReplaceQuote(txtContratoNumero_Hasta.Text) & "'"
            End If
    End Select
        
    'COSECHA
    If cboCosecha.ListIndex > 0 Then
        mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.IDCosecha = " & cboCosecha.ItemData(cboCosecha.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.IDCosecha} = " & cboCosecha.ItemData(cboCosecha.ListIndex)
    End If
    
    'CEREAL
    If cboCereal.ListIndex > 0 Then
        mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.IDCereal = " & cboCereal.ItemData(cboCereal.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.IDCereal} = " & cboCereal.ItemData(cboCereal.ListIndex)
    End If
    
    'DATE FILTER
    Select Case cboFecha.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha = '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & "'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Contrato.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 2  'GREATER
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha > '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} > CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 3  'GREATER OR EQUAL
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha >= '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 4  'MINOR
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha < '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} < CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 5  'MINOR OR EQUAL
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha <= '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 6  'NOT EQUAL
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha NOT BETWEEN '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} <> CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 7  'BETWEEN
            mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Fecha BETWEEN '" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaHasta.Value, "yyyy/mm/dd") & " 23:59:59'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Contrato.Fecha} <= CDateTime(" & Format(dtpFechaHasta.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
    End Select
        
    'COMPRADOR
    If cboComprador.ListIndex > 0 Then
        mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.IDEntidad_Comprador = " & cboComprador.ItemData(cboComprador.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Contrato.IDEntidad_Comprador} = " & cboComprador.ItemData(cboComprador.ListIndex)
    End If
    
    'CERRADO
    If cboCerrado.ListIndex > 0 Then
        mSQLWhere = mSQLWhere & IIf(mSQLWhere = "", "WHERE ", " AND ") & "Contrato.Cerrado = " & IIf(cboCerrado.ListIndex = 1, "1", "0")
    End If
        
    If mSQLWhere <> "" Then
        mSQLWhere = mSQLWhere & vbCr
    End If
    
    '--------------------------------------------------------
    'OPEN
    '--------------------------------------------------------
    recData.Open SQLSelect & SQLFrom & mSQLWhere & SQLGroupBy, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    Set tdbgrdData.DataSource = recData
    
    Call SortColumn(mOrderColumn)

    recData.Find "IDContrato = " & SaveIDContrato
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Contratos."
        Case 1
            stbMain.SimpleText = "1 Contrato."
        Case Else
            stbMain.SimpleText = RecordCount & " Contratos."
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
    ShowErrorMessage "Forms.Contrato_Lista.LoadData", "Error al leer la Lista de Contratos."
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
    tlbMain.buttons("COPY").Image = "COPY"
    tlbMain.buttons("LIQUIDACIONES").Image = "FORMULARIOS"
    tlbMain.buttons("PRINT").Image = "PRINT"
    tlbMain.buttons("SELECT").Image = "SELECT"
    '//////////////////////////////////////////////////////////
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS REPORTES AL SUBMENU DE IMPRIMIR
    Set CReports = CSM_File.GetCollectionOfFiles(pDatabase.ReportsPath, REPORT_FILENAME_PREFIX & "*.rpt", False, True, False)
    For Each ReportName In CReports
        If Left(Right(CStr(ReportName), 4), 1) = "@" Then
            tlbMain.buttons("PRINT").ButtonMenus.Add , CStr(ReportName), Mid(CStr(ReportName), Len(REPORT_FILENAME_PREFIX) + 1, Len(CStr(ReportName)) - Len(REPORT_FILENAME_PREFIX) - 5)
        Else
            tlbMain.buttons("PRINT").ButtonMenus.Add , CStr(ReportName), Mid(CStr(ReportName), Len(REPORT_FILENAME_PREFIX) + 1)
        End If
    Next ReportName
    
    Call CSM_Parameter_CoolBar.GetSettings(Mid(Me.Name, 4), cbrMain)
    
    Call FillComboBox_Comprador
    Call FillComboBox_Cosecha
    Call FillComboBox_Cereal
    
    cboContratoNumero.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboContratoNumero.AddItem "="
    cboContratoNumero.AddItem ">"
    cboContratoNumero.AddItem ">="
    cboContratoNumero.AddItem "<"
    cboContratoNumero.AddItem "<="
    cboContratoNumero.AddItem "<>"
    cboContratoNumero.AddItem "Entre"
    cboContratoNumero.ListIndex = 0
    
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
    
    cboCerrado.AddItem CSM_Constant.ITEM_ALL_MALE
    cboCerrado.AddItem CSM_Constant.BOOLEAN_STRING_YES
    cboCerrado.AddItem CSM_Constant.BOOLEAN_STRING_NO
    cboCerrado.ListIndex = 2
    
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
    Dim Contrato As Contrato

    Select Case Button.Key
        Case "NEW"
            Set Contrato = New Contrato
            If frmContrato_Detalle.Startup(Contrato) Then
                frmContrato_Detalle.Show
                frmContrato_Detalle.SetFocus
            Else
                Unload frmContrato_Detalle
                Set frmContrato_Detalle = Nothing
            End If
            
        Case "PROPERTIES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Contrato seleccionado para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            Set Contrato = New Contrato
            Contrato.IDContrato = tdbgrdData.Columns("IDContrato").Value
            If Contrato.Load() Then
                If frmContrato_Detalle.Startup(Contrato) Then
                    If frmContrato_Detalle.LoadData() Then
                        frmContrato_Detalle.Show
                        frmContrato_Detalle.SetFocus
                    Else
                        Unload frmContrato_Detalle
                        Set frmContrato_Detalle = Nothing
                    End If
                Else
                    Unload frmContrato_Detalle
                    Set frmContrato_Detalle = Nothing
                End If
            End If
            Set Contrato = Nothing

        Case "COPY"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Contrato seleccionado para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            Set Contrato = New Contrato
            Contrato.IDContrato = tdbgrdData.Columns("IDContrato").Value
            If Contrato.Copy() Then
                If frmContrato_Detalle.Startup(Contrato) Then
                    If frmContrato_Detalle.LoadData() Then
                        frmContrato_Detalle.Show
                        frmContrato_Detalle.SetFocus
                    Else
                        Unload frmContrato_Detalle
                        Set frmContrato_Detalle = Nothing
                    End If
                Else
                    Unload frmContrato_Detalle
                    Set frmContrato_Detalle = Nothing
                End If
            End If
            Set Contrato = Nothing
            
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Contrato seleccionado para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            
            If MsgBox("¿Desea eliminar el Contrato?", vbExclamation + vbYesNo + vbDefaultButton2) = vbYes Then
                Set Contrato = New Contrato
                Contrato.IDContrato = tdbgrdData.Columns("IDContrato").Value
                Call Contrato.Delete
                Set Contrato = Nothing
            End If
            
        Case "LIQUIDACIONES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Contrato seleccionado para ver sus Liquidaciones.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Contrato = New Contrato
            Contrato.IDContrato = tdbgrdData.Columns("IDContrato").Value
            If Contrato.Load() Then
                If frmContrato_Liquidacion.Startup(Contrato) Then
                    If frmContrato_Liquidacion.LoadData(Contrato.IDContrato, 0) Then
                        frmContrato_Liquidacion.Show
                    Else
                        Unload frmContrato_Liquidacion
                        Set frmContrato_Liquidacion = Nothing
                    End If
                Else
                    Unload frmContrato_Liquidacion
                    Set frmContrato_Liquidacion = Nothing
                End If
            End If
            Set Contrato = Nothing
            
        Case "PRINT"
            If tlbMain.buttons("PRINT").ButtonMenus.Count = 1 Then
                Call tlbMain_ButtonMenuClick(tlbMain.buttons("PRINT").ButtonMenus(1))
            End If
            
        Case "SELECT"
    End Select
End Sub

Private Sub tlbMain_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Dim Report As CSC_Report
    
    Select Case ButtonMenu.Parent.Key
        Case "TASKS"
            Select Case ButtonMenu.Key
                Case ""
            End Select
            
        Case "PRINT"
            Select Case ButtonMenu.Key
                Case "PREDEFINED"
                Case Else   'REPORTES
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ningún Contrato seleccionado para imprimir.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                
                    Screen.MousePointer = vbHourglass
                    
                    Set Report = New CSC_Report
                    With Report
                        .ParentForm_hWnd = frmMDI.hwnd
                        .FileName = pDatabase.ReportsPath & ButtonMenu.Key & "." & REPORT_FILE_EXTENSION
                        .WindowTitle = ButtonMenu.Text & " - Contrato Nº " & tdbgrdData.Columns("Numero").Value
                        If Right(ButtonMenu.Key, 4) = REPORT_PARAMETER_KEY Then
                            .ParameterAdd("@IDContrato", "", csrpdtNumberInteger, False, False, True).ParameterValue = tdbgrdData.Columns(0).Value
                        End If
                        If .OpenReport(True) Then
                            If Right(ButtonMenu.Key, 4) = REPORT_PARAMETER_SELECTION Then
                                .Report.RecordSelectionFormula = .Report.RecordSelectionFormula & mRecordSelectionFormula
                            End If
                            Call .PreviewReport(False)
                        End If
                    End With
                    
                    Screen.MousePointer = vbDefault
            End Select
    End Select
End Sub

'============================================================
'CONTRATO NUMERO
Private Sub cboContratoNumero_Click()
    txtContratoNumero_Desde.Visible = (cboContratoNumero.ListIndex > 0)
    lblContratoNumero_Y.Visible = (cboContratoNumero.ListIndex = 7)
    txtContratoNumero_Hasta.Visible = (cboContratoNumero.ListIndex = 7)
    
    Call LoadData(0)
End Sub

'============================================================
'CARTA PORTE NUMERO DESDE
Private Sub txtContratoNumero_Desde_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtContratoNumero_Desde)
End Sub

Private Sub txtContratoNumero_Desde_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtContratoNumero_Desde_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtContratoNumero_Desde
End Sub

'============================================================
'CARTA PORTE NUMERO HASTA
Private Sub txtContratoNumero_Hasta_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtContratoNumero_Hasta)
End Sub

Private Sub txtContratoNumero_Hasta_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtContratoNumero_Hasta_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtContratoNumero_Hasta
End Sub

Private Sub cboComprador_Click()
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

Private Sub cboCerrado_Click()
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

Public Function FillComboBox_Comprador() As Boolean
    Dim SaveItemData As Long
    
    If cboComprador.ListIndex > -1 Then
        SaveItemData = cboComprador.ItemData(cboComprador.ListIndex)
    End If
    cboComprador.Clear
    cboComprador.AddItem ITEM_ALL_FEMALE
    Call CSM_Control_ComboBox.FillFromSQL(cboComprador, "usp_Entidad_Destinatario_List 0, 1, NULL", "IDEntidad", "Nombre", "Entidades", cscpItemOrNone, SaveItemData, False)
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

