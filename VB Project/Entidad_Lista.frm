VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmEntidad_Lista 
   Caption         =   "Entidades"
   ClientHeight    =   5820
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13080
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Entidad_Lista.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   5820
   ScaleWidth      =   13080
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3975
      Left            =   120
      TabIndex        =   0
      Top             =   1380
      Width           =   12795
      _ExtentX        =   22569
      _ExtentY        =   7011
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDEntidad"
      Columns(0).DataField=   "IDEntidad"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Nombre"
      Columns(1).DataField=   "Nombre"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "CUIT"
      Columns(2).DataField=   "CUIT"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   4
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Titular"
      Columns(3).DataField=   "EsTitular"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   4
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Intermediario"
      Columns(4).DataField=   "EsIntermediario"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   4
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Remitente Comercial"
      Columns(5).DataField=   "EsRemitenteComercial"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   4
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Corredor"
      Columns(6).DataField=   "EsCorredor"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   4
      Columns(7)._MaxComboItems=   5
      Columns(7).Caption=   "Entregador"
      Columns(7).DataField=   "EsEntregador"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   4
      Columns(8)._MaxComboItems=   5
      Columns(8).Caption=   "Destinatario"
      Columns(8).DataField=   "EsDestinatario"
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   4
      Columns(9)._MaxComboItems=   5
      Columns(9).Caption=   "Destino"
      Columns(9).DataField=   "EsDestino"
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(10)._VlistStyle=   4
      Columns(10)._MaxComboItems=   5
      Columns(10).Caption=   "Transportista"
      Columns(10).DataField=   "EsTransportista"
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(11)._VlistStyle=   4
      Columns(11)._MaxComboItems=   5
      Columns(11).Caption=   "Chofer"
      Columns(11).DataField=   "EsChofer"
      Columns(11)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(12)._VlistStyle=   4
      Columns(12)._MaxComboItems=   5
      Columns(12).Caption=   "Cliente SubProducto"
      Columns(12).DataField=   "EsClienteSubProducto"
      Columns(12)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(13)._VlistStyle=   4
      Columns(13)._MaxComboItems=   5
      Columns(13).Caption=   "Activo"
      Columns(13).DataField=   "Activo"
      Columns(13)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   14
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=14"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=8969"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=8890"
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
      Splits(0)._ColumnProps(23)=   "Column(3).Width=1482"
      Splits(0)._ColumnProps(24)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(25)=   "Column(3)._WidthInPix=1402"
      Splits(0)._ColumnProps(26)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(27)=   "Column(3)._ColStyle=8705"
      Splits(0)._ColumnProps(28)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(29)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(30)=   "Column(4).Width=1773"
      Splits(0)._ColumnProps(31)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(32)=   "Column(4)._WidthInPix=1693"
      Splits(0)._ColumnProps(33)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(34)=   "Column(4)._ColStyle=8705"
      Splits(0)._ColumnProps(35)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(36)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(37)=   "Column(5).Width=2725"
      Splits(0)._ColumnProps(38)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(39)=   "Column(5)._WidthInPix=2646"
      Splits(0)._ColumnProps(40)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(41)=   "Column(5)._ColStyle=8193"
      Splits(0)._ColumnProps(42)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(43)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(44)=   "Column(6).Width=1349"
      Splits(0)._ColumnProps(45)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(46)=   "Column(6)._WidthInPix=1270"
      Splits(0)._ColumnProps(47)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(48)=   "Column(6)._ColStyle=8705"
      Splits(0)._ColumnProps(49)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(50)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(51)=   "Column(7).Width=1535"
      Splits(0)._ColumnProps(52)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(53)=   "Column(7)._WidthInPix=1455"
      Splits(0)._ColumnProps(54)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(55)=   "Column(7)._ColStyle=8705"
      Splits(0)._ColumnProps(56)=   "Column(7).AllowFocus=0"
      Splits(0)._ColumnProps(57)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(58)=   "Column(8).Width=1773"
      Splits(0)._ColumnProps(59)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(60)=   "Column(8)._WidthInPix=1693"
      Splits(0)._ColumnProps(61)=   "Column(8)._EditAlways=0"
      Splits(0)._ColumnProps(62)=   "Column(8)._ColStyle=8193"
      Splits(0)._ColumnProps(63)=   "Column(8).AllowFocus=0"
      Splits(0)._ColumnProps(64)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(65)=   "Column(9).Width=1244"
      Splits(0)._ColumnProps(66)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(67)=   "Column(9)._WidthInPix=1164"
      Splits(0)._ColumnProps(68)=   "Column(9)._EditAlways=0"
      Splits(0)._ColumnProps(69)=   "Column(9)._ColStyle=8193"
      Splits(0)._ColumnProps(70)=   "Column(9).AllowFocus=0"
      Splits(0)._ColumnProps(71)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(72)=   "Column(10).Width=1826"
      Splits(0)._ColumnProps(73)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(74)=   "Column(10)._WidthInPix=1746"
      Splits(0)._ColumnProps(75)=   "Column(10)._EditAlways=0"
      Splits(0)._ColumnProps(76)=   "Column(10).AllowSizing=0"
      Splits(0)._ColumnProps(77)=   "Column(10)._ColStyle=8193"
      Splits(0)._ColumnProps(78)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(79)=   "Column(11).Width=1085"
      Splits(0)._ColumnProps(80)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(81)=   "Column(11)._WidthInPix=1005"
      Splits(0)._ColumnProps(82)=   "Column(11)._EditAlways=0"
      Splits(0)._ColumnProps(83)=   "Column(11)._ColStyle=8705"
      Splits(0)._ColumnProps(84)=   "Column(11).Order=12"
      Splits(0)._ColumnProps(85)=   "Column(12).Width=2725"
      Splits(0)._ColumnProps(86)=   "Column(12).DividerColor=0"
      Splits(0)._ColumnProps(87)=   "Column(12)._WidthInPix=2646"
      Splits(0)._ColumnProps(88)=   "Column(12)._EditAlways=0"
      Splits(0)._ColumnProps(89)=   "Column(12)._ColStyle=8705"
      Splits(0)._ColumnProps(90)=   "Column(12).AllowFocus=0"
      Splits(0)._ColumnProps(91)=   "Column(12).Order=13"
      Splits(0)._ColumnProps(92)=   "Column(13).Width=1032"
      Splits(0)._ColumnProps(93)=   "Column(13).DividerColor=0"
      Splits(0)._ColumnProps(94)=   "Column(13)._WidthInPix=953"
      Splits(0)._ColumnProps(95)=   "Column(13)._EditAlways=0"
      Splits(0)._ColumnProps(96)=   "Column(13)._ColStyle=8705"
      Splits(0)._ColumnProps(97)=   "Column(13).AllowFocus=0"
      Splits(0)._ColumnProps(98)=   "Column(13).Order=14"
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
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=86,.parent=13,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=83,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=84,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=85,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=82,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=80,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=81,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=78,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=75,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=76,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=77,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=54,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=51,.parent=14"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=52,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=53,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=74,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=71,.parent=14,.alignment=2"
      _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=72,.parent=15"
      _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=73,.parent=17"
      _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=70,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=67,.parent=14,.alignment=2"
      _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=68,.parent=15"
      _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=69,.parent=17"
      _StyleDefs(68)  =   "Splits(0).Columns(8).Style:id=66,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(69)  =   "Splits(0).Columns(8).HeadingStyle:id=63,.parent=14"
      _StyleDefs(70)  =   "Splits(0).Columns(8).FooterStyle:id=64,.parent=15"
      _StyleDefs(71)  =   "Splits(0).Columns(8).EditorStyle:id=65,.parent=17"
      _StyleDefs(72)  =   "Splits(0).Columns(9).Style:id=62,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(73)  =   "Splits(0).Columns(9).HeadingStyle:id=59,.parent=14"
      _StyleDefs(74)  =   "Splits(0).Columns(9).FooterStyle:id=60,.parent=15"
      _StyleDefs(75)  =   "Splits(0).Columns(9).EditorStyle:id=61,.parent=17"
      _StyleDefs(76)  =   "Splits(0).Columns(10).Style:id=58,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(77)  =   "Splits(0).Columns(10).HeadingStyle:id=55,.parent=14"
      _StyleDefs(78)  =   "Splits(0).Columns(10).FooterStyle:id=56,.parent=15"
      _StyleDefs(79)  =   "Splits(0).Columns(10).EditorStyle:id=57,.parent=17"
      _StyleDefs(80)  =   "Splits(0).Columns(11).Style:id=28,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(81)  =   "Splits(0).Columns(11).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(82)  =   "Splits(0).Columns(11).FooterStyle:id=26,.parent=15"
      _StyleDefs(83)  =   "Splits(0).Columns(11).EditorStyle:id=27,.parent=17"
      _StyleDefs(84)  =   "Splits(0).Columns(12).Style:id=90,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(85)  =   "Splits(0).Columns(12).HeadingStyle:id=87,.parent=14,.alignment=2"
      _StyleDefs(86)  =   "Splits(0).Columns(12).FooterStyle:id=88,.parent=15"
      _StyleDefs(87)  =   "Splits(0).Columns(12).EditorStyle:id=89,.parent=17"
      _StyleDefs(88)  =   "Splits(0).Columns(13).Style:id=50,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(89)  =   "Splits(0).Columns(13).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(90)  =   "Splits(0).Columns(13).FooterStyle:id=48,.parent=15"
      _StyleDefs(91)  =   "Splits(0).Columns(13).EditorStyle:id=49,.parent=17"
      _StyleDefs(92)  =   "Named:id=33:Normal"
      _StyleDefs(93)  =   ":id=33,.parent=0"
      _StyleDefs(94)  =   "Named:id=34:Heading"
      _StyleDefs(95)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(96)  =   ":id=34,.wraptext=-1"
      _StyleDefs(97)  =   "Named:id=35:Footing"
      _StyleDefs(98)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(99)  =   "Named:id=36:Selected"
      _StyleDefs(100) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(101) =   "Named:id=37:Caption"
      _StyleDefs(102) =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(103) =   "Named:id=38:HighlightRow"
      _StyleDefs(104) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(105) =   "Named:id=39:EvenRow"
      _StyleDefs(106) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(107) =   "Named:id=40:OddRow"
      _StyleDefs(108) =   ":id=40,.parent=33"
      _StyleDefs(109) =   "Named:id=41:RecordSelector"
      _StyleDefs(110) =   ":id=41,.parent=34"
      _StyleDefs(111) =   "Named:id=42:FilterBar"
      _StyleDefs(112) =   ":id=42,.parent=33"
   End
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   1110
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   13080
      _ExtentX        =   23072
      _ExtentY        =   1958
      FixedOrder      =   -1  'True
      _CBWidth        =   13080
      _CBHeight       =   1110
      _Version        =   "6.7.9782"
      Child1          =   "tlbMain"
      MinWidth1       =   5595
      MinHeight1      =   570
      Width1          =   5595
      FixedBackground1=   0   'False
      Key1            =   "Toolbar"
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "picFilterEs"
      MinWidth2       =   6420
      MinHeight2      =   690
      Width2          =   6420
      FixedBackground2=   0   'False
      Key2            =   "Es"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picFilterActivo"
      MinWidth3       =   1845
      MinHeight3      =   330
      Width3          =   1845
      FixedBackground3=   0   'False
      Key3            =   "Activo"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Begin VB.PictureBox picFilterEs 
         BorderStyle     =   0  'None
         Height          =   690
         Left            =   5850
         ScaleHeight     =   690
         ScaleWidth      =   7140
         TabIndex        =   7
         Top             =   30
         Width           =   7140
         Begin VB.CheckBox chkEsClienteSubProducto 
            Alignment       =   1  'Right Justify
            Caption         =   "Cliente SubPr.:"
            Height          =   210
            Left            =   5100
            TabIndex        =   19
            Top             =   0
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CommandButton cmdTipo_Ninguno 
            Caption         =   "Ninguno"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   190
            Left            =   5700
            TabIndex        =   18
            Top             =   495
            Width           =   735
         End
         Begin VB.CommandButton cmdTipo_Todos 
            Caption         =   "Todos"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   190
            Left            =   5700
            TabIndex        =   17
            Top             =   300
            Width           =   735
         End
         Begin VB.CheckBox chkEsTitular 
            Alignment       =   1  'Right Justify
            Caption         =   "Titular:"
            Height          =   210
            Left            =   420
            TabIndex        =   16
            Top             =   0
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsIntermediario 
            Alignment       =   1  'Right Justify
            Caption         =   "Intermediario:"
            Height          =   210
            Left            =   420
            TabIndex        =   15
            Top             =   240
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsCorredor 
            Alignment       =   1  'Right Justify
            Caption         =   "Corredor:"
            Height          =   210
            Left            =   1980
            TabIndex        =   14
            Top             =   0
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsEntregador 
            Alignment       =   1  'Right Justify
            Caption         =   "Entregador:"
            Height          =   210
            Left            =   1980
            TabIndex        =   13
            Top             =   240
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsDestinatario 
            Alignment       =   1  'Right Justify
            Caption         =   "Destinatario:"
            Height          =   210
            Left            =   1980
            TabIndex        =   12
            Top             =   480
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsTransportista 
            Alignment       =   1  'Right Justify
            Caption         =   "Transportista:"
            Height          =   210
            Left            =   3540
            TabIndex        =   11
            Top             =   240
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsDestino 
            Alignment       =   1  'Right Justify
            Caption         =   "Destino:"
            Height          =   210
            Left            =   3540
            TabIndex        =   10
            Top             =   0
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsChofer 
            Alignment       =   1  'Right Justify
            Caption         =   "Chofer:"
            Height          =   210
            Left            =   3540
            TabIndex        =   9
            Top             =   480
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox chkEsRemitenteComercial 
            Alignment       =   1  'Right Justify
            Caption         =   "Rte. Comerc.:"
            Height          =   210
            Left            =   420
            TabIndex        =   8
            Top             =   480
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.Label lblFilterEs 
            Caption         =   "Es:"
            Height          =   195
            Left            =   60
            TabIndex        =   20
            Top             =   0
            Width           =   300
         End
      End
      Begin VB.PictureBox picFilterActivo 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   165
         ScaleHeight     =   330
         ScaleWidth      =   12825
         TabIndex        =   4
         Top             =   750
         Width           =   12825
         Begin VB.ComboBox cboFilterActivo 
            Height          =   330
            Left            =   780
            Style           =   2  'Dropdown List
            TabIndex        =   5
            Top             =   0
            Width           =   1095
         End
         Begin VB.Label lblFilterActivo 
            Caption         =   "Activo:"
            Height          =   195
            Left            =   60
            TabIndex        =   6
            Top             =   60
            Width           =   660
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   2
         Top             =   90
         Width           =   5595
         _ExtentX        =   9869
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
               ImageIndex      =   1
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Propiedades"
               Key             =   "PROPERTIES"
               ImageIndex      =   2
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Eliminar"
               Key             =   "DELETE"
               ImageIndex      =   3
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Copiar"
               Key             =   "COPY"
            EndProperty
            BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Filtrar"
               Key             =   "FILTER"
               Object.ToolTipText     =   "F3"
            EndProperty
            BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Quitar Filtros"
               Key             =   "FILTER_CLEAR"
               Object.ToolTipText     =   "F4"
            EndProperty
            BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Contactos"
               Key             =   "CONTACTS"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   360
      Left            =   0
      TabIndex        =   3
      Top             =   5460
      Width           =   13080
      _ExtentX        =   23072
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
            Object.Width           =   21855
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
Attribute VB_Name = "frmEntidad_Lista"
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

