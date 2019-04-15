VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Begin VB.Form frmMovimiento_SubProducto_Lista 
   Caption         =   "Movimientos de SubProductos"
   ClientHeight    =   6735
   ClientLeft      =   2610
   ClientTop       =   2940
   ClientWidth     =   14085
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Movimiento_SubProducto_Lista.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   6735
   ScaleWidth      =   14085
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   1800
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   14085
      _ExtentX        =   24844
      _ExtentY        =   3175
      BandCount       =   7
      FixedOrder      =   -1  'True
      _CBWidth        =   14085
      _CBHeight       =   1800
      _Version        =   "6.7.9782"
      Child1          =   "tlbMain"
      MinWidth1       =   9165
      MinHeight1      =   570
      Width1          =   9165
      FixedBackground1=   0   'False
      Key1            =   "Toolbar"
      NewRow1         =   0   'False
      AllowVertical1  =   0   'False
      Child2          =   "picTipo"
      MinWidth2       =   4155
      MinHeight2      =   450
      Width2          =   4155
      FixedBackground2=   0   'False
      Key2            =   "Tipo"
      NewRow2         =   0   'False
      AllowVertical2  =   0   'False
      Child3          =   "picPlanta"
      MinWidth3       =   3870
      MinHeight3      =   360
      Width3          =   3870
      FixedBackground3=   0   'False
      Key3            =   "Planta"
      NewRow3         =   0   'False
      AllowVertical3  =   0   'False
      Child4          =   "picComprobanteNumero"
      MinWidth4       =   5535
      MinHeight4      =   360
      Width4          =   5535
      FixedBackground4=   0   'False
      Key4            =   "ComprobanteNumero"
      NewRow4         =   0   'False
      AllowVertical4  =   0   'False
      Child5          =   "picFecha"
      MinWidth5       =   6720
      MinHeight5      =   360
      Width5          =   6720
      FixedBackground5=   0   'False
      Key5            =   "Fecha"
      NewRow5         =   0   'False
      AllowVertical5  =   0   'False
      Child6          =   "picEntidad_Destinatario"
      MinWidth6       =   5370
      MinHeight6      =   360
      Width6          =   5370
      FixedBackground6=   0   'False
      Key6            =   "Entidad_Destinatario"
      NewRow6         =   0   'False
      AllowVertical6  =   0   'False
      Child7          =   "picEntidad_Transportista"
      MinWidth7       =   5370
      MinHeight7      =   360
      Width7          =   5370
      FixedBackground7=   0   'False
      Key7            =   "Entidad_Transportista"
      NewRow7         =   0   'False
      AllowVertical7  =   0   'False
      Begin VB.PictureBox picTipo 
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Left            =   9840
         ScaleHeight     =   450
         ScaleWidth      =   4155
         TabIndex        =   32
         Top             =   90
         Width           =   4155
         Begin VB.CheckBox chkTipo_AjusteSube 
            Height          =   210
            Left            =   1920
            TabIndex        =   38
            Top             =   210
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_EntradaProduccion 
            Height          =   210
            Left            =   480
            TabIndex        =   37
            Top             =   0
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_SalidaVenta 
            Height          =   210
            Left            =   480
            TabIndex        =   36
            Top             =   210
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_AjusteBaja 
            Height          =   210
            Left            =   1920
            TabIndex        =   35
            Top             =   0
            Value           =   1  'Checked
            Width           =   1395
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
            Left            =   3420
            TabIndex        =   34
            Top             =   0
            Width           =   735
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
            Left            =   3420
            TabIndex        =   33
            Top             =   190
            Width           =   735
         End
         Begin VB.Label lblTipo 
            AutoSize        =   -1  'True
            Caption         =   "Tipo:"
            Height          =   210
            Left            =   0
            TabIndex        =   39
            Top             =   90
            Width           =   345
         End
      End
      Begin VB.PictureBox picPlanta 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   3870
         TabIndex        =   29
         Top             =   630
         Width           =   3870
         Begin VB.ComboBox cboPlanta 
            Height          =   330
            Left            =   660
            Style           =   2  'Dropdown List
            TabIndex        =   30
            Top             =   0
            Width           =   3195
         End
         Begin VB.Label lblPlanta 
            AutoSize        =   -1  'True
            Caption         =   "Planta:"
            Height          =   210
            Left            =   0
            TabIndex        =   31
            Top             =   60
            Width           =   480
         End
      End
      Begin VB.PictureBox picComprobanteNumero 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   4260
         ScaleHeight     =   360
         ScaleWidth      =   9735
         TabIndex        =   3
         Top             =   630
         Width           =   9735
         Begin VB.TextBox txtComprobanteNumero_Hasta 
            Height          =   315
            Left            =   4200
            MaxLength       =   12
            TabIndex        =   8
            Tag             =   "STRING|EMPTY|NUMBERS|12"
            Top             =   0
            Width           =   1335
         End
         Begin VB.ComboBox cboComprobanteNumero 
            Height          =   330
            Left            =   1320
            Style           =   2  'Dropdown List
            TabIndex        =   5
            Top             =   0
            Width           =   1215
         End
         Begin VB.TextBox txtComprobanteNumero_Desde 
            Height          =   315
            Left            =   2580
            MaxLength       =   12
            TabIndex        =   6
            Tag             =   "STRING|EMPTY|NUMBERS|12"
            Top             =   0
            Width           =   1335
         End
         Begin VB.Label lblComprobanteNumero 
            AutoSize        =   -1  'True
            Caption         =   "Comprobante:"
            Height          =   210
            Left            =   60
            TabIndex        =   4
            Top             =   60
            Width           =   1005
         End
         Begin VB.Label lblComprobanteNumero_Y 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   4020
            TabIndex        =   7
            Top             =   60
            Width           =   90
         End
      End
      Begin VB.PictureBox picEntidad_Destinatario 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   8625
         ScaleHeight     =   360
         ScaleWidth      =   5370
         TabIndex        =   22
         Top             =   1020
         Width           =   5370
         Begin VB.ComboBox cboEntidad_Destinatario 
            Height          =   330
            Left            =   1140
            Style           =   2  'Dropdown List
            TabIndex        =   24
            Top             =   0
            Width           =   4215
         End
         Begin VB.Label lblEntidad_Destinatario 
            AutoSize        =   -1  'True
            Caption         =   "Destinatario:"
            Height          =   210
            Left            =   0
            TabIndex        =   23
            Top             =   60
            Width           =   900
         End
      End
      Begin VB.PictureBox picEntidad_Transportista 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   13830
         TabIndex        =   25
         Top             =   1410
         Width           =   13830
         Begin VB.ComboBox cboEntidad_Transportista 
            Height          =   330
            Left            =   1140
            Style           =   2  'Dropdown List
            TabIndex        =   27
            Top             =   0
            Width           =   4215
         End
         Begin VB.Label lblEntidad_Transportista 
            AutoSize        =   -1  'True
            Caption         =   "Transportista:"
            Height          =   210
            Left            =   0
            TabIndex        =   26
            Top             =   60
            Width           =   1005
         End
      End
      Begin VB.PictureBox picFecha 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   8235
         TabIndex        =   9
         Top             =   1020
         Width           =   8235
         Begin VB.ComboBox cboFecha 
            Height          =   330
            Left            =   600
            Style           =   2  'Dropdown List
            TabIndex        =   11
            Top             =   0
            Width           =   1035
         End
         Begin VB.CommandButton cmdFecha_DesdeSiguiente 
            Height          =   315
            Left            =   3420
            Picture         =   "Movimiento_SubProducto_Lista.frx":0CCA
            Style           =   1  'Graphical
            TabIndex        =   13
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFecha_DesdeHoy 
            Height          =   315
            Left            =   3720
            Picture         =   "Movimiento_SubProducto_Lista.frx":1254
            Style           =   1  'Graphical
            TabIndex        =   16
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.CommandButton cmdFecha_HastaAnterior 
            Height          =   315
            Left            =   4320
            Picture         =   "Movimiento_SubProducto_Lista.frx":139E
            Style           =   1  'Graphical
            TabIndex        =   18
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFecha_HastaSiguiente 
            Height          =   315
            Left            =   6060
            Picture         =   "Movimiento_SubProducto_Lista.frx":1928
            Style           =   1  'Graphical
            TabIndex        =   20
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFecha_HastaHoy 
            Height          =   315
            Left            =   6360
            Picture         =   "Movimiento_SubProducto_Lista.frx":1EB2
            Style           =   1  'Graphical
            TabIndex        =   21
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.TextBox txtFecha_DiaSemana 
            Height          =   315
            Left            =   1680
            Locked          =   -1  'True
            TabIndex        =   15
            TabStop         =   0   'False
            Top             =   0
            Visible         =   0   'False
            Width           =   1050
         End
         Begin VB.CommandButton cmdFecha_DesdeAnterior 
            Height          =   315
            Left            =   1680
            Picture         =   "Movimiento_SubProducto_Lista.frx":1FFC
            Style           =   1  'Graphical
            TabIndex        =   12
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin MSComCtl2.DTPicker dtpFecha_Desde 
            Height          =   315
            Left            =   1980
            TabIndex        =   14
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
            Format          =   100859905
            CurrentDate     =   36950
         End
         Begin MSComCtl2.DTPicker dtpFecha_Hasta 
            Height          =   315
            Left            =   4620
            TabIndex        =   19
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
            Format          =   100859905
            CurrentDate     =   36950
         End
         Begin VB.Label lblFecha 
            AutoSize        =   -1  'True
            Caption         =   "Fecha:"
            Height          =   210
            Left            =   0
            TabIndex        =   10
            Top             =   60
            Width           =   495
         End
         Begin VB.Label lblFecha_Y 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   4140
            TabIndex        =   17
            Top             =   60
            Visible         =   0   'False
            Width           =   90
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   2
         Top             =   30
         Width           =   9585
         _ExtentX        =   16907
         _ExtentY        =   1005
         ButtonWidth     =   2170
         ButtonHeight    =   1005
         ToolTips        =   0   'False
         AllowCustomize  =   0   'False
         Wrappable       =   0   'False
         Style           =   1
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   6
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "&Nuevo"
               Key             =   "NEW"
               Style           =   5
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
               Caption         =   "Imprimir"
               Key             =   "PRINT"
               Style           =   5
            EndProperty
            BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Tareas"
               Key             =   "TASKS"
               Style           =   5
               BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
                  NumButtonMenus  =   4
                  BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "RECALCULAR_KILOGRAMOS"
                     Text            =   "Recalcular Kilogramos"
                  EndProperty
                  BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "RECALCULAR_ACONDICIONAMIENTO"
                     Text            =   "Recalcular Acondicionamiento"
                  EndProperty
                  BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Text            =   "-"
                  EndProperty
                  BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "VERIFY_DATA"
                     Text            =   "Verificar Datos"
                  EndProperty
               EndProperty
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   360
      Left            =   0
      TabIndex        =   28
      Top             =   6375
      Width           =   14085
      _ExtentX        =   24844
      _ExtentY        =   635
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   24315
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
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   3915
      Left            =   120
      TabIndex        =   0
      Top             =   2220
      Width           =   13035
      _ExtentX        =   22992
      _ExtentY        =   6906
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDMovimiento_SubProducto"
      Columns(0).DataField=   "IDMovimiento_SubProducto"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   16
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Tipo"
      Columns(1).DataField=   "Tipo"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "N° Comprobante"
      Columns(2).DataField=   "ComprobanteNumero"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Fecha"
      Columns(3).DataField=   "Fecha"
      Columns(3).NumberFormat=   "Short Date"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "Planta"
      Columns(4).DataField=   "Planta_Nombre"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Destinatario"
      Columns(5).DataField=   "Entidad_Destinatario_Nombre"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Transportista"
      Columns(6).DataField=   "Entidad_Transportista_Nombre"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   7
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
      Splits(0)._ColumnProps(10)=   "Column(1).Width=2223"
      Splits(0)._ColumnProps(11)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(12)=   "Column(1)._WidthInPix=2143"
      Splits(0)._ColumnProps(13)=   "Column(1)._EditAlways=0"
      Splits(0)._ColumnProps(14)=   "Column(1)._ColStyle=8705"
      Splits(0)._ColumnProps(15)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(16)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(17)=   "Column(2).Width=2805"
      Splits(0)._ColumnProps(18)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(19)=   "Column(2)._WidthInPix=2725"
      Splits(0)._ColumnProps(20)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(21)=   "Column(2)._ColStyle=8704"
      Splits(0)._ColumnProps(22)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(23)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(24)=   "Column(3).Width=2249"
      Splits(0)._ColumnProps(25)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(26)=   "Column(3)._WidthInPix=2170"
      Splits(0)._ColumnProps(27)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(28)=   "Column(3)._ColStyle=8708"
      Splits(0)._ColumnProps(29)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(30)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(31)=   "Column(4).Width=2831"
      Splits(0)._ColumnProps(32)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(33)=   "Column(4)._WidthInPix=2752"
      Splits(0)._ColumnProps(34)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(35)=   "Column(4)._ColStyle=8708"
      Splits(0)._ColumnProps(36)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(37)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(38)=   "Column(5).Width=5159"
      Splits(0)._ColumnProps(39)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(40)=   "Column(5)._WidthInPix=5080"
      Splits(0)._ColumnProps(41)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(42)=   "Column(5)._ColStyle=8704"
      Splits(0)._ColumnProps(43)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(44)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(45)=   "Column(6).Width=4498"
      Splits(0)._ColumnProps(46)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(47)=   "Column(6)._WidthInPix=4419"
      Splits(0)._ColumnProps(48)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(49)=   "Column(6)._ColStyle=8704"
      Splits(0)._ColumnProps(50)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(51)=   "Column(6).Order=7"
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
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=54,.parent=13,.alignment=2,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=51,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=52,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=53,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=90,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=87,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=88,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=89,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=46,.parent=13,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=44,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=45,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=110,.parent=13,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=107,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=108,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=109,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=50,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=48,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=49,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=32,.parent=13,.alignment=0,.locked=-1"
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
Attribute VB_Name = "frmMovimiento_SubProducto_Lista"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mLoading As Boolean
Private mColumnsResized As Boolean

