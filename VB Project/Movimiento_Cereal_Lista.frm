VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{38911DA0-E448-11D0-84A3-00DD01104159}#1.1#0"; "COMCT332.OCX"
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmMovimiento_Cereal_Lista 
   Caption         =   "Movimientos de Cereal"
   ClientHeight    =   6825
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13245
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Movimiento_Cereal_Lista.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   6825
   ScaleWidth      =   13245
   Begin ComCtl3.CoolBar cbrMain 
      Align           =   1  'Align Top
      Height          =   3450
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   13245
      _ExtentX        =   23363
      _ExtentY        =   6085
      BandCount       =   18
      FixedOrder      =   -1  'True
      _CBWidth        =   13245
      _CBHeight       =   3450
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
      MinWidth2       =   5580
      MinHeight2      =   450
      Width2          =   5580
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
      Child5          =   "picCtgNumero"
      MinWidth5       =   2055
      MinHeight5      =   360
      Width5          =   2055
      FixedBackground5=   0   'False
      Key5            =   "CtgNumero"
      NewRow5         =   0   'False
      AllowVertical5  =   0   'False
      Child6          =   "picFechaCargaDescarga"
      MinWidth6       =   7200
      MinHeight6      =   360
      Width6          =   6420
      FixedBackground6=   0   'False
      Key6            =   "FechaCargaDescarga"
      NewRow6         =   0   'False
      AllowVertical6  =   0   'False
      Child7          =   "picEntidad_Remitente"
      MinWidth7       =   5070
      MinHeight7      =   360
      Width7          =   5070
      FixedBackground7=   0   'False
      Key7            =   "Entidad_Remitente"
      NewRow7         =   0   'False
      AllowVertical7  =   0   'False
      Child8          =   "picEntidad_Destinatario"
      MinWidth8       =   5370
      MinHeight8      =   360
      Width8          =   5370
      FixedBackground8=   0   'False
      Key8            =   "Entidad_Destinatario"
      NewRow8         =   0   'False
      AllowVertical8  =   0   'False
      Child9          =   "picEntidad_Transportista"
      MinWidth9       =   5370
      MinHeight9      =   360
      Width9          =   5370
      FixedBackground9=   0   'False
      Key9            =   "Entidad_Transportista"
      NewRow9         =   0   'False
      AllowVertical9  =   0   'False
      Child10         =   "picCosecha"
      MinWidth10      =   3030
      MinHeight10     =   360
      Width10         =   3030
      FixedBackground10=   0   'False
      Key10           =   "Cosecha"
      NewRow10        =   0   'False
      AllowVertical10 =   0   'False
      Child11         =   "picCereal"
      MinWidth11      =   3030
      MinHeight11     =   360
      Width11         =   3030
      FixedBackground11=   0   'False
      Key11           =   "Cereal"
      NewRow11        =   0   'False
      AllowVertical11 =   0   'False
      Child12         =   "picPesoBruto"
      MinWidth12      =   3315
      MinHeight12     =   360
      Width12         =   3315
      FixedBackground12=   0   'False
      Key12           =   "PesoBruto"
      NewRow12        =   0   'False
      AllowVertical12 =   0   'False
      Child13         =   "picPesoNeto"
      MinWidth13      =   3315
      MinHeight13     =   360
      Width13         =   3315
      FixedBackground13=   0   'False
      Key13           =   "PesoNeto"
      NewRow13        =   0   'False
      AllowVertical13 =   0   'False
      Child14         =   "picHumedad"
      MinWidth14      =   3015
      MinHeight14     =   360
      Width14         =   3015
      FixedBackground14=   0   'False
      Key14           =   "Humedad"
      NewRow14        =   0   'False
      AllowVertical14 =   0   'False
      Child15         =   "picAnalisis"
      MinWidth15      =   1875
      MinHeight15     =   360
      Width15         =   1875
      FixedBackground15=   0   'False
      NewRow15        =   0   'False
      AllowVertical15 =   0   'False
      Child16         =   "picCertificadoDeposito"
      MinWidth16      =   2415
      MinHeight16     =   360
      Width16         =   2415
      FixedBackground16=   0   'False
      Key16           =   "CertificadoDeposito"
      NewRow16        =   0   'False
      AllowVertical16 =   0   'False
      Child17         =   "picCertificadoRT"
      MinWidth17      =   2955
      MinHeight17     =   360
      Width17         =   2955
      FixedBackground17=   0   'False
      Key17           =   "CertificadoRT"
      NewRow17        =   0   'False
      AllowVertical17 =   0   'False
      Child18         =   "picAnulada"
      MinWidth18      =   2895
      MinHeight18     =   360
      Width18         =   2895
      FixedBackground18=   0   'False
      Key18           =   "Anulada"
      NewRow18        =   0   'False
      AllowVertical18 =   0   'False
      Begin VB.PictureBox picCtgNumero 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   11100
         ScaleHeight     =   360
         ScaleWidth      =   2055
         TabIndex        =   76
         Top             =   1110
         Width           =   2055
         Begin MSMask.MaskEdBox maskedtextboxCtgNumero 
            Height          =   315
            Left            =   780
            TabIndex        =   77
            Top             =   0
            Width           =   1215
            _ExtentX        =   2143
            _ExtentY        =   556
            _Version        =   393216
            ClipMode        =   1
            PromptInclude   =   0   'False
            AllowPrompt     =   -1  'True
            MaxLength       =   11
            Mask            =   "###########"
            PromptChar      =   "_"
         End
         Begin VB.Label labelCtgNumero 
            AutoSize        =   -1  'True
            Caption         =   "Nº CTG:"
            Height          =   210
            Left            =   60
            TabIndex        =   78
            Top             =   60
            Width           =   585
         End
      End
      Begin VB.PictureBox picFechaCargaDescarga 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   7695
         TabIndex        =   60
         Top             =   1500
         Width           =   7695
         Begin VB.ComboBox cboFechaCargaDescargaOperacion 
            Height          =   330
            Left            =   1920
            Style           =   2  'Dropdown List
            TabIndex        =   69
            Top             =   0
            Width           =   1035
         End
         Begin VB.CommandButton cmdFechaCargaDescarga_DesdeSiguiente 
            Height          =   315
            Left            =   4740
            Picture         =   "Movimiento_Cereal_Lista.frx":0CCA
            Style           =   1  'Graphical
            TabIndex        =   68
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaCargaDescarga_DesdeHoy 
            Height          =   315
            Left            =   5040
            Picture         =   "Movimiento_Cereal_Lista.frx":1254
            Style           =   1  'Graphical
            TabIndex        =   67
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.CommandButton cmdFechaCargaDescarga_HastaAnterior 
            Height          =   315
            Left            =   5640
            Picture         =   "Movimiento_Cereal_Lista.frx":139E
            Style           =   1  'Graphical
            TabIndex        =   66
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaCargaDescarga_HastaSiguiente 
            Height          =   315
            Left            =   7380
            Picture         =   "Movimiento_Cereal_Lista.frx":1928
            Style           =   1  'Graphical
            TabIndex        =   65
            TabStop         =   0   'False
            ToolTipText     =   "Siguiente"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.CommandButton cmdFechaCargaDescarga_HastaHoy 
            Height          =   315
            Left            =   7680
            Picture         =   "Movimiento_Cereal_Lista.frx":1EB2
            Style           =   1  'Graphical
            TabIndex        =   64
            TabStop         =   0   'False
            ToolTipText     =   "Hoy"
            Top             =   0
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.TextBox txtFechaCargaDescarga_DiaSemana 
            Height          =   315
            Left            =   3000
            Locked          =   -1  'True
            TabIndex        =   63
            TabStop         =   0   'False
            Top             =   0
            Visible         =   0   'False
            Width           =   1050
         End
         Begin VB.CommandButton cmdFechaCargaDescarga_DesdeAnterior 
            Height          =   315
            Left            =   3000
            Picture         =   "Movimiento_Cereal_Lista.frx":1FFC
            Style           =   1  'Graphical
            TabIndex        =   62
            TabStop         =   0   'False
            ToolTipText     =   "Anterior"
            Top             =   0
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.ComboBox cboFechaCargaDescarga 
            Height          =   330
            ItemData        =   "Movimiento_Cereal_Lista.frx":2586
            Left            =   540
            List            =   "Movimiento_Cereal_Lista.frx":2588
            Style           =   2  'Dropdown List
            TabIndex        =   61
            Top             =   0
            Width           =   1350
         End
         Begin MSComCtl2.DTPicker dtpFechaCargaDescarga_Desde 
            Height          =   315
            Left            =   3300
            TabIndex        =   70
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
            Format          =   110690305
            CurrentDate     =   36950
         End
         Begin MSComCtl2.DTPicker dtpFechaCargaDescarga_Hasta 
            Height          =   315
            Left            =   5940
            TabIndex        =   71
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
            Format          =   110690305
            CurrentDate     =   36950
         End
         Begin VB.Label lblFechaCargaDescarga 
            AutoSize        =   -1  'True
            Caption         =   "Fecha"
            Height          =   210
            Left            =   0
            TabIndex        =   73
            Top             =   60
            Width           =   450
         End
         Begin VB.Label lblFechaCargaDescarga_Y 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   5460
            TabIndex        =   72
            Top             =   60
            Visible         =   0   'False
            Width           =   90
         End
      End
      Begin VB.PictureBox picAnalisis 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   8640
         ScaleHeight     =   360
         ScaleWidth      =   1875
         TabIndex        =   57
         Top             =   2670
         Width           =   1875
         Begin VB.ComboBox cboAnalisis 
            Height          =   330
            Left            =   720
            Style           =   2  'Dropdown List
            TabIndex        =   58
            Top             =   0
            Width           =   1155
         End
         Begin VB.Label labelAnalisis 
            AutoSize        =   -1  'True
            Caption         =   "Análisis:"
            Height          =   210
            Left            =   0
            TabIndex        =   59
            Top             =   60
            Width           =   615
         End
      End
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
         Left            =   165
         ScaleHeight     =   450
         ScaleWidth      =   8895
         TabIndex        =   3
         Top             =   630
         Width           =   8895
         Begin VB.CheckBox chkTipo_AjusteSube 
            Height          =   210
            Left            =   3360
            TabIndex        =   10
            Top             =   210
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_Entrada 
            Height          =   210
            Left            =   480
            TabIndex        =   6
            Top             =   0
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_Salida 
            Height          =   210
            Left            =   480
            TabIndex        =   5
            Top             =   210
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_SalidaProduccion 
            Height          =   210
            Left            =   1920
            TabIndex        =   8
            Top             =   210
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_TransferenciaInterna 
            Height          =   210
            Left            =   1920
            TabIndex        =   7
            Top             =   0
            Value           =   1  'Checked
            Width           =   1395
         End
         Begin VB.CheckBox chkTipo_AjusteBaja 
            Height          =   210
            Left            =   3360
            TabIndex        =   9
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
            Left            =   4860
            TabIndex        =   11
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
            Left            =   4860
            TabIndex        =   12
            Top             =   190
            Width           =   735
         End
         Begin VB.Label lblTipo 
            AutoSize        =   -1  'True
            Caption         =   "Tipo:"
            Height          =   210
            Left            =   0
            TabIndex        =   4
            Top             =   90
            Width           =   345
         End
      End
      Begin VB.PictureBox picPlanta 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   9285
         ScaleHeight     =   360
         ScaleWidth      =   3870
         TabIndex        =   54
         Top             =   675
         Width           =   3870
         Begin VB.ComboBox cboPlanta 
            Height          =   330
            Left            =   660
            Style           =   2  'Dropdown List
            TabIndex        =   55
            Top             =   0
            Width           =   3195
         End
         Begin VB.Label lblPlanta 
            AutoSize        =   -1  'True
            Caption         =   "Planta:"
            Height          =   210
            Left            =   0
            TabIndex        =   56
            Top             =   60
            Width           =   480
         End
      End
      Begin VB.PictureBox picCertificadoRT 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   9870
         TabIndex        =   51
         Top             =   3060
         Width           =   9870
         Begin VB.ComboBox cboCertificadoRT 
            Height          =   330
            Left            =   1800
            Style           =   2  'Dropdown List
            TabIndex        =   52
            Top             =   0
            Width           =   1155
         End
         Begin VB.Label lblCertificadoRT 
            AutoSize        =   -1  'True
            Caption         =   "Kgs. Pendientes de RT:"
            Height          =   210
            Left            =   0
            TabIndex        =   53
            Top             =   60
            Width           =   1680
         End
      End
      Begin VB.PictureBox picAnulada 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   10260
         ScaleHeight     =   360
         ScaleWidth      =   2895
         TabIndex        =   48
         Top             =   3060
         Width           =   2895
         Begin VB.ComboBox cboAnulada 
            Height          =   330
            Left            =   780
            Style           =   2  'Dropdown List
            TabIndex        =   49
            Top             =   0
            Width           =   2115
         End
         Begin VB.Label lblAnulada 
            AutoSize        =   -1  'True
            Caption         =   "Anulada:"
            Height          =   210
            Left            =   0
            TabIndex        =   50
            Top             =   60
            Width           =   645
         End
      End
      Begin VB.PictureBox picHumedad 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   5400
         ScaleHeight     =   360
         ScaleWidth      =   3015
         TabIndex        =   40
         Top             =   2670
         Width           =   3015
         Begin VB.TextBox txtHumedad 
            Alignment       =   1  'Right Justify
            Height          =   315
            Left            =   2340
            MaxLength       =   4
            TabIndex        =   42
            Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
            Top             =   0
            Width           =   675
         End
         Begin VB.ComboBox cboHumedad 
            Height          =   330
            Left            =   1080
            Style           =   2  'Dropdown List
            TabIndex        =   41
            Top             =   0
            Width           =   1215
         End
         Begin VB.Label lblHumedad 
            AutoSize        =   -1  'True
            Caption         =   "Humedad:"
            Height          =   195
            Left            =   60
            TabIndex        =   43
            Top             =   60
            Width           =   735
         End
      End
      Begin VB.PictureBox picPesoBruto 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   6675
         ScaleHeight     =   360
         ScaleWidth      =   6480
         TabIndex        =   32
         Top             =   2280
         Width           =   6480
         Begin VB.ComboBox cboPesoBruto 
            Height          =   330
            Left            =   960
            Style           =   2  'Dropdown List
            TabIndex        =   34
            Top             =   0
            Width           =   1215
         End
         Begin VB.TextBox txtPesoBruto 
            Alignment       =   1  'Right Justify
            Height          =   315
            Left            =   2220
            MaxLength       =   12
            TabIndex        =   33
            Tag             =   "STRING|EMPTY|NUMBERS|12"
            Top             =   0
            Width           =   1095
         End
         Begin VB.Label lblPesoBruto 
            AutoSize        =   -1  'True
            Caption         =   "Peso Bruto:"
            Height          =   210
            Left            =   0
            TabIndex        =   35
            Top             =   60
            Width           =   840
         End
      End
      Begin VB.PictureBox picPesoNeto 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   5010
         TabIndex        =   36
         Top             =   2670
         Width           =   5010
         Begin VB.TextBox txtPesoNeto 
            Alignment       =   1  'Right Justify
            Height          =   315
            Left            =   2220
            MaxLength       =   12
            TabIndex        =   38
            Tag             =   "STRING|EMPTY|NUMBERS|12"
            Top             =   0
            Width           =   1095
         End
         Begin VB.ComboBox cboPesoNeto 
            Height          =   330
            Left            =   960
            Style           =   2  'Dropdown List
            TabIndex        =   37
            Top             =   0
            Width           =   1215
         End
         Begin VB.Label lblPesoNeto 
            AutoSize        =   -1  'True
            Caption         =   "Peso Neto:"
            Height          =   195
            Left            =   60
            TabIndex        =   39
            Top             =   60
            Width           =   795
         End
      End
      Begin VB.PictureBox picCertificadoDeposito 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   10740
         ScaleHeight     =   360
         ScaleWidth      =   2415
         TabIndex        =   44
         Top             =   2670
         Width           =   2415
         Begin VB.ComboBox cboCertificadoDeposito 
            Height          =   330
            Left            =   1260
            Style           =   2  'Dropdown List
            TabIndex        =   46
            Top             =   0
            Width           =   1155
         End
         Begin VB.Label lblCertificadoDeposito 
            AutoSize        =   -1  'True
            Caption         =   "Cert. Depósito:"
            Height          =   210
            Left            =   0
            TabIndex        =   45
            Top             =   60
            Width           =   1065
         End
      End
      Begin VB.PictureBox picComprobanteNumero 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   10710
         TabIndex        =   13
         Top             =   1110
         Width           =   10710
         Begin VB.ComboBox cboComprobanteNumero 
            Height          =   330
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   15
            Top             =   0
            Width           =   1215
         End
         Begin MSMask.MaskEdBox maskedtextboxComprobanteNumeroDesde 
            Height          =   315
            Left            =   2460
            TabIndex        =   74
            Top             =   0
            Width           =   1455
            _ExtentX        =   2566
            _ExtentY        =   556
            _Version        =   393216
            ClipMode        =   1
            PromptInclude   =   0   'False
            AllowPrompt     =   -1  'True
            MaxLength       =   14
            Mask            =   "#####-########"
            PromptChar      =   "_"
         End
         Begin MSMask.MaskEdBox maskedtextboxComprobanteNumeroHasta 
            Height          =   315
            Left            =   4140
            TabIndex        =   75
            Top             =   0
            Width           =   1455
            _ExtentX        =   2566
            _ExtentY        =   556
            _Version        =   393216
            ClipMode        =   1
            PromptInclude   =   0   'False
            AllowPrompt     =   -1  'True
            MaxLength       =   14
            Mask            =   "#####-########"
            PromptChar      =   "_"
         End
         Begin VB.Label lblComprobanteNumero 
            AutoSize        =   -1  'True
            Caption         =   "Comprobante:"
            Height          =   210
            Left            =   60
            TabIndex        =   14
            Top             =   60
            Width           =   1005
         End
         Begin VB.Label labelComprobanteNumeroHasta 
            AutoSize        =   -1  'True
            Caption         =   "y"
            Height          =   210
            Left            =   3960
            TabIndex        =   16
            Top             =   60
            Width           =   90
         End
      End
      Begin VB.PictureBox picEntidad_Destinatario 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   165
         ScaleHeight     =   360
         ScaleWidth      =   7395
         TabIndex        =   20
         Top             =   1890
         Width           =   7395
         Begin VB.ComboBox cboEntidad_Destinatario 
            Height          =   330
            Left            =   1140
            Style           =   2  'Dropdown List
            TabIndex        =   22
            Top             =   0
            Width           =   4215
         End
         Begin VB.Label lblEntidad_Destinatario 
            AutoSize        =   -1  'True
            Caption         =   "Destinatario:"
            Height          =   210
            Left            =   0
            TabIndex        =   21
            Top             =   60
            Width           =   900
         End
      End
      Begin VB.PictureBox picCereal 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   3420
         ScaleHeight     =   360
         ScaleWidth      =   3030
         TabIndex        =   29
         Top             =   2280
         Width           =   3030
         Begin VB.ComboBox cboCereal 
            Height          =   330
            Left            =   840
            Style           =   2  'Dropdown List
            TabIndex        =   31
            Top             =   0
            Width           =   2175
         End
         Begin VB.Label lblCereal 
            AutoSize        =   -1  'True
            Caption         =   "Cereal:"
            Height          =   210
            Left            =   0
            TabIndex        =   30
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
         TabIndex        =   26
         Top             =   2280
         Width           =   3030
         Begin VB.ComboBox cboCosecha 
            Height          =   330
            Left            =   840
            Style           =   2  'Dropdown List
            TabIndex        =   28
            Top             =   0
            Width           =   2175
         End
         Begin VB.Label lblCosecha 
            AutoSize        =   -1  'True
            Caption         =   "Cosecha:"
            Height          =   210
            Left            =   0
            TabIndex        =   27
            Top             =   60
            Width           =   690
         End
      End
      Begin VB.PictureBox picEntidad_Transportista 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   7785
         ScaleHeight     =   360
         ScaleWidth      =   5370
         TabIndex        =   23
         Top             =   1890
         Width           =   5370
         Begin VB.ComboBox cboEntidad_Transportista 
            Height          =   330
            Left            =   1140
            Style           =   2  'Dropdown List
            TabIndex        =   25
            Top             =   0
            Width           =   4215
         End
         Begin VB.Label lblEntidad_Transportista 
            AutoSize        =   -1  'True
            Caption         =   "Transportista:"
            Height          =   210
            Left            =   0
            TabIndex        =   24
            Top             =   60
            Width           =   1005
         End
      End
      Begin VB.PictureBox picEntidad_Remitente 
         BorderStyle     =   0  'None
         Height          =   360
         Left            =   8085
         ScaleHeight     =   360
         ScaleWidth      =   5070
         TabIndex        =   17
         Top             =   1500
         Width           =   5070
         Begin VB.ComboBox cboEntidad_Remitente 
            Height          =   330
            Left            =   840
            Style           =   2  'Dropdown List
            TabIndex        =   19
            Top             =   0
            Width           =   4215
         End
         Begin VB.Label lblEntidad_Remitente 
            AutoSize        =   -1  'True
            Caption         =   "Remitente:"
            Height          =   210
            Left            =   0
            TabIndex        =   18
            Top             =   60
            Width           =   750
         End
      End
      Begin MSComctlLib.Toolbar tlbMain 
         Height          =   570
         Left            =   30
         TabIndex        =   2
         Top             =   30
         Width           =   13125
         _ExtentX        =   23151
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
                  NumButtonMenus  =   5
                  BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "CONVERTIR_SUBPRODUCTO"
                     Text            =   "Convertir a SubProductos"
                  EndProperty
                  BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Text            =   "-"
                  EndProperty
                  BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "OBTENER_HUMEDDAYZARANDEO"
                     Text            =   "Obtener humedad y zarandeo desde pesadas"
                  EndProperty
                  BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "RECALCULAR_KILOGRAMOS"
                     Text            =   "Recalcular kilogramos"
                  EndProperty
                  BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                     Key             =   "RECALCULAR_ACONDICIONAMIENTO"
                     Text            =   "Recalcular gastos de acondicionamiento"
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
      TabIndex        =   47
      Top             =   6465
      Width           =   13245
      _ExtentX        =   23363
      _ExtentY        =   635
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   22834
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
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   3600
      Width           =   13035
      _ExtentX        =   22992
      _ExtentY        =   4895
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDMovimiento_Cereal"
      Columns(0).DataField=   "IDMovimiento_Cereal"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   16
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "Tipo"
      Columns(1).DataField=   "Tipo"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Fecha"
      Columns(2).DataField=   "FechaCarga"
      Columns(2).NumberFormat=   "Short Date"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Nº comprobante"
      Columns(3).DataField=   "ComprobanteNumeroConFormato"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(4)._VlistStyle=   0
      Columns(4)._MaxComboItems=   5
      Columns(4).Caption=   "C.T.G."
      Columns(4).DataField=   "CTGNumero"
      Columns(4)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(5)._VlistStyle=   0
      Columns(5)._MaxComboItems=   5
      Columns(5).Caption=   "Remitente"
      Columns(5).DataField=   "Entidad_Remitente_Nombre"
      Columns(5)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(6)._VlistStyle=   0
      Columns(6)._MaxComboItems=   5
      Columns(6).Caption=   "Destinatario"
      Columns(6).DataField=   "Entidad_Destinatario_Nombre"
      Columns(6)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(7)._VlistStyle=   0
      Columns(7)._MaxComboItems=   5
      Columns(7).Caption=   "Transportista"
      Columns(7).DataField=   "Entidad_Transportista_Nombre"
      Columns(7)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(8)._VlistStyle=   0
      Columns(8)._MaxComboItems=   5
      Columns(8).Caption=   "Cosecha"
      Columns(8).DataField=   "Cosecha_Nombre"
      Columns(8)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(9)._VlistStyle=   0
      Columns(9)._MaxComboItems=   5
      Columns(9).Caption=   "Cereal"
      Columns(9).DataField=   "Cereal_Nombre"
      Columns(9)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(10)._VlistStyle=   0
      Columns(10)._MaxComboItems=   5
      Columns(10).Caption=   "Bruto"
      Columns(10).DataField=   "PesoBruto"
      Columns(10).NumberFormat=   "#,###"
      Columns(10)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(11)._VlistStyle=   0
      Columns(11)._MaxComboItems=   5
      Columns(11).Caption=   "Tara"
      Columns(11).DataField=   "PesoTara"
      Columns(11).NumberFormat=   "#,###"
      Columns(11)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(12)._VlistStyle=   0
      Columns(12)._MaxComboItems=   5
      Columns(12).Caption=   "Neto"
      Columns(12).DataField=   "PesoNeto"
      Columns(12).NumberFormat=   "#,###"
      Columns(12)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(13)._VlistStyle=   0
      Columns(13)._MaxComboItems=   5
      Columns(13).Caption=   "Final"
      Columns(13).DataField=   "PesoFinal"
      Columns(13).NumberFormat=   "#,###"
      Columns(13)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(14)._VlistStyle=   0
      Columns(14)._MaxComboItems=   5
      Columns(14).Caption=   "Hum."
      Columns(14).DataField=   "Humedad"
      Columns(14).NumberFormat=   "0.0"
      Columns(14)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(15)._VlistStyle=   0
      Columns(15)._MaxComboItems=   5
      Columns(15).Caption=   "Zar."
      Columns(15).DataField=   "Zaranda"
      Columns(15).NumberFormat=   "0.0"
      Columns(15)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   16
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
      Splits(0)._ColumnProps(0)=   "Columns.Count=16"
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
      Splits(0)._ColumnProps(17)=   "Column(2).Width=1588"
      Splits(0)._ColumnProps(18)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(19)=   "Column(2)._WidthInPix=1508"
      Splits(0)._ColumnProps(20)=   "Column(2)._EditAlways=0"
      Splits(0)._ColumnProps(21)=   "Column(2)._ColStyle=8708"
      Splits(0)._ColumnProps(22)=   "Column(2).AllowFocus=0"
      Splits(0)._ColumnProps(23)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(24)=   "Column(3).Width=2461"
      Splits(0)._ColumnProps(25)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(26)=   "Column(3)._WidthInPix=2381"
      Splits(0)._ColumnProps(27)=   "Column(3)._EditAlways=0"
      Splits(0)._ColumnProps(28)=   "Column(3)._ColStyle=8708"
      Splits(0)._ColumnProps(29)=   "Column(3).AllowFocus=0"
      Splits(0)._ColumnProps(30)=   "Column(3).Order=4"
      Splits(0)._ColumnProps(31)=   "Column(4).Width=2117"
      Splits(0)._ColumnProps(32)=   "Column(4).DividerColor=0"
      Splits(0)._ColumnProps(33)=   "Column(4)._WidthInPix=2037"
      Splits(0)._ColumnProps(34)=   "Column(4)._EditAlways=0"
      Splits(0)._ColumnProps(35)=   "Column(4)._ColStyle=8708"
      Splits(0)._ColumnProps(36)=   "Column(4).AllowFocus=0"
      Splits(0)._ColumnProps(37)=   "Column(4).Order=5"
      Splits(0)._ColumnProps(38)=   "Column(5).Width=5450"
      Splits(0)._ColumnProps(39)=   "Column(5).DividerColor=0"
      Splits(0)._ColumnProps(40)=   "Column(5)._WidthInPix=5371"
      Splits(0)._ColumnProps(41)=   "Column(5)._EditAlways=0"
      Splits(0)._ColumnProps(42)=   "Column(5)._ColStyle=8708"
      Splits(0)._ColumnProps(43)=   "Column(5).AllowFocus=0"
      Splits(0)._ColumnProps(44)=   "Column(5).Order=6"
      Splits(0)._ColumnProps(45)=   "Column(6).Width=5265"
      Splits(0)._ColumnProps(46)=   "Column(6).DividerColor=0"
      Splits(0)._ColumnProps(47)=   "Column(6)._WidthInPix=5186"
      Splits(0)._ColumnProps(48)=   "Column(6)._EditAlways=0"
      Splits(0)._ColumnProps(49)=   "Column(6)._ColStyle=8708"
      Splits(0)._ColumnProps(50)=   "Column(6).AllowFocus=0"
      Splits(0)._ColumnProps(51)=   "Column(6).Order=7"
      Splits(0)._ColumnProps(52)=   "Column(7).Width=5292"
      Splits(0)._ColumnProps(53)=   "Column(7).DividerColor=0"
      Splits(0)._ColumnProps(54)=   "Column(7)._WidthInPix=5212"
      Splits(0)._ColumnProps(55)=   "Column(7)._EditAlways=0"
      Splits(0)._ColumnProps(56)=   "Column(7)._ColStyle=8708"
      Splits(0)._ColumnProps(57)=   "Column(7).AllowFocus=0"
      Splits(0)._ColumnProps(58)=   "Column(7).Order=8"
      Splits(0)._ColumnProps(59)=   "Column(8).Width=3254"
      Splits(0)._ColumnProps(60)=   "Column(8).DividerColor=0"
      Splits(0)._ColumnProps(61)=   "Column(8)._WidthInPix=3175"
      Splits(0)._ColumnProps(62)=   "Column(8)._EditAlways=0"
      Splits(0)._ColumnProps(63)=   "Column(8)._ColStyle=8708"
      Splits(0)._ColumnProps(64)=   "Column(8).AllowFocus=0"
      Splits(0)._ColumnProps(65)=   "Column(8).Order=9"
      Splits(0)._ColumnProps(66)=   "Column(9).Width=2619"
      Splits(0)._ColumnProps(67)=   "Column(9).DividerColor=0"
      Splits(0)._ColumnProps(68)=   "Column(9)._WidthInPix=2540"
      Splits(0)._ColumnProps(69)=   "Column(9)._EditAlways=0"
      Splits(0)._ColumnProps(70)=   "Column(9)._ColStyle=8708"
      Splits(0)._ColumnProps(71)=   "Column(9).AllowFocus=0"
      Splits(0)._ColumnProps(72)=   "Column(9).Order=10"
      Splits(0)._ColumnProps(73)=   "Column(10).Width=1244"
      Splits(0)._ColumnProps(74)=   "Column(10).DividerColor=0"
      Splits(0)._ColumnProps(75)=   "Column(10)._WidthInPix=1164"
      Splits(0)._ColumnProps(76)=   "Column(10)._EditAlways=0"
      Splits(0)._ColumnProps(77)=   "Column(10)._ColStyle=8706"
      Splits(0)._ColumnProps(78)=   "Column(10).AllowFocus=0"
      Splits(0)._ColumnProps(79)=   "Column(10).Order=11"
      Splits(0)._ColumnProps(80)=   "Column(11).Width=1244"
      Splits(0)._ColumnProps(81)=   "Column(11).DividerColor=0"
      Splits(0)._ColumnProps(82)=   "Column(11)._WidthInPix=1164"
      Splits(0)._ColumnProps(83)=   "Column(11)._EditAlways=0"
      Splits(0)._ColumnProps(84)=   "Column(11)._ColStyle=8706"
      Splits(0)._ColumnProps(85)=   "Column(11).AllowFocus=0"
      Splits(0)._ColumnProps(86)=   "Column(11).Order=12"
      Splits(0)._ColumnProps(87)=   "Column(12).Width=1244"
      Splits(0)._ColumnProps(88)=   "Column(12).DividerColor=0"
      Splits(0)._ColumnProps(89)=   "Column(12)._WidthInPix=1164"
      Splits(0)._ColumnProps(90)=   "Column(12)._EditAlways=0"
      Splits(0)._ColumnProps(91)=   "Column(12)._ColStyle=8706"
      Splits(0)._ColumnProps(92)=   "Column(12).AllowFocus=0"
      Splits(0)._ColumnProps(93)=   "Column(12).Order=13"
      Splits(0)._ColumnProps(94)=   "Column(13).Width=1244"
      Splits(0)._ColumnProps(95)=   "Column(13).DividerColor=0"
      Splits(0)._ColumnProps(96)=   "Column(13)._WidthInPix=1164"
      Splits(0)._ColumnProps(97)=   "Column(13)._EditAlways=0"
      Splits(0)._ColumnProps(98)=   "Column(13)._ColStyle=8706"
      Splits(0)._ColumnProps(99)=   "Column(13).AllowFocus=0"
      Splits(0)._ColumnProps(100)=   "Column(13).Order=14"
      Splits(0)._ColumnProps(101)=   "Column(14).Width=847"
      Splits(0)._ColumnProps(102)=   "Column(14).DividerColor=0"
      Splits(0)._ColumnProps(103)=   "Column(14)._WidthInPix=767"
      Splits(0)._ColumnProps(104)=   "Column(14)._EditAlways=0"
      Splits(0)._ColumnProps(105)=   "Column(14)._ColStyle=8706"
      Splits(0)._ColumnProps(106)=   "Column(14).AllowFocus=0"
      Splits(0)._ColumnProps(107)=   "Column(14).Order=15"
      Splits(0)._ColumnProps(108)=   "Column(15).Width=847"
      Splits(0)._ColumnProps(109)=   "Column(15).DividerColor=0"
      Splits(0)._ColumnProps(110)=   "Column(15)._WidthInPix=767"
      Splits(0)._ColumnProps(111)=   "Column(15)._EditAlways=0"
      Splits(0)._ColumnProps(112)=   "Column(15)._ColStyle=8706"
      Splits(0)._ColumnProps(113)=   "Column(15).AllowFocus=0"
      Splits(0)._ColumnProps(114)=   "Column(15).Order=16"
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
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=46,.parent=13,.locked=-1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=44,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=45,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=66,.parent=13,.locked=-1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=63,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=64,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=65,.parent=17"
      _StyleDefs(52)  =   "Splits(0).Columns(4).Style:id=50,.parent=13,.locked=-1"
      _StyleDefs(53)  =   "Splits(0).Columns(4).HeadingStyle:id=47,.parent=14,.alignment=2"
      _StyleDefs(54)  =   "Splits(0).Columns(4).FooterStyle:id=48,.parent=15"
      _StyleDefs(55)  =   "Splits(0).Columns(4).EditorStyle:id=49,.parent=17"
      _StyleDefs(56)  =   "Splits(0).Columns(5).Style:id=110,.parent=13,.locked=-1"
      _StyleDefs(57)  =   "Splits(0).Columns(5).HeadingStyle:id=107,.parent=14,.alignment=2"
      _StyleDefs(58)  =   "Splits(0).Columns(5).FooterStyle:id=108,.parent=15"
      _StyleDefs(59)  =   "Splits(0).Columns(5).EditorStyle:id=109,.parent=17"
      _StyleDefs(60)  =   "Splits(0).Columns(6).Style:id=98,.parent=13,.locked=-1"
      _StyleDefs(61)  =   "Splits(0).Columns(6).HeadingStyle:id=95,.parent=14,.alignment=2"
      _StyleDefs(62)  =   "Splits(0).Columns(6).FooterStyle:id=96,.parent=15"
      _StyleDefs(63)  =   "Splits(0).Columns(6).EditorStyle:id=97,.parent=17"
      _StyleDefs(64)  =   "Splits(0).Columns(7).Style:id=62,.parent=13,.alignment=3,.locked=-1"
      _StyleDefs(65)  =   "Splits(0).Columns(7).HeadingStyle:id=59,.parent=14,.alignment=2"
      _StyleDefs(66)  =   "Splits(0).Columns(7).FooterStyle:id=60,.parent=15"
      _StyleDefs(67)  =   "Splits(0).Columns(7).EditorStyle:id=61,.parent=17"
      _StyleDefs(68)  =   "Splits(0).Columns(8).Style:id=94,.parent=13,.locked=-1"
      _StyleDefs(69)  =   "Splits(0).Columns(8).HeadingStyle:id=91,.parent=14,.alignment=2"
      _StyleDefs(70)  =   "Splits(0).Columns(8).FooterStyle:id=92,.parent=15"
      _StyleDefs(71)  =   "Splits(0).Columns(8).EditorStyle:id=93,.parent=17"
      _StyleDefs(72)  =   "Splits(0).Columns(9).Style:id=28,.parent=13,.locked=-1"
      _StyleDefs(73)  =   "Splits(0).Columns(9).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(74)  =   "Splits(0).Columns(9).FooterStyle:id=26,.parent=15"
      _StyleDefs(75)  =   "Splits(0).Columns(9).EditorStyle:id=27,.parent=17"
      _StyleDefs(76)  =   "Splits(0).Columns(10).Style:id=118,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(77)  =   "Splits(0).Columns(10).HeadingStyle:id=115,.parent=14,.alignment=2"
      _StyleDefs(78)  =   "Splits(0).Columns(10).FooterStyle:id=116,.parent=15"
      _StyleDefs(79)  =   "Splits(0).Columns(10).EditorStyle:id=117,.parent=17"
      _StyleDefs(80)  =   "Splits(0).Columns(11).Style:id=114,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(81)  =   "Splits(0).Columns(11).HeadingStyle:id=111,.parent=14,.alignment=2"
      _StyleDefs(82)  =   "Splits(0).Columns(11).FooterStyle:id=112,.parent=15"
      _StyleDefs(83)  =   "Splits(0).Columns(11).EditorStyle:id=113,.parent=17"
      _StyleDefs(84)  =   "Splits(0).Columns(12).Style:id=58,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(85)  =   "Splits(0).Columns(12).HeadingStyle:id=55,.parent=14,.alignment=2"
      _StyleDefs(86)  =   "Splits(0).Columns(12).FooterStyle:id=56,.parent=15"
      _StyleDefs(87)  =   "Splits(0).Columns(12).EditorStyle:id=57,.parent=17"
      _StyleDefs(88)  =   "Splits(0).Columns(13).Style:id=32,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(89)  =   "Splits(0).Columns(13).HeadingStyle:id=29,.parent=14,.alignment=2"
      _StyleDefs(90)  =   "Splits(0).Columns(13).FooterStyle:id=30,.parent=15"
      _StyleDefs(91)  =   "Splits(0).Columns(13).EditorStyle:id=31,.parent=17"
      _StyleDefs(92)  =   "Splits(0).Columns(14).Style:id=78,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(93)  =   "Splits(0).Columns(14).HeadingStyle:id=75,.parent=14,.alignment=2"
      _StyleDefs(94)  =   "Splits(0).Columns(14).FooterStyle:id=76,.parent=15"
      _StyleDefs(95)  =   "Splits(0).Columns(14).EditorStyle:id=77,.parent=17"
      _StyleDefs(96)  =   "Splits(0).Columns(15).Style:id=74,.parent=13,.alignment=1,.locked=-1"
      _StyleDefs(97)  =   "Splits(0).Columns(15).HeadingStyle:id=71,.parent=14,.alignment=2"
      _StyleDefs(98)  =   "Splits(0).Columns(15).FooterStyle:id=72,.parent=15"
      _StyleDefs(99)  =   "Splits(0).Columns(15).EditorStyle:id=73,.parent=17"
      _StyleDefs(100) =   "Named:id=33:Normal"
      _StyleDefs(101) =   ":id=33,.parent=0"
      _StyleDefs(102) =   "Named:id=34:Heading"
      _StyleDefs(103) =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(104) =   ":id=34,.wraptext=-1"
      _StyleDefs(105) =   "Named:id=35:Footing"
      _StyleDefs(106) =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(107) =   "Named:id=36:Selected"
      _StyleDefs(108) =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(109) =   "Named:id=37:Caption"
      _StyleDefs(110) =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(111) =   "Named:id=38:HighlightRow"
      _StyleDefs(112) =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(113) =   "Named:id=39:EvenRow"
      _StyleDefs(114) =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(115) =   "Named:id=40:OddRow"
      _StyleDefs(116) =   ":id=40,.parent=33"
      _StyleDefs(117) =   "Named:id=41:RecordSelector"
      _StyleDefs(118) =   ":id=41,.parent=34"
      _StyleDefs(119) =   "Named:id=42:FilterBar"
      _StyleDefs(120) =   ":id=42,.parent=33"
   End
