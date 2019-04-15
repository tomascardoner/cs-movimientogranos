VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmLibroMovimientoLista 
   Caption         =   "Libro de Movimientos"
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
   Icon            =   "LibroMovimientoLista.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   5820
   ScaleWidth      =   13080
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3255
      Left            =   240
      TabIndex        =   24
      Top             =   1920
      Width           =   10875
      _ExtentX        =   19182
      _ExtentY        =   5741
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "Rúbrica"
      Columns(0).DataField=   "Rubrica"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Producto"
      Columns(1).DataField=   "Producto"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Folio"
      Columns(2).DataField=   "Folio"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Linea"
      Columns(3).DataField=   "Linea"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Fecha"
      Columns(4).DataField=   "Fecha"
      Columns(4).NumberFormat=   "Short Date"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Tipo"
      Columns(5).DataField=   "ComprobanteTipo"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Número"
      Columns(6).DataField=   "ComprobanteNumero"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).Caption=   "CUIT"
      Columns(7).DataField=   "CUIT"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   0
      Columns(8)._MaxComboItems=   5
      Columns(8).Caption=   "Remite / Destino"
      Columns(8).DataField=   "RemitenteDestinatario"
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   0
      Columns(9)._MaxComboItems=   5
      Columns(9).Caption=   "Ingreso Kgs. Brutos"
      Columns(9).DataField=   "IngresoKilogramoBruto"
      Columns(9).NumberFormat=   "#,##0"
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(10)._VlistStyle=   0
      Columns(10)._MaxComboItems=   5
      Columns(10).Caption=   "Ingreso Kgs. Netos"
      Columns(10).DataField=   "IngresoKilogramoNeto"
      Columns(10).NumberFormat=   "#,##0"
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(11)._VlistStyle=   0
      Columns(11)._MaxComboItems=   5
      Columns(11).Caption=   "Egreso Kgs. Netos"
      Columns(11).DataField=   "EgresoKilogramoNeto"
      Columns(11).NumberFormat=   "#,##0"
      Columns(11)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(12)._VlistStyle=   0
      Columns(12)._MaxComboItems=   5
      Columns(12).Caption=   "Saldo Kgs. Netos"
      Columns(12).DataField=   "SaldoKilogramoNeto"
      Columns(12).NumberFormat=   "#,##0"
      Columns(12)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   13
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=13"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=1588"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=1508"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8706"
      Splits(0)._ColumnProps(6)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(7)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(8)=   "Column(1).Width=2646"
      Splits(0)._ColumnProps(9)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(10)=   "Column(1)._WidthInPix=2566"
      Splits(0)._ColumnProps(11)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(12)=   "Column(1)._ColStyle=8708"
      Splits(0)._ColumnProps(13)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(14)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(15)=   "Column(2).Width=1058"
      Splits(0)._ColumnProps(16)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(17)=   "Column(2)._WidthInPix=979"
      Splits(0)._ColumnProps(18)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(19)=   "Column(2)._ColStyle=8705"
      Splits(0)._ColumnProps(20)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(21)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(22)=   "Column(3).Width=1773"
      Splits(0)._ColumnProps(23)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(24)=   "Column(3)._WidthInPix=1693"
      Splits(0)._ColumnProps(25)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(26)=   "Column(3)._ColStyle=8705"
      Splits(0)._ColumnProps(27)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(28)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(29)=   "Column(4).Width=2117"
      Splits(0)._ColumnProps(30)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(31)=   "Column(4)._WidthInPix=2037"
      Splits(0)._ColumnProps(32)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(33)=   "Column(4)._ColStyle=8705"
      Splits(0)._ColumnProps(34)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(35)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(36)=   "Column(5).Width=873"
      Splits(0)._ColumnProps(37)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(38)=   "Column(5)._WidthInPix=794"
      Splits(0)._ColumnProps(39)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(40)=   "Column(5)._ColStyle=8705"
      Splits(0)._ColumnProps(41)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(42)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(43)=   "Column(6).Width=2117"
      Splits(0)._ColumnProps(44)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(45)=   "Column(6)._WidthInPix=2037"
      Splits(0)._ColumnProps(46)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(47)=   "Column(6)._ColStyle=8704"
      Splits(0)._ColumnProps(48)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(49)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(50)=   "Column(7).Width=2117"
      Splits(0)._ColumnProps(51)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(52)=   "Column(7)._WidthInPix=2037"
      Splits(0)._ColumnProps(53)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(54)=   "Column(7)._ColStyle=8704"
      Splits(0)._ColumnProps(55)=   "Column(7).AllowFocus=0"
      Splits(0)._ColumnProps(56)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(57)=   "Column(8).Width=5292"
      Splits(0)._ColumnProps(58)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(59)=   "Column(8)._WidthInPix=5212"
      Splits(0)._ColumnProps(60)=   "Column(8)._EditAlways=0"
      Splits(0)._ColumnProps(61)=   "Column(8)._ColStyle=8704"
      Splits(0)._ColumnProps(62)=   "Column(8).AllowFocus=0"
      Splits(0)._ColumnProps(63)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(64)=   "Column(9).Width=1773"
      Splits(0)._ColumnProps(65)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(66)=   "Column(9)._WidthInPix=1693"
      Splits(0)._ColumnProps(67)=   "Column(9)._EditAlways=0"
      Splits(0)._ColumnProps(68)=   "Column(9)._ColStyle=8706"
      Splits(0)._ColumnProps(69)=   "Column(9).AllowFocus=0"
      Splits(0)._ColumnProps(70)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(71)=   "Column(10).Width=2646"
      Splits(0)._ColumnProps(72)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(73)=   "Column(10)._WidthInPix=2566"
      Splits(0)._ColumnProps(74)=   "Column(10)._EditAlways=0"
      Splits(0)._ColumnProps(75)=   "Column(10)._ColStyle=8706"
      Splits(0)._ColumnProps(76)=   "Column(10).AllowFocus=0"
      Splits(0)._ColumnProps(77)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(78)=   "Column(11).Width=2646"
      Splits(0)._ColumnProps(79)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(80)=   "Column(11)._WidthInPix=2566"
      Splits(0)._ColumnProps(81)=   "Column(11)._EditAlways=0"
      Splits(0)._ColumnProps(82)=   "Column(11)._ColStyle=8706"
      Splits(0)._ColumnProps(83)=   "Column(11).AllowFocus=0"
      Splits(0)._ColumnProps(84)=   "Column(11).Order=12"
      Splits(0)._ColumnProps(85)=   "Column(12).Width=2646"
      Splits(0)._ColumnProps(86)=   "Column(12).DividerColor=0"
      Splits(0)._ColumnProps(87)=   "Column(12)._WidthInPix=2566"
      Splits(0)._ColumnProps(88)=   "Column(12)._EditAlways=0"
      Splits(0)._ColumnProps(89)=   "Column(12)._ColStyle=8706"
      Splits(0)._ColumnProps(90)=   "Column(12).AllowFocus=0"
      Splits(0)._ColumnProps(91)=   "Column(12).Order=13"
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
      _StyleDefs(36)  =   "Splits(0).Columns(0).Style:id=46,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(37)  =   "Splits(0).Columns(0).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(38)  =   "Splits(0).Columns(0).FooterStyle:id=44,.parent=15"
      _StyleDefs(39)  =   "Splits(0).Columns(0).EditorStyle:id=45,.parent=17"
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=90,.parent=13,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=87,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=88,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=89,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=82,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=80,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=81,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=78,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=75,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=76,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=77,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=28,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=26,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=27,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=32,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=29,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=30,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=31,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=50,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=48,.parent=15"
      _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=49,.parent=17"
      _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=54,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=51,.parent=14,.alignment=2"
      _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=52,.parent=15"
      _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=53,.parent=17"
      _StyleDefs(68)  =   "Splits(0).Columns(8).Style:id=58,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(69)  =   "Splits(0).Columns(8).HeadingStyle:id=55,.parent=14,.alignment=2"
      _StyleDefs(70)  =   "Splits(0).Columns(8).FooterStyle:id=56,.parent=15"
      _StyleDefs(71)  =   "Splits(0).Columns(8).EditorStyle:id=57,.parent=17"
      _StyleDefs(72)  =   "Splits(0).Columns(9).Style:id=62,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(73)  =   "Splits(0).Columns(9).HeadingStyle:id=59,.parent=14,.alignment=2"
      _StyleDefs(74)  =   "Splits(0).Columns(9).FooterStyle:id=60,.parent=15"
      _StyleDefs(75)  =   "Splits(0).Columns(9).EditorStyle:id=61,.parent=17"
      _StyleDefs(76)  =   "Splits(0).Columns(10).Style:id=66,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(77)  =   "Splits(0).Columns(10).HeadingStyle:id=63,.parent=14,.alignment=2"
      _StyleDefs(78)  =   "Splits(0).Columns(10).FooterStyle:id=64,.parent=15"
      _StyleDefs(79)  =   "Splits(0).Columns(10).EditorStyle:id=65,.parent=17"
      _StyleDefs(80)  =   "Splits(0).Columns(11).Style:id=70,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(81)  =   "Splits(0).Columns(11).HeadingStyle:id=67,.parent=14,.alignment=2"
      _StyleDefs(82)  =   "Splits(0).Columns(11).FooterStyle:id=68,.parent=15"
      _StyleDefs(83)  =   "Splits(0).Columns(11).EditorStyle:id=69,.parent=17"
      _StyleDefs(84)  =   "Splits(0).Columns(12).Style:id=74,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(85)  =   "Splits(0).Columns(12).HeadingStyle:id=71,.parent=14,.alignment=2"
      _StyleDefs(86)  =   "Splits(0).Columns(12).FooterStyle:id=72,.parent=15"
      _StyleDefs(87)  =   "Splits(0).Columns(12).EditorStyle:id=73,.parent=17"
      _StyleDefs(88)  =   "Named:id=33:Normal"
      _StyleDefs(89)  =   ":id=33,.parent=0"
      _StyleDefs(90)  =   "Named:id=34:Heading"
      _StyleDefs(91)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(92)  =   ":id=34,.wraptext=-1"
      _StyleDefs(93)  =   "Named:id=35:Footing"
      _StyleDefs(94)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(95)  =   "Named:id=36:Selected"
      _StyleDefs(96)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(97)  =   "Named:id=37:Caption"
      _StyleDefs(98)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(99)  =   "Named:id=38:HighlightRow"
      _StyleDefs(100) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(101) =   "Named:id=39:EvenRow"
      _StyleDefs(102) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(103) =   "Named:id=40:OddRow"
      _StyleDefs(104) =   ":id=40,.parent=33"
      _StyleDefs(105) =   "Named:id=41:RecordSelector"
      _StyleDefs(106) =   ":id=41,.parent=34"
      _StyleDefs(107) =   "Named:id=42:FilterBar"
      _StyleDefs(108) =   ":id=42,.parent=33"
   End
   Begin MSComctlLib.Toolbar tlbPin 
      Height          =   330
      Left            =   60
      TabIndex        =   25
      Top             =   5460
      Width           =   360
      _ExtentX        =   635
      _ExtentY        =   582
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Style           =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   1
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PIN"
            ImageIndex      =   1
            Style           =   1
         EndProperty
      EndProperty
   End
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   990
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   13080
      _ExtentX        =   23072
      _ExtentY        =   1746
      BandCount       =   4
      FixedOrder      =   -1  'True
      _CBWidth        =   13080
      _CBHeight       =   990
      _Version        =   "6.7.9782"
      Child1          =   "tlbMain"
      MinWidth1       =   4305
      MinHeight1      =   540
      Width1          =   4305
      FixedBackground1=   0   'False
      Key1            =   "Toolbar"
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "picFecha"
      MinWidth2       =   6690
      MinHeight2      =   360
      Width2          =   6690
      FixedBackground2=   0   'False
      Key2            =   "Fecha"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picRubrica"
      MinWidth3       =   2985
      MinHeight3      =   360
      Width3          =   2985
      FixedBackground3=   0   'False
      Key3            =   "Rubrica"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Child4          =   "picFolio"
      MinWidth4       =   3480
      MinHeight4      =   360
      Width4          =   3480
      FixedBackground4=   0   'False
      Key4            =   "Folio"
      NewRow4         =   0   'False
      AllowVertical4  =   0   'False
      Begin VB.PictureBox picFolio 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   3375
         ScaleHeight     =   360
         ScaleWidth      =   9615
         TabIndex        =   18
         Top             =   600
         Width           =   9615
         Begin VB.ComboBox cboFolio 
            Height          =   330
            Left            =   600
            Style           =   2  'Dropdown List
            TabIndex        =   20
            Top             =   0
            Width           =   1035
         End
         Begin VB.ComboBox cboFolioDesde 
            Height          =   330
            Left            =   1680
            Style           =   2  'Dropdown List
            TabIndex        =   21
            Top             =   0
            Width           =   735
         End
         Begin VB.ComboBox cboFolioHasta 
            Height          =   330
            Left            =   2700
            Style           =   2  'Dropdown List
            TabIndex        =   23
            Top             =   0
            Width           =   735
         End
         Begin VB.Label lblFolio 
            AutoSize        =   -1  'True
            Caption         =   "Folio:"
            Height          =   210
            Left            =   0
            TabIndex        =   19
            Top             =   60
            Width           =   375
         End
         Begin VB.Label lblFolioY 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   2520
            TabIndex        =   22
            Top             =   60
            Visible         =   0   'False
            Width           =   90
         End
      End
      Begin VB.PictureBox picRubrica 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   2985
         TabIndex        =   15
         Top             =   600
         Width           =   2985
         Begin VB.ComboBox cboRubrica 
            Height          =   330
            Left            =   720
            Style           =   2  'Dropdown List
            TabIndex        =   17
            Top             =   0
            Width           =   2235
         End
         Begin VB.Label lblRubrica 
            AutoSize        =   -1  'True
            Caption         =   "Rúbrica:"
            Height          =   210
            Left            =   0
            TabIndex        =   16
            Top             =   60
            Width           =   600
         End
      End
      Begin VB.PictureBox picFecha 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   4560
         ScaleHeight     =   360
         ScaleWidth      =   8430
         TabIndex        =   2
         Top             =   120
         Width           =   8430
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
            Picture         =   "LibroMovimientoLista.frx":062A
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
            Picture         =   "LibroMovimientoLista.frx":0BB4
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
            Picture         =   "LibroMovimientoLista.frx":113E
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
            Picture         =   "LibroMovimientoLista.frx":1288
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
            Picture         =   "LibroMovimientoLista.frx":1812
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
            Picture         =   "LibroMovimientoLista.frx":1D9C
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
            Format          =   105381889
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
            Format          =   105381889
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
         Height          =   540
         Left            =   30
         TabIndex        =   1
         Top             =   30
         Width           =   4305
         _ExtentX        =   7594
         _ExtentY        =   953
         ButtonWidth     =   1799
         ButtonHeight    =   953
         ToolTips        =   0   'False
         AllowCustomize  =   0   'False
         Wrappable       =   0   'False
         Style           =   1
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   4
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Eliminar"
               Key             =   "DELETE"
               ImageIndex      =   3
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Imprimir"
               Key             =   "PRINT"
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Tareas"
               Key             =   "TASKS"
               Style           =   5
               BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
                  NumButtonMenus  =   1
                  BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "GENERATE_MOVIMIENTO"
                     Text            =   "Generar Movimientos"
                  EndProperty
               EndProperty
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
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
      TabIndex        =   26
      Top             =   5460
      Width           =   13080
      _ExtentX        =   23072
      _ExtentY        =   635
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
Attribute VB_Name = "frmLibroMovimientoLista"
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