Private mKeyDecimal As Boolean

Private mOrderColumn As Long
Private mOrderAscending As Boolean

Private mRecordSelectionFormula As String

Private mstrSQLWhere As String

Private Const REPORT_FILENAME_PREFIX As String = "Movimiento SubProducto - "

Public Function Startup() As Boolean
    mLoading = True

    Load frmMovimiento_SubProducto_Lista
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal IDMovimiento_SubProducto As Long) As Boolean
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim recData As ADODB.Recordset
        
    Dim SaveIDMovimiento_SubProducto As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDMovimiento_SubProducto = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDMovimiento_SubProducto = tdbgrdData.Columns("IDMovimiento_SubProducto").Value
        End If
    Else
        SaveIDMovimiento_SubProducto = IDMovimiento_SubProducto
    End If
    
    Set recData = New ADODB.Recordset
        
    strSQLSelect = "SELECT Movimiento_SubProducto.IDMovimiento_SubProducto, Movimiento_SubProducto.Tipo, Movimiento_SubProducto.ComprobanteNumero, Movimiento_SubProducto.Fecha, Entidad_OrigenDestino_Origen.Nombre AS Planta_Nombre, Entidad_Destinatario.Nombre AS Entidad_Destinatario_Nombre, Entidad_Transportista.Nombre AS Entidad_Transportista_Nombre" & vbCr
    strSQLFrom = "FROM ((Movimiento_SubProducto INNER JOIN Entidad_OrigenDestino AS Entidad_OrigenDestino_Origen ON Movimiento_SubProducto.IDEntidad_Titular = Entidad_OrigenDestino_Origen.IDEntidad AND Movimiento_SubProducto.IDOrigenDestino_Origen = Entidad_OrigenDestino_Origen.IDOrigenDestino) LEFT JOIN Entidad AS Entidad_Destinatario ON Movimiento_SubProducto.IDEntidad_Destinatario = Entidad_Destinatario.IDEntidad) LEFT JOIN Entidad AS Entidad_Transportista ON Movimiento_SubProducto.IDEntidad_Transportista = Entidad_Transportista.IDEntidad" & vbCr
    
    'WHERE
    mstrSQLWhere = ""
    mRecordSelectionFormula = ""
    
    'MOVIMIENTO TIPO
    If chkTipo_EntradaProduccion.Value = vbUnchecked And chkTipo_SalidaVenta.Value = vbUnchecked And chkTipo_AjusteBaja.Value = vbUnchecked And chkTipo_AjusteSube.Value = vbUnchecked Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Tipo = ''"
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "Movimiento_SubProducto.Tipo = ''"
    Else
        If chkTipo_EntradaProduccion.Value = vbUnchecked Or chkTipo_SalidaVenta.Value = vbUnchecked Or chkTipo_AjusteBaja.Value = vbUnchecked Or chkTipo_AjusteSube.Value = vbUnchecked Then
            'COMIENZO EL PARENTESIS PARA LOS OR
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "("
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "("
            
            If chkTipo_EntradaProduccion.Value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_SubProducto.Tipo = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_SubProducto.Tipo} = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION & "'"
            End If
            If chkTipo_SalidaVenta.Value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_SubProducto.Tipo = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_SubProducto.Tipo} = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA & "'"
            End If
            If chkTipo_AjusteBaja.Value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_SubProducto.Tipo = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_SubProducto.Tipo} = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA & "'"
            End If
            If chkTipo_AjusteSube.Value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_SubProducto.Tipo = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_SubProducto.Tipo} = '" & MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE & "'"
            End If
            
            'CIERRO EL PARENTESIS
            mstrSQLWhere = mstrSQLWhere & ")"
            mRecordSelectionFormula = mRecordSelectionFormula & ")"
        End If
    End If
    
    'NUMERO DE COMPROBANTE
    Select Case cboComprobanteNumero.ListIndex
        Case 0  'ALL
        Case 1 To 6
            If Len(Trim(txtComprobanteNumero_Desde.Text)) = 12 Then
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.ComprobanteNumero " & cboComprobanteNumero.Text & " '" & CSM_String.ReplaceQuote(txtComprobanteNumero_Desde.Text) & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.ComprobanteNumero} " & cboComprobanteNumero.Text & " '" & CSM_String.ReplaceQuote(txtComprobanteNumero_Desde.Text) & "'"
            End If
        Case 7  'BETWEEN
            If Len(Trim(txtComprobanteNumero_Desde.Text)) = 12 And Len(Trim(txtComprobanteNumero_Hasta.Text)) = 12 Then
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.ComprobanteNumero BETWEEN '" & CSM_String.ReplaceQuote(txtComprobanteNumero_Desde.Text) & "' AND '" & CSM_String.ReplaceQuote(txtComprobanteNumero_Hasta.Text) & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.ComprobanteNumero} >= '" & CSM_String.ReplaceQuote(txtComprobanteNumero_Desde.Text) & "' AND {Movimiento_SubProducto.ComprobanteNumero} <= '" & CSM_String.ReplaceQuote(txtComprobanteNumero_Hasta.Text) & "'"
            End If
    End Select
    
    'FECHA
    Select Case cboFecha.ListIndex
        Case 0  'ALL
        Case 1  'EQUAL
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha BETWEEN '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.Fecha} >= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_SubProducto.Fecha} <= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 2  'GREATER
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha > '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.Fecha} > CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 3  'GREATER OR EQUAL
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha >= '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 00:00:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.Fecha} >= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 4  'MINOR
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha < '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 00:00:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.Fecha} < CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 0, 0, 0)"
        Case 5  'MINOR OR EQUAL
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha <= '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.Fecha} <= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
        Case 6  'NOT EQUAL
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha NOT BETWEEN '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(NOT ({Movimiento_SubProducto.Fecha} >= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_SubProducto.Fecha} <= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 23, 59, 59)))"
        Case 7  'BETWEEN
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.Fecha BETWEEN '" & Format(dtpFecha_Desde.Value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFecha_Hasta.Value, "yyyy/mm/dd") & " 23:59:00'"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.Fecha} >= CDateTime(" & Format(dtpFecha_Desde.Value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_SubProducto.Fecha} <= CDateTime(" & Format(dtpFecha_Hasta.Value, "yyyy, mm, dd") & ", 23, 59, 59)"
    End Select
    
    'ENTIDAD DESTINATARIO
    If cboEntidad_Destinatario.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.IDEntidad_Destinatario = " & cboEntidad_Destinatario.ItemData(cboEntidad_Destinatario.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.IDEntidad_Destinatario} = " & cboEntidad_Destinatario.ItemData(cboEntidad_Destinatario.ListIndex)
    End If
    
    'ENTIDAD TRANSPORTISTA
    If cboEntidad_Transportista.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_SubProducto.IDEntidad_Transportista = " & cboEntidad_Transportista.ItemData(cboEntidad_Transportista.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_SubProducto.IDEntidad_Transportista} = " & cboEntidad_Transportista.ItemData(cboEntidad_Transportista.ListIndex)
    End If
        
    If mstrSQLWhere <> "" Then
        mstrSQLWhere = mstrSQLWhere & vbCr
    End If
    
    recData.Open strSQLSelect & strSQLFrom & mstrSQLWhere, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    Set tdbgrdData.DataSource = recData
    
    Call SortColumn(mOrderColumn)

    recData.Find "IDMovimiento_SubProducto = " & SaveIDMovimiento_SubProducto
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Movimientos de SubProductos."
        Case 1
            stbMain.SimpleText = "1 Movimiento de SubProducto."
        Case Else
            stbMain.SimpleText = RecordCount & " Movimientos de SubProductos."
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
    ShowErrorMessage "Forms.Movimiento_SubProducto_List.LoadData", "Error al leer los Movimientos de SubProductos."
    On Error Resume Next
    If recData.State = adStateOpen Then
        recData.Close
    End If
    Set recData = Nothing
