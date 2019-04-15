VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmFormulario_Lista 
   Caption         =   "Formularios"
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
   Icon            =   "Formulario_Lista.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   5820
   ScaleWidth      =   11385
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData1116RT 
      Height          =   3255
      Left            =   5760
      TabIndex        =   26
      Top             =   1920
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDFormulario1116RT"
      Columns(0).DataField=   "IDFormulario1116RT"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Número"
      Columns(1).DataField=   "FormularioNumero"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "N° 1116A"
      Columns(2).DataField=   "Formulario1116ANumero"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Fecha"
      Columns(3).DataField=   "Fecha"
      Columns(3).NumberFormat=   "Short Date"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Entidad"
      Columns(4).DataField=   "DepositanteRazonSocial"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   4
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Anulado"
      Columns(5).DataField=   "Anulado"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   6
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=6"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=2593"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2514"
      Splits(0)._ColumnProps(12)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8708"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(16)=   "Column(2).Width=2725"
      Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=2646"
      Splits(0)._ColumnProps(19)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8708"
      Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(23)=   "Column(3).Width=3519"
      Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=3440"
      Splits(0)._ColumnProps(26)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(27)=   "Column(3)._ColStyle=8705"
      Splits(0)._ColumnProps(28)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(29)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(30)=   "Column(4).Width=2725"
      Splits(0)._ColumnProps(31)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(4)._WidthInPix=2646"
      Splits(0)._ColumnProps(33)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(34)=   "Column(4)._ColStyle=8196"
      Splits(0)._ColumnProps(35)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(36)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(37)=   "Column(5).Width=1773"
      Splits(0)._ColumnProps(38)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(5)._WidthInPix=1693"
      Splits(0)._ColumnProps(40)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(41)=   "Column(5)._ColStyle=8705"
      Splits(0)._ColumnProps(42)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(43)=   "Column(5).Order=6"
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
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=28,.parent=13,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=26,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=27,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=82,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=80,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=81,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=50,.parent=13,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=47,.parent=14"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=48,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=49,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=78,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=75,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=76,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=77,.parent=17"
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
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData1116A 
      Height          =   3255
      Left            =   240
      TabIndex        =   25
      Top             =   1920
      Width           =   5355
      _ExtentX        =   9446
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDFormulario1116A"
      Columns(0).DataField=   "IDFormulario1116A"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Número"
      Columns(1).DataField=   "FormularioNumero"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Entidad"
      Columns(2).DataField=   "DepositanteRazonSocial"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Cereal"
      Columns(3).DataField=   "Cereal"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Fecha"
      Columns(4).DataField=   "Fecha"
      Columns(4).NumberFormat=   "Short Date"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   4
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Anulado"
      Columns(5).DataField=   "Anulado"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   6
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=6"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=2778"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=2699"
      Splits(0)._ColumnProps(12)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(13)=   "Column(1)._ColStyle=8708"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(15)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(16)=   "Column(2).Width=5292"
      Splits(0)._ColumnProps(17)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(18)=   "Column(2)._WidthInPix=5212"
      Splits(0)._ColumnProps(19)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(20)=   "Column(2)._ColStyle=8708"
      Splits(0)._ColumnProps(21)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(22)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(23)=   "Column(3).Width=2725"
      Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=2646"
      Splits(0)._ColumnProps(26)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(27)=   "Column(3)._ColStyle=8708"
      Splits(0)._ColumnProps(28)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(29)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(30)=   "Column(4).Width=3519"
      Splits(0)._ColumnProps(31)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(4)._WidthInPix=3440"
      Splits(0)._ColumnProps(33)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(34)=   "Column(4)._ColStyle=8705"
      Splits(0)._ColumnProps(35)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(36)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(37)=   "Column(5).Width=1773"
      Splits(0)._ColumnProps(38)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(5)._WidthInPix=1693"
      Splits(0)._ColumnProps(40)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(41)=   "Column(5)._ColStyle=8705"
      Splits(0)._ColumnProps(42)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(43)=   "Column(5).Order=6"
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
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=90,.parent=13,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=87,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=88,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=89,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=86,.parent=13,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=83,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=84,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=85,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=82,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=80,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=81,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=78,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=75,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=76,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=77,.parent=17"
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
   Begin MSComctlLib.TabStrip tabMain 
      Height          =   3795
      Left            =   120
      TabIndex        =   24
      Top             =   1500
      Width           =   11115
      _ExtentX        =   19606
      _ExtentY        =   6694
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "1116A"
            Key             =   "1116A"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "1116RT"
            Key             =   "1116RT"
            ImageVarType    =   2
         EndProperty
      EndProperty
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
      BandCount       =   5
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
      Child2          =   "picEntidad"
      MinWidth2       =   4950
      MinHeight2      =   360
      Width2          =   4950
      FixedBackground2=   0   'False
      Key2            =   "Entidad"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picCereal"
      MinWidth3       =   4470
      MinHeight3      =   360
      Width3          =   4470
      FixedBackground3=   0   'False
      Key3            =   "Producto"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Child4          =   "picFecha"
      MinWidth4       =   6690
      MinHeight4      =   360
      Width4          =   6690
      FixedBackground4=   0   'False
      Key4            =   "Fecha"
      NewRow4         =   0   'False
      AllowVertical4  =   0   'False
      Child5          =   "picAnulado"
      MinWidth5       =   1845
      MinHeight5      =   330
      Width5          =   1845
      FixedBackground5=   0   'False
      Key5            =   "Anulado"
      NewRow5         =   0   'False
      AllowVertical5  =   0   'False
      Begin VB.PictureBox picCereal 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   6825
         ScaleHeight     =   360
         ScaleWidth      =   4470
         TabIndex        =   5
         Top             =   630
         Width           =   4470
         Begin VB.ComboBox cboCereal 
            Height          =   330
            Left            =   780
            Style           =   2  'Dropdown List
            TabIndex        =   7
            Top             =   0
            Width           =   3675
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
         ScaleWidth      =   6435
         TabIndex        =   2
         Top             =   630
         Width           =   6435
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
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   9060
         TabIndex        =   8
         Top             =   1020
         Width           =   9060
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
            Picture         =   "Formulario_Lista.frx":030A
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
            Picture         =   "Formulario_Lista.frx":0894
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
            Picture         =   "Formulario_Lista.frx":0E1E
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
            Picture         =   "Formulario_Lista.frx":0F68
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
            Picture         =   "Formulario_Lista.frx":14F2
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
            Picture         =   "Formulario_Lista.frx":1A7C
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
            Format          =   103809025
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
            Format          =   103809025
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
      Begin VB.PictureBox picAnulado 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   9450
         ScaleHeight     =   330
         ScaleWidth      =   1845
         TabIndex        =   21
         Top             =   1035
         Width           =   1845
         Begin VB.ComboBox cboAnulado 
            Height          =   330
            Left            =   780
            Style           =   2  'Dropdown List
            TabIndex        =   23
            Top             =   0
            Width           =   1095
         End
         Begin VB.Label lblAnulado 
            Caption         =   "Anulado:"
            Height          =   195
            Left            =   60
            TabIndex        =   22
            Top             =   60
            Width           =   660
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   1
         Top             =   30
         Width           =   11265
         _ExtentX        =   19870
         _ExtentY        =   1005
         ButtonWidth     =   2037
         ButtonHeight    =   1005
         ToolTips        =   0   'False
         AllowCustomize  =   0   'False
         Wrappable       =   0   'False
         Style           =   1
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   5
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Anular"
               Key             =   "ANULL"
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Eliminar"
               Key             =   "DELETE"
               ImageIndex      =   3
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Imprimir"
               Key             =   "PRINT"
               Style           =   5
               BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
                  NumButtonMenus  =   2
                  BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "FORMULARIOS"
                     Text            =   "Formularios"
                  EndProperty
                  BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "FORMULARIOS_ANULADOS"
                     Text            =   "Formularios Anulados"
                  EndProperty
               EndProperty
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Exportar"
               Key             =   "EXPORT"
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
      TabIndex        =   27
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
Attribute VB_Name = "frmFormulario_Lista"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mLoading As Boolean

