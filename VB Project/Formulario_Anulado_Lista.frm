VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmFormulario_Anulado_Lista 
   Caption         =   "Certificados Anulados"
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
   Icon            =   "Formulario_Anulado_Lista.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   5820
   ScaleWidth      =   11385
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   4095
      Left            =   120
      TabIndex        =   0
      Top             =   1260
      Width           =   11115
      _ExtentX        =   19606
      _ExtentY        =   7223
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDFormulario_Anulado"
      Columns(0).DataField=   "IDFormulario_Anulado"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   16
      Columns(1)._MaxComboItems=   5
      Columns(1).ValueItems(0)._DefaultItem=   0
      Columns(1).ValueItems(0).Value=   "1"
      Columns(1).ValueItems(0).Value.vt=   8
      Columns(1).ValueItems(0).DisplayValue=   "Formulario 1116A"
      Columns(1).ValueItems(0).DisplayValue.vt=   8
      Columns(1).ValueItems(0)._PropDict=   "_DefaultItem,517,2"
      Columns(1).ValueItems(1)._DefaultItem=   0
      Columns(1).ValueItems(1).Value=   "2"
      Columns(1).ValueItems(1).Value.vt=   8
      Columns(1).ValueItems(1).DisplayValue=   "Formulario 1116RT"
      Columns(1).ValueItems(1).DisplayValue.vt=   8
      Columns(1).ValueItems(1)._PropDict=   "_DefaultItem,517,2"
      Columns(1).ValueItems(2)._DefaultItem=   0
      Columns(1).ValueItems(2).Value=   "3"
      Columns(1).ValueItems(2).Value.vt=   8
      Columns(1).ValueItems(2).DisplayValue=   "Formulario 1116B"
      Columns(1).ValueItems(2).DisplayValue.vt=   8
      Columns(1).ValueItems(2)._PropDict=   "_DefaultItem,517,2"
      Columns(1).ValueItems(3)._DefaultItem=   0
      Columns(1).ValueItems(3).Value=   "4"
      Columns(1).ValueItems(3).Value.vt=   8
      Columns(1).ValueItems(3).DisplayValue=   "Formulario 1116C"
      Columns(1).ValueItems(3).DisplayValue.vt=   8
      Columns(1).ValueItems(3)._PropDict=   "_DefaultItem,517,2"
      Columns(1).ValueItems(4)._DefaultItem=   0
      Columns(1).ValueItems(4).Value=   "5"
      Columns(1).ValueItems(4).Value.vt=   8
      Columns(1).ValueItems(4).DisplayValue=   "Carta de Porte"
      Columns(1).ValueItems(4).DisplayValue.vt=   8
      Columns(1).ValueItems(4)._PropDict=   "_DefaultItem,517,2"
      Columns(1).ValueItems.Count=   5
      Columns(1).Caption=   "Tipo de Certificado"
      Columns(1).DataField=   "FormularioCodigo"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Nº de Certificado"
      Columns(2).DataField=   "FormularioNumero"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   16
      Columns(3)._MaxComboItems=   5
      Columns(3).ValueItems(0)._DefaultItem=   0
      Columns(3).ValueItems(0).Value=   "1"
      Columns(3).ValueItems(0).Value.vt=   8
      Columns(3).ValueItems(0).DisplayValue=   "Anulado"
      Columns(3).ValueItems(0).DisplayValue.vt=   8
      Columns(3).ValueItems(0)._PropDict=   "_DefaultItem,517,2"
      Columns(3).ValueItems(1)._DefaultItem=   0
      Columns(3).ValueItems(1).Value=   "2"
      Columns(3).ValueItems(1).Value.vt=   8
      Columns(3).ValueItems(1).DisplayValue=   "Extraviado"
      Columns(3).ValueItems(1).DisplayValue.vt=   8
      Columns(3).ValueItems(1)._PropDict=   "_DefaultItem,517,2"
      Columns(3).ValueItems(2)._DefaultItem=   0
      Columns(3).ValueItems(2).Value=   "3"
      Columns(3).ValueItems(2).Value.vt=   8
      Columns(3).ValueItems(2).DisplayValue=   "Vencido"
      Columns(3).ValueItems(2).DisplayValue.vt=   8
      Columns(3).ValueItems(2)._PropDict=   "_DefaultItem,517,2"
      Columns(3).ValueItems.Count=   3
      Columns(3).Caption=   "Motivo "
      Columns(3).DataField=   "AnulacionMotivo"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Fecha"
      Columns(4).DataField=   "Fecha"
      Columns(4).NumberFormat=   "Short Date"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   5
      Splits(0)._UserFlags=   0
      Splits(0).Locked=   -1  'True
      Splits(0).MarqueeStyle=   3
      Splits(0).AllowRowSizing=   0   'False
      Splits(0).RecordSelectors=   0   'False
      Splits(0).RecordSelectorWidth=   688
      Splits(0)._SavedRecordSelectors=   -1  'True
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
      Splits(0)._ColumnProps(7)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(8)=   "Column(1).Width=2990"
      Splits(0)._ColumnProps(9)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(10)=   "Column(1)._WidthInPix=2910"
      Splits(0)._ColumnProps(11)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(12)=   "Column(1)._ColStyle=8704"
      Splits(0)._ColumnProps(13)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(14)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(15)=   "Column(2).Width=2831"
      Splits(0)._ColumnProps(16)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(17)=   "Column(2)._WidthInPix=2752"
      Splits(0)._ColumnProps(18)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(19)=   "Column(2)._ColStyle=8708"
      Splits(0)._ColumnProps(20)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(21)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(22)=   "Column(3).Width=1931"
      Splits(0)._ColumnProps(23)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(24)=   "Column(3)._WidthInPix=1852"
      Splits(0)._ColumnProps(25)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(26)=   "Column(3)._ColStyle=8708"
      Splits(0)._ColumnProps(27)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(28)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(29)=   "Column(4).Width=2117"
      Splits(0)._ColumnProps(30)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(31)=   "Column(4)._WidthInPix=2037"
      Splits(0)._ColumnProps(32)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(33)=   "Column(4)._ColStyle=8704"
      Splits(0)._ColumnProps(34)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(35)=   "Column(4).Order=5"
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
      _StyleDefs(36)  =   "Splits(0).Columns(0).Style:id=32,.parent=13,.wraptext=0,.locked=-1"
      _StyleDefs(37)  =   "Splits(0).Columns(0).HeadingStyle:id=29,.parent=14"
      _StyleDefs(38)  =   "Splits(0).Columns(0).FooterStyle:id=30,.parent=15"
      _StyleDefs(39)  =   "Splits(0).Columns(0).EditorStyle:id=31,.parent=17"
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=28,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=26,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=27,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=46,.parent=13,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=86,.parent=13,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=83,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=84,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=85,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=82,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=79,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=80,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=81,.parent=17"
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
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   990
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11385
      _ExtentX        =   20082
      _ExtentY        =   1746
      BandCount       =   4
      FixedOrder      =   -1  'True
      _CBWidth        =   11385
      _CBHeight       =   990
      _Version        =   "6.7.9782"
      Child1          =   "tlbMain"
      MinWidth1       =   5595
      MinHeight1      =   570
      Width1          =   5595
      FixedBackground1=   0   'False
      Key1            =   "Toolbar"
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "picFilterFormularioCodigo"
      MinWidth2       =   3345
      MinHeight2      =   330
      Width2          =   3345
      FixedBackground2=   0   'False
      Key2            =   "FilterFormularioCodigo"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picFilterAnulacionMotivo"
      MinWidth3       =   1905
      MinHeight3      =   330
      Width3          =   1905
      FixedBackground3=   0   'False
      Key3            =   "FilterAnulacionMotivo"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Child4          =   "picFilterFecha"
      MinWidth4       =   2325
      MinHeight4      =   330
      Width4          =   2325
      FixedBackground4=   0   'False
      Key4            =   "FilterFecha"
      NewRow4         =   0   'False
      AllowVertical4  =   0   'False
      Begin VB.PictureBox picFilterFecha 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   2295
         ScaleHeight     =   330
         ScaleWidth      =   9000
         TabIndex        =   10
         Top             =   630
         Width           =   9000
         Begin MSComCtl2.DTPicker dtpFilterFecha 
            Height          =   315
            Left            =   720
            TabIndex        =   11
            Top             =   0
            Width           =   1635
            _ExtentX        =   2884
            _ExtentY        =   556
            _Version        =   393216
            CheckBox        =   -1  'True
            Format          =   98566145
            CurrentDate     =   41535
            MaxDate         =   55153
            MinDate         =   40513
         End
         Begin VB.Label lblFilterFecha 
            AutoSize        =   -1  'True
            Caption         =   "Fecha:"
            Height          =   210
            Left            =   60
            TabIndex        =   12
            Top             =   60
            Width           =   495
         End
      End
      Begin VB.PictureBox picFilterAnulacionMotivo 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   165
         ScaleHeight     =   330
         ScaleWidth      =   1905
         TabIndex        =   7
         Top             =   630
         Width           =   1905
         Begin VB.ComboBox cboFilterAnulacionMotivo 
            Height          =   330
            Left            =   720
            Style           =   2  'Dropdown List
            TabIndex        =   8
            Top             =   0
            Width           =   1215
         End
         Begin VB.Label lblFilterAnulacionMotivo 
            AutoSize        =   -1  'True
            Caption         =   "Motivo:"
            Height          =   210
            Left            =   60
            TabIndex        =   9
            Top             =   60
            Width           =   510
         End
      End
      Begin VB.PictureBox picFilterFormularioCodigo 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   7950
         ScaleHeight     =   330
         ScaleWidth      =   3345
         TabIndex        =   4
         Top             =   150
         Width           =   3345
         Begin VB.ComboBox cboFilterFormularioCodigo 
            Height          =   330
            Left            =   1560
            Style           =   2  'Dropdown List
            TabIndex        =   5
            Top             =   0
            Width           =   1815
         End
         Begin VB.Label lblFilterFormularioCodigo 
            AutoSize        =   -1  'True
            Caption         =   "Tipo de Certificado:"
            Height          =   210
            Left            =   60
            TabIndex        =   6
            Top             =   60
            Width           =   1395
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   2
         Top             =   30
         Width           =   7695
         _ExtentX        =   13573
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
      TabIndex        =   3
      Top             =   5460
      Width           =   11385
      _ExtentX        =   20082
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
            Object.Width           =   18865
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
Attribute VB_Name = "frmFormulario_Anulado_Lista"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mLoading As Boolean
Private mColumnsResized As Boolean