End Function

Private Sub Form_Load()
    Dim ValueItem As TrueOleDBGrid80.ValueItem
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
    tlbMain.buttons("PRINT").Image = "PRINT"
    tlbMain.buttons("TASKS").Image = "TASKS"
    '//////////////////////////////////////////////////////////
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS SUBMENUES DE NUEVO
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA, MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , , "-"
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA, MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE, MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE_NOMBRE
    
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
    
    chkTipo_EntradaProduccion.Caption = MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION_NOMBRECORTO
    chkTipo_SalidaVenta.Caption = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA_NOMBRECORTO
    chkTipo_AjusteBaja.Caption = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA_NOMBRECORTO
    chkTipo_AjusteSube.Caption = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE_NOMBRECORTO
    
    cboComprobanteNumero.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboComprobanteNumero.AddItem "="
    cboComprobanteNumero.AddItem ">"
    cboComprobanteNumero.AddItem ">="
    cboComprobanteNumero.AddItem "<"
    cboComprobanteNumero.AddItem "<="
    cboComprobanteNumero.AddItem "<>"
    cboComprobanteNumero.AddItem "Entre"
    cboComprobanteNumero.ListIndex = 0
    
    cboFecha.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboFecha.AddItem "="
    cboFecha.AddItem ">"
    cboFecha.AddItem ">="
    cboFecha.AddItem "<"
    cboFecha.AddItem "<="
    cboFecha.AddItem "<>"
    cboFecha.AddItem "Entre"
    cboFecha.ListIndex = 7
    
    dtpFecha_Desde.Value = DateAdd("d", -7, Date)
    txtFecha_DiaSemana.Text = WeekdayName(Weekday(dtpFecha_Desde.Value))
    dtpFecha_Hasta.Value = Date
    
    Call FillComboBox_Planta
    Call FillComboBox_Entidad_Destinatario
    Call FillComboBox_Entidad_Transportista
        
    'AGREGO LOS VALUE ITEMS DE LA COLUMNA TIPO
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.Value = MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION
    ValueItem.DisplayValue = MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.Value = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA
    ValueItem.DisplayValue = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.Value = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA
    ValueItem.DisplayValue = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.Value = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE
    ValueItem.DisplayValue = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Call SetTrueDBGridAppearance
    Call CSM_Parameter_TrueDBGrid.GetSettings(Mid(Me.Name, 4), tdbgrdData)
    
    mOrderColumn = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", 4, csrdtNumberInteger)
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