End
Attribute VB_Name = "frmMovimiento_Cereal_Lista"
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

Private Const REPORT_FILENAME_PREFIX As String = "Movimiento Cereal - "

Public Function Startup() As Boolean
    mLoading = True

    Load frmMovimiento_Cereal_Lista
    
    mLoading = False
    Startup = True
End Function

Public Function LoadData(ByVal IDMovimiento_Cereal As Long) As Boolean
    Dim strSQLSelect As String
    Dim strSQLFrom As String
    Dim recData As ADODB.recordset
        
    Dim SaveIDMovimiento_Cereal As Long
    
    Dim RecordCount As Long
    
    If mLoading Then
        Exit Function
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If IDMovimiento_Cereal = 0 Then
        If Not tdbgrdData.EOF Then
            SaveIDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
        End If
    Else
        SaveIDMovimiento_Cereal = IDMovimiento_Cereal
    End If
    
    Set recData = New ADODB.recordset
    
    'VERSION 14/03/2012 - MOSTRAR LA ENTIDAD REMITENTE DE LA MERCADERIA SEGUN CORRESPONDA
    strSQLSelect = "SELECT Movimiento_Cereal.IDMovimiento_Cereal, Movimiento_Cereal.Tipo, Movimiento_Cereal.ComprobanteNumero, Movimiento_Cereal.ComprobanteNumeroConFormato, Movimiento_Cereal.FechaCarga, Movimiento_Cereal.CTGNumero, dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) AS Entidad_Remitente_ID, dbo.udf_GetRemitenteCerealNombre(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) AS Entidad_Remitente_Nombre, Entidad_Destinatario.Nombre AS Entidad_Destinatario_Nombre, Entidad_Transportista.Nombre AS Entidad_Transportista_Nombre, Cosecha.Nombre AS Cosecha_Nombre, Cereal.Nombre AS Cereal_Nombre, Movimiento_Cereal.PesoBruto, Movimiento_Cereal.PesoTara, Movimiento_Cereal.PesoNeto, Movimiento_Cereal.PesoFinal, Movimiento_Cereal.Humedad, Movimiento_Cereal.Zaranda" & vbCr
    strSQLFrom = "FROM ((((Movimiento_Cereal INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha) INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) LEFT JOIN Entidad AS Entidad_Destinatario ON Movimiento_Cereal.IDEntidad_Destinatario = Entidad_Destinatario.IDEntidad) LEFT JOIN Entidad AS Entidad_Transportista ON Movimiento_Cereal.IDEntidad_Transportista = Entidad_Transportista.IDEntidad) LEFT JOIN Movimiento_Cereal_Analisis ON Movimiento_Cereal.IDMovimiento_Cereal = Movimiento_Cereal_Analisis.IDMovimiento_Cereal" & vbCr
    
    'WHERE
    mstrSQLWhere = ""
    mRecordSelectionFormula = ""
    
    'MOVIMIENTO TIPO
    If chkTipo_Entrada.value = vbUnchecked And chkTipo_Salida.value = vbUnchecked And chkTipo_SalidaProduccion.value = vbUnchecked And chkTipo_TransferenciaInterna.value = vbUnchecked Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.Tipo = ''"
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "Movimiento_Cereal.Tipo = ''"
    Else
        If chkTipo_Entrada.value = vbUnchecked Or chkTipo_Salida.value = vbUnchecked Or chkTipo_TransferenciaInterna.value = vbUnchecked Or chkTipo_SalidaProduccion.value = vbUnchecked Or chkTipo_AjusteBaja.value = vbUnchecked Or chkTipo_AjusteSube.value = vbUnchecked Then
            'COMIENZO EL PARENTESIS PARA LOS OR
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "("
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "("
            
            If chkTipo_Entrada.value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "'"
            End If
            If chkTipo_Salida.value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_SALIDA & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_SALIDA & "'"
            End If
            If chkTipo_TransferenciaInterna.value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA & "'"
            End If
            If chkTipo_SalidaProduccion.value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION & "'"
            End If
            If chkTipo_AjusteBaja.value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA & "'"
            End If
            If chkTipo_AjusteSube.value = vbChecked Then
                mstrSQLWhere = mstrSQLWhere & IIf(Right(mstrSQLWhere, 1) = "(", "", " OR ") & "Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE & "'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(Right(mRecordSelectionFormula, 1) = "(", "", " OR ") & "{Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE & "'"
            End If
            
            'CIERRO EL PARENTESIS
            mstrSQLWhere = mstrSQLWhere & ")"
            mRecordSelectionFormula = mRecordSelectionFormula & ")"
        End If
    End If
    
    'CARTA DE PORTE
    Select Case cboComprobanteNumero.ListIndex
        Case 0  'ALL
        Case 1 To 6
            If maskedtextboxComprobanteNumeroDesde.Text <> "" Then
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.ComprobanteNumero " & cboComprobanteNumero.Text & " " & maskedtextboxComprobanteNumeroDesde.Text
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.ComprobanteNumero} " & cboComprobanteNumero.Text & " " & maskedtextboxComprobanteNumeroDesde.Text
            End If
        Case 7  'BETWEEN
            If maskedtextboxComprobanteNumeroHasta.Text <> "" Then
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.ComprobanteNumero BETWEEN " & maskedtextboxComprobanteNumeroDesde.Text & " AND " & maskedtextboxComprobanteNumeroHasta.Text
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.ComprobanteNumero} >= " & maskedtextboxComprobanteNumeroDesde.Text & " AND {Movimiento_Cereal.ComprobanteNumero} <= " & maskedtextboxComprobanteNumeroHasta.Text
            End If
    End Select
    
    'CTG NUMERO
    If maskedtextboxCtgNumero.Text <> "" Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.CTGNumero = " & maskedtextboxCtgNumero.Text
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.CTGNumero} = " & maskedtextboxCtgNumero.Text
    End If
    
    'PLANTA
    If cboPlanta.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.IDEntidad_Destino = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND Movimiento_Cereal.IDOrigenDestino_Destino = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & ") OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_SALIDA & "' AND Movimiento_Cereal.IDEntidad_Titular = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND Movimiento_Cereal.IDOrigenDestino_Origen = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2)
        mstrSQLWhere = mstrSQLWhere & ") OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA & "' AND Movimiento_Cereal.IDEntidad_Titular = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND (Movimiento_Cereal.IDOrigenDestino_Origen = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & " OR Movimiento_Cereal.IDOrigenDestino_Destino = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & ")) OR ((Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION & "' OR Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA & "' OR Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE & "') AND Movimiento_Cereal.IDEntidad_Titular = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND Movimiento_Cereal.IDOrigenDestino_Origen = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & "))"
        
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.IDEntidad_Destino} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND {Movimiento_Cereal.IDOrigenDestino_Destino} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & ") OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_SALIDA & "' AND {Movimiento_Cereal.IDEntidad_Titular} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND {Movimiento_Cereal.IDOrigenDestino_Origen} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2)
        mRecordSelectionFormula = mRecordSelectionFormula & ") OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA & "' AND {Movimiento_Cereal.IDEntidad_Titular} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND ({Movimiento_Cereal.IDOrigenDestino_Origen} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & " OR {Movimiento_Cereal.IDOrigenDestino_Destino} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & ")) OR (({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION & "' OR {Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA & "' OR {Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE & "') AND {Movimiento_Cereal.IDEntidad_Titular} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 1) & " AND {Movimiento_Cereal.IDOrigenDestino_Origen} = " & CSM_Control_ComboBox.GetSubID(cboPlanta, 5, 2) & "))"
    End If
    
    ' FECHA DE CARGA / DESCARGA
    If cboFechaCargaDescarga.ListIndex = 0 Then
        'FECHA DE CARGA
        Select Case cboFechaCargaDescargaOperacion.ListIndex
            Case 0  'ALL
            Case 1  'EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)"
            Case 2  'GREATER
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga > '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.FechaCarga} > CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)"
            Case 3  'GREATER OR EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga >= '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0)"
            Case 4  'MINOR
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga < '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.FechaCarga} < CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0)"
            Case 5  'MINOR OR EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga <= '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)"
            Case 6  'NOT EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga NOT BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(NOT ({Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)))"
            Case 7  'BETWEEN
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.FechaCarga BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Hasta.value, "yyyy/mm/dd") & " 23:59:00'"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Hasta.value, "yyyy, mm, dd") & ", 23, 59, 59)"
        End Select
    Else
        'FECHA DE CARGA O DESCARGA, SEGÚN CORRESPONDA POR EL TIPO DE MOVIMIENTO
        Select Case cboFechaCargaDescargaOperacion.ListIndex
            Case 0  'ALL
            Case 1  'EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaHoraDescarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)))"
            Case 2  'GREATER
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga > '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga > '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaCarga} > CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaHoraDescarga} > CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)))"
            Case 3  'GREATER OR EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga >= '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga >= '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0)) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaHoraDescarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0)))"
            Case 4  'MINOR
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga < '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga < '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaCarga} < CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0)) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaHoraDescarga} < CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0)))"
            Case 5  'MINOR OR EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga <= '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga <= '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaHoraDescarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)))"
            Case 6  'NOT EQUAL
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga NOT BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga NOT BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 23:59:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND (NOT ({Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)))) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND (NOT ({Movimiento_Cereal.FechaHoraDescarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaHoraDescarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 23, 59, 59)))))"
            Case 7  'BETWEEN
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "((Movimiento_Cereal.Tipo <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaCarga BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Hasta.value, "yyyy/mm/dd") & " 23:59:00') OR (Movimiento_Cereal.Tipo = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND Movimiento_Cereal.FechaHoraDescarga BETWEEN '" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy/mm/dd") & " 00:00:00' AND '" & Format(dtpFechaCargaDescarga_Hasta.value, "yyyy/mm/dd") & " 23:59:00'))"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(({Movimiento_Cereal.Tipo} <> '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaCarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaCarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Hasta.value, "yyyy, mm, dd") & ", 23, 59, 59)) OR ({Movimiento_Cereal.Tipo} = '" & MOVIMIENTO_CEREAL_TIPO_ENTRADA & "' AND {Movimiento_Cereal.FechaHoraDescarga} >= CDateTime(" & Format(dtpFechaCargaDescarga_Desde.value, "yyyy, mm, dd") & ", 0, 0, 0) AND {Movimiento_Cereal.FechaHoraDescarga} <= CDateTime(" & Format(dtpFechaCargaDescarga_Hasta.value, "yyyy, mm, dd") & ", 23, 59, 59)))"
        End Select
    End If
    
    'ENTIDAD REMITENTE
    If cboEntidad_Remitente.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = " & cboEntidad_Remitente.ItemData(cboEntidad_Remitente.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{@IDTitularCereal} = " & cboEntidad_Remitente.ItemData(cboEntidad_Remitente.ListIndex)
    End If
    
    'ENTIDAD DESTINATARIO
    If cboEntidad_Destinatario.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDEntidad_Destinatario = " & cboEntidad_Destinatario.ItemData(cboEntidad_Destinatario.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.IDEntidad_Destinatario} = " & cboEntidad_Destinatario.ItemData(cboEntidad_Destinatario.ListIndex)
    End If
    
    'ENTIDAD TRANSPORTISTA
    If cboEntidad_Transportista.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDEntidad_Transportista = " & cboEntidad_Transportista.ItemData(cboEntidad_Transportista.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.IDEntidad_Transportista} = " & cboEntidad_Transportista.ItemData(cboEntidad_Transportista.ListIndex)
    End If
    
    'COSECHA
    If cboCosecha.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDCosecha = " & cboCosecha.ItemData(cboCosecha.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.IDCosecha} = " & cboCosecha.ItemData(cboCosecha.ListIndex)
    End If
    
    'CEREAL
    If cboCereal.ListIndex > 0 Then
        mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDCereal = " & cboCereal.ItemData(cboCereal.ListIndex)
        mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.IDCereal} = " & cboCereal.ItemData(cboCereal.ListIndex)
    End If
    
    'PESO BRUTO
    If cboPesoBruto.ListIndex > 0 Then
        If IsNumeric(txtPesoBruto.Text) Then
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.PesoBruto " & cboPesoBruto.Text & " " & CLng(txtPesoBruto.Text)
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.PesoBruto} " & cboPesoBruto.Text & " " & CLng(txtPesoBruto.Text)
        End If
    End If
    
    'PESO NETO
    If cboPesoNeto.ListIndex > 0 Then
        If IsNumeric(txtPesoNeto.Text) Then
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.PesoNeto " & cboPesoNeto.Text & " " & CLng(txtPesoNeto.Text)
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.PesoNeto} " & cboPesoNeto.Text & " " & CLng(txtPesoNeto.Text)
        End If
    End If
    
    'HUMEDAD
    Select Case cboHumedad.ListIndex
        Case 0  'TODAS
        Case 1  'VACIA
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.Humedad IS NULL"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "IsNull({Movimiento_Cereal.Humedad})"
        Case 2  'COMPLETA
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "(NOT Movimiento_Cereal.Humedad IS NULL)"
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "(NOT IsNull({Movimiento_Cereal.Humedad}))"
        Case 3 To 8
            If IsNumeric(txtHumedad.Text) Then
                mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.Humedad " & cboHumedad.Text & " " & CSM_String.ConvertDoubleToVBNumber(CDbl(txtHumedad.Text))
                mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.Humedad} " & cboHumedad.Text & " " & CSM_String.ConvertDoubleToVBNumber(CDbl(txtHumedad.Text))
            End If
    End Select
    
    'ANÁLISIS
    Select Case cboAnalisis.ListIndex
        Case 0
        Case 1
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal_Analisis.IDMovimiento_Cereal IS NOT NULL"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "Not IsNull({Movimiento_Cereal_Analisis.IDMovimiento_Cereal})"
        Case 2
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal_Analisis.IDMovimiento_Cereal IS NULL"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "IsNull({Movimiento_Cereal_Analisis.IDMovimiento_Cereal})"
    End Select
    
    'FORMULARIO 1116A
    Select Case cboCertificadoDeposito.ListIndex
        Case 0
        Case 1
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.Certificado = 1"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.Certificado} = True"
        Case 2
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.Certificado = 0"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.Certificado} = False"
    End Select
    
    'FORMULARIO 1116RT
    Select Case cboCertificadoRT.ListIndex
        Case 0
        Case 1
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "(Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) > 0"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "({Movimiento_Cereal.PesoNeto} - {Movimiento_Cereal.KilogramoAplicado}) > 0"
        Case 2
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "(Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) = 0"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "({Movimiento_Cereal.PesoNeto} - {Movimiento_Cereal.KilogramoAplicado}) = 0"
    End Select
    
    'ANULADA
    Select Case cboAnulada.ListIndex
        Case 0  'Todas
        Case 1  'No
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "IsNull({Movimiento_Cereal.IDCartaPorte_MotivoAnulacion})"
        Case 2  'Si
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NOT NULL"
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "NOT IsNull({Movimiento_Cereal.IDCartaPorte_MotivoAnulacion})"
        Case Else
            mstrSQLWhere = mstrSQLWhere & IIf(mstrSQLWhere = "", "WHERE ", " AND ") & "Movimiento_Cereal.IDCartaPorte_MotivoAnulacion = " & cboAnulada.ListIndex - 2
            mRecordSelectionFormula = mRecordSelectionFormula & IIf(mRecordSelectionFormula = "", "", " AND ") & "{Movimiento_Cereal.IDCartaPorte_MotivoAnulacion} = " & cboAnulada.ListIndex - 2
    End Select
    
    If mstrSQLWhere <> "" Then
        mstrSQLWhere = mstrSQLWhere & vbCr
    End If
    
    recData.Open strSQLSelect & strSQLFrom & mstrSQLWhere, pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    
    Set tdbgrdData.DataSource = recData
    
    Call SortColumn(mOrderColumn)

    recData.Find "IDMovimiento_Cereal = " & SaveIDMovimiento_Cereal
    If recData.EOF Then
        If Not (recData.BOF And recData.EOF) Then
            recData.MoveFirst
        End If
    End If
    RecordCount = recData.RecordCount
    Select Case RecordCount
        Case 0
            stbMain.SimpleText = "No hay Movimientos de Cereales."
        Case 1
            stbMain.SimpleText = "1 Movimiento de Cereal."
        Case Else
            stbMain.SimpleText = RecordCount & " Movimientos de Cereales."
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
    ShowErrorMessage "Forms.Movimiento_CerealList.LoadData", "Error al leer los Movimientos de Cereales."
    On Error Resume Next
    If recData.State = adStateOpen Then
        recData.Close
    End If
    Set recData = Nothing