Private mColumnsResized_1116A As Boolean
Private mOrderColumn_1116A As Long
Private mOrderAscending_1116A As Boolean

Private mColumnsResized_1116RT As Boolean
Private mOrderColumn_1116RT As Long
Private mOrderAscending_1116RT As Boolean

Private mRecordSelectionFormula_1116A As String
Private mRecordSelectionFormula_1116RT As String

Public Function Startup() As Boolean
    mLoading = True

    Load Me
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal IDFormulario As Long) As Boolean
    LoadData = (LoadData_1116A(IDFormulario) And LoadData_1116RT(IDFormulario))
    
    Call tabMain_Click
End Function

Private Function LoadData_1116A(ByVal IDFormulario1116A As Long) As Boolean
    Dim recData As ADODB.Recordset
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim strSQLWhere As String
    
    Dim SaveIDFormulario1116A As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDFormulario1116A = 0 Then
        If Not tdbgrdData1116A.EOF Then
            SaveIDFormulario1116A = tdbgrdData1116A.Columns("IDFormulario1116A").Value
        End If
    Else
        SaveIDFormulario1116A = IDFormulario1116A
    End If
    
    Set recData = New ADODB.Recordset
    
    strSQLSelect = "SELECT Formulario1116A_Cabecera.IDFormulario1116A, Formulario1116A_Cabecera.FormularioNumero, Formulario1116A_Cabecera.DepositanteRazonSocial, Cereal.Nombre AS Cereal, Formulario1116A_Cabecera.Fecha, Formulario1116A_Cabecera.Anulado" & vbCr
    
    strSQLFrom = "FROM Formulario1116A_Cabecera LEFT JOIN Cereal ON Formulario1116A_Cabecera.IDCereal = Cereal.IDCereal" & vbCr
    
    '--------------------------------------------------------
    'WHERE
    '--------------------------------------------------------
    strSQLWhere = ""
    mRecordSelectionFormula_1116A = ""
    
    'ENTIDAD
    If cboEntidad.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.DepositanteIDEntidad = " & cboEntidad.ItemData(cboEntidad.ListIndex)
        mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.DepositanteIDEntidad} = " & cboEntidad.ItemData(cboEntidad.ListIndex)
    End If
        
    'CEREAL
    If cboCereal.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.IDCereal = " & cboCereal.ItemData(cboCereal.ListIndex)
        mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.IDCereal} = " & cboCereal.ItemData(cboCereal.ListIndex)
    End If
    
    'DATE FILTER
    Select Case cboFecha.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Formulario1116A_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 2  'GREATER
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha > #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:00#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} > CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 3  'GREATER OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha >= #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 4  'MINOR
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha < #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} < CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 5  'MINOR OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha <= #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:00#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 6  'NOT EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha NOT BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} <> CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 7  'BETWEEN
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Fecha BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaHasta.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Formulario1116A_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaHasta.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
    End Select
    
    'ANULADO
    If cboAnulado.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.Anulado = " & IIf(cboAnulado.ListIndex = 1, "True", "False")
        mRecordSelectionFormula_1116A = mRecordSelectionFormula_1116A & IIf(mRecordSelectionFormula_1116A = "", "", " AND ") & "{Formulario1116A_Cabecera.Anulado} = " & IIf(cboAnulado.ListIndex = 1, "True", "False")
    End If
    
    If strSQLWhere <> "" Then
        strSQLWhere = strSQLWhere & vbCr
    End If
    
    '--------------------------------------------------------
    'OPEN
    '--------------------------------------------------------
    recData.Open strSQLSelect & strSQLFrom & strSQLWhere, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    '--------------------------------------------------------
    'ORDER BY
    '--------------------------------------------------------
    recData.Sort = tdbgrdData1116A.Columns(mOrderColumn_1116A - 1).DataField & IIf(mOrderAscending_1116A, " ASC", " DESC")
    
    Set tdbgrdData1116A.DataSource = recData

    recData.Find "IDFormulario1116A = " & SaveIDFormulario1116A
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            tdbgrdData1116A.Tag = "No hay Formularios 1116A."
        Case 1
            tdbgrdData1116A.Tag = "1 Formulario 1116A."
        Case Else
            tdbgrdData1116A.Tag = RecordCount & " Formularios 1116A."
    End Select

    Set recData = Nothing
    
    On Error Resume Next
    If frmMDI.ActiveForm.Name = Me.Name And GetForegroundWindow() = frmMDI.hwnd And frmMDI.WindowState <> vbMinimized Then
        tdbgrdData1116A.SetFocus
    End If
    
    Screen.MousePointer = vbDefault
    LoadData_1116A = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Forms.FormularioLista.LoadData_1116A", "Error al leer la Lista de Formularios 1116A."
    On Error Resume Next
    recData.Close
    Set recData = Nothing
End Function