Public Sub SetTrueDBGridAppearance()
    With tdbgrdData
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
        
        '.MultipleLines = IIf(pParametro.GridMultipleLines, TrueOleDBGrid80.MultipleLinesConstants.dbgMultipleVariable, TrueOleDBGrid80.MultipleLinesConstants.dbgDisabled)
        
        '.Columns("KilogramoFinal").Visible = pParametro.Movimiento_SubProducto_Lista_Columna_KilogramoFinal_Mostrar
    End With
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If mColumnsResized Then
        Call CSM_Parameter_TrueDBGrid.SaveSettings(Mid(Me.Name, 4), tdbgrdData)
    End If
    Call CSM_Parameter_CoolBar.SaveSettings(Mid(Me.Name, 4), cbrMain)
    
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Column", mOrderColumn)
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\" & Mid(Me.Name, 4), "Grid_Order_Ascending", mOrderAscending)
    
    Set frmMovimiento_SubProducto_Lista = Nothing
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Movimiento_SubProducto As Movimiento_SubProducto

    Select Case Button.Key
        Case "PROPERTIES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento seleccionado para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            Set Movimiento_SubProducto = New Movimiento_SubProducto
            Movimiento_SubProducto.IDMovimiento_SubProducto = tdbgrdData.Columns("IDMovimiento_SubProducto").Value
            If Movimiento_SubProducto.Load() Then
                If frmMovimiento_SubProducto_Detalle.Startup(Movimiento_SubProducto) Then
                    If frmMovimiento_SubProducto_Detalle.LoadData() Then
                        frmMovimiento_SubProducto_Detalle.Show
                        frmMovimiento_SubProducto_Detalle.SetFocus
                    Else
                        Unload frmMovimiento_SubProducto_Detalle
                        Set frmMovimiento_SubProducto_Detalle = Nothing
                    End If
                Else
                    Unload frmMovimiento_SubProducto_Detalle
                    Set frmMovimiento_SubProducto_Detalle = Nothing
                End If
            End If
            Set Movimiento_SubProducto = Nothing
            
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento de SubProducto seleccionado para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            
            Set Movimiento_SubProducto = New Movimiento_SubProducto
            Movimiento_SubProducto.IDMovimiento_SubProducto = tdbgrdData.Columns("IDMovimiento_SubProducto").Value
            If Movimiento_SubProducto.Load() Then
                If MsgBox("¿Desea eliminar este Movimiento de SubProducto?", vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
                    Movimiento_SubProducto.Delete
                End If
            End If
            Set Movimiento_SubProducto = Nothing
            tdbgrdData.SetFocus
            
        Case "COPY"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento de SubProducto seleccionado para copiar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Movimiento_SubProducto = New Movimiento_SubProducto
            
            Movimiento_SubProducto.IDMovimiento_SubProducto = tdbgrdData.Columns("IDMovimiento_SubProducto").Value
            If Movimiento_SubProducto.Copy() Then
                If frmMovimiento_SubProducto_Detalle.Startup(Movimiento_SubProducto) Then
                    If frmMovimiento_SubProducto_Detalle.LoadData Then
                        frmMovimiento_SubProducto_Detalle.Show
                        frmMovimiento_SubProducto_Detalle.SetFocus
                    Else
                        Unload frmMovimiento_SubProducto_Detalle
                        Set frmMovimiento_SubProducto_Detalle = Nothing
                    End If
                Else
                    Unload frmMovimiento_SubProducto_Detalle
                    Set frmMovimiento_SubProducto_Detalle = Nothing
                End If
            Else
                Unload frmMovimiento_SubProducto_Detalle
                Set frmMovimiento_SubProducto_Detalle = Nothing
            End If
            
            Set Movimiento_SubProducto = Nothing
            
        Case "PRINT"
            If tlbMain.buttons("PRINT").ButtonMenus.Count = 1 Then
                Call tlbMain_ButtonMenuClick(tlbMain.buttons("PRINT").ButtonMenus(1))
            End If
            
        Case "SELECT"
        
    End Select
End Sub

Private Sub tlbMain_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Dim Movimiento_SubProducto As Movimiento_SubProducto
    Dim recData As ADODB.Recordset
    Dim Report As CSC_Report
    
    Dim ExportPath As String

    Select Case ButtonMenu.Parent.Key
    
        Case "NEW"
            Set Movimiento_SubProducto = New Movimiento_SubProducto
            Movimiento_SubProducto.Tipo = ButtonMenu.Key
            If frmMovimiento_SubProducto_Detalle.Startup(Movimiento_SubProducto) Then
                frmMovimiento_SubProducto_Detalle.Show
                frmMovimiento_SubProducto_Detalle.SetFocus
            Else
                Unload frmMovimiento_SubProducto_Detalle
                Set frmMovimiento_SubProducto_Detalle = Nothing
            End If
    
        Case "PRINT"
            Select Case ButtonMenu.Key
                Case "PREDEFINED"
                Case Else   'REPORTES AUTOCARGABLES
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ningún Movimiento de SubProducto para imprimir.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                
                    Screen.MousePointer = vbHourglass
                    
                    Set Report = New CSC_Report
                    With Report
                        .ParentForm_hWnd = frmMDI.hwnd
                        .FILENAME = pDatabase.ReportsPath & ButtonMenu.Key & "." & REPORT_FILE_EXTENSION
                        .WindowTitle = ButtonMenu.Text & " - Remito Nº " & tdbgrdData.Columns("ComprobanteNumero").Value
                        If Right(ButtonMenu.Key, 4) = REPORT_PARAMETER_KEY Then
                            .ParameterAdd("@IDMovimiento_SubProducto", "", csrpdtNumberInteger, False, False, True).ParameterValue = tdbgrdData.Columns(0).Value
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
    
        '//////////////////////////////////////////////////////////////////////
        ' T A S K S
        '//////////////////////////////////////////////////////////////////////
        Case "TASKS"
    End Select
    
    Exit Sub
    
ErrorHandler:
    CSM_Error.ShowErrorMessage "Forms.Movimiento_SubProducto_Lista.Print", "Error al mostrar un Reporte."
End Sub

'============================================================
'Movimiento_SubProducto TIPO
Private Sub chkTipo_EntradaProduccion_Click()
    Call LoadData(0)
End Sub

Private Sub chkTipo_SalidaVenta_Click()
    Call LoadData(0)
End Sub

Private Sub chkTipo_AjusteBaja_Click()
    Call LoadData(0)
End Sub

Private Sub chkTipo_AjusteSube_Click()
    Call LoadData(0)
End Sub

Private Sub cmdTipo_Todos_Click()
    mLoading = True
    chkTipo_EntradaProduccion.Value = vbChecked
    chkTipo_SalidaVenta.Value = vbChecked
    chkTipo_AjusteBaja.Value = vbChecked
    chkTipo_AjusteSube.Value = vbChecked
    mLoading = False
    Call LoadData(0)
    tdbgrdData.SetFocus
End Sub

Private Sub cmdTipo_Ninguno_Click()
    mLoading = True
    chkTipo_EntradaProduccion.Value = vbUnchecked
    chkTipo_SalidaVenta.Value = vbUnchecked
    chkTipo_AjusteBaja.Value = vbUnchecked
    chkTipo_AjusteSube.Value = vbUnchecked
    mLoading = False
    Call LoadData(0)
    tdbgrdData.SetFocus
End Sub

'============================================================
'PLANTA
Private Sub cboPlanta_Click()
    Call LoadData(0)
End Sub

'============================================================
'CARTA PORTE NUMERO
Private Sub cboComprobanteNumero_Click()
    txtComprobanteNumero_Desde.Visible = (cboComprobanteNumero.ListIndex > 0)
    lblComprobanteNumero_Y.Visible = (cboComprobanteNumero.ListIndex = 7)
    txtComprobanteNumero_Hasta.Visible = (cboComprobanteNumero.ListIndex = 7)
    
    Call LoadData(0)
End Sub

'============================================================
'CARTA PORTE NUMERO DESDE
Private Sub txtComprobanteNumero_Desde_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtComprobanteNumero_Desde)
End Sub