End Function

Private Sub Form_Load()
    Dim ValueItem As TrueOleDBGrid80.ValueItem
    
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
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_CEREAL_TIPO_ENTRADA, MOVIMIENTO_CEREAL_TIPO_ENTRADA_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_CEREAL_TIPO_SALIDA, MOVIMIENTO_CEREAL_TIPO_SALIDA_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , , "-"
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA, MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION, MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA, MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA_NOMBRE
    tlbMain.buttons("NEW").ButtonMenus.Add , MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE, MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE_NOMBRE
    
    '//////////////////////////////////////////////////////////
    'ASIGNO LOS REPORTES AL SUBMENU DE IMPRIMIR
    Call MiscAppFunctions.FillSubmenuWithReports(REPORT_FILENAME_PREFIX, tlbMain.buttons("PRINT").ButtonMenus)
    
    Call CSM_Parameter_CoolBar.GetSettings(Mid(Me.Name, 4), cbrMain)
    
    chkTipo_Entrada.Caption = MOVIMIENTO_CEREAL_TIPO_ENTRADA_NOMBRECORTO
    chkTipo_Salida.Caption = MOVIMIENTO_CEREAL_TIPO_SALIDA_NOMBRECORTO
    chkTipo_TransferenciaInterna.Caption = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA_NOMBRECORTO
    chkTipo_SalidaProduccion.Caption = MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION_NOMBRECORTO
    chkTipo_AjusteBaja.Caption = MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA_NOMBRECORTO
    chkTipo_AjusteSube.Caption = MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE_NOMBRECORTO
    
    cboComprobanteNumero.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboComprobanteNumero.AddItem "="
    cboComprobanteNumero.AddItem ">"
    cboComprobanteNumero.AddItem ">="
    cboComprobanteNumero.AddItem "<"
    cboComprobanteNumero.AddItem "<="
    cboComprobanteNumero.AddItem "<>"
    cboComprobanteNumero.AddItem "Entre"
    cboComprobanteNumero.ListIndex = 0
    
    cboFechaCargaDescarga.AddItem "Carga:"
    cboFechaCargaDescarga.AddItem "(Des)carga:"
    cboFechaCargaDescarga.ListIndex = 0
    
    cboFechaCargaDescargaOperacion.AddItem CSM_Constant.ITEM_ALL_FEMALE
    cboFechaCargaDescargaOperacion.AddItem "="
    cboFechaCargaDescargaOperacion.AddItem ">"
    cboFechaCargaDescargaOperacion.AddItem ">="
    cboFechaCargaDescargaOperacion.AddItem "<"
    cboFechaCargaDescargaOperacion.AddItem "<="
    cboFechaCargaDescargaOperacion.AddItem "<>"
    cboFechaCargaDescargaOperacion.AddItem "Entre"
    cboFechaCargaDescargaOperacion.ListIndex = 7
    
    dtpFechaCargaDescarga_Desde.value = DateAdd("d", -7, Date)
    txtFechaCargaDescarga_DiaSemana.Text = WeekdayName(Weekday(dtpFechaCargaDescarga_Desde.value))
    dtpFechaCargaDescarga_Hasta.value = Date
    
    Call FillComboBox_Planta
    Call FillComboBox_Entidad_Remitente
    Call FillComboBox_Entidad_Destinatario
    Call FillComboBox_Entidad_Transportista
    Call FillComboBox_Cosecha
    Call FillComboBox_Cereal
        
    cboPesoBruto.AddItem CSM_Constant.ITEM_ALL_MALE
    cboPesoBruto.AddItem "="
    cboPesoBruto.AddItem ">"
    cboPesoBruto.AddItem ">="
    cboPesoBruto.AddItem "<"
    cboPesoBruto.AddItem "<="
    cboPesoBruto.AddItem "<>"
    cboPesoBruto.ListIndex = 0
    
    cboPesoNeto.AddItem CSM_Constant.ITEM_ALL_MALE
    cboPesoNeto.AddItem "="
    cboPesoNeto.AddItem ">"
    cboPesoNeto.AddItem ">="
    cboPesoNeto.AddItem "<"
    cboPesoNeto.AddItem "<="
    cboPesoNeto.AddItem "<>"
    cboPesoNeto.ListIndex = 0
    
    cboHumedad.AddItem CSM_Constant.ITEM_ALL_MALE
    cboHumedad.AddItem CSM_Constant.ITEM_EMPTY_FEMALE
    cboHumedad.AddItem CSM_Constant.ITEM_COMPLETE_FEMALE
    cboHumedad.AddItem "="
    cboHumedad.AddItem ">"
    cboHumedad.AddItem ">="
    cboHumedad.AddItem "<"
    cboHumedad.AddItem "<="
    cboHumedad.AddItem "<>"
    cboHumedad.ListIndex = 0
    
    cboAnalisis.AddItem CSM_Constant.ITEM_ALL_MALE
    cboAnalisis.AddItem CSM_Constant.BOOLEAN_STRING_YES
    cboAnalisis.AddItem CSM_Constant.BOOLEAN_STRING_NO
    cboAnalisis.ListIndex = 0
    
    cboCertificadoDeposito.AddItem CSM_Constant.ITEM_ALL_MALE
    cboCertificadoDeposito.AddItem CSM_Constant.BOOLEAN_STRING_YES
    cboCertificadoDeposito.AddItem CSM_Constant.BOOLEAN_STRING_NO
    cboCertificadoDeposito.ListIndex = 0
    
    cboCertificadoRT.AddItem CSM_Constant.ITEM_ALL_MALE
    cboCertificadoRT.AddItem CSM_Constant.BOOLEAN_STRING_YES
    cboCertificadoRT.AddItem CSM_Constant.BOOLEAN_STRING_NO
    cboCertificadoRT.ListIndex = 0
    
    Call FillComboBox_MotivoAnulacion
    
    'AGREGO LOS VALUE ITEMS DE LA COLUMNA TIPO
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.value = MOVIMIENTO_CEREAL_TIPO_ENTRADA
    ValueItem.DisplayValue = MOVIMIENTO_CEREAL_TIPO_ENTRADA_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.value = MOVIMIENTO_CEREAL_TIPO_SALIDA
    ValueItem.DisplayValue = MOVIMIENTO_CEREAL_TIPO_SALIDA_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.value = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA
    ValueItem.DisplayValue = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.value = MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION
    ValueItem.DisplayValue = MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.value = MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA
    ValueItem.DisplayValue = MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA_NOMBRECORTO
    tdbgrdData.Columns("Tipo").ValueItems.Add ValueItem
    
    Set ValueItem = New TrueOleDBGrid80.ValueItem
    ValueItem.value = MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE
    ValueItem.DisplayValue = MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE_NOMBRECORTO
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
        
        .Columns("PesoFinal").Visible = pParametro.Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar
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
    
    Set frmMovimiento_Cereal_Lista = Nothing
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim Movimiento_Cereal As Movimiento_Cereal

    Select Case Button.Key
        Case "PROPERTIES"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento de Cereal seleccionado para modificar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            Set Movimiento_Cereal = New Movimiento_Cereal
            Movimiento_Cereal.IDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
            If Movimiento_Cereal.Load() Then
                If frmMovimiento_Cereal_Detalle.Startup(Movimiento_Cereal) Then
                    If frmMovimiento_Cereal_Detalle.LoadData() Then
                        frmMovimiento_Cereal_Detalle.Show
                        frmMovimiento_Cereal_Detalle.SetFocus
                    Else
                        Unload frmMovimiento_Cereal_Detalle
                        Set frmMovimiento_Cereal_Detalle = Nothing
                    End If
                Else
                    Unload frmMovimiento_Cereal_Detalle
                    Set frmMovimiento_Cereal_Detalle = Nothing
                End If
            End If
            Set Movimiento_Cereal = Nothing
            
        Case "DELETE"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento de Cereal seleccionado para eliminar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If
            
            Set Movimiento_Cereal = New Movimiento_Cereal
            Movimiento_Cereal.IDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
            If Movimiento_Cereal.Load() Then
                'VERIFICO QUE NO ESTÉ CERTIFICADO
                If Movimiento_Cereal.Certificado = vbChecked Then
                    MsgBox "No se puede eliminar este Movimiento de Cereal porque ya está Certificado.", vbExclamation, App.Title
                    Set Movimiento_Cereal = Nothing
                    Exit Sub
                End If
                
                If MsgBox("¿Desea eliminar este Movimiento de Cereal?", vbExclamation + vbYesNo + vbDefaultButton2, App.Title) = vbYes Then
                    Movimiento_Cereal.Delete
                End If
            End If
            Set Movimiento_Cereal = Nothing
            tdbgrdData.SetFocus
            
        Case "COPY"
            If tdbgrdData.FirstRow = "" Then
                MsgBox "No hay ningún Movimiento de Cereal seleccionado para copiar.", vbExclamation, App.Title
                tdbgrdData.SetFocus
                Exit Sub
            End If

            Set Movimiento_Cereal = New Movimiento_Cereal
            Movimiento_Cereal.IDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
            If Movimiento_Cereal.Copy() Then
                If frmMovimiento_Cereal_Detalle.Startup(Movimiento_Cereal) Then
                    If frmMovimiento_Cereal_Detalle.LoadData() Then
                        frmMovimiento_Cereal_Detalle.Show
                    Else
                        Unload frmMovimiento_Cereal_Detalle
                        Set frmMovimiento_Cereal_Detalle = Nothing
                    End If
                Else
                    Unload frmMovimiento_Cereal_Detalle
                    Set frmMovimiento_Cereal_Detalle = Nothing
                End If
            End If
            Set Movimiento_Cereal = Nothing
            
        Case "PRINT"
            'Call tlbMain_ButtonMenuClick(tlbMain.Buttons("PRINT").ButtonMenus("TICKETBALANZA"))
            
        Case "SELECT"
        
    End Select