Public Function LoadData(ByVal IDEntidad As Long) As Boolean
    Dim recData As ADODB.Recordset
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim strSQLWhere As String
    
    Dim strSQLWhereEs As String
    
    Dim SaveIDEntidad As Long
    
    Dim RecordCount As Long
    
    If mSkipLoadData Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDEntidad = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDEntidad = tdbgrdData.Columns("IDEntidad").Value
        End If
    Else
        SaveIDEntidad = IDEntidad
    End If
    
    Set recData = New ADODB.Recordset
    
    strSQLSelect = "SELECT IDEntidad, Nombre, CUIT, EsTitular, EsIntermediario, EsRemitenteComercial, EsCorredor, EsEntregador, EsDestinatario, EsDestino, EsTransportista, EsChofer, EsClienteSubProducto, Activo" & vbCr
    
    strSQLFrom = "FROM Entidad" & vbCr
    
    'WHERE
    strSQLWhere = ""
    strSQLWhereEs = ""
    If chkEsTitular.Value = vbUnchecked And chkEsIntermediario.Value = vbUnchecked And chkEsRemitenteComercial.Value = vbUnchecked And chkEsCorredor.Value = vbUnchecked And chkEsEntregador.Value = vbUnchecked And chkEsDestinatario.Value = vbUnchecked And chkEsDestino.Value = vbUnchecked And chkEsTransportista.Value = vbUnchecked And chkEsChofer.Value = vbUnchecked Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "1 = 0"
    ElseIf chkEsTitular.Value = vbUnchecked Or chkEsIntermediario.Value = vbUnchecked Or chkEsRemitenteComercial.Value = vbUnchecked Or chkEsCorredor.Value = vbUnchecked Or chkEsEntregador.Value = vbUnchecked Or chkEsDestinatario.Value = vbUnchecked Or chkEsDestino.Value = vbUnchecked Or chkEsTransportista.Value = vbUnchecked Or chkEsChofer.Value = vbUnchecked Then
        If chkEsTitular.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsTitular = 1"
        End If
        If chkEsIntermediario.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsIntermediario = 1"
        End If
        If chkEsRemitenteComercial.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsRemitenteComercial = 1"
        End If
        If chkEsCorredor.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsCorredor = 1"
        End If
        If chkEsEntregador.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsEntregador = 1"
        End If
        If chkEsDestinatario.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsDestinatario = 1"
        End If
        If chkEsDestino.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsDestino = 1"
        End If
        If chkEsTransportista.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsTransportista = 1"
        End If
        If chkEsChofer.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsChofer = 1"
        End If
        If chkEsClienteSubProducto.Value = vbChecked Then
            strSQLWhereEs = strSQLWhereEs & IIf(strSQLWhereEs = "", "", " OR ") & "EsClienteSubProducto = 1"
        End If
        If strSQLWhereEs = "" Then
            strSQLWhereEs = "False"
        End If
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE (", " AND (") & strSQLWhereEs & ")"
    End If
    
    If cboFilterActivo.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "Activo = " & IIf(cboFilterActivo.ListIndex = 1, "1", "0")
    End If
    
    If strSQLWhere <> "" Then
        strSQLWhere = strSQLWhere & vbCr
    End If
    
    recData.Open strSQLSelect & strSQLFrom & strSQLWhere, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    Set tdbgrdData.DataSource = recData
    
    Call SortColumn(mOrderColumn)

    recData.Find "IDEntidad = " & SaveIDEntidad
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Entidades."
        Case 1
            stbMain.SimpleText = "1 Entidad."
        Case Else
            stbMain.SimpleText = RecordCount & " Entidades."
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
    ShowErrorMessage "Forms.Entidad_Lista.LoadData", "Error al leer las Entidades."
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
    tlbMain.buttons("FILTER").Image = "FILTER"
    tlbMain.buttons("FILTER_CLEAR").Image = "FILTER_CLEAR"
    tlbMain.buttons("CONTACTS").Image = "CONTACTS"
    '//////////////////////////////////////////////////////////
    
    Call CSM_Parameter_CoolBar.GetSettings(Mid(Me.Name, 4), cbrMain)
    
    Call SetTrueDBGridAppearance
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4), tdbgrdData)
    
    mOrderColumn = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn(1)
    
    cboFilterActivo.AddItem CSM_Constant.ITEM_ALL_MALE
    cboFilterActivo.AddItem CSM_Constant.BOOLEAN_STRING_YES
    cboFilterActivo.AddItem CSM_Constant.BOOLEAN_STRING_NO
    cboFilterActivo.ListIndex = CSM_Constant.FILTER_ACTIVO_LIST_INDEX
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
    
    Set frmEntidad_Lista = Nothing
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Entidad As Entidad
    Dim recData As ADODB.Recordset

    Select Case Button.Key
        Case "NEW"
            Set Entidad = New Entidad
            If frmEntidad_Detalle.Startup(Entidad) Then
                frmEntidad_Detalle.Show
                frmEntidad_Detalle.WindowState = vbNormal
                frmEntidad_Detalle.SetFocus
            Else
                Unload frmEntidad_Detalle
                Set frmEntidad_Detalle = Nothing
            End If
            
        Case "PROPERTIES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ninguna Entidad seleccionada para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Entidad = New Entidad
            Entidad.IDEntidad = tdbgrdData.Columns("IDEntidad").Value
            If Entidad.Load() Then
                If frmEntidad_Detalle.Startup(Entidad) Then
                    If frmEntidad_Detalle.LoadData() Then
                        frmEntidad_Detalle.Show
                    Else
                        Unload frmEntidad_Detalle
                        Set frmEntidad_Detalle = Nothing
                    End If
                Else
                    Unload frmEntidad_Detalle
                    Set frmEntidad_Detalle = Nothing
                End If
            End If
            Set Entidad = Nothing
            Set frmEntidad_Detalle = Nothing
            
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ninguna Entidad seleccionada para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Entidad = New Entidad
            Entidad.IDEntidad = tdbgrdData.Columns("IDEntidad").Value
            If Entidad.Load() Then
                If MsgBox("¿Desea eliminar esta Entidad?" & vbCr & vbCr & "Nombre: " & Entidad.Nombre, vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
                    Entidad.Delete
                End If
            End If
            Set Entidad = Nothing
            tdbgrdData.SetFocus
            
        Case "COPY"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ninguna Entidad seleccionada para copiar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Entidad = New Entidad
            Entidad.IDEntidad = tdbgrdData.Columns("IDEntidad").Value
            If Entidad.Copy() Then
                If frmEntidad_Detalle.Startup(Entidad) Then
                    If frmEntidad_Detalle.LoadData() Then
                        frmEntidad_Detalle.Show
                    Else
                        Unload frmEntidad_Detalle
                        Set frmEntidad_Detalle = Nothing
                    End If
                Else
                    Unload frmEntidad_Detalle
                    Set frmEntidad_Detalle = Nothing
                End If
            End If
            Set Entidad = Nothing
            Set frmEntidad_Detalle = Nothing
            
        Case "FILTER"
            frmEntidad_Filtrar.Show vbModal, frmMDI
            With frmEntidad_Filtrar
                If .Tag = "OK" Then
                    Set recData = tdbgrdData.DataSource
                    If Not recData.BOF Then
                        recData.MoveFirst
                    End If
                    If .optNombre.Value Then
                        recData.Filter = "Nombre LIKE '*" & CSM_String.ReplaceQuote(.txtNombre.Text) & "*'"
                    Else
                        recData.Filter = "CUIT = '" & CSM_String.ReplaceQuote(.txtCUIT.Text) & "'"
                    End If
                End If
            End With
            Unload frmEntidad_Filtrar
            Set frmEntidad_Filtrar = Nothing
            
        Case "FILTER_CLEAR"
            Set recData = tdbgrdData.DataSource
            If recData.Filter <> "" Then
                recData.Filter = ""
            End If
            
        Case "CONTACTS"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ninguna Entidad seleccionada para ver sus Contactos.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Entidad = New Entidad
            Entidad.IDEntidad = tdbgrdData.Columns("IDEntidad").Value
            If Entidad.Load() Then
                If frmEntidad_Contacto.Startup(Entidad) Then
                    If frmEntidad_Contacto.LoadData(Entidad.IDEntidad, 0) Then
                        frmEntidad_Contacto.Show
                    Else
                        Unload frmEntidad_Contacto
                        Set frmEntidad_Contacto = Nothing
                    End If
                Else
                    Unload frmEntidad_Contacto
                    Set frmEntidad_Contacto = Nothing
                End If
            End If
            Set Entidad = Nothing
    End Select
End Sub

Private Sub chkEsTitular_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsIntermediario_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsRemitenteComercial_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsCorredor_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsEntregador_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsDestinatario_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsDestino_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsTransportista_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsChofer_Click()
    Call LoadData(0)
End Sub

Private Sub chkEsClienteSubProducto_Click()
    Call LoadData(0)
End Sub

Private Sub cmdTipo_Todos_Click()
    mSkipLoadData = True
    chkEsTitular.Value = vbChecked
    chkEsIntermediario.Value = vbChecked
    chkEsRemitenteComercial.Value = vbChecked
    chkEsCorredor.Value = vbChecked
    chkEsEntregador.Value = vbChecked
    chkEsDestinatario.Value = vbChecked
    chkEsDestino.Value = vbChecked
    chkEsTransportista.Value = vbChecked
    chkEsChofer.Value = vbChecked
    chkEsClienteSubProducto.Value = vbChecked
    mSkipLoadData = False
    Call LoadData(0)
    tdbgrdData.SetFocus
End Sub

Private Sub cmdTipo_Ninguno_Click()
    mSkipLoadData = True
    chkEsTitular.Value = vbUnchecked
    chkEsIntermediario.Value = vbUnchecked
    chkEsRemitenteComercial.Value = vbUnchecked
    chkEsCorredor.Value = vbUnchecked
    chkEsEntregador.Value = vbUnchecked
    chkEsDestinatario.Value = vbUnchecked
    chkEsDestino.Value = vbUnchecked
    chkEsTransportista.Value = vbUnchecked
    chkEsChofer.Value = vbUnchecked
    chkEsClienteSubProducto.Value = vbUnchecked
    mSkipLoadData = False
    Call LoadData(0)
    tdbgrdData.SetFocus
End Sub

Private Sub cboFilterActivo_Click()
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
