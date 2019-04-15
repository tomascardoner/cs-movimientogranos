VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmFormularioA_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Certificado de Depósito"
   ClientHeight    =   8130
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9390
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FormularioA_Detalle.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   8130
   ScaleWidth      =   9390
   Begin VB.TextBox txtDepositanteCUIT 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5460
      Locked          =   -1  'True
      TabIndex        =   24
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtMermaHumedad 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   8280
      Locked          =   -1  'True
      TabIndex        =   43
      TabStop         =   0   'False
      Top             =   6240
      Width           =   975
   End
   Begin VB.CommandButton cmdFechaDescarga_DesdeAnterior 
      Height          =   315
      Left            =   1500
      Picture         =   "FormularioA_Detalle.frx":0CCA
      Style           =   1  'Graphical
      TabIndex        =   12
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   1560
      Width           =   300
   End
   Begin VB.CommandButton cmdFechaDescarga_HastaHoy 
      Height          =   315
      Left            =   3540
      Picture         =   "FormularioA_Detalle.frx":1254
      Style           =   1  'Graphical
      TabIndex        =   20
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   1920
      Width           =   315
   End
   Begin VB.CommandButton cmdFechaDescarga_HastaSiguiente 
      Height          =   315
      Left            =   3240
      Picture         =   "FormularioA_Detalle.frx":139E
      Style           =   1  'Graphical
      TabIndex        =   19
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   1920
      Width           =   300
   End
   Begin VB.CommandButton cmdFechaDescarga_HastaAnterior 
      Height          =   315
      Left            =   1500
      Picture         =   "FormularioA_Detalle.frx":1928
      Style           =   1  'Graphical
      TabIndex        =   17
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   1920
      Width           =   300
   End
   Begin VB.CommandButton cmdFechaDescarga_DesdeHoy 
      Height          =   315
      Left            =   3540
      Picture         =   "FormularioA_Detalle.frx":1EB2
      Style           =   1  'Graphical
      TabIndex        =   15
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   1560
      Width           =   315
   End
   Begin VB.CommandButton cmdFechaDescarga_DesdeSiguiente 
      Height          =   315
      Left            =   3240
      Picture         =   "FormularioA_Detalle.frx":1FFC
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   1560
      Width           =   300
   End
   Begin VB.TextBox txtKilogramoFinal 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   8280
      Locked          =   -1  'True
      TabIndex        =   47
      TabStop         =   0   'False
      Top             =   7080
      Width           =   975
   End
   Begin VB.TextBox txtMermaVolatil 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   8280
      Locked          =   -1  'True
      TabIndex        =   41
      TabStop         =   0   'False
      Top             =   5820
      Width           =   975
   End
   Begin VB.TextBox txtMermaZarandeo 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   8280
      Locked          =   -1  'True
      TabIndex        =   45
      TabStop         =   0   'False
      Top             =   6660
      Width           =   975
   End
   Begin VB.TextBox txtMovimientoSeleccionado 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   3840
      Locked          =   -1  'True
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   5460
      Width           =   495
   End
   Begin VB.Frame fraSelect 
      Caption         =   "Seleccionar"
      Height          =   615
      Left            =   120
      TabIndex        =   32
      Top             =   5280
      Width           =   2595
      Begin VB.CommandButton cmdSelectAll 
         Caption         =   "Todas"
         Height          =   270
         Left            =   120
         TabIndex        =   33
         Top             =   240
         Width           =   735
      End
      Begin VB.CommandButton cmdSelectNone 
         Caption         =   "Ninguna"
         Height          =   270
         Left            =   900
         TabIndex        =   34
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton cmdSelectInvert 
         Caption         =   "Invertir"
         Height          =   270
         Left            =   1740
         TabIndex        =   35
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.TextBox txtKilogramoNeto 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   8280
      Locked          =   -1  'True
      TabIndex        =   39
      TabStop         =   0   'False
      Top             =   5400
      Width           =   975
   End
   Begin VB.CommandButton cmdFecha_Anterior 
      Height          =   315
      Left            =   1500
      Picture         =   "FormularioA_Detalle.frx":2586
      Style           =   1  'Graphical
      TabIndex        =   1
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   120
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Siguiente 
      Height          =   315
      Left            =   3240
      Picture         =   "FormularioA_Detalle.frx":2B10
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   120
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Hoy 
      Height          =   315
      Left            =   3540
      Picture         =   "FormularioA_Detalle.frx":309A
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtFormularioNumero 
      Height          =   315
      Left            =   1500
      MaxLength       =   12
      TabIndex        =   8
      Tag             =   "STRING|NOTEMPTY|NUMBERS|13"
      Top             =   840
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   8160
      TabIndex        =   49
      Top             =   7620
      Width           =   1095
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   6960
      TabIndex        =   48
      Top             =   7620
      Width           =   1095
   End
   Begin MSDataListLib.DataCombo datcboCondicionPago 
      Height          =   330
      Left            =   1500
      TabIndex        =   10
      Top             =   1200
      Width           =   2475
      _ExtentX        =   4366
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
      Left            =   1800
      TabIndex        =   2
      Top             =   120
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   98566145
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40179
   End
   Begin MSDataListLib.DataCombo datcboPlanta 
      Height          =   330
      Left            =   1500
      TabIndex        =   6
      Top             =   480
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
   Begin MSDataListLib.DataCombo datcboDepositante 
      Height          =   330
      Left            =   5460
      TabIndex        =   22
      Top             =   120
      Width           =   3795
      _ExtentX        =   6694
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
      Left            =   5460
      TabIndex        =   26
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
      Left            =   5460
      TabIndex        =   28
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
   Begin MSDataListLib.DataCombo datcboPartido 
      Height          =   330
      Left            =   5460
      TabIndex        =   30
      Top             =   1560
      Width           =   3795
      _ExtentX        =   6694
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
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   2895
      Left            =   120
      TabIndex        =   31
      Top             =   2340
      Width           =   9135
      _ExtentX        =   16113
      _ExtentY        =   5106
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDMovimiento"
      Columns(0).DataField=   "IDMovimiento"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   4
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Selec."
      Columns(1).DataField=   "Seleccionada"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "N°  CTG"
      Columns(2).DataField=   "CTGNumero"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "N° Carta de Porte"
      Columns(3).DataField=   "ComprobanteNumero"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Fecha Descarga"
      Columns(4).DataField=   "FechaDescarga"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Kilos"
      Columns(5).DataField=   "PesoNeto"
      Columns(5).NumberFormat=   "#,###"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Zarandeo Kgs."
      Columns(6).DataField=   "MermaZarandaKilogranmo"
      Columns(6).NumberFormat=   "#,###"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).Caption=   "% Humedad"
      Columns(7).DataField=   "Humedad"
      Columns(7).NumberFormat=   "0.0"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   0
      Columns(8)._MaxComboItems=   5
      Columns(8).Caption=   "Secado Kgs."
      Columns(8).DataField=   "MermaHumedadKilogramo"
      Columns(8).NumberFormat=   "#,###"
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   0
      Columns(9)._MaxComboItems=   5
      Columns(9).Caption=   "MermaVolatil"
      Columns(9).DataField=   "MermaVolatilKilogramo"
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(10)._VlistStyle=   0
      Columns(10)._MaxComboItems=   5
      Columns(10).Caption=   "PesoFinal"
      Columns(10).DataField=   "PesoFinal"
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   11
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=11"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=3254"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=3175"
      Splits(0)._ColumnProps(4)=   "Column(0)._EditAlways=0"
      Splits(0)._ColumnProps(5)=   "Column(0).AllowSizing=0"
      Splits(0)._ColumnProps(6)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(7)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(8)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(9)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(10)=   "Column(1).Width=1058"
      Splits(0)._ColumnProps(11)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(12)=   "Column(1)._WidthInPix=979"
      Splits(0)._ColumnProps(13)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(14)=   "Column(1).AllowSizing=0"
      Splits(0)._ColumnProps(15)=   "Column(1)._ColStyle=513"
      Splits(0)._ColumnProps(16)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(17)=   "Column(2).Width=1905"
      Splits(0)._ColumnProps(18)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(19)=   "Column(2)._WidthInPix=1826"
      Splits(0)._ColumnProps(20)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(21)=   "Column(2)._ColStyle=8705"
      Splits(0)._ColumnProps(22)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(23)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(24)=   "Column(3).Width=2593"
      Splits(0)._ColumnProps(25)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(26)=   "Column(3)._WidthInPix=2514"
      Splits(0)._ColumnProps(27)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(28)=   "Column(3)._ColStyle=8704"
      Splits(0)._ColumnProps(29)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(30)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(31)=   "Column(4).Width=2355"
      Splits(0)._ColumnProps(32)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(33)=   "Column(4)._WidthInPix=2275"
      Splits(0)._ColumnProps(34)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(35)=   "Column(4)._ColStyle=8704"
      Splits(0)._ColumnProps(36)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(37)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(38)=   "Column(5).Width=1984"
      Splits(0)._ColumnProps(39)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(40)=   "Column(5)._WidthInPix=1905"
      Splits(0)._ColumnProps(41)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(42)=   "Column(5)._ColStyle=8706"
      Splits(0)._ColumnProps(43)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(44)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(45)=   "Column(6).Width=2037"
      Splits(0)._ColumnProps(46)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(47)=   "Column(6)._WidthInPix=1958"
      Splits(0)._ColumnProps(48)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(49)=   "Column(6)._ColStyle=8706"
      Splits(0)._ColumnProps(50)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(51)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(52)=   "Column(7).Width=1693"
      Splits(0)._ColumnProps(53)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(54)=   "Column(7)._WidthInPix=1614"
      Splits(0)._ColumnProps(55)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(56)=   "Column(7)._ColStyle=8706"
      Splits(0)._ColumnProps(57)=   "Column(7).AllowFocus=0"
      Splits(0)._ColumnProps(58)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(59)=   "Column(8).Width=1561"
      Splits(0)._ColumnProps(60)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(61)=   "Column(8)._WidthInPix=1482"
      Splits(0)._ColumnProps(62)=   "Column(8)._EditAlways=0"
      Splits(0)._ColumnProps(63)=   "Column(8)._ColStyle=8706"
      Splits(0)._ColumnProps(64)=   "Column(8).AllowFocus=0"
      Splits(0)._ColumnProps(65)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(66)=   "Column(9).Width=2725"
      Splits(0)._ColumnProps(67)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(68)=   "Column(9)._WidthInPix=2646"
      Splits(0)._ColumnProps(69)=   "Column(9)._EditAlways=0"
      Splits(0)._ColumnProps(70)=   "Column(9)._ColStyle=8196"
      Splits(0)._ColumnProps(71)=   "Column(9).Visible=0"
      Splits(0)._ColumnProps(72)=   "Column(9).AllowFocus=0"
      Splits(0)._ColumnProps(73)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(74)=   "Column(10).Width=2725"
      Splits(0)._ColumnProps(75)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(76)=   "Column(10)._WidthInPix=2646"
      Splits(0)._ColumnProps(77)=   "Column(10)._EditAlways=0"
      Splits(0)._ColumnProps(78)=   "Column(10)._ColStyle=8196"
      Splits(0)._ColumnProps(79)=   "Column(10).Visible=0"
      Splits(0)._ColumnProps(80)=   "Column(10).AllowFocus=0"
      Splits(0)._ColumnProps(81)=   "Column(10).Order=11"
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
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=50,.parent=13,.alignment=2"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=47,.parent=14,.alignment=2"
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
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=58,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=55,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=56,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=57,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=32,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=29,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=30,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=31,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=46,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=44,.parent=15"
      _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=45,.parent=17"
      _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=78,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=75,.parent=14,.alignment=2"
      _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=76,.parent=15"
      _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=77,.parent=17"
      _StyleDefs(68)  =   "Splits(0).Columns(8).Style:id=54,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(69)  =   "Splits(0).Columns(8).HeadingStyle:id=51,.parent=14,.alignment=2"
      _StyleDefs(70)  =   "Splits(0).Columns(8).FooterStyle:id=52,.parent=15"
      _StyleDefs(71)  =   "Splits(0).Columns(8).EditorStyle:id=53,.parent=17"
      _StyleDefs(72)  =   "Splits(0).Columns(9).Style:id=62,.parent=13,.locked=-1"
      _StyleDefs(73)  =   "Splits(0).Columns(9).HeadingStyle:id=59,.parent=14"
      _StyleDefs(74)  =   "Splits(0).Columns(9).FooterStyle:id=60,.parent=15"
      _StyleDefs(75)  =   "Splits(0).Columns(9).EditorStyle:id=61,.parent=17"
      _StyleDefs(76)  =   "Splits(0).Columns(10).Style:id=66,.parent=13,.locked=-1"
      _StyleDefs(77)  =   "Splits(0).Columns(10).HeadingStyle:id=63,.parent=14"
      _StyleDefs(78)  =   "Splits(0).Columns(10).FooterStyle:id=64,.parent=15"
      _StyleDefs(79)  =   "Splits(0).Columns(10).EditorStyle:id=65,.parent=17"
      _StyleDefs(80)  =   "Named:id=33:Normal"
      _StyleDefs(81)  =   ":id=33,.parent=0"
      _StyleDefs(82)  =   "Named:id=34:Heading"
      _StyleDefs(83)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(84)  =   ":id=34,.wraptext=-1"
      _StyleDefs(85)  =   "Named:id=35:Footing"
      _StyleDefs(86)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(87)  =   "Named:id=36:Selected"
      _StyleDefs(88)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(89)  =   "Named:id=37:Caption"
      _StyleDefs(90)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(91)  =   "Named:id=38:HighlightRow"
      _StyleDefs(92)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(93)  =   "Named:id=39:EvenRow"
      _StyleDefs(94)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(95)  =   "Named:id=40:OddRow"
      _StyleDefs(96)  =   ":id=40,.parent=33"
      _StyleDefs(97)  =   "Named:id=41:RecordSelector"
      _StyleDefs(98)  =   ":id=41,.parent=34"
      _StyleDefs(99)  =   "Named:id=42:FilterBar"
      _StyleDefs(100) =   ":id=42,.parent=33"
   End
   Begin MSComCtl2.DTPicker dtpFechaDescarga_Desde 
      Height          =   315
      Left            =   1800
      TabIndex        =   13
      Top             =   1560
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
      CurrentDate     =   40544
      MinDate         =   40179
   End
   Begin MSComCtl2.DTPicker dtpFechaDescarga_Hasta 
      Height          =   315
      Left            =   1800
      TabIndex        =   18
      Top             =   1920
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
      CurrentDate     =   42480.5029861111
      MinDate         =   40179
   End
   Begin VB.Label lblDepositanteCUIT 
      AutoSize        =   -1  'True
      Caption         =   "CUIT:"
      Height          =   210
      Left            =   4380
      TabIndex        =   23
      Top             =   540
      Width           =   375
   End
   Begin VB.Label lblMermaHumedad 
      Caption         =   "Merma Secado:"
      Height          =   195
      Left            =   6600
      TabIndex        =   42
      Top             =   6300
      Width           =   1515
   End
   Begin VB.Label lblFechaDescargaHasta 
      AutoSize        =   -1  'True
      Caption         =   "Descarga hasta:"
      Height          =   210
      Left            =   120
      TabIndex        =   16
      Top             =   1980
      Width           =   1200
   End
   Begin VB.Label lblFechaDescargaDesde 
      AutoSize        =   -1  'True
      Caption         =   "Descarga desde:"
      Height          =   210
      Left            =   120
      TabIndex        =   11
      Top             =   1620
      Width           =   1245
   End
   Begin VB.Label lblKilogramoFinal 
      Caption         =   "Kilogramos Finales:"
      Height          =   195
      Left            =   6600
      TabIndex        =   46
      Top             =   7140
      Width           =   1515
   End
   Begin VB.Label lblMermaVolatil 
      Caption         =   "Merma Volátil:"
      Height          =   195
      Left            =   6600
      TabIndex        =   40
      Top             =   5880
      Width           =   1515
   End
   Begin VB.Label lblMermaZarandeo 
      Caption         =   "Merma Zarandeo:"
      Height          =   195
      Left            =   6600
      TabIndex        =   44
      Top             =   6720
      Width           =   1515
   End
   Begin VB.Label lblMovimientoSeleccionado 
      Caption         =   "C.P. Selec.:"
      Height          =   195
      Left            =   2880
      TabIndex        =   36
      Top             =   5520
      Width           =   855
   End
   Begin VB.Label lblKilogramoNeto 
      Caption         =   "Kilogramos Netos:"
      Height          =   195
      Left            =   6600
      TabIndex        =   38
      Top             =   5460
      Width           =   1515
   End
   Begin VB.Label lblCereal 
      AutoSize        =   -1  'True
      Caption         =   "Cereal:"
      Height          =   210
      Left            =   4380
      TabIndex        =   27
      Top             =   1260
      Width           =   510
   End
   Begin VB.Label lblCosecha 
      AutoSize        =   -1  'True
      Caption         =   "Cosecha:"
      Height          =   210
      Left            =   4380
      TabIndex        =   25
      Top             =   900
      Width           =   690
   End
   Begin VB.Label lblDepositante 
      AutoSize        =   -1  'True
      Caption         =   "Depositante:"
      Height          =   210
      Left            =   4380
      TabIndex        =   21
      Top             =   180
      Width           =   900
   End
   Begin VB.Label lblPartido 
      AutoSize        =   -1  'True
      Caption         =   "Partido:"
      Height          =   210
      Left            =   4380
      TabIndex        =   29
      Top             =   1620
      Width           =   540
   End
   Begin VB.Label lblFormularioNumero 
      AutoSize        =   -1  'True
      Caption         =   "Certificado Nº:"
      Height          =   210
      Left            =   120
      TabIndex        =   7
      Top             =   900
      Width           =   1050
   End
   Begin VB.Label lblFecha 
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
   Begin VB.Label lblCondicionPago 
      Caption         =   "Cond. Pago:"
      Height          =   210
      Left            =   120
      TabIndex        =   9
      Top             =   1260
      Width           =   1020
   End