End Sub

Private Sub tlbMain_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Dim Movimiento_Cereal As Movimiento_Cereal
    Dim Movimiento_Cereal_Calculo As Movimiento_Cereal_Calculo
    Dim recData As ADODB.recordset
    
    Select Case ButtonMenu.Parent.Key
    
        Case "NEW"
            Set Movimiento_Cereal = New Movimiento_Cereal
            Movimiento_Cereal.Tipo = ButtonMenu.Key
            If frmMovimiento_Cereal_Detalle.Startup(Movimiento_Cereal) Then
                If cboEntidad_Remitente.ListIndex > 0 Then
                    frmMovimiento_Cereal_Detalle.datcboEntidad_Titular.BoundText = cboEntidad_Remitente.ItemData(cboEntidad_Remitente.ListIndex)
                End If
                frmMovimiento_Cereal_Detalle.Show
                frmMovimiento_Cereal_Detalle.SetFocus
            Else
                Unload frmMovimiento_Cereal_Detalle
                Set frmMovimiento_Cereal_Detalle = Nothing
            End If
            
    
        '//////////////////////////////////////////////////////////////////////
        ' P R I N T
        '//////////////////////////////////////////////////////////////////////
        Case "PRINT"
            Select Case ButtonMenu.Key
                Case "PREDEFINED"
                Case Else   'REPORTES DE FORMULARIOS
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ningún Movimiento para Imprimir.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                    
                    Call MiscAppFunctions.ShowReport(ButtonMenu.Key, ButtonMenu.Text, "", 0, mRecordSelectionFormula)
            End Select
    
        '//////////////////////////////////////////////////////////////////////
        ' T A S K S
        '//////////////////////////////////////////////////////////////////////
        Case "TASKS"
            Select Case ButtonMenu.Key
                Case "CONVERTIR_SUBPRODUCTO"
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ningún Movimiento para Convertir a SubProducto.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                    
                    Set Movimiento_Cereal = New Movimiento_Cereal
                    Movimiento_Cereal.IDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
                    If Movimiento_Cereal.Load() Then
                        If Movimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION Then
                            MsgBox "Debe seleccionar un movimiento de salida a producción.", vbInformation, App.Title
                            tdbgrdData.SetFocus
                            Set Movimiento_Cereal = Nothing
                            Exit Sub
                        End If
                    End If
                    
                    If frmMovimiento_Cereal_A_SubProducto.Startup(Movimiento_Cereal) Then
                        frmMovimiento_Cereal_A_SubProducto.Show
                    End If
                    
                    Set Movimiento_Cereal = Nothing
            
                Case "OBTENER_HUMEDDAYZARANDEO"
                    Call ObtenerPesadasHumedadYZarandeo
                    
                Case "RECALCULAR_KILOGRAMOS"
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ningún movimiento para recalcular los kilogramos.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                    
                    If MsgBox("Se recalcularán las mermas de las entradas y los kilogramos sin aplicar de las salidas mostradas.", vbQuestion + vbYesNo, App.Title) = vbYes Then
                        Set recData = tdbgrdData.DataSource
                        recData.MoveFirst
                        Set Movimiento_Cereal = New Movimiento_Cereal
                        Do While Not recData.EOF
                            stbMain.SimpleText = "Recalculando kilogramos: " & recData.AbsolutePosition & " de " & recData.RecordCount & " (" & Format(recData.AbsolutePosition / recData.RecordCount, "Percent") & ")..."
                            DoEvents
                            Movimiento_Cereal.IDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
                            Movimiento_Cereal.RefreshListSkip = True
                            If Movimiento_Cereal.Load() Then
                                Movimiento_Cereal.UpdateMermas
                            End If
                            recData.MoveNext
                        Loop
                        recData.MoveFirst
                        RefreshList_Module.Movimiento_Cereal 0
                        Set Movimiento_Cereal = Nothing
                    End If
                    
                    tdbgrdData.SetFocus
                    
                Case "RECALCULAR_ACONDICIONAMIENTO"
                    If tdbgrdData.FirstRow = "" Then
                        MsgBox "No hay ningún movimiento para recalcular los gastos de acondicionamiento.", vbExclamation, App.Title
                        tdbgrdData.SetFocus
                        Exit Sub
                    End If
                    
                    If MsgBox("Se recalcularán los gastos de acondicionamiento de todos los Movimientos de entrada mostrados.", vbQuestion + vbYesNo, App.Title) = vbYes Then
                        Set recData = tdbgrdData.DataSource
                        recData.MoveFirst
                        Set Movimiento_Cereal_Calculo = New Movimiento_Cereal_Calculo
                        Do While Not recData.EOF
                            stbMain.SimpleText = "Recalculando gastos de acondicionamiento: " & recData.AbsolutePosition & " de " & recData.RecordCount & " (" & Format(recData.AbsolutePosition / recData.RecordCount, "Percent") & ")..."
                            DoEvents
                            Movimiento_Cereal_Calculo.IDMovimiento_Cereal = recData("IDMovimiento_Cereal").value
                            Movimiento_Cereal_Calculo.NoMatchRaiseError = False
                            Movimiento_Cereal_Calculo.RefreshListSkip = True
                            If Movimiento_Cereal_Calculo.Load() Then
                                Call Movimiento_Cereal_Calculo.Calcular
                            End If
                            recData.MoveNext
                        Loop
                        recData.MoveFirst
                        RefreshList_Module.Movimiento_Cereal 0
                        Set Movimiento_Cereal_Calculo = Nothing
                    End If
                    
                    tdbgrdData.SetFocus
                    
            End Select
    End Select