Public Function Startup() As Boolean
    mLoading = True

    Load Me
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal Rubrica As Long, ByVal Folio As Integer, ByVal Linea As Byte) As Boolean
    Dim recData As ADODB.Recordset
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim strSQLWhere As String
    
    Dim SaveRubrica As Long
    Dim SaveFolio As Integer
    Dim SaveLinea As Byte
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If Rubrica = 0 Then
        If Not tdbgrdData.EOF Then
            SaveRubrica = tdbgrdData.Columns("Rubrica").Value
            SaveFolio = tdbgrdData.Columns("Folio").Value
            SaveLinea = tdbgrdData.Columns("Linea").Value
        End If
    Else
        SaveRubrica = Rubrica
        SaveFolio = Folio
        SaveLinea = Linea
    End If
    
    Set recData = New ADODB.Recordset
    
    strSQLSelect = "SELECT LibroMovimiento_Detalle.Rubrica, Producto.Nombre AS Producto, LibroMovimiento_Detalle.Folio, LibroMovimiento_Detalle.Linea, LibroMovimiento_Detalle.Fecha, LibroMovimiento_Detalle.ComprobanteTipo, LibroMovimiento_Detalle.ComprobanteNumero, LibroMovimiento_Detalle.CUIT, LibroMovimiento_Detalle.RemitenteDestinatario, LibroMovimiento_Detalle.IngresoKilogramoBruto, LibroMovimiento_Detalle.IngresoKilogramoNeto, LibroMovimiento_Detalle.EgresoKilogramoNeto, LibroMovimiento_Detalle.SaldoKilogramoNeto, LibroMovimiento_Detalle.Observacion" & vbCr
    
    strSQLFrom = "FROM (LibroMovimiento_Cabecera INNER JOIN LibroMovimiento_Detalle ON LibroMovimiento_Cabecera.Rubrica = LibroMovimiento_Detalle.Rubrica) INNER JOIN Producto ON LibroMovimiento_Cabecera.IDProductoTipo = Producto.IDProductoTipo AND LibroMovimiento_Cabecera.IDProducto = Producto.IDProducto" & vbCr
    
    '--------------------------------------------------------
    'WHERE
    '--------------------------------------------------------
    strSQLWhere = ""
    mRecordSelectionFormula = ""
    
    'DATE FILTER
    Select Case cboFecha.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {LibroMovimiento_Detalle.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 2  'GREATER
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha > #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:00#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} > CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 3  'GREATER OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha >= #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 4  'MINOR
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha < #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} < CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 5  'MINOR OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha <= #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:00#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} <= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 6  'NOT EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha NOT BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} <> CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 7  'BETWEEN
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Fecha BETWEEN #" & Format(dtpFechaDesde.Value, "yyyy/mm/dd") & " 00:00:00# AND #" & Format(dtpFechaHasta.Value, "yyyy/mm/dd") & " 23:59:59#"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Fecha} >= CDateTime(" & Format(dtpFechaDesde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {LibroMovimiento_Detalle.Fecha} <= CDateTime(" & Format(dtpFechaHasta.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
    End Select
    
    'RUBRICA
    If cboRubrica.ListIndex > 0 Then
        strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Cabecera.Rubrica = " & cboRubrica.ItemData(cboRubrica.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Cabecera.Rubrica} = " & cboRubrica.ItemData(cboRubrica.ListIndex)
    End If
    
    'FOLIO FILTER
    Select Case cboFolio.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio = " & cboFolioDesde.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} = " & cboFolioDesde.ListIndex + 1
        Case 2  'GREATER
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio > " & cboFolioDesde.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} > " & cboFolioDesde.ListIndex + 1
        Case 3  'GREATER OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio >= " & cboFolioDesde.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} >= " & cboFolioDesde.ListIndex + 1
        Case 4  'MINOR
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio < " & cboFolioDesde.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} < " & cboFolioDesde.ListIndex + 1
        Case 5  'MINOR OR EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio <= " & cboFolioDesde.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} <= " & cboFolioDesde.ListIndex + 1
        Case 6  'NOT EQUAL
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio <> " & cboFolioDesde.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} <> " & cboFolioDesde.ListIndex + 1
        Case 7  'BETWEEN
            strSQLWhere = strSQLWhere & IIf(strSQLWhere = "", "WHERE ", " AND ") & "LibroMovimiento_Detalle.Folio BETWEEN " & cboFolioDesde.ListIndex + 1 & " AND " & cboFolioHasta.ListIndex + 1
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{LibroMovimiento_Detalle.Folio} >= " & cboFolioDesde.ListIndex + 1 & " AND {LibroMovimiento_Detalle.Folio} <= " & cboFolioHasta.ListIndex + 1
    End Select
    
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
    recData.Sort = tdbgrdData.Columns(mOrderColumn - 1).DataField & IIf(mOrderAscending, " ASC", " DESC")
    
    Set tdbgrdData.DataSource = recData

    'recData.Find "Rubrica = " & SaveRubrica & " AND Folio = " & SaveFolio & " AND Linea = " & SaveLinea
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.Panels("TEXT").Text = "No hay Movimientos."
        Case 1
            stbMain.Panels("TEXT").Text = "1 Movimiento."
        Case Else
            stbMain.Panels("TEXT").Text = RecordCount & " Movimientos."
    End Select

    Set recData = Nothing
    
    On Error Resume Next
    If frmMDI.ActiveForm.Name = Me.Name And GetForegroundWindow() = frmMDI.hWnd And frmMDI.WindowState <> vbMinimized Then
        tdbgrdData.SetFocus
    End If
    
    Screen.MousePointer = vbDefault
    LoadData = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Forms.LibroMovimientoLista.LoadData", "Error al leer la Lista de Movimientos."
    On Error Resume Next
    recData.Close
    Set recData = Nothing
End Function

Public Sub SetTrueDBGridColors()
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
    Dim Index As Long
    
    mLoading = True
    
    cbrMain.Bands("Toolbar").MinWidth = CSM_Control_Toolbar.GetTotalWidth(tlbMain)
    
    CSM_Forms.ResizeAndPosition frmMDI, Me
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS ICONOS AL TOOLBAR
    Set tlbMain.ImageList = frmMDI.ilsFormToolbar
    Set tlbMain.HotImageList = frmMDI.ilsFormToolbarHot
    tlbMain.Buttons("DELETE").Image = "DELETE"
    tlbMain.Buttons("PRINT").Image = "PRINT"
    tlbMain.Buttons("TASKS").Image = "TASKS"
    tlbMain.Buttons("SELECT").Image = "SELECT"
    '//////////////////////////////////////////////////////////
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS ICONOS AL PIN
    Set tlbPin.ImageList = frmMDI.ilsFormPin
    '//////////////////////////////////////////////////////////
    
    Call CSM_Parameter_CoolBar.GetSettings("LibroMovimientoLista", cbrMain)
    
    cboFecha.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboFecha.AddItem "="
    cboFecha.AddItem ">"
    cboFecha.AddItem ">="
    cboFecha.AddItem "<"
    cboFecha.AddItem "<="
    cboFecha.AddItem "<>"
    cboFecha.AddItem "Entre"
    cboFecha.ListIndex = 1
    
    dtpFechaDesde.Value = Date
    txtDiaSemana.Text = WeekdayName(Weekday(dtpFechaDesde.Value))
    dtpFechaHasta.Value = Date
    
    Call FillComboBoxRubrica
    
    cboFolio.AddItem CSM_Constant.ITEM_ALL_MALE
    cboFolio.AddItem "="
    cboFolio.AddItem ">"
    cboFolio.AddItem ">="
    cboFolio.AddItem "<"
    cboFolio.AddItem "<="
    cboFolio.AddItem "<>"
    cboFolio.AddItem "Entre"
    cboFolio.ListIndex = 0
    For Index = 1 To pParametro.LibroMovimientoFolios
        cboFolioDesde.AddItem Index
        cboFolioHasta.AddItem Index
    Next Index
    cboFolioDesde.ListIndex = 0
    cboFolioHasta.ListIndex = 0
    
    Call SetTrueDBGridColors
    Call CSM_Parameter_TrueDBGrid.GetSettings("LibroMovimientoLista", tdbgrdData)
    
    mOrderColumn = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\LibroMovimientoLista", "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\LibroMovimientoLista", "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn(1)
    
    If tlbPin.Buttons("PIN").Value = tbrUnpressed Then
        tlbPin.Buttons("PIN").Image = 1
    Else
        tlbPin.Buttons("PIN").Image = 2
    End If
    
    mLoading = False
    
    Call LoadData(0, 0, 0)
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
                tdbgrdData_KeyDown KeyCode, Shift
        End Select
    Else
        tdbgrdData_KeyDown KeyCode, Shift
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If mColumnsResized Then
        Call CSM_Parameter_TrueDBGrid.SaveSettings("LibroMovimientoLista", tdbgrdData)
    End If
    Call CSM_Parameter_CoolBar.SaveSettings("LibroMovimientoLista", cbrMain)
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim LibroMovimiento_Detalle As LibroMovimiento_Detalle
    Dim Report As CSC_Report
    
    Dim ExportPath As String

    Select Case Button.Key
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento seleccionado para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
                
            If MsgBox("¿Desea eliminar el Movimiento?", vbExclamation + vbYesNo + vbDefaultButton2) = vbYes Then
                Set LibroMovimiento_Detalle = New LibroMovimiento_Detalle
                Set LibroMovimiento_Detalle.Database = pDatabase
                LibroMovimiento_Detalle.Rubrica = tdbgrdData.Columns("Rubrica").Value
                LibroMovimiento_Detalle.Folio = tdbgrdData.Columns("Folio").Value
                LibroMovimiento_Detalle.Linea = tdbgrdData.Columns("Linea").Value
                If LibroMovimiento_Detalle.Load() Then
                    LibroMovimiento_Detalle.Delete
                End If
                Set LibroMovimiento_Detalle = Nothing
            End If
        Case "PRINT"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento para imprimir.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
                    
            Screen.MousePointer = vbHourglass
            
            Set Report = New CSC_Report
            With Report
                .ParentForm_hWnd = frmMDI.hWnd
                .Filename = pReportsPath & "Libro Movimientos.rpt"
                .WindowTitle = "Libro de Movimientos"
                If .OpenReport() Then
                    .Report.RecordSelectionFormula = mRecordSelectionFormula
                    Call .PreviewReport(False)
                End If
            End With
            
            Screen.MousePointer = vbDefault
        Case "SELECT"
    End Select
End Sub

Private Sub tlbMain_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Select Case ButtonMenu.Parent.Key
        Case "TASKS"
            Select Case ButtonMenu.Key
                Case "GENERATE_MOVIMIENTO"
RESHOW:
                    frmGenerarLibroMovimiento.Show vbModal, frmMDI
                    If frmGenerarLibroMovimiento.Tag = "OK" Then
                        If MsgBox("¿Desea crear los Movimientos del Libro?", vbQuestion + vbYesNo, App.Title) = vbYes Then
                            If Not GenerarLibroMovimientos(frmGenerarLibroMovimiento.cboRubrica.ItemData(frmGenerarLibroMovimiento.cboRubrica.ListIndex), frmGenerarLibroMovimiento.cboPeriodoMes.ListIndex + 1, Val(frmGenerarLibroMovimiento.cboPeriodoAnio.Text)) Then
                                GoTo RESHOW
                            End If
                        End If
                    End If
                    Unload frmGenerarLibroMovimiento
                    Set frmGenerarLibroMovimiento = Nothing
                    
                    tdbgrdData.SetFocus
            End Select
    End Select
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
    
    Call LoadData(0, 0, 0)
End Sub

Private Sub cmdFechaDesdeAnterior_Click()
    dtpFechaDesde.Value = DateAdd("d", -1, dtpFechaDesde.Value)
    dtpFechaDesde.SetFocus
    dtpFechaDesde_Change
End Sub

Private Sub dtpFechaDesde_Change()
    txtDiaSemana.Text = WeekdayName(Weekday(dtpFechaDesde.Value))
    Call LoadData(0, 0, 0)
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
    Call LoadData(0, 0, 0)
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

Private Sub cboRubrica_Click()
    Call LoadData(0, 0, 0)
End Sub

Private Sub cboFolio_Click()
    cboFolioDesde.Visible = (cboFolio.ListIndex > 0)
    lblFolioY.Visible = (cboFolio.ListIndex = 7)
    cboFolioHasta.Visible = (cboFolio.ListIndex = 7)
        
    Call LoadData(0, 0, 0)
End Sub

Private Sub cboFolioDesde_Click()
    Call LoadData(0, 0, 0)
End Sub

Private Sub cboFolioHasta_Click()
    Call LoadData(0, 0, 0)
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
    Call LoadData(0, 0, 0)
    
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
    
    tlbPin.Top = ScaleHeight - 330
    tlbPin.Left = 15
End Sub

Private Sub tlbPin_ButtonClick(ByVal Button As MSComctlLib.Button)
    If Button.Value = tbrUnpressed Then
        Button.Image = 1
    Else
        Button.Image = 2
    End If
End Sub

Public Function FillComboBoxRubrica() As Boolean
    Dim SaveItemData As Long
    
    cboRubrica.Clear
    cboRubrica.AddItem ITEM_ALL_FEMALE
    
    If cboRubrica.ListIndex > -1 Then
        SaveItemData = cboRubrica.ItemData(cboRubrica.ListIndex)
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboRubrica, "SELECT LibroMovimiento_Cabecera.Rubrica, LibroMovimiento_Cabecera.Rubrica & ' - ' & Producto.Nombre AS DisplayText FROM LibroMovimiento_Cabecera INNER JOIN Producto ON LibroMovimiento_Cabecera.IDProductoTipo = Producto.IDProductoTipo AND LibroMovimiento_Cabecera.IDProducto = Producto.IDProducto ORDER BY LibroMovimiento_Cabecera.Rubrica", "Rubrica", "DisplayText", "Rúbricas", cscpItemOrFirst, SaveItemData, False)
End Function