End
Attribute VB_Name = "frmFormularioA_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mColumnsResized As Boolean

Private mKeyDecimal As Boolean

Private maDataTypes() As ADODB.DataTypeEnum
Private mOrderColumn As Long
Private mOrderAscending As Boolean

Private mCantidadCPSeleccionada As Long

Private mKilogramoNeto As Long
Private mMermaZarandeo As Long
Private mMermaHumedad As Long
Private mMermaVolatil As Long
Private mKilogramoFinal As Long

Private mFormulario1116A_Cabecera As F1116A_Cabecera

Private Const GRID_COLUMN_IDMOVIMIENTO As Integer = 0
Private Const GRID_COLUMN_SELECT As Integer = 1
Private Const GRID_COLUMN_CTGNUMERO As Integer = 2
Private Const GRID_COLUMN_COMPROBANTENUMERO As Integer = 3
Private Const GRID_COLUMN_FECHADESCARGA As Integer = 4
Private Const GRID_COLUMN_KILOGRAMONETO As Integer = 5
Private Const GRID_COLUMN_MERMAZARANDEO As Integer = 6
Private Const GRID_COLUMN_HUMEDAD As Integer = 7
Private Const GRID_COLUMN_MERMAHUMEDAD As Integer = 8
Private Const GRID_COLUMN_MERMAVOLATIL As Integer = 9
Private Const GRID_COLUMN_KILOGRAMOFINAL As Integer = 10