Private mOrderColumn As Long
Private mOrderAscending As Boolean

Public Function Startup() As Boolean
    mLoading = True

    Load Me
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal IDFormulario_Anulado As Long) As Boolean
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
        
    Dim SaveIDFormulario_Anulado As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDFormulario_Anulado = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDFormulario_Anulado = tdbgrdData.Columns("IDFormulario_Anulado").Value
        End If
    Else
        SaveIDFormulario_Anulado = IDFormulario_Anulado
    End If
    
    If pIsCompiled Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario_Anulado_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("FormularioCodigo", adTinyInt, adParamInput, , IIf(cboFilterFormularioCodigo.ListIndex = 0, Null, cboFilterFormularioCodigo.ListIndex))
        .Parameters.Append .CreateParameter("AnulacionMotivo", adTinyInt, adParamInput, , IIf(cboFilterAnulacionMotivo.ListIndex = 0, Null, cboFilterAnulacionMotivo.ListIndex))
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , dtpFilterFecha.Value)
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenStatic, adLockReadOnly, adCmdStoredProc
    
    Set tdbgrdData.DataSource = recData
    
    If Not recData.EOF Then
        Call SortColumn(mOrderColumn)
    End If
    
    recData.Find "IDFormulario_Anulado = " & SaveIDFormulario_Anulado
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Certificados anulados."
        Case 1
            stbMain.SimpleText = "1 Certificado anulado."
        Case Else
            stbMain.SimpleText = RecordCount & " Certificados anulados."
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
    Call CSM_Error.ShowErrorMessage("Forms.Formulario_Anulado.LoadData", "Error al listar los Certificados Anulados.")
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