End Sub

'============================================================
'Movimiento_Cereal TIPO
Private Sub chkTipo_Entrada_Click()
    Call LoadData(0)
End Sub

Private Sub chkTipo_Salida_Click()
    Call LoadData(0)
End Sub

Private Sub chkTipo_TransferenciaInterna_Click()
    Call LoadData(0)
End Sub

Private Sub chkTipo_SalidaProduccion_Click()
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
    chkTipo_Entrada.value = vbChecked
    chkTipo_Salida.value = vbChecked
    chkTipo_TransferenciaInterna.value = vbChecked
    chkTipo_SalidaProduccion.value = vbChecked
    chkTipo_AjusteBaja.value = vbChecked
    chkTipo_AjusteSube.value = vbChecked
    mLoading = False
    Call LoadData(0)
    tdbgrdData.SetFocus
End Sub

Private Sub cmdTipo_Ninguno_Click()
    mLoading = True
    chkTipo_Entrada.value = vbUnchecked
    chkTipo_Salida.value = vbUnchecked
    chkTipo_TransferenciaInterna.value = vbUnchecked
    chkTipo_SalidaProduccion.value = vbUnchecked
    chkTipo_AjusteBaja.value = vbUnchecked
    chkTipo_AjusteSube.value = vbUnchecked
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
    maskedtextboxComprobanteNumeroDesde.Visible = (cboComprobanteNumero.ListIndex > 0)
    labelComprobanteNumeroHasta.Visible = (cboComprobanteNumero.ListIndex = 7)
    maskedtextboxComprobanteNumeroHasta.Visible = (cboComprobanteNumero.ListIndex = 7)
    
    Call LoadData(0)