Public Function Startup(ByRef Formulario1116A_Cabecera As F1116A_Cabecera) As Boolean
    Set mFormulario1116A_Cabecera = Formulario1116A_Cabecera
    
    Load Me
        
    Me.Caption = "Detalle del Certificado de Depósito - Nuevo"
        
    dtpFecha.Value = Date
    
    Call CSM_ApplicationLog.WriteLogEvent("Populating ComboBox Planta...", vbLogEventTypeInformation)
    Call CSM_Control_DataCombo.FillFromSQL(datcboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL ", "ID", "Nombre", "Plantas", cscpItemOrFirstIfUnique, pParametro.Planta_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboDepositante, "usp_Entidad_Titular_List 0, 1, " & mFormulario1116A_Cabecera.DepositanteIDEntidad, "IDEntidad", "Nombre", "Depositantes", cscpNone)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCosecha, "usp_Cosecha_List 0, 1, " & mFormulario1116A_Cabecera.IDCosecha, "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirst, pParametro.Cosecha_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "usp_Cereal_List 0, 1, 1, " & mFormulario1116A_Cabecera.IDCereal, "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCondicionPago, "SELECT IDCondicionPago, Nombre FROM CondicionPago WHERE (Activo = 1 OR IDCondicionPago = " & mFormulario1116A_Cabecera.GastoIDCondicionPago & ") ORDER BY CantidadDias", "IDCondicionPago", "Nombre", "Condiciones de Pago", cscpFirstIfUnique)
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mFormulario1116A_Cabecera
        Me.Caption = "Detalle del Certificado de Depósito"
    End With
    
    LoadData = True
End Function

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    Call SetTrueDBGridAppearance
    
    mOrderColumn = GRID_COLUMN_CTGNUMERO
    mOrderAscending = True
    
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
        If MsgBox("¿Desea cancelar la carga del Certificado de Depósito?", vbQuestion + vbYesNo, App.Title) = vbNo Then
            Cancel = True
        End If
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmFormularioA_Detalle = Nothing
    Set mFormulario1116A_Cabecera = Nothing
    Set frmFormularioA_Detalle = Nothing
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
'PLANTA
Private Sub datcboPlanta_Change()
    Call FillComboBox_Partido
    Call tdbgrdData_Fill
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
    
    Set Entidad_Depositante = New Entidad
    If datcboDepositante.BoundText <> "" Then
        Entidad_Depositante.IDEntidad = CLng(datcboDepositante.BoundText)
        If Not Entidad_Depositante.Load() Then
            txtDepositanteCUIT.Text = ""
            Set Entidad_Depositante = Nothing
            Exit Sub
        End If
        txtDepositanteCUIT.Text = Entidad_Depositante.CUIT
        Set Entidad_Depositante = Nothing
    End If
    Call FillComboBox_Partido
    Call tdbgrdData_Fill
End Sub

'============================================================
'CUIT
Private Sub txtDepositanteCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDepositanteCUIT)
End Sub