Private Sub dtpFilterFecha_Change()
    Call LoadData(0)
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
    tlbMain.buttons("SELECT").Image = "SELECT"
    '//////////////////////////////////////////////////////////
    
    Call CSM_Parameter_CoolBar.GetSettings(Mid(Me.Name, 4), cbrMain)
    
    Call SetTrueDBGridColors
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4), tdbgrdData)
    
    mOrderColumn = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", 2, csrdtNumberInteger)
    mOrderAscending = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", True, csrdtBoolean)
    Call SortColumn(1)
    
    cboFilterFormularioCodigo.AddItem CSM_Constant.ITEM_ALL_MALE
    cboFilterFormularioCodigo.AddItem "Formulario 1116A"
    cboFilterFormularioCodigo.AddItem "Formulario 1116RT"
    cboFilterFormularioCodigo.AddItem "Formulario 1116B"
    cboFilterFormularioCodigo.AddItem "Formulario 1116C"
    cboFilterFormularioCodigo.AddItem "Carta de Porte"
    cboFilterFormularioCodigo.ListIndex = 0

    cboFilterAnulacionMotivo.AddItem CSM_Constant.ITEM_ALL_MALE
    cboFilterAnulacionMotivo.AddItem "Anulado"
    cboFilterAnulacionMotivo.AddItem "Extraviado"
    cboFilterAnulacionMotivo.AddItem "Vencido"
    cboFilterAnulacionMotivo.ListIndex = 0
    
    dtpFilterFecha.Value = Date
    dtpFilterFecha.Value = Null
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

    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", mOrderColumn)
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", mOrderAscending)

    Set frmFormulario_Anulado_Lista = Nothing
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Formulario_Anulado As Formulario_Anulado
    
    Select Case Button.Key
        Case "NEW"
            Set Formulario_Anulado = New Formulario_Anulado
            If frmFormulario_Anulado_Detalle.Startup(Formulario_Anulado) Then
                If cboFilterFormularioCodigo.ListIndex > 0 Then
                    frmFormulario_Anulado_Detalle.cboFormularioCodigo.ListIndex = cboFilterFormularioCodigo.ListIndex - 1
                End If
                frmFormulario_Anulado_Detalle.Show
                frmFormulario_Anulado_Detalle.SetFocus
            Else
                Unload frmFormulario_Anulado_Detalle
                Set frmFormulario_Anulado_Detalle = Nothing
            End If
            
        Case "PROPERTIES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Certificado seleccionado para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            
            Set Formulario_Anulado = New Formulario_Anulado
            Formulario_Anulado.IDFormulario_Anulado = tdbgrdData.Columns("IDFormulario_Anulado").Value
            If Formulario_Anulado.Load() Then
                If frmFormulario_Anulado_Detalle.Startup(Formulario_Anulado) Then
                    If frmFormulario_Anulado_Detalle.LoadData() Then
                        frmFormulario_Anulado_Detalle.Show
                        frmFormulario_Anulado_Detalle.SetFocus
                    Else
                        Unload frmFormulario_Anulado_Detalle
                        Set frmFormulario_Anulado_Detalle = Nothing
                    End If
                Else
                    Unload frmFormulario_Anulado_Detalle
                    Set frmFormulario_Anulado_Detalle = Nothing
                End If
            End If
            Set Formulario_Anulado = Nothing
            
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Certificado seleccionado para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            Set Formulario_Anulado = New Formulario_Anulado
            Formulario_Anulado.IDFormulario_Anulado = tdbgrdData.Columns("IDFormulario_Anulado").Value
            
            If MsgBox("¿Desea eliminar este Certificado Anulado?", vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
                Formulario_Anulado.Delete
            End If
            
            Set Formulario_Anulado = Nothing
            
        Case "COPY"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Certificado seleccionado para copiar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            
            Set Formulario_Anulado = New Formulario_Anulado
            Formulario_Anulado.IDFormulario_Anulado = tdbgrdData.Columns("IDFormulario_Anulado").Value
            If Formulario_Anulado.Copy() Then
                If frmFormulario_Anulado_Detalle.Startup(Formulario_Anulado) Then
                    If frmFormulario_Anulado_Detalle.LoadData() Then
                        frmFormulario_Anulado_Detalle.Show
                        frmFormulario_Anulado_Detalle.SetFocus
                    Else
                        Unload frmFormulario_Anulado_Detalle
                        Set frmFormulario_Anulado_Detalle = Nothing
                    End If
                Else
                    Unload frmFormulario_Anulado_Detalle
                    Set frmFormulario_Anulado_Detalle = Nothing
                End If
            End If
            Set Formulario_Anulado = Nothing
            
        Case "SELECT"
    End Select
End Sub

Private Sub cboFilterFormularioCodigo_Click()
    Call LoadData(0)
End Sub

Private Sub cboFilterAnulacionMotivo_Click()
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