Private Sub txtComprobanteNumero_Desde_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtComprobanteNumero_Desde_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtComprobanteNumero_Desde
End Sub

'============================================================
'CARTA PORTE NUMERO HASTA
Private Sub txtComprobanteNumero_Hasta_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtComprobanteNumero_Hasta)
End Sub

Private Sub txtComprobanteNumero_Hasta_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtComprobanteNumero_Hasta_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtComprobanteNumero_Hasta
End Sub

'============================================================
'FECHA CARGA
Private Sub cboFecha_Click()
    txtFecha_DiaSemana.Visible = (cboFecha.ListIndex > 0 And cboFecha.ListIndex < 7)
    cmdFecha_DesdeAnterior.Visible = (cboFecha.ListIndex > 0)
    dtpFecha_Desde.Visible = (cboFecha.ListIndex > 0)
    cmdFecha_DesdeSiguiente.Visible = (cboFecha.ListIndex > 0)
    cmdFecha_DesdeHoy.Visible = (cboFecha.ListIndex > 0)
    
    lblFecha_Y.Visible = (cboFecha.ListIndex = 7)
    
    cmdFecha_HastaAnterior.Visible = (cboFecha.ListIndex = 7)
    dtpFecha_Hasta.Visible = (cboFecha.ListIndex = 7)
    cmdFecha_HastaSiguiente.Visible = (cboFecha.ListIndex = 7)
    cmdFecha_HastaHoy.Visible = (cboFecha.ListIndex = 7)
    
    cmdFecha_DesdeAnterior.Left = 1680
    dtpFecha_Desde.Left = 1980
    cmdFecha_DesdeSiguiente.Left = 3400
    cmdFecha_DesdeHoy.Left = 3720
    
    If cboFecha.ListIndex > 0 And cboFecha.ListIndex < 7 Then
        cmdFecha_DesdeAnterior.Left = cmdFecha_DesdeAnterior.Left + txtFecha_DiaSemana.Width
        dtpFecha_Desde.Left = dtpFecha_Desde.Left + txtFecha_DiaSemana.Width
        cmdFecha_DesdeSiguiente.Left = cmdFecha_DesdeSiguiente.Left + txtFecha_DiaSemana.Width
        cmdFecha_DesdeHoy.Left = cmdFecha_DesdeHoy.Left + txtFecha_DiaSemana.Width
    End If
    
    Call LoadData(0)