'============================================================
'COSECHA
Private Sub datcboCosecha_Change()
    Call FillComboBox_Partido
    Call tdbgrdData_Fill
End Sub

'============================================================
'CEREAL
Private Sub datcboCereal_Change()
    Call FillComboBox_Partido
    Call tdbgrdData_Fill
End Sub

'============================================================
'PARTIDO
Private Sub datcboPartido_Change()
    Call tdbgrdData_Fill
End Sub

'============================================================
'FECHA DESCARGA DESDE
Private Sub cmdFechaDescarga_DesdeAnterior_Click()
    dtpFechaDescarga_Desde.Value = DateAdd("d", -1, dtpFechaDescarga_Desde.Value)
    dtpFechaDescarga_Desde.SetFocus
    dtpFechaDescarga_Desde_Change
End Sub

Private Sub dtpFechaDescarga_Desde_Change()
    Call FillComboBox_Partido
    Call tdbgrdData_Fill
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
    Call FillComboBox_Partido
    Call tdbgrdData_Fill
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

'============================================================

Private Sub tdbgrdData_Fill()
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim XArrayDB As XArrayDBObject.XArrayDB
    
    Set XArrayDB = New XArrayDBObject.XArrayDB
    
    If Val(datcboPlanta.BoundText) = 0 Or Val(datcboDepositante.BoundText) = 0 Or Val(datcboCosecha.BoundText) = 0 Or Val(datcboCereal.BoundText) = 0 Or Val(datcboPartido.BoundText) = 0 Then
        Set tdbgrdData.Array = XArrayDB
        tdbgrdData.ReBind
        
        mCantidadCPSeleccionada = 0
        
        mKilogramoNeto = 0
        mMermaZarandeo = 0
        mMermaHumedad = 0
        mMermaVolatil = 0
        mKilogramoFinal = 0
        
        Call RefreshTotals
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Movimiento_Cereal_Entrada_SinCertificar_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad_Depositario", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 1))
        .Parameters.Append .CreateParameter("IDPlanta", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 2))
        .Parameters.Append .CreateParameter("IDEntidad_Depositante", adInteger, adParamInput, , Val(datcboDepositante.BoundText))
        .Parameters.Append .CreateParameter("IDCosecha", adSmallInt, adParamInput, , Val(datcboCosecha.BoundText))
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , Val(datcboCereal.BoundText))
        .Parameters.Append .CreateParameter("IDPartido", adSmallInt, adParamInput, , Val(datcboPartido.BoundText))
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , dtpFechaDescarga_Desde.Value)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , dtpFechaDescarga_Hasta.Value)
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    Set cmdData = Nothing
    
    If Not recData.EOF Then
        Call XArrayDB.LoadRows(recData.GetRows())
    End If
    Set tdbgrdData.Array = XArrayDB
    tdbgrdData.ReBind
    
    mCantidadCPSeleccionada = 0
    
    mKilogramoNeto = 0
    mMermaZarandeo = 0
    mMermaHumedad = 0
    mMermaVolatil = 0
    mKilogramoFinal = 0
    
    Call RefreshTotals
    
    maDataTypes = pDatabase.GetDataTypeArrayFromRecordset(recData)
    
    Call tdbgrdData_SortColumn(mOrderColumn)
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.FormularioA_Detalle.tdbgrdData_Fill", "Error al listar las Cartas de Porte.")
End Sub