Private Function LoadData_1116RT(ByVal IDFormulario1116RT As Long) As Boolean
    Dim recData As ADODB.Recordset
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim strSQLWhere As String
    
    Dim SaveIDFormulario1116RT As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDFormulario1116RT = 0 Then
        If Not tdbgrdData1116RT.EOF Then
            SaveIDFormulario1116RT = tdbgrdData1116RT.Columns("IDFormulario1116RT").Value
        End If
    Else
        SaveIDFormulario1116RT = IDFormulario1116RT
    End If
    
    Set recData = New ADODB.Recordset
    
    strSQLSelect = "SELECT Formulario1116RT_Cabecera.IDFormulario1116RT, Formulario1116RT_Cabecera.FormularioNumero, Formulario1116A_Cabecera.FormularioNumero AS Formulario1116ANumero, Formulario1116RT_Cabecera.Fecha, Formulario1116A_Cabecera.DepositanteRazonSocial, Formulario1116RT_Cabecera.Anulado" & vbCr
    
    strSQLFrom = "FROM Formulario1116RT_Cabecera LEFT JOIN Formulario1116A_Cabecera ON Formulario1116RT_Cabecera.IDFormulario1116A = Formulario1116A_Cabecera.IDFormulario1116A" & vbCr
    
    '--------------------------------------------------------
    'WHERE
    '--------------------------------------------------------
    strSQLWhere = ""
    mRecordSelectionFormula_1116RT = ""
    
    'ENTIDAD
    If cboEntidad.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.DepositanteIDEntidad = " & cboEntidad.ItemData(cboEntidad.ListIndex)
        mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116A_Cabecera.DepositanteIDEntidad} = " & cboEntidad.ItemData(cboEntidad.ListIndex)
    End If
        
    'PRODUCTO
    If cboCereal.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116A_Cabecera.IDCereal = " & cboCereal.ItemData(cboCereal.ListIndex)
        mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116A_Cabecera.IDCereal} = " & cboCereal.ItemData(cboCereal.ListIndex)
    End If
    
    'DATE FILTER
    Select Case cboFecha.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Formulario1116A_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 2  'GREATER
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha > #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} > CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 3  'GREATER OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha >= #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 4  'MINOR
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha < #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} < CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 5  'MINOR OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha <= #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 6  'NOT EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha NOT BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} <> CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 7  'BETWEEN
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Fecha BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaHasta.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Formulario1116RT_Cabecera.Fecha} <= CDateTime(" & Format(dtpFechaHasta.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
    End Select
    
    'ANULADO
    If cboAnulado.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Formulario1116RT_Cabecera.Anulado = " & IIf(cboAnulado.ListIndex = 1, "True", "False")
        mRecordSelectionFormula_1116RT = mRecordSelectionFormula_1116RT & IIf(mRecordSelectionFormula_1116RT = "", "", " AND ") & "{Formulario1116RT_Cabecera.Anulado} = " & IIf(cboAnulado.ListIndex = 1, "True", "False")
    End If
    
    If strSQLWhere <> "" Then
        strSQLWhere = strSQLWhere & vbCr
    End If
    
    '--------------------------------------------------------
    'OPEN
    '--------------------------------------------------------
    recData.Open strSQLSelect & strSQLFrom & strSQLWhere, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    '--------------------------------------------------------
    'ORDER BY
    '--------------------------------------------------------
    recData.Sort = tdbgrdData1116RT.Columns(mOrderColumn_1116RT - 1).DataField & IIf(mOrderAscending_1116RT, " ASC", " DESC")
    
    Set tdbgrdData1116RT.DataSource = recData

    recData.Find "IDFormulario1116RT = " & SaveIDFormulario1116RT
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            tdbgrdData1116RT.Tag = "No hay Formularios 1116RT."
        Case 1
            tdbgrdData1116RT.Tag = "1 Formulario 1116RT."
        Case Else
            tdbgrdData1116RT.Tag = RecordCount & " Formularios 1116RT."
    End Select

    Set recData = Nothing
    
    On Error Resume Next
    If frmMDI.ActiveForm.Name = Me.Name And GetForegroundWindow() = frmMDI.hwnd And frmMDI.WindowState <> vbMinimized Then
        tdbgrdData1116RT.SetFocus
    End If
    
    Screen.MousePointer = vbDefault
    LoadData_1116RT = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Forms.FormularioLista.LoadData_1116RT", "Error al leer la Lista de Formularios 1116RT."
    On Error Resume Next
    recData.Close
    Set recData = Nothing
End Function

Public Sub SetTrueDBGridLook()
    With tdbgrdData1116A
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
    End With
    With tdbgrdData1116RT
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
    End With
End Sub

Private Sub Form_Load()
    mLoading = True
    
    cbrMain.Bands("Toolbar").MinWidth = CSM_Control_Toolbar.GetTotalWidth(tlbMain)

    CSM_Forms.ResizeAndPosition frmMDI, Me
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS ICONOS AL TOOLBAR
    Set tlbMain.ImageList = frmMDI.ilsFormToolbar
    Set tlbMain.HotImageList = frmMDI.ilsFormToolbarHot
    ' tlbMain.Buttons("PROPERTIES").Image = "PROPERTIES"
    tlbMain.Buttons("DELETE").Image = "DELETE"
    tlbMain.Buttons("PRINT").Image = "PRINT"
    tlbMain.Buttons("EXPORT").Image = "EXPORT"
    tlbMain.Buttons("SELECT").Image = "SELECT"
    '//////////////////////////////////////////////////////////
    
    Call CSM_Parameter_CoolBar.GetSettings("FormularioLista", cbrMain)
    
    Call FillComboBoxEntidad
    
    Call FillComboBoxProducto
    
    cboFecha.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboFecha.AddItem "="
    cboFecha.AddItem ">"
    cboFecha.AddItem ">="
    cboFecha.AddItem "<"
    cboFecha.AddItem "<="
    cboFecha.AddItem "<>"
    cboFecha.AddItem "Entre"
    cboFecha.ListIndex = 1
    
    cboAnulado.AddItem "« Todos »"
    cboAnulado.AddItem "Sí"
    cboAnulado.AddItem "No"
    cboAnulado.ListIndex = 0
        
    dtpFechaDesde.Value = Date
    txtDiaSemana.Text = WeekdayName(Weekday(dtpFechaDesde.Value))
    dtpFechaHasta.Value = Date
    
    Call SetTrueDBGridLook
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4) & "\1116A", tdbgrdData1116A)
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4) & "\1116RT", tdbgrdData1116RT)
    
    mOrderColumn_1116A = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4) & "\1116A", "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending_1116A = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4) & "\1116A", "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn_1116A(1)
    
    mOrderColumn_1116RT = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4) & "\1116RT", "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending_1116RT = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4) & "\1116RT", "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn_1116RT(1)
    
    mLoading = False
    
    Call LoadData(0)
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
                tlbMain_ButtonClick tlbMain.Buttons.Item("NEW")
            Case vbKeyP
                tlbMain_ButtonClick tlbMain.Buttons.Item("PROPERTIES")
            Case vbKeyE
                tlbMain_ButtonClick tlbMain.Buttons.Item("DELETE")
            Case vbKeyS
                tlbMain_ButtonClick tlbMain.Buttons.Item("SELECT")
            Case Else
                tdbgrdData1116A_KeyDown KeyCode, Shift
        End Select
    Else
        tdbgrdData1116A_KeyDown KeyCode, Shift
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If mColumnsResized_1116A Then
        Call CSM_Parameter_TrueDBGrid.SaveSettings(Mid(Me.Name, 4) & "\1116A", tdbgrdData1116A)
    End If
    If mColumnsResized_1116RT Then
        Call CSM_Parameter_TrueDBGrid.SaveSettings(Mid(Me.Name, 4) & "\1116RT", tdbgrdData1116RT)
    End If
    Call CSM_Parameter_CoolBar.SaveSettings(Mid(Me.Name, 4), cbrMain)
End Sub