End Sub

Private Sub cmdFecha_DesdeAnterior_Click()
    dtpFecha_Desde.Value = DateAdd("d", -1, dtpFecha_Desde.Value)
    dtpFecha_Desde.SetFocus
    dtpFecha_Desde_Change
End Sub

Private Sub dtpFecha_Desde_Change()
    txtFecha_DiaSemana.Text = WeekdayName(Weekday(dtpFecha_Desde.Value))
    Call LoadData(0)
End Sub

Private Sub cmdFecha_DesdeSiguiente_Click()
    dtpFecha_Desde.Value = DateAdd("d", 1, dtpFecha_Desde.Value)
    dtpFecha_Desde.SetFocus
    dtpFecha_Desde_Change
End Sub

Private Sub cmdFecha_DesdeHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFecha_Desde.Value
    dtpFecha_Desde.Value = Date
    dtpFecha_Desde.SetFocus
    If OldValue <> dtpFecha_Desde.Value Then
        dtpFecha_Desde_Change
    End If
End Sub

Private Sub cmdFecha_HastaAnterior_Click()
    dtpFecha_Hasta.Value = DateAdd("d", -1, dtpFecha_Hasta.Value)
    dtpFecha_Hasta.SetFocus
    dtpFecha_Hasta_Change
End Sub