Private Sub tdbgrdData_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdData.SelStartCol <> tdbgrdData.SelEndCol Then
        tdbgrdData.SelEndCol = tdbgrdData.SelStartCol
    End If
    If tdbgrdData.SelStartCol = mOrderColumn Then
        mOrderAscending = Not mOrderAscending
    Else
        mOrderAscending = True
    End If
    OldOrderColumn = mOrderColumn
    mOrderColumn = tdbgrdData.SelStartCol
    tdbgrdData.SelStartCol = -1
    tdbgrdData.SelEndCol = -1
    
    Call tdbgrdData_SortColumn(OldOrderColumn)
End Sub

Private Sub tdbgrdData_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized = True
End Sub

Private Sub tdbgrdData_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdData.MoveFirst
        Case vbKeyEnd
            tdbgrdData.MoveLast
    End Select
End Sub

Private Sub tdbgrdData_AfterColUpdate(ByVal ColIndex As Integer)
    If ColIndex = GRID_COLUMN_SELECT Then
        If CBool(tdbgrdData.Columns(GRID_COLUMN_SELECT).Value) Then
            mCantidadCPSeleccionada = mCantidadCPSeleccionada + 1
            mKilogramoNeto = mKilogramoNeto + tdbgrdData.Columns(GRID_COLUMN_KILOGRAMONETO).Value
            mMermaZarandeo = mMermaZarandeo + tdbgrdData.Columns(GRID_COLUMN_MERMAZARANDEO).Value
            mMermaHumedad = mMermaHumedad + tdbgrdData.Columns(GRID_COLUMN_MERMAHUMEDAD).Value
            mMermaVolatil = mMermaVolatil + tdbgrdData.Columns(GRID_COLUMN_MERMAVOLATIL).Value
            mKilogramoFinal = mKilogramoFinal + tdbgrdData.Columns(GRID_COLUMN_KILOGRAMOFINAL).Value
        Else
            mCantidadCPSeleccionada = mCantidadCPSeleccionada - 1
            mKilogramoNeto = mKilogramoNeto - tdbgrdData.Columns(GRID_COLUMN_KILOGRAMONETO).Value
            mMermaZarandeo = mMermaZarandeo - tdbgrdData.Columns(GRID_COLUMN_MERMAZARANDEO).Value
            mMermaHumedad = mMermaHumedad - tdbgrdData.Columns(GRID_COLUMN_MERMAHUMEDAD).Value
            mMermaVolatil = mMermaVolatil - tdbgrdData.Columns(GRID_COLUMN_MERMAVOLATIL).Value
            mKilogramoFinal = mKilogramoFinal - tdbgrdData.Columns(GRID_COLUMN_KILOGRAMOFINAL).Value
        End If
        Call RefreshTotals
    End If