Private Sub tabMain_Click()
    tdbgrdData1116A.Visible = (tabMain.SelectedItem.Key = "1116A")
    tdbgrdData1116RT.Visible = (tabMain.SelectedItem.Key = "1116RT")
    
    stbMain.SimpleText = IIf(tabMain.SelectedItem.Key = "1116A", tdbgrdData1116A.Tag, tdbgrdData1116RT.Tag)
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Formulario1116A_Cabecera As F1116A_Cabecera
    Dim Formulario1116RT_Cabecera As F1116RT_Cabecera
    
    Dim ExportPath As String

    Select Case Button.Key
        Case "ANULL"
            If tabMain.SelectedItem.Key = "1116A" Then
                If tdbgrdData1116A.FirstRow = "" Then
                    MsgBox "No hay ningún Formulario 1116A seleccionado para anular.", vbExclamation, App.Title
                    tdbgrdData1116A.SetFocus
                    Exit Sub
                End If
                
                If MsgBox("¿Desea anular el Formulario 1116A.?" & vbCr & "Esto eliminará las referencias a las cartas de porte.", vbExclamation + vbYesNo) = vbYes Then
                    Set Formulario1116A_Cabecera = New F1116A_Cabecera
                    Set Formulario1116A_Cabecera.Database = pDatabase
                    Formulario1116A_Cabecera.IDFormulario1116A = tdbgrdData1116A.Columns("IDFormulario1116A").Value
                    If Formulario1116A_Cabecera.Load() Then
                        Formulario1116A_Cabecera.Anular
                    End If
                    Set Formulario1116A_Cabecera = Nothing
                End If
            Else
                If tdbgrdData1116RT.FirstRow = "" Then
                    MsgBox "No hay ningún Formulario 1116RT seleccionado para anular.", vbExclamation, App.Title
                    tdbgrdData1116RT.SetFocus
                    Exit Sub
                End If
            
                If MsgBox("¿Desea anular el Formulario 1116RT.?", vbExclamation + vbYesNo) = vbYes Then
                    Set Formulario1116RT_Cabecera = New F1116RT_Cabecera
                    Set Formulario1116RT_Cabecera.Database = pDatabase
                    Formulario1116RT_Cabecera.IDFormulario1116RT = tdbgrdData1116RT.Columns("IDFormulario1116RT").Value
                    If Formulario1116RT_Cabecera.Load() Then
                        Formulario1116RT_Cabecera.Anular
                    End If
                    Set Formulario1116RT_Cabecera = Nothing
                End If
            End If

            
        Case "DELETE"
            If tabMain.SelectedItem.Key = "1116A" Then
                If tdbgrdData1116A.FirstRow = "" Then
                    MsgBox "No hay ningún Formulario 1116A seleccionado para eliminar.", vbExclamation, App.Title
                    tdbgrdData1116A.SetFocus
                    Exit Sub
                End If
                
                If MsgBox("¿Desea eliminar el Formulario 1116A.?", vbExclamation + vbYesNo + vbDefaultButton2) = vbYes Then
                    Set Formulario1116A_Cabecera = New F1116A_Cabecera
                    Set Formulario1116A_Cabecera.Database = pDatabase
                    Formulario1116A_Cabecera.IDFormulario1116A = tdbgrdData1116A.Columns("IDFormulario1116A").Value
                    If Formulario1116A_Cabecera.Load() Then
                        Formulario1116A_Cabecera.Delete
                    End If
                    Set Formulario1116A_Cabecera = Nothing
                End If
            Else
                If tdbgrdData1116RT.FirstRow = "" Then
                    MsgBox "No hay ningún Formulario 1116RT seleccionado para eliminar.", vbExclamation, App.Title
                    tdbgrdData1116RT.SetFocus
                    Exit Sub
                End If
            
                If MsgBox("¿Desea anular el Formulario 1116RT.?", vbExclamation + vbYesNo + vbDefaultButton2) = vbYes Then
                    Set Formulario1116RT_Cabecera = New F1116RT_Cabecera
                    Set Formulario1116RT_Cabecera.Database = pDatabase
                    Formulario1116RT_Cabecera.IDFormulario1116RT = tdbgrdData1116RT.Columns("IDFormulario1116RT").Value
                    If Formulario1116RT_Cabecera.Load() Then
                        Formulario1116RT_Cabecera.Delete
                    End If
                    Set Formulario1116RT_Cabecera = Nothing
                End If
            End If
            
        Case "EXPORT"
            If tdbgrdData1116A.FirstRow = "" And tdbgrdData1116RT.FirstRow = "" Then
                MsgBox "No hay ningún Formulario 1116A ni 1116RT para exportar.", vbExclamation, App.Title
                If tabMain.SelectedItem.Key = "1116A" Then
                    tdbgrdData1116A.SetFocus
                Else
                    tdbgrdData1116RT.SetFocus
                End If
                Exit Sub
            End If
            
            If MsgBox("Se exportarán los Formularios a archivos de texto compatibles con el sistema Movimiento de Granos de AFIP. Cualquier archivo existente en la carpeta con el mismo nombre (ANULAFIP.txt, C1116A.txt, R1116A.txt y 1116T.txt) será sobreescrito." & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title) = vbYes Then
                ExportPath = CSM_CommonDialog.BrowseForFolder(frmMDI.hwnd, "Seleccione la carpeta de destino")
                If ExportPath <> "" Then
                    If ExportFormularios30(ExportPath) Then
                        If MsgBox("Se han exportado los Formularios a la carpeta: """ & ExportPath & """." & vbCr & vbCr & "¿Desea abrir la carpeta de destino de los archivos?", vbQuestion + vbYesNo, App.Title) = vbYes Then
                            Shell "explorer.exe """ & ExportPath & """", vbNormalFocus
                        End If
                    End If
                End If
            End If
            
            If tabMain.SelectedItem.Key = "1116A" Then
                tdbgrdData1116A.SetFocus
            Else
                tdbgrdData1116RT.SetFocus
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
                Case "FORMULARIOS", "FORMULARIOS_ANULADOS"
                    If tabMain.SelectedItem.Key = "1116A" Then
                        If tdbgrdData1116A.FirstRow = "" Then
                            MsgBox "No hay ningún Formulario 1116A seleccionado para imprimir.", vbExclamation, App.Title
                            tdbgrdData1116A.SetFocus
                            Exit Sub
                        End If
                    Else
                        If tdbgrdData1116RT.FirstRow = "" Then
                            MsgBox "No hay ningún Formulario 1116RT seleccionado para imprimir.", vbExclamation, App.Title
                            tdbgrdData1116RT.SetFocus
                            Exit Sub
                        End If
                    End If
                
                    Screen.MousePointer = vbHourglass
                    
                    Set Report = New CSC_Report
                    With Report
                        .ParentForm_hWnd = frmMDI.hwnd
                        .FileName = pReportsPath & "Formulario " & tabMain.SelectedItem.Key & IIf(ButtonMenu.Key = "FORMULARIOS", "", " Anulado") & ".rpt"
                        .WindowTitle = "Formularios " & tabMain.SelectedItem.Key & IIf(ButtonMenu.Key = "FORMULARIOS", "", " Anulados")
                        If .OpenReport() Then
                            .Report.RecordSelectionFormula = IIf(tabMain.SelectedItem.Key = "1116A", mRecordSelectionFormula_1116A, mRecordSelectionFormula_1116RT)
                            Call .PreviewReport(False)
                        End If
                    End With
                    
                    Screen.MousePointer = vbDefault
            End Select
    End Select
End Sub

Private Sub cboEntidad_Click()
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

Private Sub cboAnulado_Click()
    Call LoadData(0)
End Sub

Private Sub tdbgrdData1116A_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized_1116A = True
End Sub

Private Sub tdbgrdData1116A_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdData1116A.SelStartCol <> tdbgrdData1116A.SelEndCol Then
        tdbgrdData1116A.SelEndCol = tdbgrdData1116A.SelStartCol
    End If
    If tdbgrdData1116A.SelStartCol + 1 = mOrderColumn_1116A Then
        mOrderAscending_1116A = Not mOrderAscending_1116A
    Else
        mOrderAscending_1116A = True
    End If
    OldOrderColumn = mOrderColumn_1116A
    mOrderColumn_1116A = tdbgrdData1116A.SelStartCol + 1
    tdbgrdData1116A.SelStartCol = -1
    tdbgrdData1116A.SelEndCol = -1
    
    Call SortColumn_1116A(OldOrderColumn)
End Sub

Private Sub tdbgrdData1116A_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdData1116A.MoveFirst
        Case vbKeyEnd
            tdbgrdData1116A.MoveLast
    End Select
End Sub

Private Sub tdbgrdData1116A_DblClick()
    'tlbMain_ButtonClick tlbMain.Buttons("PROPERTIES")
End Sub

Private Sub SortColumn_1116A(ByVal OldOrderColumn As Long)
    Call LoadData_1116A(0)
    
    'ICONOS
    tdbgrdData1116A.Columns(OldOrderColumn - 1).HeadingStyle.ForegroundPicture = 0
    tdbgrdData1116A.Columns(mOrderColumn_1116A - 1).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdData1116A.Columns(mOrderColumn_1116A - 1).HeadingStyle.TransparentForegroundPicture = True
    If mOrderAscending_1116A Then
        Set tdbgrdData1116A.Columns(mOrderColumn_1116A - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdData1116A.Columns(mOrderColumn_1116A - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

Private Sub tdbgrdData1116RT_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized_1116RT = True
End Sub

Private Sub tdbgrdData1116RT_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdData1116RT.SelStartCol <> tdbgrdData1116RT.SelEndCol Then
        tdbgrdData1116RT.SelEndCol = tdbgrdData1116RT.SelStartCol
    End If
    If tdbgrdData1116RT.SelStartCol + 1 = mOrderColumn_1116RT Then
        mOrderAscending_1116RT = Not mOrderAscending_1116RT
    Else
        mOrderAscending_1116RT = True
    End If
    OldOrderColumn = mOrderColumn_1116RT
    mOrderColumn_1116RT = tdbgrdData1116RT.SelStartCol + 1
    tdbgrdData1116RT.SelStartCol = -1
    tdbgrdData1116RT.SelEndCol = -1
    
    Call SortColumn_1116RT(OldOrderColumn)
End Sub

Private Sub tdbgrdData1116RT_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdData1116RT.MoveFirst
        Case vbKeyEnd
            tdbgrdData1116RT.MoveLast
    End Select
End Sub

Private Sub tdbgrdData1116RT_DblClick()
    'tlbMain_ButtonClick tlbMain.Buttons("PROPERTIES")
End Sub

Private Sub SortColumn_1116RT(ByVal OldOrderColumn As Long)
    Call LoadData_1116RT(0)
    
    'ICONOS
    tdbgrdData1116RT.Columns(OldOrderColumn - 1).HeadingStyle.ForegroundPicture = 0
    tdbgrdData1116RT.Columns(mOrderColumn_1116RT - 1).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdData1116RT.Columns(mOrderColumn_1116RT - 1).HeadingStyle.TransparentForegroundPicture = True
    If mOrderAscending_1116RT Then
        Set tdbgrdData1116RT.Columns(mOrderColumn_1116RT - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdData1116RT.Columns(mOrderColumn_1116RT - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

Private Sub ResizeControls(ByVal CoolBarHeight As Single)
    Const CONTROL_SPACE = 30
    
    On Error Resume Next
    
    tabMain.Top = CoolBarHeight + CONTROL_SPACE
    tabMain.Left = CONTROL_SPACE
    tabMain.Height = ScaleHeight - tabMain.Top - CONTROL_SPACE - stbMain.Height
    tabMain.Width = ScaleWidth - (CONTROL_SPACE * 2)
    
    tdbgrdData1116A.Top = tabMain.ClientTop + CONTROL_SPACE
    tdbgrdData1116A.Left = tabMain.ClientLeft + CONTROL_SPACE
    tdbgrdData1116A.Height = tabMain.ClientHeight - (CONTROL_SPACE * 2)
    tdbgrdData1116A.Width = tabMain.ClientWidth - (CONTROL_SPACE * 2)
    
    tdbgrdData1116RT.Top = tabMain.ClientTop + CONTROL_SPACE
    tdbgrdData1116RT.Left = tabMain.ClientLeft + CONTROL_SPACE
    tdbgrdData1116RT.Height = tabMain.ClientHeight - (CONTROL_SPACE * 2)
    tdbgrdData1116RT.Width = tabMain.ClientWidth - (CONTROL_SPACE * 2)
End Sub

Private Sub tlbPin_ButtonClick(ByVal Button As MSComctlLib.Button)
    If Button.Value = tbrUnpressed Then
        Button.Image = 1
    Else
        Button.Image = 2
    End If
End Sub

Public Function FillComboBoxEntidad() As Boolean
    Dim SaveItemData As Long
    
    If cboEntidad.ListIndex > -1 Then
        SaveItemData = cboEntidad.ItemData(cboEntidad.ListIndex)
    End If
    cboEntidad.Clear
    cboEntidad.AddItem ITEM_ALL_FEMALE
    Call CSM_Control_ComboBox.FillFromSQL(cboEntidad, "SELECT IDEntidad, Nombre FROM Entidad WHERE EsTitular = True AND Activo = True ORDER BY Nombre", "IDEntidad", "Nombre", "Entidades", cscpItemOrNone, SaveItemData, False)
End Function

Public Function FillComboBoxProducto() As Boolean
    Dim SaveItemData As Long
    
    cboCereal.Clear
    cboCereal.AddItem ITEM_ALL_MALE
    
    If cboCereal.ListIndex > -1 Then
        SaveItemData = cboCereal.ItemData(cboCereal.ListIndex)
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboCereal, "SELECT IDCereal, Nombre FROM Cereal WHERE Activo = True ORDER BY Nombre", "IDCereal", "Nombre", "Cereales", cscpItemOrFirst, SaveItemData, False)
End Function

Private Function ExportFormularios20(ByVal ExportPath As String) As Boolean
    Dim recData_1116A As ADODB.Recordset
    Dim recData_1116RT As ADODB.Recordset
    
    Dim Formulario1116A_Cabecera As F1116A_Cabecera
    Dim Formulario1116A_Detalle As F1116A_Detalle
    Dim Formulario1116RT_Cabecera As F1116RT_Cabecera
    
    Dim FileNumber As Integer
    
    Dim Formulario1116A_Cabecera_TextStream As String
    Dim Formulario1116A_Detalle_TextStream As String
    Dim Formulario1116RT_Cabecera_TextStream As String
    Dim FormularioAnulado_TextStream As String
    
    Dim EntidadDepositaria As Entidad
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    Screen.MousePointer = vbHourglass
    
    CSF_Status.lblStatus.Caption = "Exportando Formularios..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    ExportPath = ExportPath & IIf(Right(ExportPath, 1) = "\", "", "\")
    
    '////////////////////////////////////////////////////////////
    'FORMULARIOS 1116A
    '////////////////////////////////////////////////////////////
    
    'CREO UN CLON DEL RECORDSET, Y LO ORDENO POR NUMERO DE FORMULARIO
    Set recData_1116A = tdbgrdData1116A.DataSource
    Set recData_1116A = recData_1116A.Clone
    recData_1116A.Sort = "FormularioNumero"
    recData_1116A.MoveFirst
    
    'COMIENZO A RECORRER LOS FORMULARIOS
    Do While Not recData_1116A.EOF
        
        Set Formulario1116A_Cabecera = New F1116A_Cabecera
        Formulario1116A_Cabecera.IDFormulario1116A = recData_1116A("IDFormulario1116A").Value
        If Not Formulario1116A_Cabecera.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Formulario1116A_Cabecera = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If
        
        With Formulario1116A_Cabecera
            If Formulario1116A_Cabecera.Anulado Then
                'GUARDO LOS DATOS EN EL STREAM DE ANULADOS
                FormularioAnulado_TextStream = FormularioAnulado_TextStream & "1;"      'TIPO DE FORMULARIO 1=1116A
                FormularioAnulado_TextStream = FormularioAnulado_TextStream & Val(CSM_String.CleanNotNumericChars(.FormularioNumero)) & vbCrLf
            Else
                If Not .LoadDetalles() Then
                    Unload CSF_Status
                    Set CSF_Status = Nothing
                    Set Formulario1116A_Cabecera = Nothing
                    Screen.MousePointer = vbDefault
                    Exit Function
                End If
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(CSM_String.CleanNotNumericChars(.FormularioNumero), "000000000000")
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(pParametro.EstablecimientoONCCA, "000000")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.DepositanteCUIT)
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteRazonSocial, "!" & String(30, "@"))
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & .DepositanteDomicilioTipo
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioCalle, "!" & String(35, "@"))
                If IsNumeric(.DepositanteDomicilioNumero) Then
                    Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(CDbl(.DepositanteDomicilioNumero), "00000.00")
                Else
                    Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(Val(.DepositanteDomicilioNumero), "00000.00")
                End If
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioPiso & " ", "!@@@@@")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioOficina & " ", "!@@@")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioLocalidad.IDPartido, "00000")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioCodigoPostal, "!@@@@@@@@")
                
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.Producto.ONCCAEspecieCodigo, "000")
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.Cosecha.ONCCACodigo, "!@@@@@")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000"           'ALMACENAJE DIAS LIBRES
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "0000,00"       'TARIFA DE ALMACENAJE CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"   'TARIFA DE GASTOS GENERALES CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"   'TARIFA DE ZARANDEO CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'SECADO DE %
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'SECADO A %
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "0000,00"       'TARIFA DE SECADO CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"   'TARIFA POR PUNTO DE EXCESO DE SECADO CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "0000,00"       'TARIFA OTROS CADA 100 KGS.
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.OrigenIDPartido, "00000")
                
                Set EntidadDepositaria = New Entidad
                'EntidadDepositaria.IDEntidad = pParametro.EntidadIDDepositaria
                If Not EntidadDepositaria.Load() Then
                End If
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(EntidadDepositaria.DomicilioLocalidad.IDPartido, "00000")
                Set EntidadDepositaria = Nothing
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Space(10)       'NUMERO DE ANALISIS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000"      'NUMERO DE BOLETIN
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000"      'FECHA ANALISIS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00"            'GRADO
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'FACTOR
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'CONTENIDO PROTEICO %
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000000"   'CUIT DEL LABORATORIO
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Space(40)       'RAZON SOCIAL DEL LABORATORIO
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.KilogramoBruto, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.MermaVolatilKilogramos, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.MermaZarandeoKilogramos, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.MermaSecadoKilogramos, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.PesoNeto, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.Fecha, "ddmmyyyy")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"               'IMPORTE IVA SERVICIOS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00" & vbCrLf      'TOTAL SERVICIOS
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(, "0000000000000") & vbCrLf      'NUMERO DE CAC
            End If
            
            For Each Formulario1116A_Detalle In Formulario1116A_Cabecera.CFormulario1116A_Detalle
                With Formulario1116A_Detalle
                    Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & Format(CSM_String.CleanNotNumericChars(Formulario1116A_Cabecera.FormularioNumero), "000000000000")
                    'Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & CSM_String.CleanNotNumericChars(.ComprobanteNumero)
                    Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & Format(CSM_String.CleanNotNumericChars(Formulario1116A_Cabecera.FormularioNumero), "000000000000")
                    'Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.KilogramosBrutos, "00000000.00")
                    'Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & Format(.CartaPorteFecha, "ddmmyyyy") & vbCrLf
                End With
            Next Formulario1116A_Detalle
            
            Set Formulario1116A_Detalle = Nothing
        End With
        
        Set Formulario1116A_Cabecera = Nothing
        
        recData_1116A.MoveNext
    Loop
    
    'LIMPIO LOS SALTOS DE LINEA DE MAS
    If Right(Formulario1116A_Cabecera_TextStream, 2) = vbCrLf Then
        Formulario1116A_Cabecera_TextStream = Left(Formulario1116A_Cabecera_TextStream, Len(Formulario1116A_Cabecera_TextStream) - 2)
    End If
    If Right(Formulario1116A_Detalle_TextStream, 2) = vbCrLf Then
        Formulario1116A_Detalle_TextStream = Left(Formulario1116A_Detalle_TextStream, Len(Formulario1116A_Detalle_TextStream) - 2)
    End If
    
    'ABRO EL ARCHIVO Y GRABO LOS DATOS DE LA CABECERA
    FileNumber = FreeFile()
    Open ExportPath & "C1116A.txt" For Output As #FileNumber
    Print #FileNumber, Formulario1116A_Cabecera_TextStream
    Close #FileNumber
    
    'ABRO EL ARCHIVO Y GRABO LOS DATOS DEL DETALLE
    FileNumber = FreeFile()
    Open ExportPath & "R1116A.txt" For Output As #FileNumber
    Print #FileNumber, Formulario1116A_Detalle_TextStream
    Close #FileNumber
    
    
    '////////////////////////////////////////////////////////////
    'FORMULARIOS 1116RT
    '////////////////////////////////////////////////////////////
    
    'CREO UN CLON DEL RECORDSET, Y LO ORDENO POR NUMERO DE FORMULARIO
    Set recData_1116RT = tdbgrdData1116RT.DataSource
    Set recData_1116RT = recData_1116RT.Clone
    recData_1116RT.Sort = "FormularioNumero"
    recData_1116RT.MoveFirst
    
    'COMIENZO A RECORRER LOS FORMULARIOS
    Do While Not recData_1116RT.EOF
        Set Formulario1116RT_Cabecera = New F1116RT_Cabecera
        Formulario1116RT_Cabecera.IDFormulario1116RT = recData_1116RT("IDFormulario1116RT").Value
        If Not Formulario1116RT_Cabecera.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Formulario1116RT_Cabecera = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If
        
        If Formulario1116RT_Cabecera.Anulado Then
            'GUARDO LOS DATOS EN EL STREAM DE ANULADOS
            FormularioAnulado_TextStream = FormularioAnulado_TextStream & "2;"   'TIPO DE FORMULARIO 1=1116A
            FormularioAnulado_TextStream = FormularioAnulado_TextStream & Val(CSM_String.CleanNotNumericChars(Formulario1116RT_Cabecera.FormularioNumero)) & vbCrLf
        Else
            With Formulario1116RT_Cabecera
                '*** FORMULARIO ***
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.FormularioNumero)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(CSM_String.CleanNotNumericChars(.Formulario1116A_Cabecera.FormularioNumero), "000000000000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.Fecha, "ddmmyyyy")
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(pParametro.EstablecimientoONCCA, "000000")
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.Formulario1116A_Cabecera.Producto.ONCCAEspecieCodigo, "000")
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.Formulario1116A_Cabecera.Producto.ONCCATipoGranoCodigo, "00")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.Formulario1116A_Cabecera.PesoNeto, "00000000.00")
            End With
            With Formulario1116RT_Cabecera.Formulario1116A_Cabecera
                '*** DEPOSITANTE ***
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.DepositanteCUIT)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteRazonSocial, "!" & String(30, "@"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioIDLocalidad, "00000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & .DepositanteDomicilioTipo
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioCalle, "!" & String(35, "@"))
                If IsNumeric(.DepositanteDomicilioNumero) Then
                    Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(CDbl(.DepositanteDomicilioNumero), "00000.00")
                Else
                    Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(Val(.DepositanteDomicilioNumero), "00000.00")
                End If
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioPiso & " ", "!@@@@@")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioOficina & " ", "!@@@")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioLocalidad.IDPartido, "00000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioCodigoPostal, "!@@@@@@@@")
                
                '*** RECEPTOR ***
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.DepositanteCUIT)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteRazonSocial, "!" & String(50, "@"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & .DepositanteIDCategoriaIVA
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioDireccion, "!" & String(70, "@"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioIDLocalidad, "00000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & String(10, "0")               'NUMERO DE OPERADOR EN EL ONCCA (0=PRODUCTOR)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & "1"                           'ROL DEL RECEPTOR (1=PRODUCTOR / 2=COMERCIANTE)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & "0"                           'DESCONOCIDO
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(, "0000000000000") & vbCrLf      'NUMERO DE CAC
            End With
        End If
        
        Set Formulario1116RT_Cabecera = Nothing
        
        recData_1116RT.MoveNext
    Loop
        
    'LIMPIO LOS SALTOS DE LINEA DE MAS
    If Right(Formulario1116RT_Cabecera_TextStream, 2) = vbCrLf Then
        Formulario1116RT_Cabecera_TextStream = Left(Formulario1116RT_Cabecera_TextStream, Len(Formulario1116RT_Cabecera_TextStream) - 2)
    End If
    If Right(FormularioAnulado_TextStream, 2) = vbCrLf Then
        FormularioAnulado_TextStream = Left(FormularioAnulado_TextStream, Len(FormularioAnulado_TextStream) - 2)
    End If
    
    'ABRO EL ARCHIVO Y GRABO LOS DATOS DE LA CABECERA
    FileNumber = FreeFile()
    Open ExportPath & "1116T.txt" For Output As #FileNumber
    Print #FileNumber, Formulario1116RT_Cabecera_TextStream
    Close #FileNumber
    
    'SI HAY ANULADOS, ABRO EL ARCHIVO DE ANULADOS Y GRABO LOS DATOS
    If FormularioAnulado_TextStream <> "" Then
        FileNumber = FreeFile()
        Open ExportPath & "ANULAFIP.txt" For Output As #FileNumber
        Print #FileNumber, FormularioAnulado_TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing
    
    Screen.MousePointer = vbDefault
    ExportFormularios20 = True
    Exit Function
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.FormularioLista.ExportFormularios20", "Error al exportar los datos de los Formularios.")
End Function

Private Function ExportFormularios30(ByVal ExportPath As String) As Boolean
    Dim recData_1116A As ADODB.Recordset
    Dim recData_1116RT As ADODB.Recordset
    
    Dim Formulario1116A_Cabecera As F1116A_Cabecera
    Dim Formulario1116A_Detalle As F1116A_Detalle
    Dim Formulario1116RT_Cabecera As F1116RT_Cabecera
    
    Dim FileNumber As Integer
    
    Dim Formulario1116A_Cabecera_TextStream As String
    Dim Formulario1116A_Detalle_TextStream As String
    Dim Formulario1116RT_Cabecera_TextStream As String
    Dim FormularioAnulado_TextStream As String
    
    Dim EntidadDepositaria As Entidad
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    Screen.MousePointer = vbHourglass
    
    CSF_Status.lblStatus.Caption = "Exportando Formularios..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    ExportPath = ExportPath & IIf(Right(ExportPath, 1) = "\", "", "\")
    
    '////////////////////////////////////////////////////////////
    'FORMULARIOS 1116A
    '////////////////////////////////////////////////////////////
    
    'CREO UN CLON DEL RECORDSET, Y LO ORDENO POR NUMERO DE FORMULARIO
    Set recData_1116A = tdbgrdData1116A.DataSource
    Set recData_1116A = recData_1116A.Clone
    recData_1116A.Sort = "FormularioNumero"
    recData_1116A.MoveFirst
    
    'COMIENZO A RECORRER LOS FORMULARIOS
    Do While Not recData_1116A.EOF
        
        Set Formulario1116A_Cabecera = New F1116A_Cabecera
        Formulario1116A_Cabecera.IDFormulario1116A = recData_1116A("IDFormulario1116A").Value
        If Not Formulario1116A_Cabecera.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Formulario1116A_Cabecera = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If
        
        With Formulario1116A_Cabecera
            If Formulario1116A_Cabecera.Anulado Then
                'GUARDO LOS DATOS EN EL STREAM DE ANULADOS
                
                '1 - Código de Formulario (1=1116A)
                FormularioAnulado_TextStream = FormularioAnulado_TextStream & "1"
                '2 - Nro. de Certificado a Anular
                FormularioAnulado_TextStream = FormularioAnulado_TextStream & Val(CSM_String.CleanNotNumericChars(.FormularioNumero))
                '3 - Motivo (1=ANULADO, 2=EXTRAVIADO, 3=VENCIDO)
                FormularioAnulado_TextStream = FormularioAnulado_TextStream & .AnuladoMotivo
                
                'END OF LINE
                FormularioAnulado_TextStream = FormularioAnulado_TextStream & vbCrLf
            Else
                If Not .LoadDetalles() Then
                    Unload CSF_Status
                    Set CSF_Status = Nothing
                    Set Formulario1116A_Cabecera = Nothing
                    Screen.MousePointer = vbDefault
                    Exit Function
                End If
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(CSM_String.CleanNotNumericChars(.FormularioNumero), String(12, "0"))
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(pParametro.EstablecimientoONCCA, "000000")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.DepositanteCUIT)
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteRazonSocial, "!" & String(30, "@"))
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & .DepositanteDomicilioTipo
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioCalle, "!" & String(35, "@"))
                If IsNumeric(.DepositanteDomicilioNumero) Then
                    Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(CDbl(.DepositanteDomicilioNumero), "00000.00")
                Else
                    Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(Val(.DepositanteDomicilioNumero), "00000.00")
                End If
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioPiso & " ", "!@@@@@")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioOficina & " ", "!@@@")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioLocalidad.IDLocalidad, "00000")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioLocalidad.IDPartido, "00000")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.DepositanteDomicilioCodigoPostal, "!@@@@@@@@")
                
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.Producto.ONCCAEspecieCodigo, "000")
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & .Cosecha.ONCCACodigo
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000"           'ALMACENAJE DIAS LIBRES
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "0000,00"       'TARIFA DE ALMACENAJE CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"   'TARIFA DE GASTOS GENERALES CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"   'TARIFA DE ZARANDEO CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'SECADO DE %
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'SECADO A %
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "0000,00"       'TARIFA DE SECADO CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"   'TARIFA POR PUNTO DE EXCESO DE SECADO CADA 100 KGS.
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "0000,00"       'TARIFA OTROS CADA 100 KGS.
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.OrigenIDPartido, "00000")
                
                Set EntidadDepositaria = New Entidad
                'EntidadDepositaria.IDEntidad = pParametro.EntidadIDDepositaria
                If Not EntidadDepositaria.Load() Then
                End If
                'Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(EntidadDepositaria.DomicilioLocalidad.IDPartido, "00000")
                Set EntidadDepositaria = Nothing
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Space(10)       'NUMERO DE ANALISIS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000"      'NUMERO DE BOLETIN
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000"      'FECHA ANALISIS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00"            'GRADO
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'FACTOR
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "000,00"        'CONTENIDO PROTEICO %
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000000"   'CUIT DEL LABORATORIO
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Space(40)       'RAZON SOCIAL DEL LABORATORIO
                
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.KilogramoBruto, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.MermaVolatilKilogramos, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.MermaZarandeoKilogramos, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.MermaSecadoKilogramos, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.PesoNeto, "00000000.00")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.Fecha, "ddmmyyyy")
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"               'IMPORTE IVA SERVICIOS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & "00000000,00"               'TOTAL SERVICIOS
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & Format(.Formulario1116_Talonario.CAC, "0000000000000")    'NUMERO DE CAC
                
                'END OF LINE
                Formulario1116A_Cabecera_TextStream = Formulario1116A_Cabecera_TextStream & vbCrLf
            End If
            
            For Each Formulario1116A_Detalle In Formulario1116A_Cabecera.CFormulario1116A_Detalle
                With Formulario1116A_Detalle
                    Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & Format(CSM_String.CleanNotNumericChars(Formulario1116A_Cabecera.FormularioNumero), "000000000000")
                    'Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & CSM_String.CleanNotNumericChars(.ComprobanteNumero)
                    Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & Format(CSM_String.CleanNotNumericChars(Formulario1116A_Cabecera.FormularioNumero), "000000000000")
                    'Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.KilogramosBrutos, "00000000.00")
                    'Formulario1116A_Detalle_TextStream = Formulario1116A_Detalle_TextStream & Format(.CartaPorteFecha, "ddmmyyyy") & vbCrLf
                End With
            Next Formulario1116A_Detalle
            
            Set Formulario1116A_Detalle = Nothing
        End With
        
        Set Formulario1116A_Cabecera = Nothing
        
        recData_1116A.MoveNext
    Loop
    
    'LIMPIO LOS SALTOS DE LINEA DE MAS
    If Right(Formulario1116A_Cabecera_TextStream, 2) = vbCrLf Then
        Formulario1116A_Cabecera_TextStream = Left(Formulario1116A_Cabecera_TextStream, Len(Formulario1116A_Cabecera_TextStream) - 2)
    End If
    If Right(Formulario1116A_Detalle_TextStream, 2) = vbCrLf Then
        Formulario1116A_Detalle_TextStream = Left(Formulario1116A_Detalle_TextStream, Len(Formulario1116A_Detalle_TextStream) - 2)
    End If
    
    'ABRO EL ARCHIVO Y GRABO LOS DATOS DE LA CABECERA
    FileNumber = FreeFile()
    Open ExportPath & "C1116A.txt" For Output As #FileNumber
    Print #FileNumber, Formulario1116A_Cabecera_TextStream
    Close #FileNumber
    
    'ABRO EL ARCHIVO Y GRABO LOS DATOS DEL DETALLE
    FileNumber = FreeFile()
    Open ExportPath & "R1116A.txt" For Output As #FileNumber
    Print #FileNumber, Formulario1116A_Detalle_TextStream
    Close #FileNumber
    
    
    '////////////////////////////////////////////////////////////
    'FORMULARIOS 1116RT
    '////////////////////////////////////////////////////////////
    
    'CREO UN CLON DEL RECORDSET, Y LO ORDENO POR NUMERO DE FORMULARIO
    Set recData_1116RT = tdbgrdData1116RT.DataSource
    Set recData_1116RT = recData_1116RT.Clone
    recData_1116RT.Sort = "FormularioNumero"
    recData_1116RT.MoveFirst
    
    'COMIENZO A RECORRER LOS FORMULARIOS
    Do While Not recData_1116RT.EOF
        Set Formulario1116RT_Cabecera = New F1116RT_Cabecera
        Formulario1116RT_Cabecera.IDFormulario1116RT = recData_1116RT("IDFormulario1116RT").Value
        If Not Formulario1116RT_Cabecera.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Formulario1116RT_Cabecera = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If
        
        If Formulario1116RT_Cabecera.Anulado Then
            'GUARDO LOS DATOS EN EL STREAM DE ANULADOS
        
            '1 - Código de Formulario (2=1116RT)
            FormularioAnulado_TextStream = FormularioAnulado_TextStream & "2"
            '2 - Nro. de Certificado a Anular
            FormularioAnulado_TextStream = FormularioAnulado_TextStream & Val(CSM_String.CleanNotNumericChars(Formulario1116RT_Cabecera.FormularioNumero))
            '3 - Motivo (1=ANULADO, 2=EXTRAVIADO, 3=VENCIDO)
            FormularioAnulado_TextStream = FormularioAnulado_TextStream & Formulario1116RT_Cabecera.AnuladoMotivo
            
            'END OF LINE
            FormularioAnulado_TextStream = FormularioAnulado_TextStream & vbCrLf
        
        Else
            With Formulario1116RT_Cabecera
                '*** FORMULARIO ***
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(CSM_String.CleanNotNumericChars(.FormularioNumero), String(12, "0"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(CSM_String.CleanNotNumericChars(.Formulario1116A_Cabecera.FormularioNumero), String(12, "0"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.Fecha, "ddmmyyyy")
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(pParametro.EstablecimientoONCCA, "000000")
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.Formulario1116A_Cabecera.Producto.ONCCAEspecieCodigo, "000")
                'Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.Formulario1116A_Cabecera.Producto.ONCCATipoGranoCodigo, "00")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.Formulario1116A_Cabecera.PesoNeto, "00000000.00")
            End With
            With Formulario1116RT_Cabecera.Formulario1116A_Cabecera
                '*** DEPOSITANTE ***
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.DepositanteCUIT)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteRazonSocial, "!" & String(30, "@"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioIDLocalidad, "00000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & .DepositanteDomicilioTipo
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioCalle, "!" & String(35, "@"))
                If IsNumeric(.DepositanteDomicilioNumero) Then
                    Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(CDbl(.DepositanteDomicilioNumero), "00000.00")
                Else
                    Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(Val(.DepositanteDomicilioNumero), "00000.00")
                End If
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioPiso & " ", "!@@@@@")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioOficina & " ", "!@@@")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioLocalidad.IDPartido, "00000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioCodigoPostal, "!@@@@@@@@")
                
                '*** RECEPTOR ***
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & CSM_String.CleanNotNumericChars(.DepositanteCUIT)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteRazonSocial, "!" & String(50, "@"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & .DepositanteIDCategoriaIVA
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioDireccion, "!" & String(70, "@"))
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(.DepositanteDomicilioIDLocalidad, "00000")
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & String(10, "0")               'NUMERO DE OPERADOR EN EL ONCCA (0=PRODUCTOR)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & "1"                           'ROL DEL RECEPTOR (1=PRODUCTOR / 2=COMERCIANTE)
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & "0"                           'DESCONOCIDO
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & Format(Formulario1116RT_Cabecera.Formulario1116_Talonario.CAC, String(14, "0")) 'NUMERO DE CAC
                
                'END OF LINE
                Formulario1116RT_Cabecera_TextStream = Formulario1116RT_Cabecera_TextStream & vbCrLf
            End With
        End If
        
        Set Formulario1116RT_Cabecera = Nothing
        
        recData_1116RT.MoveNext
    Loop
        
    'LIMPIO LOS SALTOS DE LINEA DE MAS
    If Right(Formulario1116RT_Cabecera_TextStream, 2) = vbCrLf Then
        Formulario1116RT_Cabecera_TextStream = Left(Formulario1116RT_Cabecera_TextStream, Len(Formulario1116RT_Cabecera_TextStream) - 2)
    End If
    If Right(FormularioAnulado_TextStream, 2) = vbCrLf Then
        FormularioAnulado_TextStream = Left(FormularioAnulado_TextStream, Len(FormularioAnulado_TextStream) - 2)
    End If
    
    'ABRO EL ARCHIVO Y GRABO LOS DATOS DE LA CABECERA
    FileNumber = FreeFile()
    Open ExportPath & "1116T.txt" For Output As #FileNumber
    Print #FileNumber, Formulario1116RT_Cabecera_TextStream
    Close #FileNumber
    
    'SI HAY ANULADOS, ABRO EL ARCHIVO DE ANULADOS Y GRABO LOS DATOS
    If FormularioAnulado_TextStream <> "" Then
        FileNumber = FreeFile()
        Open ExportPath & "ANULAFIP.txt" For Output As #FileNumber
        Print #FileNumber, FormularioAnulado_TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing
    
    Screen.MousePointer = vbDefault
    ExportFormularios30 = True
    Exit Function
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.FormularioLista.ExportFormularios30", "Error al exportar los datos de los Formularios.")
End Function