Private Function GenerarLibroMovimientos(ByVal Rubrica As Long, ByVal PeriodoMes As Byte, PeriodoAnio As Integer) As Boolean
    Dim LibroMovimiento_Cabecera As LibroMovimiento_Cabecera
    Dim LibroMovimiento_Detalle As LibroMovimiento_Detalle
    
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim recPrevious As ADODB.Recordset
    
    Dim CantidadMovimientos As Long
    Dim DiaInicio As Byte
    Dim DiaActual As Byte
    Dim DiaActualMovimiento As Boolean
    Dim Folio As Integer
    
    Dim IngresoKilogramoBrutoDia As Long
    Dim IngresoKilogramoNetoDia As Long
    Dim EgresoKilogramoNetoDia As Long
    
    Dim IngresoKilogramoBrutoMes As Long
    Dim IngresoKilogramoNetoMes As Long
    Dim EgresoKilogramoNetoMes As Long
    
    Dim SaldoKilogramoNeto As Long
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    Screen.MousePointer = vbHourglass
    
    'CARGO LOS DATOS DE LA CABECERA
    Set LibroMovimiento_Cabecera = New LibroMovimiento_Cabecera
    LibroMovimiento_Cabecera.Rubrica = Rubrica
    If Not LibroMovimiento_Cabecera.Load() Then
        Set LibroMovimiento_Cabecera = Nothing
        Screen.MousePointer = vbDefault
        Exit Function
    End If
    
    'OBTENGO EL NUMERO DE FOLIO ANTERIOR
    Set recPrevious = New ADODB.Recordset
    Set recPrevious.ActiveConnection = pDatabase.Connection
    recPrevious.CursorType = adOpenStatic
    recPrevious.LockType = adLockReadOnly
    recPrevious.Source = "SELECT Max(Folio) AS MaxFolio FROM LibroMovimiento_Detalle WHERE Rubrica = " & Rubrica
    recPrevious.Open , , , , adCmdText
    Folio = Val(recPrevious("MaxFolio").Value & "")
    recPrevious.Close
    
    If Folio > 0 Then
        'OBTENGO LOS SALDOS DEL ULTIMO MOVIMIENTO
        recPrevious.Source = "SELECT Linea, SaldoKilogramoNeto FROM LibroMovimiento_Detalle WHERE Rubrica = " & Rubrica & " AND Folio = " & Folio
        recPrevious.Open , , , , adCmdText
        If Not recPrevious.EOF Then
            recPrevious.Sort = "Linea ASC"
            recPrevious.MoveLast
            SaldoKilogramoNeto = Val(recPrevious("SaldoKilogramoNeto").Value & "")
        End If
        recPrevious.Close
    End If
    
    Set recPrevious = Nothing
    
    'ABRO LA CONSULTA DE LOS MOVIMIENTOS
    Set cmdData = New ADODB.command
    Set cmdData.ActiveConnection = pDatabase.Connection
    cmdData.CommandText = "LibroMovimiento_Todos"
    cmdData.CommandType = adCmdStoredProc
    cmdData.NamedParameters = True
    cmdData.Parameters.Append cmdData.CreateParameter("IDProductoTipo:", adInteger, adParamInput, , pParametro.ProductoTipoIDCereal)
    cmdData.Parameters.Append cmdData.CreateParameter("IDProducto:", adInteger, adParamInput, , LibroMovimiento_Cabecera.IDProducto)
    cmdData.Parameters.Append cmdData.CreateParameter("Mes:", adTinyInt, adParamInput, , PeriodoMes)
    cmdData.Parameters.Append cmdData.CreateParameter("Año:", adInteger, adParamInput, , PeriodoAnio)
    Set recData = cmdData.Execute()
    Set cmdData = Nothing
    
    If recData.BOF And recData.EOF Then
        If Folio = 0 Then
            Screen.MousePointer = vbDefault
            MsgBox "No hay movimientos en el período especificado. Se cancelará el proceso.", vbExclamation, App.Title
            recData.Close
            Set recData = Nothing
            Set LibroMovimiento_Cabecera = Nothing
            Exit Function
        Else
            Screen.MousePointer = vbDefault
            If MsgBox("No hay movimientos en el período especificado." & vbCr & vbCr & "¿Desea continuar de todos modos?", vbQuestion + vbYesNo, App.Title) = vbNo Then
                recData.Close
                Set recData = Nothing
                Set LibroMovimiento_Cabecera = Nothing
                Exit Function
            End If
            Screen.MousePointer = vbHourglass
        End If
    End If
    
    'TENGO QUE HACER COMO MINIMO UN MOVIMIENTO POR DIA
    If Folio = 0 Then
        'ES EL PRIMER MOVIMIENTO DEL LIBRO, POR LO TANTO EMPIEZO CON LA FECHA DEL PRIMER MOVIMIENTO
        Folio = 1
        DiaInicio = Day(recData("Fecha").Value)
    Else
        Folio = Folio + 1
        DiaInicio = 1
    
        Set LibroMovimiento_Detalle = New LibroMovimiento_Detalle
        With LibroMovimiento_Detalle
            .Rubrica = Rubrica
            .Folio = Folio
            .MovimientoTipo = LIBRO_MOVIMIENTOTIPO_SALDO_FOLIOANTERIOR
            .Fecha = DateSerial(PeriodoAnio, PeriodoMes, 1)
            .SaldoKilogramoNeto = SaldoKilogramoNeto
            .Observacion = LIBRO_OBSERVACIONES_STOCKFOLIOANTERIOR_LEGEND
            .Update
        End With
        Set LibroMovimiento_Detalle = Nothing
    End If
    For DiaActual = DiaInicio To CSM_DateTime.GetLastDayOfMonth(PeriodoMes, PeriodoAnio)
        DiaActualMovimiento = False
        
        IngresoKilogramoBrutoDia = 0
        IngresoKilogramoNetoDia = 0
        EgresoKilogramoNetoDia = 0
        
        'RECORRO EL RECORDSET
        Do While Not recData.EOF
            Select Case Day(recData("Fecha").Value)
                Case Is < DiaActual
                    'ESTOY EN UN REGISTRO ANTERIOR, ME MUEVO AL SIGUIENTE
                    recData.MoveNext
                Case Is = DiaActual
                    'ESTOY EN UN REGISTRO VALIDO, GUARDO LOS DATOS
                    DiaActualMovimiento = True
                    Set LibroMovimiento_Detalle = New LibroMovimiento_Detalle
                    With LibroMovimiento_Detalle
                        .Rubrica = Rubrica
                        .Folio = Folio
                        If recData("ComprobanteTipo").Value = "01" Then
                            .MovimientoTipo = LIBRO_MOVIMIENTOTIPO_INGRESO
                        Else
                            .MovimientoTipo = LIBRO_MOVIMIENTOTIPO_EGRESO
                        End If
                        .Fecha = recData("Fecha").Value
                        .ComprobanteTipo = recData("ComprobanteTipo").Value
                        .ComprobanteNumero = recData("ComprobanteNumero").Value
                        .CUIT = recData("CUIT").Value
                        .RemitenteDestinatario = recData("RemitenteODestinatario").Value
                        .IngresoKilogramoBruto = recData("IngresoKilogramoBruto").Value
                        .IngresoKilogramoNeto = recData("IngresoKilogramoNeto").Value
                        .EgresoKilogramoNeto = recData("EgresoKilogramoNeto").Value
                        
                        SaldoKilogramoNeto = SaldoKilogramoNeto + .IngresoKilogramoNeto - .EgresoKilogramoNeto
                        .SaldoKilogramoNeto = SaldoKilogramoNeto
                        .Observacion = ""
                        .Update
                        Folio = .Folio
                        
                        CantidadMovimientos = CantidadMovimientos + 1
                        
                        IngresoKilogramoBrutoDia = IngresoKilogramoBrutoDia + .IngresoKilogramoBruto
                        IngresoKilogramoNetoDia = IngresoKilogramoNetoDia + .IngresoKilogramoNeto
                        EgresoKilogramoNetoDia = EgresoKilogramoNetoDia + .EgresoKilogramoNeto
                        
                        IngresoKilogramoBrutoMes = IngresoKilogramoBrutoMes + .IngresoKilogramoBruto
                        IngresoKilogramoNetoMes = IngresoKilogramoNetoMes + .IngresoKilogramoNeto
                        EgresoKilogramoNetoMes = EgresoKilogramoNetoMes + .EgresoKilogramoNeto
                    End With
                
                    recData.MoveNext
                Case Is > DiaActual
                    'ESTOY EN UN REGISTRO POSTERIOR, SALGO DEL LOOP
                    Exit Do
            End Select
        Loop
        
        'CREO EL CIERRE DEL DIA
        Set LibroMovimiento_Detalle = New LibroMovimiento_Detalle
        With LibroMovimiento_Detalle
            .Rubrica = Rubrica
            .Folio = Folio
            .MovimientoTipo = LIBRO_MOVIMIENTOTIPO_CIERREDIARIO
            .Fecha = DateSerial(PeriodoAnio, PeriodoMes, DiaActual)
            .ComprobanteTipo = 0
            .ComprobanteNumero = ""
            .CUIT = ""
            .RemitenteDestinatario = LIBRO_REMITENTEDESTINATARIO_CIERREDIARIO_LEGEND
            .IngresoKilogramoBruto = IngresoKilogramoBrutoDia
            .IngresoKilogramoNeto = IngresoKilogramoNetoDia
            .EgresoKilogramoNeto = EgresoKilogramoNetoDia
            .SaldoKilogramoNeto = SaldoKilogramoNeto
            .Observacion = IIf(DiaActualMovimiento, "", LIBRO_OBSERVACIONES_SINMOVIMIENTOS_LEGEND)
            .Update
            Folio = .Folio
            
            CantidadMovimientos = CantidadMovimientos + 1
        End With
    Next DiaActual
        
    'CREO EL CIERRE DEL MES
    Set LibroMovimiento_Detalle = New LibroMovimiento_Detalle
    With LibroMovimiento_Detalle
        .Rubrica = Rubrica
        .Folio = Folio
        .MovimientoTipo = LIBRO_MOVIMIENTOTIPO_CIERREMENSUAL
        .Fecha = DateSerial(PeriodoAnio, PeriodoMes, CSM_DateTime.GetLastDayOfMonth(PeriodoMes, PeriodoAnio))
        .ComprobanteTipo = 0
        .ComprobanteNumero = ""
        .CUIT = ""
        .RemitenteDestinatario = LIBRO_REMITENTEDESTINATARIO_CIERREMENSUAL_LEGEND
        .IngresoKilogramoBruto = IngresoKilogramoBrutoMes
        .IngresoKilogramoNeto = IngresoKilogramoNetoMes
        .EgresoKilogramoNeto = EgresoKilogramoNetoMes
        .SaldoKilogramoNeto = SaldoKilogramoNeto
        .Observacion = ""
        .Update
        Folio = .Folio
        
        CantidadMovimientos = CantidadMovimientos + 1
    End With
        
    Set LibroMovimiento_Cabecera = Nothing
    Set LibroMovimiento_Detalle = Nothing
    
    Call LoadData(0, 0, 0)

    MsgBox "Se han creado " & CantidadMovimientos & " movimientos.", vbInformation, App.Title
    
    Screen.MousePointer = vbDefault
    GenerarLibroMovimientos = True
    Exit Function
    
ErrorHandler:
    CSM_Error.ShowErrorMessage "Forms.LibroMovimientoLista.GenerarLibroMovimientos", "Error al generar los Movimientos del Libro."
End Function