End Sub

Private Sub tdbgrdData_SortColumn(ByVal OldOrderColumn As Long)
'    Dim XArrayDB As XArrayDBObject.XArrayDB
'
'    Set XArrayDB = tdbgrdData.Array
'    If Not XArrayDB Is Nothing Then
'        Call XArrayDB.QuickSort(0, XArrayDB.UpperBound(1), mOrderColumn, IIf(mOrderAscending, XORDER_ASCEND, XORDER_DESCEND), CSM_XArrayDB.ConvertADOTypeToXTYPE(maDataTypes(mOrderColumn)))
'        tdbgrdData.ReBind
'    End If
'
'    'ICONOS
'    If OldOrderColumn <> mOrderColumn Then
'        tdbgrdData.Columns(OldOrderColumn).HeadingStyle.ForegroundPicture = 0
'    End If
'    tdbgrdData.Columns(mOrderColumn).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
'    tdbgrdData.Columns(mOrderColumn).HeadingStyle.TransparentForegroundPicture = True
'    If mOrderAscending Then
'        Set tdbgrdData.Columns(mOrderColumn).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
'    Else
'        Set tdbgrdData.Columns(mOrderColumn).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
'    End If
End Sub

Private Sub cmdSelectAll_Click()
    Dim Index As Integer
    
    tdbgrdData.Visible = False
    tdbgrdData.MoveFirst
    mKilogramoNeto = 0
    mMermaZarandeo = 0
    mMermaHumedad = 0
    mMermaVolatil = 0
    mKilogramoFinal = 0
    For Index = 0 To tdbgrdData.ApproxCount - 1
        tdbgrdData.Columns(GRID_COLUMN_SELECT).Value = True
        mKilogramoNeto = mKilogramoNeto + tdbgrdData.Columns(GRID_COLUMN_KILOGRAMONETO).Value
        mMermaZarandeo = mMermaZarandeo + tdbgrdData.Columns(GRID_COLUMN_MERMAZARANDEO).Value
        mMermaHumedad = mMermaHumedad + tdbgrdData.Columns(GRID_COLUMN_MERMAHUMEDAD).Value
        mMermaVolatil = mMermaVolatil + tdbgrdData.Columns(GRID_COLUMN_MERMAVOLATIL).Value
        mKilogramoFinal = mKilogramoFinal + tdbgrdData.Columns(GRID_COLUMN_KILOGRAMOFINAL).Value
        tdbgrdData.MoveNext
    Next Index
    tdbgrdData.MoveFirst
    tdbgrdData.Visible = True
    
    mCantidadCPSeleccionada = tdbgrdData.ApproxCount
    
    Call RefreshTotals
End Sub

Private Sub cmdSelectNone_Click()
    Dim Index As Integer
    
    tdbgrdData.Visible = False
    tdbgrdData.MoveFirst
    For Index = 0 To tdbgrdData.ApproxCount - 1
        tdbgrdData.Columns(GRID_COLUMN_SELECT).Value = False
        tdbgrdData.MoveNext
    Next Index
    tdbgrdData.MoveFirst
    tdbgrdData.Visible = True
    
    mCantidadCPSeleccionada = 0
    
    mKilogramoNeto = 0
    mMermaZarandeo = 0
    mMermaHumedad = 0
    mMermaVolatil = 0
    mKilogramoFinal = 0
    
    Call RefreshTotals
End Sub