End Sub

'============================================================
'CARTA PORTE NUMERO DESDE
Private Sub maskedtextboxComprobanteNumeroDesde_GotFocus()
    maskedtextboxComprobanteNumeroDesde.SelStart = 0
    maskedtextboxComprobanteNumeroDesde.SelLength = Len(maskedtextboxComprobanteNumeroDesde.Text)
End Sub

Private Sub maskedtextboxComprobanteNumeroDesde_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call maskedtextboxComprobanteNumeroDesde_LostFocus
        Call LoadData(0)
    End If
End Sub

Private Sub maskedtextboxComprobanteNumeroDesde_LostFocus()
    maskedtextboxComprobanteNumeroDesde.Text = PadStringLeft(maskedtextboxComprobanteNumeroDesde.Text, "0", 13)
    Call LoadData(0)
End Sub

'============================================================
'CARTA PORTE NUMERO HASTA
Private Sub maskedtextboxComprobanteNumeroHasta_GotFocus()
    maskedtextboxComprobanteNumeroHasta.SelStart = 0
    maskedtextboxComprobanteNumeroHasta.SelLength = Len(maskedtextboxComprobanteNumeroHasta.Text)
End Sub

Private Sub maskedtextboxComprobanteNumeroHasta_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call maskedtextboxComprobanteNumeroHasta_LostFocus
        Call LoadData(0)
    End If
End Sub

Private Sub maskedtextboxComprobanteNumeroHasta_LostFocus()
    maskedtextboxComprobanteNumeroHasta.Text = PadStringLeft(maskedtextboxComprobanteNumeroHasta.Text, "0", 13)
    Call LoadData(0)
End Sub

'============================================================
'CTG NUMERO
Private Sub maskedtextboxCtgNumero_GotFocus()
    maskedtextboxCtgNumero.SelStart = 0
    maskedtextboxCtgNumero.SelLength = Len(maskedtextboxCtgNumero.Text)
End Sub

Private Sub maskedtextboxCtgNumero_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

'============================================================
'FECHA CARGA / DESCARGA
Private Sub cboFechaCargaDescarga_Click()
    Call LoadData(0)
End Sub

Private Sub cboFechaCargaDescargaOperacion_Click()
    ' VISIBILIDAD
    txtFechaCargaDescarga_DiaSemana.Visible = (cboFechaCargaDescargaOperacion.ListIndex > 0 And cboFechaCargaDescargaOperacion.ListIndex < 7)
    cmdFechaCargaDescarga_DesdeAnterior.Visible = (cboFechaCargaDescargaOperacion.ListIndex > 0)
    dtpFechaCargaDescarga_Desde.Visible = (cboFechaCargaDescargaOperacion.ListIndex > 0)
    cmdFechaCargaDescarga_DesdeSiguiente.Visible = (cboFechaCargaDescargaOperacion.ListIndex > 0)
    cmdFechaCargaDescarga_DesdeHoy.Visible = (cboFechaCargaDescargaOperacion.ListIndex > 0)
    
    lblFechaCargaDescarga_Y.Visible = (cboFechaCargaDescargaOperacion.ListIndex = 7)
    
    cmdFechaCargaDescarga_HastaAnterior.Visible = (cboFechaCargaDescargaOperacion.ListIndex = 7)
    dtpFechaCargaDescarga_Hasta.Visible = (cboFechaCargaDescargaOperacion.ListIndex = 7)
    cmdFechaCargaDescarga_HastaSiguiente.Visible = (cboFechaCargaDescargaOperacion.ListIndex = 7)
    cmdFechaCargaDescarga_HastaHoy.Visible = (cboFechaCargaDescargaOperacion.ListIndex = 7)
    
    ' POSICIÓN Y ANCHO PICTURE + BAND
    If cboFechaCargaDescargaOperacion.ListIndex > 0 Then
        If cboFechaCargaDescargaOperacion.ListIndex < 7 Then
            cmdFechaCargaDescarga_DesdeAnterior.Left = txtFechaCargaDescarga_DiaSemana.Left + txtFechaCargaDescarga_DiaSemana.Width + 45
        Else
            cmdFechaCargaDescarga_DesdeAnterior.Left = cboFechaCargaDescargaOperacion.Left + cboFechaCargaDescargaOperacion.Width + 45
        End If
        dtpFechaCargaDescarga_Desde.Left = cmdFechaCargaDescarga_DesdeAnterior.Left + cmdFechaCargaDescarga_DesdeAnterior.Width
        cmdFechaCargaDescarga_DesdeSiguiente.Left = dtpFechaCargaDescarga_Desde.Left + dtpFechaCargaDescarga_Desde.Width
        cmdFechaCargaDescarga_DesdeHoy.Left = cmdFechaCargaDescarga_DesdeSiguiente.Left + cmdFechaCargaDescarga_DesdeSiguiente.Width
        If cboFechaCargaDescargaOperacion.ListIndex < 7 Then
            picFechaCargaDescarga.Width = cmdFechaCargaDescarga_DesdeHoy.Left + cmdFechaCargaDescarga_DesdeHoy.Width
        Else
            picFechaCargaDescarga.Width = cmdFechaCargaDescarga_HastaHoy.Left + cmdFechaCargaDescarga_HastaHoy.Width
        End If
        cbrMain.Bands(5).MinWidth = picFechaCargaDescarga.Width
        cbrMain.Bands(5).Width = picFechaCargaDescarga.Width
    End If
    
    Call LoadData(0)
End Sub

Private Sub cmdFechaCargaDescarga_DesdeAnterior_Click()
    dtpFechaCargaDescarga_Desde.value = DateAdd("d", -1, dtpFechaCargaDescarga_Desde.value)
    dtpFechaCargaDescarga_Desde.SetFocus
    dtpFechaCargaDescarga_Desde_Change
End Sub

Private Sub dtpFechaCargaDescarga_Desde_Change()
    txtFechaCargaDescarga_DiaSemana.Text = WeekdayName(Weekday(dtpFechaCargaDescarga_Desde.value))
    Call LoadData(0)
End Sub

Private Sub cmdFechaCargaDescarga_DesdeSiguiente_Click()
    dtpFechaCargaDescarga_Desde.value = DateAdd("d", 1, dtpFechaCargaDescarga_Desde.value)
    dtpFechaCargaDescarga_Desde.SetFocus
    dtpFechaCargaDescarga_Desde_Change
End Sub

Private Sub cmdFechaCargaDescarga_DesdeHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaCargaDescarga_Desde.value
    dtpFechaCargaDescarga_Desde.value = Date
    dtpFechaCargaDescarga_Desde.SetFocus
    If OldValue <> dtpFechaCargaDescarga_Desde.value Then
        dtpFechaCargaDescarga_Desde_Change
    End If
End Sub

Private Sub cmdFechaCargaDescarga_HastaAnterior_Click()
    dtpFechaCargaDescarga_Hasta.value = DateAdd("d", -1, dtpFechaCargaDescarga_Hasta.value)
    dtpFechaCargaDescarga_Hasta.SetFocus
    dtpFechaCargaDescarga_Hasta_Change
End Sub

Private Sub dtpFechaCargaDescarga_Hasta_Change()
    Call LoadData(0)
End Sub

Private Sub cmdFechaCargaDescarga_HastaSiguiente_Click()
    dtpFechaCargaDescarga_Hasta.value = DateAdd("d", 1, dtpFechaCargaDescarga_Hasta.value)
    dtpFechaCargaDescarga_Hasta.SetFocus
    dtpFechaCargaDescarga_Hasta_Change
End Sub

Private Sub cmdFechaCargaDescarga_HastaHoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaCargaDescarga_Hasta.value
    dtpFechaCargaDescarga_Hasta.value = Date
    dtpFechaCargaDescarga_Hasta.SetFocus
    If OldValue <> dtpFechaCargaDescarga_Hasta.value Then
        dtpFechaCargaDescarga_Hasta_Change
    End If
End Sub

'============================================================
'ENTIDADES
Private Sub cboEntidad_Remitente_Click()
    Call LoadData(0)
End Sub

Private Sub cboEntidad_Destinatario_Click()
    Call LoadData(0)
End Sub

Private Sub cboEntidad_Transportista_Click()
    Call LoadData(0)
End Sub


'============================================================
'COSECHA
Private Sub cboCosecha_Click()
    Call LoadData(0)
End Sub

'============================================================
'CEREAL
Private Sub cboCereal_Click()
    Call LoadData(0)
End Sub

'============================================================
'PESO BRUTO
Private Sub cboPesoBruto_Click()
    txtPesoBruto.Visible = (cboPesoBruto.ListIndex > 0)
    
    Call LoadData(0)
End Sub

Private Sub txtPesoBruto_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPesoBruto)
End Sub

Private Sub txtPesoBruto_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtPesoBruto_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtPesoBruto
End Sub

'============================================================
'PESO NETO
Private Sub cboPesoNeto_Click()
    txtPesoNeto.Visible = (cboPesoNeto.ListIndex > 0)
    
    Call LoadData(0)
End Sub

Private Sub txtPesoNeto_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPesoNeto)
End Sub

Private Sub txtPesoNeto_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtPesoNeto_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtPesoNeto
End Sub

'============================================================
'HUMEDAD
Private Sub cboHumedad_Click()
    txtHumedad.Visible = (cboHumedad.ListIndex > 2)
    
    Call LoadData(0)
End Sub

Private Sub txtHumedad_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtHumedad)
End Sub

Private Sub txtHumedad_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        Call LoadData(0)
    End If
End Sub

Private Sub txtHumedad_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtHumedad
End Sub

'============================================================
'ANAÁLISIS
Private Sub cboAnalisis_Click()
    Call LoadData(0)
End Sub

'============================================================
'FORMULARIO 1116A
Private Sub cboCertificadoDeposito_Click()
    Call LoadData(0)
End Sub

'============================================================
'FORMULARIO 1116RT
Private Sub cboCertificadoRT_Click()
    Call LoadData(0)
End Sub