Private Sub dtpFecha_Hasta_Change()
    Call LoadData(0)
End Sub

Private Sub cmdFecha_HastaSiguiente_Click()
    dtpFecha_Hasta.Value = DateAdd("d", 1, dtpFecha_Hasta.Value)
    dtpFecha_Hasta.SetFocus
    dtpFecha_Hasta_Change
End Sub

Private Sub cmdFecha_HastaHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFecha_Hasta.Value
    dtpFecha_Hasta.Value = Date
    dtpFecha_Hasta.SetFocus
    If OldValue <> dtpFecha_Hasta.Value Then
        dtpFecha_Hasta_Change
    End If
End Sub

'============================================================
'ENTIDADES
Private Sub cboEntidad_Destinatario_Click()
    Call LoadData(0)
End Sub

Private Sub cboEntidad_Transportista_Click()
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

Public Function FillComboBox_Planta() As Boolean
    Dim SaveItemData As Long
    
    If cboPlanta.ListIndex > -1 Then
        SaveItemData = cboPlanta.ItemData(cboPlanta.ListIndex)
    Else
        SaveItemData = pParametro.Planta_IDDefault
    End If
    cboPlanta.Clear
    cboPlanta.AddItem ITEM_ALL_FEMALE
    Call CSM_Control_ComboBox.FillFromSQL(cboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, 1, NULL, NULL", "ID", "Nombre", "Plantas", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Entidad_Destinatario() As Boolean
    Dim SaveItemData As Long
    
    If cboEntidad_Destinatario.ListIndex > -1 Then
        SaveItemData = cboEntidad_Destinatario.ItemData(cboEntidad_Destinatario.ListIndex)
    End If
    cboEntidad_Destinatario.Clear
    cboEntidad_Destinatario.AddItem CSM_Constant.ITEM_ALL_MALE
    Call CSM_Control_ComboBox.FillFromSQL(cboEntidad_Destinatario, "usp_Entidad_ClienteSubProducto_List 0, 1, NULL", "IDEntidad", "Nombre", "Destinatarios", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Entidad_Transportista() As Boolean
    Dim SaveItemData As Long
    
    If cboEntidad_Transportista.ListIndex > -1 Then
        SaveItemData = cboEntidad_Transportista.ItemData(cboEntidad_Transportista.ListIndex)
    End If
    cboEntidad_Transportista.Clear
    cboEntidad_Transportista.AddItem CSM_Constant.ITEM_ALL_MALE
    Call CSM_Control_ComboBox.FillFromSQL(cboEntidad_Transportista, "usp_Entidad_Transportista_List 0, 1, NULL", "IDEntidad", "Nombre", "Transportistas", cscpItemOrFirst, SaveItemData, False)
End Function