Private Sub cmdSelectInvert_Click()
    Dim Index As Integer
    
    tdbgrdData.Visible = False
    tdbgrdData.MoveFirst
    For Index = 0 To tdbgrdData.ApproxCount - 1
        If tdbgrdData.Columns(GRID_COLUMN_SELECT).Value Then
            mCantidadCPSeleccionada = mCantidadCPSeleccionada - 1
            mKilogramoNeto = mKilogramoNeto - tdbgrdData.Columns(GRID_COLUMN_KILOGRAMONETO).Value
            mMermaZarandeo = mMermaZarandeo - tdbgrdData.Columns(GRID_COLUMN_MERMAZARANDEO).Value
            mMermaHumedad = mMermaHumedad - tdbgrdData.Columns(GRID_COLUMN_MERMAHUMEDAD).Value
            mMermaVolatil = mMermaVolatil - tdbgrdData.Columns(GRID_COLUMN_MERMAVOLATIL).Value
            mKilogramoFinal = mKilogramoFinal - tdbgrdData.Columns(GRID_COLUMN_KILOGRAMOFINAL).Value
        Else
            mCantidadCPSeleccionada = mCantidadCPSeleccionada + 1
            mKilogramoNeto = mKilogramoNeto + tdbgrdData.Columns(GRID_COLUMN_KILOGRAMONETO).Value
            mMermaZarandeo = mMermaZarandeo + tdbgrdData.Columns(GRID_COLUMN_MERMAZARANDEO).Value
            mMermaHumedad = mMermaHumedad + tdbgrdData.Columns(GRID_COLUMN_MERMAHUMEDAD).Value
            mMermaVolatil = mMermaVolatil + tdbgrdData.Columns(GRID_COLUMN_MERMAVOLATIL).Value
            mKilogramoFinal = mKilogramoFinal + tdbgrdData.Columns(GRID_COLUMN_KILOGRAMOFINAL).Value
        End If
        tdbgrdData.Columns(GRID_COLUMN_SELECT).Value = Not tdbgrdData.Columns(GRID_COLUMN_SELECT).Value
        tdbgrdData.MoveNext
    Next Index
    tdbgrdData.MoveFirst
    tdbgrdData.Visible = True
    
    Call RefreshTotals
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Private Sub cmdAceptar_Click()
    Dim Formulario1116A_Cabecera_VerificaNumero As F1116A_Cabecera
    Dim Formulario1116A_Detalle As F1116A_Detalle
    
    Dim Entidad_OrigenDestino As Entidad_OrigDest
    
    If Trim(txtFormularioNumero.Text) = "" Then
        MsgBox "Debe ingresar el Número de Certificado.", vbInformation, App.Title
        txtFormularioNumero.SetFocus
        Exit Sub
    End If
    If mCantidadCPSeleccionada = 0 Then
        MsgBox "No hay ninguna Carta de Porte seleccionada para asignar al Certificado de Depósito.", vbInformation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    If pParametro.Formulario1116A_RemesasMaximo > 0 And mCantidadCPSeleccionada > pParametro.Formulario1116A_RemesasMaximo Then
        MsgBox "Ha seleccionado " & mCantidadCPSeleccionada & " Cartas de Porte. El máximo permitido es " & pParametro.Formulario1116A_RemesasMaximo, vbInformation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    'VERIFICO LAS FECHAS DE LAS CARTAS DE PORTE
    tdbgrdData.Visible = False
    tdbgrdData.MoveFirst
    Do While Not tdbgrdData.EOF
        If CBool(tdbgrdData.Columns(GRID_COLUMN_SELECT).Value) Then
            If DateDiff("d", CDate(tdbgrdData.Columns(GRID_COLUMN_FECHADESCARGA).Value), dtpFecha.Value) < 0 Then
                MsgBox "Hay al menos una Carta de Porte seleccionada que tiene Fecha de Arribo mayor a la Fecha del Certificado.", vbInformation, App.Title
                tdbgrdData.MoveFirst
                tdbgrdData.Visible = True
                tdbgrdData.ReBind
                Exit Sub
            End If
        End If
        tdbgrdData.MoveNext
    Loop
    tdbgrdData.MoveFirst
    tdbgrdData.Visible = True
    tdbgrdData.ReBind
    
    If Val(datcboCondicionPago.BoundText) = 0 Then
        MsgBox "Debe seleccionar la Condición de Pago.", vbInformation, App.Title
        datcboCondicionPago.SetFocus
        Exit Sub
    End If
    
    'VERIFICO SI NO EXISTE EL NÚMERO DE FORMULARIO
    Set Formulario1116A_Cabecera_VerificaNumero = New F1116A_Cabecera
    Formulario1116A_Cabecera_VerificaNumero.NoMatchRaiseError = False
    Formulario1116A_Cabecera_VerificaNumero.FormularioNumero = txtFormularioNumero.Text
    If Formulario1116A_Cabecera_VerificaNumero.LoadByFormularioNumero() Then
        If Not Formulario1116A_Cabecera_VerificaNumero.NoMatch Then
            MsgBox "El Número de Certificado ya existe.", vbExclamation, App.Title
            Set Formulario1116A_Cabecera_VerificaNumero = Nothing
            Exit Sub
        End If
    End If
    Set Formulario1116A_Cabecera_VerificaNumero = Nothing
        
    'VERIFICO QUE EL DEPOSITANTE TENGA LOS DATOS COMPLETOS
    Dim Entidad_Depositante As Entidad
    Set Entidad_Depositante = New Entidad
    Entidad_Depositante.IDEntidad = CLng(datcboDepositante.BoundText)
    If Not Entidad_Depositante.Load() Then
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    If Entidad_Depositante.Entidad_Domicilio.Calle = "" Then
        MsgBox "El Depositante no tiene los datos del domicilio completos.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    If Entidad_Depositante.Entidad_Impuesto.IDCategoriaIVA = 0 Then
        MsgBox "El Depositante no tiene los datos impositivos completos.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    
    'VERIFICO QUE LA LOCALIDAD DEL DEPOSITANTE, TENGA ESPECIFICADO EL PARTIDO
    If Entidad_Depositante.Entidad_Domicilio.Localidad.IDPartido = 0 Then
        MsgBox "La Localidad del domicilio del Depositante (" & Entidad_Depositante.Entidad_Domicilio.Localidad.Nombre & "), no tiene especificado el Partido al cual pertenece." & vbCr & "Por favor, especifíquelo en la tabla de Localidades.", vbExclamation, App.Title
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    
    If MsgBox("¿Desea generar el Certificado de Depósito?", vbQuestion + vbYesNo, App.Title) = vbNo Then
        Set Entidad_Depositante = Nothing
        Exit Sub
    End If
    
    With mFormulario1116A_Cabecera
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
        
        .IDCosecha = CLng(datcboCosecha.BoundText)
        .IDCereal = CLng(datcboCereal.BoundText)
        
        .Origen_IDPartido = CLng(datcboPartido.BoundText)
        
        'LUGAR ENTREGA
        Set Entidad_OrigenDestino = New Entidad_OrigDest
        Entidad_OrigenDestino.IDEntidad = .DepositarioIDEntidad
        Entidad_OrigenDestino.IDOrigenDestino = .DepositarioIDPlanta
        If Entidad_OrigenDestino.Load() Then
            .LugarEntregaDescripcion = "Planta Nº " & Entidad_OrigenDestino.ONCCA_Codigo_Formatted & " - " & Entidad_OrigenDestino.Direccion & " - " & Entidad_OrigenDestino.Localidad.Nombre
            .LugarEntregaIDProvincia = Entidad_OrigenDestino.Localidad.IDProvincia
            .LugarYFecha = Entidad_OrigenDestino.Localidad.Nombre & ", " & Format(dtpFecha.Value, "dd \d\e mmmm \d\e yyyy")
        End If
        Set Entidad_OrigenDestino = Nothing
        
        .GastoIDCondicionPago = Val(datcboCondicionPago.BoundText)
        
        'AGREGO LOS ID DE LOS MOVIMIENTOS
        tdbgrdData.Visible = False
        tdbgrdData.MoveFirst
        Set .CFormulario1116A_Detalle = New Collection
        Do While Not tdbgrdData.EOF
            If CBool(tdbgrdData.Columns(GRID_COLUMN_SELECT).Value) Then
                Set Formulario1116A_Detalle = New F1116A_Detalle
                Formulario1116A_Detalle.IDMovimiento_Cereal = CLng(tdbgrdData.Columns(GRID_COLUMN_IDMOVIMIENTO).Value)
                .CFormulario1116A_Detalle.Add Formulario1116A_Detalle
            End If
            tdbgrdData.MoveNext
        Loop
        Set Formulario1116A_Detalle = Nothing
        tdbgrdData.MoveFirst
        tdbgrdData.Visible = True
        tdbgrdData.ReBind
                
        .RefreshListSkip = True
        If Not .Update Then
            Exit Sub
        End If
    End With
    
    Set Entidad_Depositante = Nothing
    
    MsgBox "Se ha generado el Certificado de Depósito.", vbInformation, App.Title
    
    Call RefreshList_Module.Formulario1116A(mFormulario1116A_Cabecera.IDFormulario1116A)
    
    Unload Me