'============================================================
'ANULADA
Private Sub cboAnulada_Click()
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
    Dim recData As ADODB.recordset

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
    Call CSM_Control_ComboBox.FillFromSQL(cboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL", "ID", "Nombre", "Plantas", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Entidad_Remitente() As Boolean
    Dim SaveItemData As Long
    
    If cboEntidad_Remitente.ListIndex > -1 Then
        SaveItemData = cboEntidad_Remitente.ItemData(cboEntidad_Remitente.ListIndex)
    End If
    cboEntidad_Remitente.Clear
    cboEntidad_Remitente.AddItem CSM_Constant.ITEM_ALL_MALE
    'TO FIX: 0 = pParametro.IDEntidad_Depositario
    Call CSM_Control_ComboBox.FillFromSQL(cboEntidad_Remitente, "usp_Entidad_Remitente_List 0, 1, NULL", "IDEntidad", "Nombre", "Remitentes", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Entidad_Destinatario() As Boolean
    Dim SaveItemData As Long
    
    If cboEntidad_Destinatario.ListIndex > -1 Then
        SaveItemData = cboEntidad_Destinatario.ItemData(cboEntidad_Destinatario.ListIndex)
    End If
    cboEntidad_Destinatario.Clear
    cboEntidad_Destinatario.AddItem CSM_Constant.ITEM_ALL_MALE
    Call CSM_Control_ComboBox.FillFromSQL(cboEntidad_Destinatario, "usp_Entidad_Destinatario_List 0, 1, NULL", "IDEntidad", "Nombre", "Destinatarios", cscpItemOrFirst, SaveItemData, False)
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

Public Function FillComboBox_Cosecha() As Boolean
    Dim SaveItemData As Byte
    
    If cboCosecha.ListIndex > -1 Then
        SaveItemData = cboCosecha.ItemData(cboCosecha.ListIndex)
    Else
        SaveItemData = pParametro.Cosecha_IDDefault
    End If
    cboCosecha.Clear
    cboCosecha.AddItem CSM_Constant.ITEM_ALL_FEMALE
    
    Call CSM_Control_ComboBox.FillFromSQL(cboCosecha, "usp_Cosecha_List 0, 1, NULL", "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_Cereal() As Boolean
    Dim SaveItemData As Long
    
    cboCereal.Clear
    cboCereal.AddItem CSM_Constant.ITEM_ALL_MALE
    
    If cboCereal.ListIndex > -1 Then
        SaveItemData = cboCereal.ItemData(cboCereal.ListIndex)
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboCereal, "usp_Cereal_List 0, 0, 1, NULL", "IDCereal", "Nombre", "Cereales", cscpItemOrFirst, SaveItemData, False)
End Function

Public Function FillComboBox_MotivoAnulacion() As Boolean
    Dim SaveItemData As Byte
    
    If cboAnulada.ListIndex > -1 Then
        SaveItemData = cboAnulada.ItemData(cboAnulada.ListIndex)
    Else
        SaveItemData = 254
    End If
    Call CSM_Control_ComboBox.FillFromSQL(cboAnulada, "usp_CartaPorte_MotivoAnulacion_List 1, 1, 1", "IDCartaPorte_MotivoAnulacion", "Nombre", "Motivos de anulación", cscpItemOrFirstIfUnique, SaveItemData)
End Function

Private Function ExportCartasPorteRecibidas30(ByVal ExportPath As String) As Boolean
    Dim recData_CartaPorte As ADODB.recordset

    Dim FileNumber As Integer

    Dim CartaPorteRecibida_TextStream As String

    Dim Movimiento_Cereal As Movimiento_Cereal
    Dim ComprobanteNumero As String
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim DataIncomplete As Integer

    Const FILE_NAMEANDEXTENSION As String = "CPR.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    ExportPath = ExportPath & IIf(Right(ExportPath, 1) = "\", "", "\")
    If FileSystem.Dir(ExportPath & FILE_NAMEANDEXTENSION) <> "" Then
        DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILE_NAMEANDEXTENSION & ") en la carpeta de destino (" & ExportPath & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
        If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
            Exit Function
        End If
    End If

    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Cartas de Porte Recibidas..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents

    '////////////////////////////////////////////////////////////
    'CARTAS DE PORTE
    '////////////////////////////////////////////////////////////

    'ABRO UN NUEVO RECORDSET CON LOS FILTROS SELECCIONADOS, Y LO ORDENO POR NUMERO DE CARTA DE PORTE
    Set recData_CartaPorte = New ADODB.recordset

    recData_CartaPorte.Open "SELECT Movimiento_Cereal.IDMovimiento_Cereal, Movimiento_Cereal.ComprobanteNumero, Movimiento_Cereal.PesoNeto FROM Movimiento_Cereal LEFT JOIN Formulario1116A_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario1116A_Detalle.IDMovimiento_Cereal " & mstrSQLWhere & " ORDER BY ComprobanteNumero", pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText

    'COMIENZO A RECORRER LAS Movimiento_CerealS
    Do While Not recData_CartaPorte.EOF
        'CARGO LOS DATOS DEl Movimiento_Cereal ACTUAL
        Set Movimiento_Cereal = New Movimiento_Cereal
        Movimiento_Cereal.IDMovimiento_Cereal = recData_CartaPorte("IDMovimiento_Cereal").value
        If Not Movimiento_Cereal.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Movimiento_Cereal = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If

        With Movimiento_Cereal
            'VERIFICO LOS DATOS DE LA CARTA DE PORTE
            If Movimiento_Cereal.IDOrigenDestino_Origen = 0 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificada la Procedencia." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & "C.P. Nº: " & Movimiento_Cereal.ComprobanteNumero & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.PesoBruto > 45000 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal excede los 45.000 kgs. de Peso Bruto." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & "C.P. Nº: " & Movimiento_Cereal.ComprobanteNumero & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no es una Entrada." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & "C.P. Nº: " & Movimiento_Cereal.ComprobanteNumero & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.TransporteDominioCamion = "" Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificada la Patente del Camión." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & "C.P. Nº: " & Movimiento_Cereal.ComprobanteNumero & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.CTGNumero = 0 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificado el Número de CTG." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & "C.P. Nº: " & Movimiento_Cereal.ComprobanteNumero & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.FechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificada la Fecha de Descarga." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & "C.P. Nº: " & Movimiento_Cereal.ComprobanteNumero & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            Else

                'VERIFICO QUE NO SEA UNA NUEVA CARTA DE PORTE
                If ComprobanteNumero <> Movimiento_Cereal.ComprobanteNumero Then
                    ComprobanteNumero = Movimiento_Cereal.ComprobanteNumero
                End If

                '1 - Tipo de Transporte - (1=Transporte Automotor)
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "1"
                '2 - Tipo de Carta de Porte - (1=Cartas de Porte Recibidas)
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "1"
                '3 - No. Carta de Porte
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .ComprobanteNumero
                '4 - No. de CEE
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .CartaPorte_Talonario.CEENumero
                '5 - No. de CTG
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .CTGNumero
                '6 - Fecha de Carga
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & Format(.FechaCarga, "ddmmyyyy")
                '7 - CUIT del Titular de la CP
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Titular.CUIT
                '8 - CUIT del Intermediario de la CP
                If .IDEntidad_Intermediario = 0 Then
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "00000000000"
                Else
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Intermediario.CUIT
                End If
                '9 - CUIT del Remitente Comercial de la CP
                If .IDEntidad_RemitenteComercial = 0 Then
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "00000000000"
                Else
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_RemitenteComercial.CUIT
                End If
                '10 - CUIT del Corredor de la CP
                If .IDEntidad_Corredor = 0 Then
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "00000000000"
                Else
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Corredor.CUIT
                End If
                '11 - CUIT del Entregador de la CP
                If .IDEntidad_Entregador = 0 Then
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "00000000000"
                Else
                    CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Entregador.CUIT
                End If
                '12 - CUIT del Destinatario de la CP
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Destinatario.CUIT
                '13 - CUIT del Destino de la CP
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Destino.CUIT
                '14 - CUIT del Transportista
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Transportista.CUIT
                '15 - CUIT / CUIL del Chofer
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Entidad_Chofer.CUIT
                '16 - Cosecha
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & .Cosecha.ONCCA_Codigo
                '17 - Especie
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.PadStringLeft(.Cereal.ONCCA_EspecieCodigo, "0", 3)
                '18 - Tipo de grano
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.PadStringRight(.Cereal.ONCCA_GranoTipoCodigo, "0", 2)
                '19 - Contrato/Boleto Compra-Venta
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.PadStringLeft("", " ", 20)
                '20 - Tipo de Pesado: 1 = Balanza
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "1"
                '21 - Peso Neto de Carga
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.PesoNeto, "00000000.00")
                '22 - Código de Establecimiento Origen
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & Format(.OrigenDestino_Origen.ONCCA_Codigo, "000000")
                '23 - Código de Localidad Origen
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & UCase(CSM_String.PadStringLeft(.OrigenDestino_Origen.IDLocalidad, "0", 5))
                '24 - Código de Establecimiento Destino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & Format(.OrigenDestino_Destino.ONCCA_Codigo, "000000")
                '25 - Código de Localidad Destino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & UCase(CSM_String.PadStringLeft(.OrigenDestino_Destino.IDLocalidad, "0", 5))
                '26 - Kms. a recorrer
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.PadStringRight(.TransporteKilometro, "0", 4)
                '27 - Patente del Camión
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & UCase(CSM_String.PadStringRight(.TransporteDominioCamion, " ", 11))
                '28 - Acoplado Patente
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & UCase(CSM_String.PadStringRight(.TransporteDominioAcoplado, " ", 11))
                '29 - Tarifa por Tonelada
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.TransporteTarifa, "00000.00")
                '30 - Fecha de Descarga
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & Format(.FechaHoraDescarga, "ddmmyyyy")
                '31 - Fecha de Arribo a Destino/Redestino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & Format(.FechaHoraArribo, "ddmmyyyy")
                '32 - Peso Neto de Descarga
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.PesoNeto, "00000000.00")
                '33 - CUIT Establecimiento Redestino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & String(11, "0")
                '34 - Código de Localidad de Redestino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "00000"
                '35 - Código de Establecimiento de Redestino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "000000"
                '36 - Fecha de Arribo a Redestino
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & "00000000"

                'END OF LINE
                CartaPorteRecibida_TextStream = CartaPorteRecibida_TextStream & vbCrLf
            End If
        End With

        Set Movimiento_Cereal = Nothing

        If DataIncomplete = VbMsgBoxResult.vbNo Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If

        recData_CartaPorte.MoveNext
    Loop

    'LIMPIO LOS SALTOS DE LINEA DE MAS
    If Right(CartaPorteRecibida_TextStream, 2) = vbCrLf Then
        CartaPorteRecibida_TextStream = Left(CartaPorteRecibida_TextStream, Len(CartaPorteRecibida_TextStream) - 2)
    End If

    'ABRO EL ARCHIVO Y GRABO LOS DATOS
    FileNumber = FreeFile()
    If DeletePreviousFile = VbMsgBoxResult.vbYes Then
        Open ExportPath & FILE_NAMEANDEXTENSION For Output As #FileNumber
    Else
        Open ExportPath & FILE_NAMEANDEXTENSION For Append As #FileNumber
    End If
    Print #FileNumber, CartaPorteRecibida_TextStream
    Close #FileNumber

    Unload CSF_Status
    Set CSF_Status = Nothing

    Screen.MousePointer = vbDefault
    ExportCartasPorteRecibidas30 = True
    Exit Function

ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.Movimiento_Cereal_Lista.ExportCartasPorteRecibidas30", "Error al exportar los datos de las Cartas de Porte Recibidas.")
End Function

Private Function ExportCartasPorteEmitidas30(ByVal ExportPath As String) As Boolean
    Dim recData_CartaPorte As ADODB.recordset

    Dim FileNumber As Integer

    Dim CartaPorteEmitida_TextStream As String

    Dim Movimiento_Cereal As Movimiento_Cereal
    Dim ComprobanteNumero As String

    Dim DeletePreviousFile As Integer
    Dim DataIncomplete As Integer

    Const FILE_NAMEANDEXTENSION As String = "CPE.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    ExportPath = ExportPath & IIf(Right(ExportPath, 1) = "\", "", "\")
    If FileSystem.Dir(ExportPath & FILE_NAMEANDEXTENSION) <> "" Then
        DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILE_NAMEANDEXTENSION & ") en la carpeta de destino (" & ExportPath & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
        If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
            Exit Function
        End If
    End If

    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Cartas de Porte Emitidas..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents

    '////////////////////////////////////////////////////////////
    'CARTAS DE PORTE
    '////////////////////////////////////////////////////////////

    'ABRO UN NUEVO RECORDSET CON LOS FILTROS SELECCIONADOS, Y LO ORDENO POR NUMERO DE CARTA DE PORTE
    Set recData_CartaPorte = New ADODB.recordset

    recData_CartaPorte.Open "SELECT First(Movimiento_Cereal.IDMovimiento_Cereal) AS IDMovimiento_Cereal, First(Movimiento_Cereal.IDEquipo) AS IDEquipo, CartaPorte_Numero, Sum(IIF(IsNull(CartaPorte_KilogramoNeto), KilogramoNeto, CartaPorte_KilogramoNeto)) AS KilogramoNeto FROM Movimiento_Cereal LEFT JOIN F1116A_Detalle_Movimiento_Cereal ON Movimiento_Cereal.IDMovimiento_Cereal = F1116A_Detalle_Movimiento_Cereal.IDMovimiento_Cereal " & mstrSQLWhere & " GROUP BY CartaPorte_Numero ORDER BY CartaPorte_Numero", pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText

    'COMIENZO A RECORRER LAS Movimiento_CerealS
    Do While Not recData_CartaPorte.EOF
        'CARGO LOS DATOS DE LA Movimiento_Cereal ACTUAL
        Set Movimiento_Cereal = New Movimiento_Cereal
        Movimiento_Cereal.IDMovimiento_Cereal = recData_CartaPorte("IDMovimiento_Cereal").value
        If Not Movimiento_Cereal.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Movimiento_Cereal = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If

        With Movimiento_Cereal
            'VERIFICO LOS DATOS DE LA CARTA DE PORTE
            If Movimiento_Cereal.IDOrigenDestino_Origen = 0 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificada la Procedencia." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.PesoBruto > 45000 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal excede los 45.000 kgs. de Peso Bruto." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no es una Entrada." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.TransporteDominioCamion = "" Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificada la Patente del Camión." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.CTGNumero = "" Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificado el Número de CTG." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.TransporteKilometro = 0 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificados los Kilómetros." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            ElseIf Movimiento_Cereal.TransporteTarifa = 0 Then
                DataIncomplete = MsgBox("Este Movimiento_Cereal no tiene especificada la Tarifa de Flete." & vbCr & vbCr & "IDMovimiento_Cereal: " & Movimiento_Cereal.IDMovimiento_Cereal & vbCr & vbCr & "¿Desea continuar?", vbQuestion + vbYesNo, App.Title)
            Else

                'VERIFICO QUE NO SEA UNA NUEVA CARTA DE PORTE
                If ComprobanteNumero <> Movimiento_Cereal.ComprobanteNumero Then
                    ComprobanteNumero = Movimiento_Cereal.ComprobanteNumero
                End If

                '1 - Tipo de Transporte - (1=Transporte Automotor)
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "1"
                '2 - Tipo de Carta de Porte - (5=Cartas de Porte Emitidas)
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "5"
                '3 - No. Carta de Porte
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .ComprobanteNumero
                '4 - No. de CEE
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .CartaPorte_Talonario.CEENumero
                '5 - No. de CTG
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .CTGNumero
                '6 - Fecha de Carga
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & Format(.FechaCarga, "ddmmyyyy")
                '7 - CUIT del Titular de la CP
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Titular.CUIT
                '8 - CUIT del Intermediario de la CP
                If .IDEntidad_Intermediario = 0 Then
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "00000000000"
                Else
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Intermediario.CUIT
                End If
                '9 - CUIT del Remitente Comercial de la CP
                If .IDEntidad_RemitenteComercial = 0 Then
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "00000000000"
                Else
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_RemitenteComercial.CUIT
                End If
                '10 - CUIT del Corredor de la CP
                If .IDEntidad_Corredor = 0 Then
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "00000000000"
                Else
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.CleanNotNumericChars(.Entidad_Corredor.CUIT)
                End If
                '11 - CUIT del Entregador de la CP
                If .IDEntidad_Entregador = 0 Then
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "00000000000"
                Else
                    CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Entregador.CUIT
                End If
                '12 - CUIT del Destinatario de la CP
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Destinatario.CUIT
                '13 - CUIT del Destino de la CP
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Destino.CUIT
                '14 - CUIT del Transportista
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Transportista.CUIT
                '15 - CUIT / CUIL del Chofer
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Entidad_Chofer.CUIT
                '16 - Cosecha
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & .Cosecha.ONCCA_Codigo
                '17 - Especie
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.PadStringLeft(.Cereal.ONCCA_EspecieCodigo, "0", 3)
                '18 - Tipo de grano
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.PadStringRight(.Cereal.ONCCA_GranoTipoCodigo, "0", 2)
                '19 - Contrato/Boleto Compra-Venta
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.PadStringLeft("", " ", 20)
                '20 - Tipo de Pesado: 1 = Balanza
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & "1"
                '21 - Peso Neto de Carga
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.PesoNeto, "00000000.00")
                '22 - Código de Establecimiento Origen
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & Format(.OrigenDestino_Origen.ONCCA_Codigo, "000000")
                '23 - Código de Localidad Origen
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & UCase(CSM_String.PadStringLeft(.OrigenDestino_Origen.IDLocalidad, "0", 5))
                '24 - Código de Establecimiento Destino
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & Format(.OrigenDestino_Destino.ONCCA_Codigo, "000000")
                '25 - Código de Localidad Destino
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & UCase(CSM_String.PadStringLeft(.OrigenDestino_Destino.IDLocalidad, "0", 5))
                '26 - Kms. a recorrer
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.PadStringRight(.TransporteKilometro, "0", 4)
                '27 - Patente del Camión
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & UCase(CSM_String.PadStringRight(.TransporteDominioCamion, " ", 11))
                '28 - Acoplado Patente
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & UCase(CSM_String.PadStringRight(.TransporteDominioAcoplado, " ", 11))
                '29 - Tarifa por Tonelada
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(.TransporteTarifa, "00000.00")

                'END OF LINE
                CartaPorteEmitida_TextStream = CartaPorteEmitida_TextStream & vbCrLf

            End If
        End With

        Set Movimiento_Cereal = Nothing

        If DataIncomplete = VbMsgBoxResult.vbNo Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If

        recData_CartaPorte.MoveNext
    Loop

    'LIMPIO LOS SALTOS DE LINEA DE MAS
    If Right(CartaPorteEmitida_TextStream, 2) = vbCrLf Then
        CartaPorteEmitida_TextStream = Left(CartaPorteEmitida_TextStream, Len(CartaPorteEmitida_TextStream) - 2)
    End If

    'ABRO EL ARCHIVO Y GRABO LOS DATOS
    FileNumber = FreeFile()
    If DeletePreviousFile = VbMsgBoxResult.vbYes Then
        Open ExportPath & FILE_NAMEANDEXTENSION For Output As #FileNumber
    Else
        Open ExportPath & FILE_NAMEANDEXTENSION For Append As #FileNumber
    End If
    Print #FileNumber, CartaPorteEmitida_TextStream
    Close #FileNumber

    Unload CSF_Status
    Set CSF_Status = Nothing

    Screen.MousePointer = vbDefault
    ExportCartasPorteEmitidas30 = True
    Exit Function

ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.Movimiento_Cereal_Lista.ExportCartasPorteEmitidas30", "Error al exportar los datos de las Cartas de Porte Emitidas.")
End Function

Private Function VerifyData() As Boolean
    Dim recData_CartaPorte As ADODB.recordset
    Dim Movimiento_Cereal As Movimiento_Cereal
    
    Dim ResultText As String
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Verificando Movimiento_Cereals..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents

    'ABRO UN NUEVO RECORDSET CON LOS FILTROS SELECCIONADOS
    Set recData_CartaPorte = New ADODB.recordset

    recData_CartaPorte.Open "SELECT Movimiento_Cereal.IDMovimiento_Cereal, Movimiento_Cereal.ComprobanteNumero FROM Movimiento_Cereal LEFT JOIN Formulario1116A_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario1116A_Detalle.IDMovimiento_Cereal " & mstrSQLWhere & " ORDER BY ComprobanteNumero", pDatabase.Connection, adOpenStatic, adLockReadOnly, adCmdText
    ResultText = "ID MOV. | C. PORTE Nº  |   FECHA    | MOTIVO"

    'COMIENZO A RECORRER LAS Movimiento_CerealS
    Do While Not recData_CartaPorte.EOF
        'CARGO LOS DATOS DEL Movimiento_Cereal ACTUAL
        Set Movimiento_Cereal = New Movimiento_Cereal
        Movimiento_Cereal.IDMovimiento_Cereal = recData_CartaPorte("IDMovimiento_Cereal").value
        If Not Movimiento_Cereal.Load() Then
            Unload CSF_Status
            Set CSF_Status = Nothing
            Set Movimiento_Cereal = Nothing
            Screen.MousePointer = vbDefault
            Exit Function
        End If
        CSF_Status.lblStatus.Caption = "Verificando C.P. Nº " & Movimiento_Cereal.ComprobanteNumero & "..."
        CSF_Status.SetFocus
        DoEvents

        With Movimiento_Cereal
            'VERIFICO LOS DATOS DE LA CARTA DE PORTE
            'TO FIX: 0 = pParametro.IDEntidad_Depositario
            If .Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA And Movimiento_Cereal.Entidad_Destino.IDEntidad <> 0 Then
                'TO FIX: 0 = pParametro.Entidad_Depositario.Nombre
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal es una Entrada pero el Destino especificado no es: " & "" & ".")
            End If
            If .IDOrigenDestino_Origen = 0 Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificada la Procedencia.")
            End If
            If .IDOrigenDestino_Destino = 0 Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificado el Destino.")
            End If
            If .PesoBruto > 45000 Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal excede los 45.000 kgs. de Peso Bruto.")
            End If
            If .TransporteDominioCamion = "" Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificada la Patente del Camión.")
            End If
            If .CTGNumero = 0 Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificado el Número de CTG.")
            End If
            If .Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA And Movimiento_Cereal.FechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificada la Fecha de Descarga.")
            End If
            If .TransporteKilometro = 0 Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificados los Kilómetros.")
            End If
            If .TransporteTarifa = 0 Then
                ResultText = ResultText & AgregarErrorCP(.IDMovimiento_Cereal_Formatted, .ComprobanteNumero, .FechaCarga_Formatted, "Este Movimiento_Cereal no tiene especificada la Tarifa del Flete.")
            End If
            'TO FIX
'            If (.MOVIMIENTO_CEREAL_TIPO = MOVIMIENTO_CEREAL_TIPO_SALIDA Or .MOVIMIENTO_CEREAL_TIPO = MOVIMIENTO_CEREAL_TIPO_SALIDAINTERNA) And .KilogramoAplicado > 0 Then
'                Call .CalcularKilogramosSinAplicar
'                .Update
'            End If
        End With
        
        Set Movimiento_Cereal = Nothing

        recData_CartaPorte.MoveNext
    Loop

    Unload CSF_Status
    Set CSF_Status = Nothing

    Screen.MousePointer = vbDefault
    
    VerifyData = (InStr(1, ResultText, vbCrLf) = 0)
    If VerifyData Then
        MsgBox ResultText, vbExclamation, App.Title
    End If
    Exit Function

ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.Movimiento_Cereal_Lista.VerifyData", "Error al verificar los datos de los Movimiento_Cereals.")
End Function

Private Function AgregarErrorCP(ByVal IDMovimiento_Cereal_Formatted As String, ByVal ComprobanteNumero As String, ByVal FechaCarga_Formatted As String, ByVal Motivo As String) As String
    Dim ResultText As String

    ResultText = vbCrLf & CSM_String.PadStringLeft(IDMovimiento_Cereal_Formatted, " ", 7) & " | "
    ResultText = ResultText & ComprobanteNumero & " | "
    ResultText = ResultText & FechaCarga_Formatted & " | "
    ResultText = ResultText & Motivo

    AgregarErrorCP = AgregarErrorCP & ResultText
End Function

Private Sub ObtenerPesadasHumedadYZarandeo()
    Dim DatabasePesadas As CSC_Database_ADO_SQL
    Dim recData As ADODB.recordset
    Dim movimiento As Movimiento_Cereal
    Dim Pesadas As Pesadas
    Dim Pesada As Pesada
    
    Dim SumaKilogramos As Long
    Dim SobrescribirDatos As Boolean
    Dim MostrarAdvertenciasIndividuales As Boolean
    Dim ResultadoObtencionPesadas As String
    
    If tdbgrdData.FirstRow = "" Then
        MsgBox "No hay ningún movimiento para obtener la humedad y el zarandeo.", vbExclamation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    Call frmMovimiento_Cereal_ObtenerPesadas.Show(vbModal, frmMDI)
    If frmMovimiento_Cereal_ObtenerPesadas.Tag = "CANCEL" Then
        Set frmMovimiento_Cereal_ObtenerPesadas = Nothing
        tdbgrdData.SetFocus
        Exit Sub
    End If
    SobrescribirDatos = (frmMovimiento_Cereal_ObtenerPesadas.chkSobrescribirDatos.value = vbChecked)
    MostrarAdvertenciasIndividuales = (frmMovimiento_Cereal_ObtenerPesadas.chkMostrarAdvertenciasIndividuales.value = vbChecked)
    Set frmMovimiento_Cereal_ObtenerPesadas = Nothing
    
    ' Obtengo los parámetros de la base de datos de Pesadas
    Set DatabasePesadas = New CSC_Database_ADO_SQL
    Call DatabasePesadas.LoadParametersFromINI("DatabasePesadas")
    If DatabasePesadas.Provider = "" Or DatabasePesadas.UserID = "" Or DatabasePesadas.DataSource = "" Then
        MsgBox "Los datos de conexión a la base de datos de pesadas están incompletos.", vbExclamation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    ' Abro la conexión a la base de datos de pesadas
    If DatabasePesadas.Connect <> -1 Then
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    ' Recorro los movimientos de la grilla
    Set recData = tdbgrdData.DataSource
    recData.MoveFirst
    ResultadoObtencionPesadas = ""
    Do While Not recData.EOF
        stbMain.SimpleText = "Obteniendo datos: " & recData.AbsolutePosition & " de " & recData.RecordCount & " (" & Format(recData.AbsolutePosition / recData.RecordCount, "Percent") & ")..."
        DoEvents
        
        Set movimiento = New Movimiento_Cereal
        movimiento.IDMovimiento_Cereal = tdbgrdData.Columns("IDMovimiento_Cereal").value
        movimiento.RefreshListSkip = True
        If Not movimiento.Load() Then
            movimiento = Nothing
            recData.Close
            Set recData = Nothing
            DatabasePesadas.Disconnect
            Set DatabasePesadas = Nothing
            tdbgrdData.SetFocus
            Exit Sub
        End If
        
        ' Si no es una entrada la salteo
        If movimiento.Tipo <> Constants.MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
            GoTo ContinueLoop
        End If
        
        ' Si ya tiene los datos de humedad y zarandeo especificados y no sobreescribe, sigo con la siguiente CP
        If (movimiento.Humedad > -1 And movimiento.Zaranda > -1) And Not SobrescribirDatos Then
            GoTo ContinueLoop
        End If
            
        ' Obtengo las pesadas correspondientes al CTG
        Set Pesadas = New Pesadas
        If Not Pesadas.ObtenerPesadas(DatabasePesadas, movimiento.CTGNumero) Then
            Set Pesadas = Nothing
            movimiento = Nothing
            recData.Close
            Set recData = Nothing
            DatabasePesadas.Disconnect
            Set DatabasePesadas = Nothing
            tdbgrdData.SetFocus
            Exit Sub
        End If
        
        If Pesadas.Count = 0 Then
            If MostrarAdvertenciasIndividuales Then
                MsgBox "No hay pesadas asociadas a la carta de porte." & vbCrLf & vbCrLf & "C.T.G.: " & movimiento.CTGNumero, vbInformation, App.Title
            Else
                ResultadoObtencionPesadas = ResultadoObtencionPesadas & "C.T.G.: " & movimiento.CTGNumero & " - No hay pesadas asociadas a la carta de porte." & vbCrLf
            End If
            GoTo ContinueLoop
        End If
            
        SumaKilogramos = 0
        For Each Pesada In Pesadas
            SumaKilogramos = SumaKilogramos + Pesada.KilogramoNeto
            If movimiento.IDCereal <> Pesada.IDProducto Then
                If MostrarAdvertenciasIndividuales Then
                    If MsgBox("No coincide el cereal de la carta de porte con el de la pesada asociada." & vbCrLf & vbCrLf & "C.T.G.: " & movimiento.CTGNumero & vbCrLf & "Nº de pesada: " & Pesada.IDPesada_Formatted & vbCrLf & vbCrLf & "¿Desea actualizar los datos de todas maneras?", vbExclamation, App.Title) = vbNo Then
                        GoTo ContinueLoop
                    End If
                Else
                    ResultadoObtencionPesadas = ResultadoObtencionPesadas & "C.T.G.: " & movimiento.CTGNumero & " - Nº de pesada: " & Pesada.IDPesada_Formatted & " - La suma de kilogramos de las pesadas asociadas no coincide con los de la carta de porte." & vbCrLf
                End If
            End If
            movimiento.Movimiento_Cereal_PesadaCompleta_AddFromData Pesada.IDPesada, Pesada.KilogramoNeto, Pesada.Humedad, Pesada.Zaranda
        Next
        
        ' Verifico que coincidan los kilogramos de la suma de pesadas con los de la carta de porte
        If SumaKilogramos <> movimiento.PesoNeto Then
            If MostrarAdvertenciasIndividuales Then
                If Pesadas.Count = 1 Then
                    If MsgBox("No coinciden los kilogramos de la carta de porte con los de la pesada asociada." & vbCrLf & vbCrLf & "C.T.G.: " & movimiento.CTGNumero & vbCrLf & vbCrLf & "¿Desea actualizar los datos de todas maneras?", vbExclamation, App.Title) = vbNo Then
                        GoTo ContinueLoop
                    End If
                Else
                    If MsgBox("No coinciden los kilogramos de la carta de porte con los de la suma de las pesadas asociadas." & vbCrLf & vbCrLf & "C.T.G.: " & movimiento.CTGNumero & vbCrLf & vbCrLf & "¿Desea actualizar los datos de todas maneras?", vbExclamation, App.Title) = vbNo Then
                        GoTo ContinueLoop
                    End If
                End If
            Else
                ResultadoObtencionPesadas = ResultadoObtencionPesadas & "C.T.G.: " & movimiento.CTGNumero & " - La suma de kilogramos de las pesadas asociadas no coincide con los de la carta de porte." & vbCrLf
            End If
        End If
        
        If Not movimiento.UpdatePesadasHumedadYZarandeo(SobrescribirDatos) Then
            Set Pesadas = Nothing
            movimiento = Nothing
            recData.Close
            Set recData = Nothing
            DatabasePesadas.Disconnect
            Set DatabasePesadas = Nothing
            tdbgrdData.SetFocus
            Exit Sub
        End If
        
ContinueLoop:
        recData.MoveNext
    Loop
    recData.MoveFirst
    RefreshList_Module.Movimiento_Cereal 0
    Set movimiento = Nothing

    If Not DatabasePesadas Is Nothing Then
        Set DatabasePesadas = Nothing
    End If
    
    If (Not MostrarAdvertenciasIndividuales) And ResultadoObtencionPesadas <> "" Then
        MsgBox ResultadoObtencionPesadas, vbExclamation, App.Title
    End If
    
    tdbgrdData.SetFocus
End Sub