End Sub

Private Sub RefreshTotals()
    txtMovimientoSeleccionado.Text = mCantidadCPSeleccionada
    
    txtKilogramoNeto.Text = Format(mKilogramoNeto, "#,##0")
    txtMermaZarandeo.Text = Format(mMermaZarandeo, "#,##0")
    txtMermaHumedad.Text = Format(mMermaHumedad, "#,##0")
    txtMermaVolatil.Text = Format(mMermaVolatil, "#,##0")
    txtKilogramoFinal.Text = Format(mKilogramoFinal, "#,##0")
End Sub

Public Sub SetTrueDBGridAppearance()
    With tdbgrdData
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
        
        '.MultipleLines = IIf(pParametro.GridMultipleLines, TrueOleDBGrid80.MultipleLinesConstants.dbgMultipleVariable, TrueOleDBGrid80.MultipleLinesConstants.dbgDisabled)
    End With
End Sub

Public Sub FillComboBox_Partido()
    If Val(datcboDepositante.BoundText) = 0 Or Val(datcboCosecha.BoundText) = 0 Or Val(datcboCereal.BoundText) = 0 Then
        Set datcboPartido.DataSource = Nothing
        Exit Sub
    End If
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboPartido, "usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido " & Left(datcboPlanta.BoundText, Len(datcboPlanta.BoundText) - 5) & ", " & Val(Right(datcboPlanta.BoundText, 5)) & ", " & datcboDepositante.BoundText & ", " & datcboCosecha.BoundText & ", " & datcboCereal.BoundText & ", " & CSM_String.FormatDateTimeToSQL(dtpFechaDescarga_Desde.Value) & ", " & CSM_String.FormatDateTimeToSQL(dtpFechaDescarga_Hasta.Value), "IDPartido", "Nombre", "Partidos", cscpNone)
End Sub
