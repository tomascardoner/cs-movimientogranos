VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmMovimiento_Cereal_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Movimiento de Cereal"
   ClientHeight    =   6525
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   13890
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Movimiento_Cereal_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   6525
   ScaleWidth      =   13890
   Begin VB.PictureBox picExtras 
      BorderStyle     =   0  'None
      Height          =   1515
      Left            =   9360
      ScaleHeight     =   1515
      ScaleWidth      =   4395
      TabIndex        =   125
      Top             =   4380
      Width           =   4395
      Begin VB.CheckBox chkIgnorarCertificado 
         Height          =   210
         Left            =   3540
         TabIndex        =   130
         Top             =   120
         Width           =   195
      End
      Begin VB.CheckBox chkDeclaraIPRO 
         Height          =   210
         Left            =   1260
         TabIndex        =   128
         Top             =   120
         Width           =   195
      End
      Begin VB.TextBox txtNotas 
         Height          =   615
         Left            =   1260
         MultiLine       =   -1  'True
         TabIndex        =   134
         Top             =   840
         Width           =   3015
      End
      Begin MSDataListLib.DataCombo datcboAnulada 
         Height          =   330
         Left            =   1260
         TabIndex        =   132
         Top             =   420
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblIgnorarCertificado 
         AutoSize        =   -1  'True
         Caption         =   "Ignorar certificado:"
         Height          =   210
         Left            =   1980
         TabIndex        =   129
         Top             =   120
         Width           =   1365
      End
      Begin VB.Label lblDeclaraIPRO 
         AutoSize        =   -1  'True
         Caption         =   "Declara IPRO:"
         Height          =   210
         Left            =   120
         TabIndex        =   127
         Top             =   120
         Width           =   990
      End
      Begin VB.Label lblAnulada 
         AutoSize        =   -1  'True
         Caption         =   "Anulada:"
         Height          =   210
         Left            =   120
         TabIndex        =   131
         Top             =   480
         Width           =   645
      End
      Begin VB.Label lblNotas 
         AutoSize        =   -1  'True
         Caption         =   "Notas:"
         Height          =   210
         Left            =   120
         TabIndex        =   133
         Top             =   840
         Width           =   465
      End
   End
   Begin VB.Frame fraPesadasCompletas 
      Caption         =   "Pesadas de la Carta de Porte"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3975
      Left            =   9300
      TabIndex        =   154
      Top             =   1980
      Visible         =   0   'False
      Width           =   4515
      Begin VB.CommandButton cmdPesadasCalcular 
         Caption         =   "Calcular Humedad, Zarandeo y Kgs. Netos"
         Height          =   375
         Left            =   420
         TabIndex        =   190
         Top             =   3540
         Visible         =   0   'False
         Width           =   3855
      End
      Begin VB.CommandButton cmdPesadasReducidas 
         Caption         =   "�"
         BeginProperty Font 
            Name            =   "Symbol"
            Size            =   8.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         TabIndex        =   155
         TabStop         =   0   'False
         ToolTipText     =   "Pesadas reducidas"
         Top             =   300
         Width           =   255
      End
      Begin VB.TextBox txtPesadaCompleta_PesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Index           =   5
         Left            =   1680
         MaxLength       =   7
         TabIndex        =   187
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   3120
         Width           =   855
      End
      Begin VB.TextBox txtPesadaCompleta_Humedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   5
         Left            =   2700
         MaxLength       =   4
         TabIndex        =   188
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   3120
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Zaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   5
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   189
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   3120
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_PesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Index           =   4
         Left            =   1680
         MaxLength       =   7
         TabIndex        =   182
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   2640
         Width           =   855
      End
      Begin VB.TextBox txtPesadaCompleta_Humedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   4
         Left            =   2700
         MaxLength       =   4
         TabIndex        =   183
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   2640
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Zaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   4
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   184
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   2640
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_PesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Index           =   3
         Left            =   1680
         MaxLength       =   7
         TabIndex        =   177
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   2160
         Width           =   855
      End
      Begin VB.TextBox txtPesadaCompleta_Humedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   3
         Left            =   2700
         MaxLength       =   4
         TabIndex        =   178
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   2160
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Zaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   3
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   179
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   2160
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_PesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Index           =   2
         Left            =   1680
         MaxLength       =   7
         TabIndex        =   172
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   1680
         Width           =   855
      End
      Begin VB.TextBox txtPesadaCompleta_Humedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   2
         Left            =   2700
         MaxLength       =   4
         TabIndex        =   173
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   1680
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Zaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   2
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   174
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   1680
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Zaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   1
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   169
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   1200
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Zaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   0
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   164
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   720
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Humedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   1
         Left            =   2700
         MaxLength       =   4
         TabIndex        =   168
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   1200
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_Humedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   0
         Left            =   2700
         MaxLength       =   4
         TabIndex        =   163
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   720
         Width           =   675
      End
      Begin VB.TextBox txtPesadaCompleta_PesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Index           =   1
         Left            =   1680
         MaxLength       =   7
         TabIndex        =   167
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   1200
         Width           =   855
      End
      Begin VB.TextBox txtPesadaCompleta_PesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Index           =   0
         Left            =   1680
         MaxLength       =   7
         TabIndex        =   162
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   720
         Width           =   855
      End
      Begin VB.TextBox txtPesadaCompleta_Ticket 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   0
         Left            =   420
         MaxLength       =   11
         TabIndex        =   161
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox txtPesadaCompleta_Ticket 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   1
         Left            =   420
         MaxLength       =   11
         TabIndex        =   166
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   1200
         Width           =   1095
      End
      Begin VB.TextBox txtPesadaCompleta_Ticket 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   2
         Left            =   420
         MaxLength       =   11
         TabIndex        =   171
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   1680
         Width           =   1095
      End
      Begin VB.TextBox txtPesadaCompleta_Ticket 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   3
         Left            =   420
         MaxLength       =   11
         TabIndex        =   176
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox txtPesadaCompleta_Ticket 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   4
         Left            =   420
         MaxLength       =   11
         TabIndex        =   181
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   2640
         Width           =   1095
      End
      Begin VB.TextBox txtPesadaCompleta_Ticket 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   5
         Left            =   420
         MaxLength       =   11
         TabIndex        =   186
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   3120
         Width           =   1095
      End
      Begin VB.Line Line 
         Index           =   7
         X1              =   180
         X2              =   4320
         Y1              =   3030
         Y2              =   3030
      End
      Begin VB.Line Line 
         Index           =   6
         X1              =   180
         X2              =   4320
         Y1              =   2550
         Y2              =   2550
      End
      Begin VB.Line Line 
         Index           =   5
         X1              =   180
         X2              =   4320
         Y1              =   2070
         Y2              =   2070
      End
      Begin VB.Line Line 
         Index           =   4
         X1              =   180
         X2              =   4320
         Y1              =   1590
         Y2              =   1590
      End
      Begin VB.Line linPesadasCompletas_Columna4 
         X1              =   3480
         X2              =   3480
         Y1              =   300
         Y2              =   3480
      End
      Begin VB.Line linPesadasCompletas_Columna3 
         X1              =   2610
         X2              =   2610
         Y1              =   300
         Y2              =   3480
      End
      Begin VB.Line Line 
         Index           =   1
         X1              =   180
         X2              =   4320
         Y1              =   1110
         Y2              =   1110
      End
      Begin VB.Line linPesadasCompletas_Columna2 
         X1              =   1560
         X2              =   1560
         Y1              =   300
         Y2              =   3480
      End
      Begin VB.Line linPesadasCompletas_Columna1 
         X1              =   360
         X2              =   360
         Y1              =   300
         Y2              =   3480
      End
      Begin VB.Line linPesadasCompletas_Titulo 
         X1              =   180
         X2              =   4320
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Label lblPesadasCompletas_Zaranda 
         AutoSize        =   -1  'True
         Caption         =   "Zarandeo"
         Height          =   210
         Left            =   3540
         TabIndex        =   159
         Top             =   300
         Width           =   705
      End
      Begin VB.Label lblPesadasCompletas_Humedad 
         AutoSize        =   -1  'True
         Caption         =   "Humedad"
         Height          =   210
         Left            =   2700
         TabIndex        =   158
         Top             =   300
         Width           =   675
      End
      Begin VB.Label lblPesadasCompletas_PesoNeto 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         Caption         =   "Peso Neto"
         Height          =   210
         Left            =   1680
         TabIndex        =   157
         Top             =   300
         Width           =   855
      End
      Begin VB.Label lblPesadasCompletas_Ticket 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         Caption         =   "N� Ticket"
         Height          =   210
         Left            =   480
         TabIndex        =   156
         Top             =   300
         Width           =   1005
      End
      Begin VB.Label lblPesadaCompleta 
         AutoSize        =   -1  'True
         Caption         =   "1:"
         Height          =   210
         Index           =   0
         Left            =   180
         TabIndex        =   160
         Top             =   780
         Width           =   135
      End
      Begin VB.Label lblPesadaCompleta 
         AutoSize        =   -1  'True
         Caption         =   "2:"
         Height          =   210
         Index           =   1
         Left            =   180
         TabIndex        =   165
         Top             =   1260
         Width           =   135
      End
      Begin VB.Label lblPesadaCompleta 
         AutoSize        =   -1  'True
         Caption         =   "3:"
         Height          =   210
         Index           =   2
         Left            =   180
         TabIndex        =   170
         Top             =   1740
         Width           =   135
      End
      Begin VB.Label lblPesadaCompleta 
         AutoSize        =   -1  'True
         Caption         =   "4:"
         Height          =   210
         Index           =   3
         Left            =   180
         TabIndex        =   175
         Top             =   2220
         Width           =   135
      End
      Begin VB.Label lblPesadaCompleta 
         AutoSize        =   -1  'True
         Caption         =   "5:"
         Height          =   210
         Index           =   4
         Left            =   180
         TabIndex        =   180
         Top             =   2700
         Width           =   135
      End
      Begin VB.Label lblPesadaCompleta 
         AutoSize        =   -1  'True
         Caption         =   "6:"
         Height          =   210
         Index           =   5
         Left            =   180
         TabIndex        =   185
         Top             =   3180
         Width           =   135
      End
   End
   Begin VB.PictureBox picPesadas 
      BorderStyle     =   0  'None
      Height          =   1515
      Left            =   9360
      ScaleHeight     =   1515
      ScaleWidth      =   4395
      TabIndex        =   104
      TabStop         =   0   'False
      Top             =   4380
      Width           =   4395
      Begin VB.CommandButton cmdPesadasCompletas 
         Caption         =   "�"
         BeginProperty Font 
            Name            =   "Symbol"
            Size            =   8.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1320
         TabIndex        =   135
         TabStop         =   0   'False
         ToolTipText     =   "Pesadas completas"
         Top             =   120
         Width           =   255
      End
      Begin VB.TextBox txtPesada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   5
         Left            =   3240
         MaxLength       =   11
         TabIndex        =   116
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox txtPesada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   4
         Left            =   1800
         MaxLength       =   11
         TabIndex        =   114
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox txtPesada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   3
         Left            =   240
         MaxLength       =   11
         TabIndex        =   112
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox txtPesada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   2
         Left            =   3240
         MaxLength       =   11
         TabIndex        =   110
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   120
         Width           =   1095
      End
      Begin VB.TextBox txtPesada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   1
         Left            =   1800
         MaxLength       =   11
         TabIndex        =   108
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   120
         Width           =   1095
      End
      Begin VB.TextBox txtPesada 
         Alignment       =   1  'Right Justify
         Height          =   330
         Index           =   0
         Left            =   240
         MaxLength       =   11
         TabIndex        =   106
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label lblPesada 
         AutoSize        =   -1  'True
         Caption         =   "6:"
         Height          =   210
         Index           =   5
         Left            =   3060
         TabIndex        =   115
         Top             =   660
         Width           =   135
      End
      Begin VB.Label lblPesada 
         AutoSize        =   -1  'True
         Caption         =   "5:"
         Height          =   210
         Index           =   4
         Left            =   1620
         TabIndex        =   113
         Top             =   660
         Width           =   135
      End
      Begin VB.Label lblPesada 
         AutoSize        =   -1  'True
         Caption         =   "4:"
         Height          =   210
         Index           =   3
         Left            =   60
         TabIndex        =   111
         Top             =   660
         Width           =   135
      End
      Begin VB.Label lblPesada 
         AutoSize        =   -1  'True
         Caption         =   "3:"
         Height          =   210
         Index           =   2
         Left            =   3060
         TabIndex        =   109
         Top             =   180
         Width           =   135
      End
      Begin VB.Label lblPesada 
         AutoSize        =   -1  'True
         Caption         =   "2:"
         Height          =   210
         Index           =   1
         Left            =   1620
         TabIndex        =   107
         Top             =   180
         Width           =   135
      End
      Begin VB.Label lblPesada 
         AutoSize        =   -1  'True
         Caption         =   "1:"
         Height          =   210
         Index           =   0
         Left            =   60
         TabIndex        =   105
         Top             =   180
         Width           =   135
      End
   End
   Begin VB.PictureBox picInformacion 
      BorderStyle     =   0  'None
      Height          =   1395
      Left            =   9360
      ScaleHeight     =   1395
      ScaleWidth      =   4395
      TabIndex        =   138
      Top             =   4440
      Width           =   4395
      Begin VB.ComboBox cboFormulariosAplicados 
         Height          =   330
         Left            =   1560
         Style           =   2  'Dropdown List
         TabIndex        =   144
         Top             =   720
         Width           =   2670
      End
      Begin VB.TextBox txtIDMovimiento_Cereal 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1560
         TabIndex        =   140
         TabStop         =   0   'False
         Top             =   0
         Width           =   1395
      End
      Begin VB.TextBox txtKilogramoMulti 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1560
         TabIndex        =   142
         TabStop         =   0   'False
         Top             =   360
         Width           =   1395
      End
      Begin VB.Label lblFormulariosAplicados 
         AutoSize        =   -1  'True
         Caption         =   "Formularios:"
         Height          =   210
         Left            =   120
         TabIndex        =   143
         Top             =   780
         Width           =   885
      End
      Begin VB.Label lblKilogramoMulti 
         AutoSize        =   -1  'True
         Caption         =   "Kgs.:"
         Height          =   210
         Left            =   120
         TabIndex        =   141
         Top             =   420
         Width           =   375
      End
      Begin VB.Label lblIDMovimiento 
         AutoSize        =   -1  'True
         Caption         =   "ID Movim.:"
         Height          =   210
         Left            =   120
         TabIndex        =   139
         Top             =   60
         Width           =   720
      End
   End
   Begin VB.PictureBox picAuditoria 
      BorderStyle     =   0  'None
      Height          =   1395
      Left            =   9360
      ScaleHeight     =   1395
      ScaleWidth      =   4395
      TabIndex        =   145
      Top             =   4440
      Width           =   4395
      Begin VB.TextBox txtUsuario_Modificacion 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         TabIndex        =   151
         TabStop         =   0   'False
         Top             =   720
         Width           =   2715
      End
      Begin VB.TextBox txtFechaHora_Creacion 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         TabIndex        =   149
         TabStop         =   0   'False
         Top             =   360
         Width           =   2715
      End
      Begin VB.TextBox txtUsuario_Creacion 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         TabIndex        =   147
         TabStop         =   0   'False
         Top             =   0
         Width           =   2715
      End
      Begin VB.TextBox txtFechaHora_Modificacion 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         ForeColor       =   &H8000000D&
         Height          =   315
         Left            =   1620
         TabIndex        =   153
         TabStop         =   0   'False
         Top             =   1080
         Width           =   2715
      End
      Begin VB.Label lblUsuario_Creacion 
         AutoSize        =   -1  'True
         Caption         =   "Usuario Creaci�n:"
         Height          =   210
         Left            =   120
         TabIndex        =   146
         Top             =   60
         Width           =   1290
      End
      Begin VB.Label lblFechaHora_Creacion 
         AutoSize        =   -1  'True
         Caption         =   "Fecha/Hora Creac.:"
         Height          =   210
         Left            =   120
         TabIndex        =   148
         Top             =   420
         Width           =   1410
      End
      Begin VB.Label lblFechaHora_Modificacion 
         AutoSize        =   -1  'True
         Caption         =   "Fecha/Hora Modif.:"
         Height          =   210
         Left            =   120
         TabIndex        =   152
         Top             =   1140
         Width           =   1365
      End
      Begin VB.Label lblUsuario_Modificacion 
         AutoSize        =   -1  'True
         Caption         =   "Usuario Modificac.:"
         Height          =   210
         Left            =   120
         TabIndex        =   150
         Top             =   780
         Width           =   1380
      End
   End
   Begin VB.PictureBox picNavegador 
      BorderStyle     =   0  'None
      Height          =   375
      Left            =   9300
      ScaleHeight     =   375
      ScaleWidth      =   2475
      TabIndex        =   191
      Top             =   6060
      Width           =   2475
      Begin VB.CommandButton cmdNavegador_Ultimo 
         Caption         =   ">>"
         Height          =   375
         Left            =   2100
         TabIndex        =   195
         ToolTipText     =   "Ir al �ltimo Movimiento"
         Top             =   0
         Width           =   375
      End
      Begin VB.CommandButton cmdNavegador_Siguiente 
         Caption         =   ">"
         Height          =   375
         Left            =   1680
         TabIndex        =   194
         ToolTipText     =   "Ir al Movimiento siguiente"
         Top             =   0
         Width           =   375
      End
      Begin VB.CommandButton cmdNavegador_Anterior 
         Caption         =   "<"
         Height          =   375
         Left            =   420
         TabIndex        =   193
         ToolTipText     =   "Ir al Movimiento anterior"
         Top             =   0
         Width           =   375
      End
      Begin VB.CommandButton cmdNavegador_Primero 
         Caption         =   "<<"
         Height          =   375
         Left            =   0
         TabIndex        =   192
         ToolTipText     =   "Ir al primer Movimiento"
         Top             =   0
         Width           =   375
      End
      Begin VB.Line linNavegador_RowSeparator 
         X1              =   960
         X2              =   1515
         Y1              =   195
         Y2              =   195
      End
      Begin VB.Label lblNavegador_RowCount 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Calibri"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   150
         Left            =   840
         TabIndex        =   197
         Top             =   210
         Width           =   795
      End
      Begin VB.Label lblNavegador_RowNumber 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Calibri"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   150
         Left            =   840
         TabIndex        =   196
         Top             =   0
         Width           =   795
      End
   End
   Begin VB.Frame fraDatosDescarga 
      Caption         =   "5 - Datos a Completar en el Lugar de Destino"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Left            =   9300
      TabIndex        =   89
      Top             =   1980
      Width           =   4515
      Begin VB.CommandButton cmdFechaDescarga_Hoy 
         Height          =   315
         Left            =   3540
         Picture         =   "Movimiento_Cereal_Detalle.frx":0CCA
         Style           =   1  'Graphical
         TabIndex        =   101
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   1140
         Width           =   315
      End
      Begin VB.CommandButton cmdFechaDescarga_Siguiente 
         Height          =   315
         Left            =   3240
         Picture         =   "Movimiento_Cereal_Detalle.frx":0E14
         Style           =   1  'Graphical
         TabIndex        =   99
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   1140
         Width           =   300
      End
      Begin VB.CommandButton cmdFechaDescarga_Anterior 
         Height          =   315
         Left            =   1500
         Picture         =   "Movimiento_Cereal_Detalle.frx":139E
         Style           =   1  'Graphical
         TabIndex        =   98
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   1140
         Width           =   300
      End
      Begin MSComCtl2.DTPicker dtpHoraArribo 
         Height          =   315
         Left            =   1800
         TabIndex        =   96
         Top             =   660
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "HH:mm"
         Format          =   97124355
         UpDown          =   -1  'True
         CurrentDate     =   40659
      End
      Begin VB.CommandButton cmdFechaArribo_Hoy 
         Height          =   315
         Left            =   3540
         Picture         =   "Movimiento_Cereal_Detalle.frx":1928
         Style           =   1  'Graphical
         TabIndex        =   94
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   300
         Width           =   315
      End
      Begin VB.CommandButton cmdFechaArribo_Siguiente 
         Height          =   315
         Left            =   3240
         Picture         =   "Movimiento_Cereal_Detalle.frx":1A72
         Style           =   1  'Graphical
         TabIndex        =   93
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   300
         Width           =   300
      End
      Begin VB.CommandButton cmdFechaArribo_Anterior 
         Height          =   315
         Left            =   1500
         Picture         =   "Movimiento_Cereal_Detalle.frx":1FFC
         Style           =   1  'Graphical
         TabIndex        =   91
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   300
         Width           =   300
      End
      Begin MSComCtl2.DTPicker dtpFechaArribo 
         Height          =   315
         Left            =   1800
         TabIndex        =   92
         Top             =   300
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   97124353
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin MSComCtl2.DTPicker dtpFechaDescarga 
         Height          =   315
         Left            =   1800
         TabIndex        =   100
         Top             =   1140
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   97124353
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin MSComCtl2.DTPicker dtpHoraDescarga 
         Height          =   315
         Left            =   1800
         TabIndex        =   103
         Top             =   1500
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "HH:mm"
         Format          =   97124355
         UpDown          =   -1  'True
         CurrentDate     =   40659
      End
      Begin VB.Label lblHoraDescarga 
         AutoSize        =   -1  'True
         Caption         =   "Hora Descarga:"
         Height          =   210
         Left            =   120
         TabIndex        =   102
         Top             =   1560
         Width           =   1140
      End
      Begin VB.Label lblFechaDescarga 
         AutoSize        =   -1  'True
         Caption         =   "Fecha Descarga:"
         Height          =   210
         Left            =   120
         TabIndex        =   97
         Top             =   1200
         Width           =   1245
      End
      Begin VB.Label lblHoraArribo 
         AutoSize        =   -1  'True
         Caption         =   "Hora Arribo:"
         Height          =   210
         Left            =   120
         TabIndex        =   95
         Top             =   720
         Width           =   885
      End
      Begin VB.Label lblFechaArribo 
         AutoSize        =   -1  'True
         Caption         =   "Fecha Arribo:"
         Height          =   210
         Left            =   120
         TabIndex        =   90
         Top             =   360
         Width           =   990
      End
   End
   Begin VB.Frame fraDatosTransporte 
      Caption         =   "4 - Datos del Transporte"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   9300
      TabIndex        =   74
      Top             =   60
      Width           =   4515
      Begin VB.TextBox txtTransporteTarifaReferencia 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1200
         MaxLength       =   10
         TabIndex        =   85
         Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
         Top             =   1380
         Width           =   1095
      End
      Begin VB.CommandButton cmdTransporteTarifa 
         Caption         =   "<"
         Height          =   315
         Left            =   2280
         TabIndex        =   86
         TabStop         =   0   'False
         ToolTipText     =   "Obtener la Tarifa de Flete"
         Top             =   1380
         Width           =   255
      End
      Begin VB.CommandButton cmdTransporteKilometro 
         Caption         =   "<"
         Height          =   315
         Left            =   2280
         TabIndex        =   83
         TabStop         =   0   'False
         ToolTipText     =   "Obtener los kil�metros desde el Origen / Destino"
         Top             =   1020
         Width           =   255
      End
      Begin VB.TextBox txtTransporteTarifa 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   3300
         MaxLength       =   10
         TabIndex        =   88
         Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
         Top             =   1380
         Width           =   1095
      End
      Begin VB.TextBox txtTransporteKilometro 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   82
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   1020
         Width           =   1095
      End
      Begin VB.TextBox txtTransporteAcoplado 
         Height          =   315
         Left            =   3300
         MaxLength       =   7
         TabIndex        =   80
         Tag             =   "STRING|EMPTY|UPPER|7"
         Top             =   660
         Width           =   1095
      End
      Begin VB.TextBox txtTransporteCamion 
         Height          =   315
         Left            =   1200
         MaxLength       =   7
         TabIndex        =   78
         Tag             =   "STRING|EMPTY|UPPER|7"
         Top             =   660
         Width           =   915
      End
      Begin VB.TextBox txtCTGCancelacion 
         Height          =   315
         Left            =   1200
         MaxLength       =   11
         TabIndex        =   76
         Tag             =   "STRING|EMPTY|NUMBERS|11"
         Top             =   300
         Width           =   1875
      End
      Begin VB.Label lblTransporteTarifa 
         AutoSize        =   -1  'True
         Caption         =   "Tarifa:"
         Height          =   210
         Left            =   2760
         TabIndex        =   87
         Top             =   1440
         Width           =   465
      End
      Begin VB.Label lblTransporteTarifaReferencia 
         AutoSize        =   -1  'True
         Caption         =   "Tarifa Refer.:"
         Height          =   210
         Left            =   120
         TabIndex        =   84
         Top             =   1440
         Width           =   960
      End
      Begin VB.Label lblTransporteKilometro 
         AutoSize        =   -1  'True
         Caption         =   "Kms.:"
         Height          =   210
         Left            =   120
         TabIndex        =   81
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblTransporteAcoplado 
         AutoSize        =   -1  'True
         Caption         =   "Acoplado:"
         Height          =   210
         Left            =   2460
         TabIndex        =   79
         Top             =   720
         Width           =   735
      End
      Begin VB.Label lblTransporteCamion 
         AutoSize        =   -1  'True
         Caption         =   "Cami�n:"
         Height          =   210
         Left            =   120
         TabIndex        =   77
         Top             =   720
         Width           =   570
      End
      Begin VB.Label lblCTGCancelacion 
         AutoSize        =   -1  'True
         Caption         =   "C.T.G. Canc.:"
         Height          =   210
         Left            =   120
         TabIndex        =   75
         Top             =   360
         Width           =   960
      End
   End
   Begin VB.Frame fraDestino 
      Caption         =   "3 - Lugar de Destino de los Granos"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   4680
      TabIndex        =   64
      Top             =   4620
      Width           =   4515
      Begin VB.CommandButton cmdDestino 
         Caption         =   "�"
         Height          =   315
         Left            =   4140
         TabIndex        =   67
         TabStop         =   0   'False
         ToolTipText     =   "Or�genes / Destinos"
         Top             =   300
         Width           =   255
      End
      Begin VB.TextBox txtDestinoProvincia 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   73
         Top             =   1380
         Width           =   3195
      End
      Begin VB.TextBox txtDestinoLocalidad 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   71
         Top             =   1020
         Width           =   3195
      End
      Begin VB.TextBox txtDestinoDireccion 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   69
         Top             =   660
         Width           =   3195
      End
      Begin MSDataListLib.DataCombo datcboDestino 
         Height          =   330
         Left            =   1200
         TabIndex        =   66
         Top             =   300
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblDestino 
         AutoSize        =   -1  'True
         Caption         =   "Destino:"
         Height          =   210
         Left            =   120
         TabIndex        =   65
         Top             =   360
         Width           =   585
      End
      Begin VB.Label lblDestinoDireccion 
         AutoSize        =   -1  'True
         Caption         =   "Direcci�n:"
         Height          =   210
         Left            =   120
         TabIndex        =   68
         Top             =   720
         Width           =   720
      End
      Begin VB.Label lblDestinoLocalidad 
         AutoSize        =   -1  'True
         Caption         =   "Localidad:"
         Height          =   210
         Left            =   120
         TabIndex        =   70
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label lblDestinoProvincia 
         AutoSize        =   -1  'True
         Caption         =   "Provincia:"
         Height          =   210
         Left            =   120
         TabIndex        =   72
         Top             =   1440
         Width           =   705
      End
   End
   Begin VB.Frame fraProcedencia 
      Caption         =   "Procedencia de la Mercader�a"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   4680
      TabIndex        =   54
      Top             =   2700
      Width           =   4515
      Begin VB.CommandButton cmdProcedencia 
         Caption         =   "�"
         Height          =   315
         Left            =   4140
         TabIndex        =   57
         TabStop         =   0   'False
         ToolTipText     =   "Or�genes / Destinos"
         Top             =   300
         Width           =   255
      End
      Begin VB.TextBox txtProcedenciaLocalidad 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   61
         Top             =   1020
         Width           =   3195
      End
      Begin VB.TextBox txtProcedenciaProvincia 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   63
         Top             =   1380
         Width           =   3195
      End
      Begin VB.TextBox txtProcedenciaDireccion 
         Enabled         =   0   'False
         Height          =   315
         Left            =   1200
         TabIndex        =   59
         Top             =   660
         Width           =   3195
      End
      Begin MSDataListLib.DataCombo datcboProcedencia 
         Height          =   330
         Left            =   1200
         TabIndex        =   56
         Top             =   300
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblProcedenciaProvincia 
         AutoSize        =   -1  'True
         Caption         =   "Provincia:"
         Height          =   210
         Left            =   120
         TabIndex        =   62
         Top             =   1440
         Width           =   705
      End
      Begin VB.Label lblProcedenciaLocalidad 
         AutoSize        =   -1  'True
         Caption         =   "Localidad:"
         Height          =   210
         Left            =   120
         TabIndex        =   60
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label lblProcedenciaDireccion 
         AutoSize        =   -1  'True
         Caption         =   "Direcci�n:"
         Height          =   210
         Left            =   120
         TabIndex        =   58
         Top             =   720
         Width           =   720
      End
      Begin VB.Label lblProcedencia 
         AutoSize        =   -1  'True
         Caption         =   "Procedencia:"
         Height          =   210
         Left            =   120
         TabIndex        =   55
         Top             =   360
         Width           =   945
      End
   End
   Begin VB.Frame fraDatosGranos 
      Caption         =   "2 - Datos de los Granos / Especies Transportadas"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   4680
      TabIndex        =   34
      Top             =   60
      Width           =   4515
      Begin VB.CommandButton cmdContrato 
         Caption         =   "�"
         Height          =   315
         Left            =   4140
         TabIndex        =   41
         TabStop         =   0   'False
         ToolTipText     =   "Contratos"
         Top             =   1020
         Width           =   255
      End
      Begin VB.TextBox txtVolatil 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   3720
         MaxLength       =   4
         TabIndex        =   49
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|9.99"
         Top             =   1380
         Width           =   675
      End
      Begin VB.TextBox txtZaranda 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   3720
         MaxLength       =   4
         TabIndex        =   53
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   2100
         Width           =   675
      End
      Begin VB.TextBox txtHumedad 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   3720
         MaxLength       =   4
         TabIndex        =   51
         Tag             =   "DECIMAL|EMPTY|ZERO|POSITIVE|99.9"
         Top             =   1740
         Width           =   675
      End
      Begin VB.TextBox txtPesoNeto 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H8000000D&
         Height          =   330
         Left            =   1200
         Locked          =   -1  'True
         MaxLength       =   7
         TabIndex        =   47
         TabStop         =   0   'False
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   2100
         Width           =   1095
      End
      Begin VB.TextBox txtPesoTara 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1200
         MaxLength       =   7
         TabIndex        =   45
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE|99999"
         Top             =   1740
         Width           =   1095
      End
      Begin VB.TextBox txtPesoBruto 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1200
         MaxLength       =   7
         TabIndex        =   43
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE|99999"
         Top             =   1380
         Width           =   1095
      End
      Begin MSDataListLib.DataCombo datcboCosecha 
         Height          =   330
         Left            =   1200
         TabIndex        =   36
         Top             =   300
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboCereal 
         Height          =   330
         Left            =   1200
         TabIndex        =   38
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboContrato 
         Height          =   330
         Left            =   1200
         TabIndex        =   40
         Top             =   1020
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblVolatil 
         AutoSize        =   -1  'True
         Caption         =   "Volatil:"
         Height          =   210
         Left            =   2820
         TabIndex        =   48
         Top             =   1440
         Width           =   480
      End
      Begin VB.Label lblZaranda 
         AutoSize        =   -1  'True
         Caption         =   "Zarandeo:"
         Height          =   210
         Left            =   2820
         TabIndex        =   52
         Top             =   2160
         Width           =   750
      End
      Begin VB.Label lblHumedad 
         AutoSize        =   -1  'True
         Caption         =   "Humedad:"
         Height          =   210
         Left            =   2820
         TabIndex        =   50
         Top             =   1800
         Width           =   720
      End
      Begin VB.Label lblPesoNeto 
         AutoSize        =   -1  'True
         Caption         =   "Peso Neto:"
         Height          =   210
         Left            =   120
         TabIndex        =   46
         Top             =   2160
         Width           =   780
      End
      Begin VB.Label lblPesoTara 
         AutoSize        =   -1  'True
         Caption         =   "Peso Tara:"
         Height          =   210
         Left            =   120
         TabIndex        =   44
         Top             =   1800
         Width           =   780
      End
      Begin VB.Label lblPesoBruto 
         AutoSize        =   -1  'True
         Caption         =   "Peso Bruto:"
         Height          =   210
         Left            =   120
         TabIndex        =   42
         Top             =   1440
         Width           =   840
      End
      Begin VB.Label lblContratoNumero 
         AutoSize        =   -1  'True
         Caption         =   "Contrato N�:"
         Height          =   210
         Left            =   120
         TabIndex        =   39
         Top             =   1080
         Width           =   885
      End
      Begin VB.Label lblCereal 
         AutoSize        =   -1  'True
         Caption         =   "Cereal:"
         Height          =   210
         Left            =   120
         TabIndex        =   37
         Top             =   720
         Width           =   510
      End
      Begin VB.Label lblCosecha 
         AutoSize        =   -1  'True
         Caption         =   "Cosecha:"
         Height          =   210
         Left            =   120
         TabIndex        =   35
         Top             =   360
         Width           =   690
      End
   End
   Begin VB.Frame fraDatosIntervinientes 
      Caption         =   "1 - Datos de Intervinientes en el Traslado de Granos"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3735
      Left            =   60
      TabIndex        =   16
      Top             =   2700
      Width           =   4515
      Begin VB.CheckBox chkEntidad_Chofer_Todos 
         Caption         =   "#"
         Height          =   315
         Left            =   840
         Style           =   1  'Graphical
         TabIndex        =   32
         TabStop         =   0   'False
         ToolTipText     =   "Mostrar todos los choferes"
         Top             =   3240
         Width           =   330
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Intermediario 
         Height          =   330
         Left            =   1200
         TabIndex        =   18
         Top             =   300
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_RemitenteComercial 
         Height          =   330
         Left            =   1200
         TabIndex        =   20
         Top             =   720
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Corredor 
         Height          =   330
         Left            =   1200
         TabIndex        =   22
         Top             =   1140
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Entregador 
         Height          =   330
         Left            =   1200
         TabIndex        =   24
         Top             =   1560
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Destinatario 
         Height          =   330
         Left            =   1200
         TabIndex        =   26
         Top             =   1980
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Destino 
         Height          =   330
         Left            =   1200
         TabIndex        =   28
         Top             =   2400
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Transportista 
         Height          =   330
         Left            =   1200
         TabIndex        =   30
         Top             =   2820
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Chofer 
         Height          =   330
         Left            =   1200
         TabIndex        =   33
         Top             =   3240
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblEntidad_Chofer 
         AutoSize        =   -1  'True
         Caption         =   "Chofer:"
         Height          =   210
         Left            =   120
         TabIndex        =   31
         Top             =   3300
         Width           =   540
      End
      Begin VB.Label lblEntidad_Transportista 
         AutoSize        =   -1  'True
         Caption         =   "Transportista:"
         Height          =   210
         Left            =   120
         TabIndex        =   29
         Top             =   2880
         Width           =   1005
      End
      Begin VB.Label lblEntidad_Destino 
         AutoSize        =   -1  'True
         Caption         =   "Destino:"
         Height          =   210
         Left            =   120
         TabIndex        =   27
         Top             =   2460
         Width           =   585
      End
      Begin VB.Label lblEntidad_Destinatario 
         AutoSize        =   -1  'True
         Caption         =   "Destinatario:"
         Height          =   210
         Left            =   120
         TabIndex        =   25
         Top             =   2040
         Width           =   900
      End
      Begin VB.Label lblEntidad_Entregador 
         AutoSize        =   -1  'True
         Caption         =   "Entregador:"
         Height          =   210
         Left            =   120
         TabIndex        =   23
         Top             =   1620
         Width           =   840
      End
      Begin VB.Label lblEntidad_Corredor 
         AutoSize        =   -1  'True
         Caption         =   "Corredor:"
         Height          =   210
         Left            =   120
         TabIndex        =   21
         Top             =   1200
         Width           =   690
      End
      Begin VB.Label lblEntidad_RemitenteComercial 
         AutoSize        =   -1  'True
         Caption         =   "Rte. Comerc.:"
         Height          =   210
         Left            =   120
         TabIndex        =   19
         Top             =   780
         Width           =   975
      End
      Begin VB.Label lblEntidad_Intermediario 
         AutoSize        =   -1  'True
         Caption         =   "Intermediario:"
         Height          =   210
         Left            =   120
         TabIndex        =   17
         Top             =   360
         Width           =   960
      End
   End
   Begin VB.Frame fraEncabezado 
      Caption         =   "Encabezado"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4515
      Begin MSMask.MaskEdBox maskedtextboxComprobanteNumero 
         Height          =   315
         Left            =   1200
         TabIndex        =   12
         Top             =   1740
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
      Begin VB.CommandButton cmdEntidad 
         Caption         =   "�"
         Height          =   315
         Left            =   900
         TabIndex        =   4
         TabStop         =   0   'False
         ToolTipText     =   "Entidades"
         Top             =   660
         Width           =   255
      End
      Begin VB.TextBox txtMovimientoTipo 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   300
         Width           =   3195
      End
      Begin VB.CommandButton cmdVerificarDuplicado 
         Caption         =   "� Verificar"
         Height          =   315
         Left            =   2700
         TabIndex        =   15
         TabStop         =   0   'False
         ToolTipText     =   "Verificar si el comprobante ya existe en el sistema"
         Top             =   2100
         Width           =   975
      End
      Begin VB.CommandButton cmdFechaCarga_Hoy 
         Height          =   315
         Left            =   3240
         Picture         =   "Movimiento_Cereal_Detalle.frx":2586
         Style           =   1  'Graphical
         TabIndex        =   10
         TabStop         =   0   'False
         ToolTipText     =   "Hoy"
         Top             =   1020
         Width           =   315
      End
      Begin VB.CommandButton cmdFechaCarga_Siguiente 
         Height          =   315
         Left            =   2940
         Picture         =   "Movimiento_Cereal_Detalle.frx":26D0
         Style           =   1  'Graphical
         TabIndex        =   9
         TabStop         =   0   'False
         ToolTipText     =   "Siguiente"
         Top             =   1020
         Width           =   300
      End
      Begin VB.CommandButton cmdFechaCarga_Anterior 
         Height          =   315
         Left            =   1200
         Picture         =   "Movimiento_Cereal_Detalle.frx":2C5A
         Style           =   1  'Graphical
         TabIndex        =   7
         TabStop         =   0   'False
         ToolTipText     =   "Anterior"
         Top             =   1020
         Width           =   300
      End
      Begin MSComCtl2.DTPicker dtpFechaCarga 
         Height          =   315
         Left            =   1500
         TabIndex        =   8
         Top             =   1020
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   97124353
         CurrentDate     =   40659
         MaxDate         =   55153
         MinDate         =   40513
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Titular 
         Height          =   330
         Left            =   1200
         TabIndex        =   5
         Top             =   660
         Width           =   3195
         _ExtentX        =   5636
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSMask.MaskEdBox maskedtextboxCTGNumero 
         Height          =   315
         Left            =   1200
         TabIndex        =   14
         Top             =   2100
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         ClipMode        =   1
         PromptInclude   =   0   'False
         AllowPrompt     =   -1  'True
         MaxLength       =   11
         Mask            =   "###########"
         PromptChar      =   "_"
      End
      Begin VB.Label lblEntidad_Titular 
         AutoSize        =   -1  'True
         Caption         =   "Titular:"
         Height          =   210
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   480
      End
      Begin VB.Label lblFechaCarga 
         AutoSize        =   -1  'True
         Caption         =   "Fecha Carga:"
         Height          =   210
         Left            =   120
         TabIndex        =   6
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label lblCTGNumero 
         AutoSize        =   -1  'True
         Caption         =   "C.T.G.:"
         Height          =   210
         Left            =   120
         TabIndex        =   13
         Top             =   2160
         Width           =   495
      End
      Begin VB.Label lblComprobanteNumero 
         AutoSize        =   -1  'True
         Caption         =   "Comprobante:"
         Height          =   210
         Left            =   120
         TabIndex        =   11
         Top             =   1800
         Width           =   1005
      End
      Begin VB.Label lblMovimientoTipo 
         AutoSize        =   -1  'True
         Caption         =   "Tipo:"
         Height          =   210
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   345
      End
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   12900
      TabIndex        =   137
      Top             =   6060
      Width           =   915
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   11880
      TabIndex        =   136
      Top             =   6060
      Width           =   915
   End
   Begin VB.PictureBox picAnalisis 
      BorderStyle     =   0  'None
      Height          =   1515
      Left            =   9360
      ScaleHeight     =   1515
      ScaleWidth      =   4395
      TabIndex        =   117
      Top             =   4380
      Width           =   4395
      Begin VB.CommandButton cmdAnalisis_MuestraNumero_ObtenerSiguiente 
         Caption         =   "Obtener siguiente"
         Height          =   330
         Left            =   2580
         TabIndex        =   122
         Top             =   480
         Width           =   1575
      End
      Begin VB.ComboBox cboAnalisis_ResultadoIPRO 
         Height          =   330
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   124
         Top             =   900
         Width           =   1770
      End
      Begin VB.TextBox txtAnalisis_MuestraNumero 
         Alignment       =   1  'Right Justify
         Height          =   330
         Left            =   1440
         MaxLength       =   11
         TabIndex        =   121
         Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
         Top             =   480
         Width           =   1095
      End
      Begin MSComCtl2.DTPicker dtpAnalisis_Fecha 
         Height          =   315
         Left            =   1440
         TabIndex        =   119
         Top             =   60
         Width           =   1875
         _ExtentX        =   3307
         _ExtentY        =   556
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   97124353
         CurrentDate     =   42934
         MaxDate         =   73415
         MinDate         =   40179
      End
      Begin VB.Label lblAnalisis_ResultadoIPRO 
         AutoSize        =   -1  'True
         Caption         =   "Resultado IPRO:"
         Height          =   210
         Left            =   120
         TabIndex        =   123
         Top             =   960
         Width           =   1155
      End
      Begin VB.Label lblAnalisis_MuestraNumero 
         AutoSize        =   -1  'True
         Caption         =   "Muestra N�:"
         Height          =   210
         Left            =   120
         TabIndex        =   120
         Top             =   540
         Width           =   855
      End
      Begin VB.Label lblAnalisis_Fecha 
         AutoSize        =   -1  'True
         Caption         =   "Fecha:"
         Height          =   210
         Left            =   120
         TabIndex        =   118
         Top             =   120
         Width           =   495
      End
   End
   Begin MSComctlLib.TabStrip tabExtras 
      Height          =   1935
      Left            =   9300
      TabIndex        =   126
      Top             =   4020
      Width           =   4515
      _ExtentX        =   7964
      _ExtentY        =   3413
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   5
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Pesadas"
            Key             =   "PESADAS"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "An�lisis"
            Key             =   "ANALISIS"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Extras"
            Key             =   "EXTRAS"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Informaci�n"
            Key             =   "INFORMACION"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Auditor�a"
            Key             =   "AUDITORIA"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmMovimiento_Cereal_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean
Private mLoading As Boolean

Private mMovimiento_Cereal As Movimiento_Cereal
Private mMovimiento_Cereal_Analisis As Movimiento_Cereal_Analisis

Private mCerealRealizaAnalisis As Boolean
Private mCerealRealizaAnalisisIPRO As Boolean
Private mEntidadOrigenDestinoRealizaAnalisis As Boolean
Private mEntidadOrigenDestinoRealizaAnalisisIPRO As Boolean

Public Function Startup(ByRef Movimiento_Cereal As Movimiento_Cereal) As Boolean
    Set mMovimiento_Cereal = Movimiento_Cereal
    Set mMovimiento_Cereal_Analisis = New Movimiento_Cereal_Analisis
    
    mLoading = True
    
    Load Me
    
    Me.Caption = "Detalle del Movimiento de Cereal - Nuevo"
    
    txtMovimientoTipo.Text = mMovimiento_Cereal.TipoNombre
    
    Call MostrarYHabilitarControles
    
    dtpFechaCarga.value = Date
    
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        If frmMovimiento_Cereal_Lista.cboFechaCargaDescargaOperacion.ListIndex = 1 Then
            dtpFechaCarga.value = frmMovimiento_Cereal_Lista.dtpFechaCargaDescarga_Desde.value
        End If
    End If
    
    Select Case mMovimiento_Cereal.Tipo
        Case MOVIMIENTO_CEREAL_TIPO_ENTRADA
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Titular, "usp_Entidad_Titular_List 0, 1, " & mMovimiento_Cereal.IDEntidad_Titular, "IDEntidad", "Nombre", "Titulares", cscpFirstIfUnique)
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Destinatario, "usp_Entidad_Destinatario_List 0, 1, " & mMovimiento_Cereal.IDEntidad_Destinatario, "IDEntidad", "Nombre", "Destinatarios", cscpItemOrFirstIfUnique, CLng(pParametro.Planta_IDDefault \ 100000))
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Destino, "usp_Entidad_ControlaStock_List 0, 1, NULL, " & mMovimiento_Cereal.IDEntidad_Destino, "IDEntidad", "Nombre", "Destinos", cscpFirstIfUnique)
        Case MOVIMIENTO_CEREAL_TIPO_SALIDA
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Titular, "usp_Entidad_ControlaStock_List 0, 1, NULL, " & mMovimiento_Cereal.IDEntidad_Titular, "IDEntidad", "Nombre", "Titulares", cscpFirstIfUnique)
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Destino, "usp_Entidad_Destino_List 0, 1, " & mMovimiento_Cereal.IDEntidad_Destino, "IDEntidad", "Nombre", "Destinos", cscpFirstIfUnique)
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Destinatario, "usp_Entidad_Destinatario_List 0, 1, " & mMovimiento_Cereal.IDEntidad_Destinatario, "IDEntidad", "Nombre", "Destinatarios", cscpFirstIfUnique)
        Case MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Titular, "usp_Entidad_ControlaStock_List 0, 1, NULL, " & mMovimiento_Cereal.IDEntidad_Titular, "IDEntidad", "Nombre", "Titulares", cscpFirstIfUnique)
            Call datcboEntidad_Destino_Change
        Case MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Titular, "usp_Entidad_ControlaStock_List 0, 1, NULL, " & mMovimiento_Cereal.IDEntidad_Titular, "IDEntidad", "Nombre", "Titulares", cscpFirstIfUnique)
        Case MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA, MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE
            Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Titular, "usp_Entidad_ControlaStock_List 0, 1, NULL, " & mMovimiento_Cereal.IDEntidad_Titular, "IDEntidad", "Nombre", "Titulares", cscpFirstIfUnique)
    End Select
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Intermediario, "usp_Entidad_Intermediario_List 1, 1, " & mMovimiento_Cereal.IDEntidad_Intermediario, "IDEntidad", "Nombre", "Intermediarios", cscpFirst)
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_RemitenteComercial, "usp_Entidad_RemitenteComercial_List 1, 1, " & mMovimiento_Cereal.IDEntidad_RemitenteComercial, "IDEntidad", "Nombre", "Remitentes Comerciales", cscpFirst)
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Corredor, "usp_Entidad_Corredor_List 1, 1, " & mMovimiento_Cereal.IDEntidad_Corredor, "IDEntidad", "Nombre", "Corredores", cscpFirst)
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Entregador, "usp_Entidad_Entregador_List 1, 1, " & mMovimiento_Cereal.IDEntidad_Entregador, "IDEntidad", "Nombre", "Entregadores", cscpFirst)
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Transportista, "usp_Entidad_Transportista_List 0, 1, " & mMovimiento_Cereal.IDEntidad_Transportista, "IDEntidad", "Nombre", "Transportistas", cscpFirstIfUnique)
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboCosecha, "usp_Cosecha_List 0, 1, " & mMovimiento_Cereal.IDCosecha, "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirstIfUnique, pParametro.Cosecha_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "usp_Cereal_List 0, 0, 1, " & mMovimiento_Cereal.IDCereal, "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
    
    dtpFechaArribo.value = dtpFechaCarga.value
    dtpHoraArribo.value = Time
    
    dtpFechaDescarga.value = dtpFechaCarga.value
    dtpHoraDescarga.value = Time
    
    Call tabExtras_Click
    
    dtpAnalisis_Fecha.value = dtpFechaArribo.value
    dtpAnalisis_Fecha.value = Null
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboAnulada, "usp_CartaPorte_MotivoAnulacion_List 0, 1, 0", "IDCartaPorte_MotivoAnulacion", "Nombre", "Motivos de anulaci�n", cscpCurrentOrFirst)
    
    Startup = True
    mLoading = False
End Function

Public Function LoadData() As Boolean
    Dim Index As Integer
    Dim recData As ADODB.recordset
    
    mLoading = True
    With mMovimiento_Cereal
        Me.Caption = "Detalle del Movimiento de Cereal"
        
        'ENCABEZADO
        datcboEntidad_Titular.BoundText = .IDEntidad_Titular
        dtpFechaCarga.value = .FechaCarga_Formatted
        maskedtextboxComprobanteNumero.Text = .ComprobanteNumeroConFormato
        maskedtextboxCtgNumero.Text = .CTGNumero
        
        '1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
        datcboEntidad_Intermediario.BoundText = .IDEntidad_Intermediario
        datcboEntidad_RemitenteComercial.BoundText = .IDEntidad_RemitenteComercial
        datcboEntidad_Corredor.BoundText = .IDEntidad_Corredor
        datcboEntidad_Entregador.BoundText = .IDEntidad_Entregador
        datcboEntidad_Destinatario.BoundText = .IDEntidad_Destinatario
        datcboEntidad_Destino.BoundText = .IDEntidad_Destino
        datcboEntidad_Transportista.BoundText = .IDEntidad_Transportista
        datcboEntidad_Chofer.BoundText = .IDEntidad_Chofer
        
        '2 - DATOS DE LOS GRANOS / ESPECIES TRANSPORTADOS
        datcboCosecha.BoundText = .IDCosecha
        datcboCereal.BoundText = .IDCereal
        datcboContrato.BoundText = .IDContrato
        txtPesoBruto.Text = .PesoBruto_Formatted
        txtPesoTara.Text = .PesoTara_Formatted
        
        'DATOS PARA MERMAS
        txtVolatil.Text = .Volatil_Formatted
        txtHumedad.Text = .Humedad_Formatted
        txtZaranda.Text = .Zaranda_Formatted
        
        '2 - PROCEDENCIA DE LA MERCADERIA
        datcboProcedencia.BoundText = .IDOrigenDestino_Origen
                
        '3 - LUGAR DE DESTINO DE LOS GRANOS
        datcboDestino.BoundText = .IDOrigenDestino_Destino
        
        '4 - DATOS DEL TRANSPORTE
        txtCTGCancelacion.Text = .CTGCancelacion_Formatted
        txtTransporteCamion.Text = .TransporteDominioCamion
        txtTransporteAcoplado.Text = .TransporteDominioAcoplado
        txtTransporteKilometro.Text = .TransporteKilometro_Formatted
        txtTransporteTarifaReferencia.Text = .TransporteTarifaReferencia_Formatted
        txtTransporteTarifa.Text = .TransporteTarifa_Formatted
        
        '5 - DATOS A COMPLETAR EN EL LUGAR DE DESTINO Y DESCARGA
        If .Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
            dtpFechaArribo.MinDate = DateSerial(2010, 12, 1)
            dtpFechaArribo.value = .FechaHoraArribo_FormattedAsDate
            dtpHoraArribo.value = .FechaHoraArribo_FormattedAsTime
            dtpFechaDescarga.MinDate = DateSerial(2010, 12, 1)
            dtpFechaDescarga.value = .FechaHoraDescarga_FormattedAsDate
            dtpHoraDescarga.value = .FechaHoraDescarga_FormattedAsTime
        Else
            dtpFechaArribo.MinDate = DATE_TIME_FIELD_NULL_VALUE
            dtpFechaArribo.value = DATE_TIME_FIELD_NULL_VALUE
            dtpHoraArribo.value = DATE_TIME_FIELD_NULL_VALUE
            dtpFechaDescarga.MinDate = DATE_TIME_FIELD_NULL_VALUE
            dtpFechaDescarga.value = DATE_TIME_FIELD_NULL_VALUE
            dtpHoraDescarga.value = DATE_TIME_FIELD_NULL_VALUE
        End If
        
        'PESADAS
        Call LimpiarPesadas
        If .LoadPesadas Then
            For Index = 1 To IIf(.CMovimiento_Cereal_Pesada.Count > 6, 6, .CMovimiento_Cereal_Pesada.Count)
                txtPesada(Index - 1).Text = .CMovimiento_Cereal_Pesada(Index).IDPesada
                Call txtPesada_LostFocus(Index - 1)
                If .Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
                    txtPesadaCompleta_Ticket(Index - 1).Text = .CMovimiento_Cereal_Pesada(Index).IDPesada
                    Call txtPesadaCompleta_Ticket_LostFocus(Index - 1)
                    txtPesadaCompleta_PesoNeto(Index - 1).Text = .CMovimiento_Cereal_Pesada(Index).PesoNeto
                    Call txtPesadaCompleta_PesoNeto_LostFocus(Index - 1)
                    txtPesadaCompleta_Humedad(Index - 1).Text = .CMovimiento_Cereal_Pesada(Index).Humedad_Formatted
                    Call txtPesadaCompleta_Humedad_LostFocus(Index - 1)
                    txtPesadaCompleta_Zaranda(Index - 1).Text = .CMovimiento_Cereal_Pesada(Index).Zaranda_Formatted
                    Call txtPesadaCompleta_Zaranda_LostFocus(Index - 1)
                End If
            Next Index
            If .CMovimiento_Cereal_Pesada.Count <= 6 Then
                tabExtras.Tabs("PESADAS").Caption = "Pesadas"
                fraPesadasCompletas.Caption = "Pesadas"
            Else
                tabExtras.Tabs("PESADAS").Caption = "Pesadas (EXCEDIDAS +6)"
                fraPesadasCompletas.Caption = "Pesadas (EXCEDIDAS +6)"
            End If
        End If
        
        'AN�LISIS
        mMovimiento_Cereal_Analisis.IDMovimiento_Cereal = .IDMovimiento_Cereal
        mMovimiento_Cereal_Analisis.NoMatchRaiseError = False
        If mMovimiento_Cereal_Analisis.Load And Not mMovimiento_Cereal_Analisis.NoMatch Then
            dtpAnalisis_Fecha.value = CSM_Function.IfIsZeroDate_Null(mMovimiento_Cereal_Analisis.Fecha)
            txtAnalisis_MuestraNumero.Text = mMovimiento_Cereal_Analisis.MuestraNumero
            cboAnalisis_ResultadoIPRO.ListIndex = CSM_Function.CheckBoxValue2ComboboxListIndex(mMovimiento_Cereal_Analisis.ResultadoIPRO)
        Else
            If .Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
                dtpAnalisis_Fecha.value = dtpFechaArribo.value
            End If
            dtpAnalisis_Fecha.value = Null
            txtAnalisis_MuestraNumero.Text = ""
            cboAnalisis_ResultadoIPRO.ListIndex = 0
        End If
        
        'EXTRAS
        chkDeclaraIPRO.value = IIf(.DeclaraIPRO, vbChecked, vbUnchecked)
        datcboAnulada.BoundText = .IDCartaPorte_MotivoAnulacion
        chkIgnorarCertificado.value = IIf(.Certificado = CheckBoxConstants.vbGrayed, vbChecked, vbUnchecked)
        txtNotas.Text = .Notas
        
        'INFORMACION
        txtIDMovimiento_Cereal.Text = .IDMovimiento_Cereal_Formatted
        If .Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA Then
            txtKilogramoMulti.Text = Format(Abs(.PesoFinal) - .KilogramoAplicado, "#,##0")
        Else
            txtKilogramoMulti.Text = .PesoFinal_Formatted
        End If
        
        'AUDITOR�A
        txtUsuario_Creacion.Text = .UsuarioCreacion.Nombre
        txtFechaHora_Creacion.Text = .FechaHoraCreacion_Formatted
        txtUsuario_Modificacion.Text = .UsuarioModificacion.Nombre
        txtFechaHora_Modificacion.Text = .FechaHoraModificacion_Formatted
    
        If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
            Set recData = frmMovimiento_Cereal_Lista.tdbgrdData.DataSource
            
            If Not (recData.BOF And recData.EOF) Then
                lblNavegador_RowNumber = Format(recData.AbsolutePosition, "#,##0")
                lblNavegador_RowCount = Format(recData.RecordCount, "#,##0")
            End If
        End If
        
        'VERIFICO QUE NO EST� CERTIFICADO
        If .Certificado = CheckBoxConstants.vbChecked Then
            Call CSM_Forms.ControlsChangeEnabledState(Me, False, False, False, "cmdPesadasReducidas", "picPesadas", "cmdPesadasCompletas", "tabExtras", "picAnalisis", "lblAnalisis_Fecha", "dtpAnalisis_Fecha", "lblAnalisis_MuestraNumero", "txtAnalisis_MuestraNumero", "lblAnalisis_ResultadoIPRO", "cboAnalisis_ResultadoIPRO", "picExtras", "chkDeclaraIPRO", "picInformacion", "lblFormulariosAplicados", "cboFormulariosAplicados", "cmdAceptar", "cmdCancelar", "picNavegador", "cmdNavegador_Primero", "cmdNavegador_Anterior", "lblNavegador_RowNumber", "lblNavegador_RowCount", "cmdNavegador_Siguiente", "cmdNavegador_Ultimo")
        Else
            Call CSM_Forms.ControlsChangeEnabledState(Me, True, False, False, "txtProcedenciaDireccion", "txtProcedenciaLocalidad", "txtProcedenciaProvincia", "txtDestinoDireccion", "txtDestinoLocalidad", "txtDestinoProvincia")
        End If
    End With
    
    LoadData = True
    mLoading = False
End Function

Private Sub cmdNavegador_Anterior_Click()
    Call Navegar("PREVIOUS")
End Sub

Private Sub cmdNavegador_Primero_Click()
    Call Navegar("FIRST")
End Sub

Private Sub cmdNavegador_Siguiente_Click()
    Call Navegar("NEXT")
End Sub

Private Sub cmdNavegador_Ultimo_Click()
    Call Navegar("LAST")
End Sub

Private Sub datcboCosecha_Change()
    If mMovimiento_Cereal.IsNew And (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE) Then
        mMovimiento_Cereal.IDCosecha = Val(datcboCosecha.BoundText)
        mMovimiento_Cereal.GetProximoComprobanteNumero
        maskedtextboxComprobanteNumero.Text = mMovimiento_Cereal.ComprobanteNumero
    End If
    
    Call LoadComboBoxContratos
End Sub

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    Call CSM_Control_TextBox.PrepareAll(Me)
    
    'AN�LISIS
    cboAnalisis_ResultadoIPRO.AddItem CSM_Constant.ITEM_NONE_CHARS10
    cboAnalisis_ResultadoIPRO.AddItem CSM_Constant.ITEM_POSITIVE_MALE
    cboAnalisis_ResultadoIPRO.AddItem CSM_Constant.ITEM_NEGATIVE_MALE
    cboAnalisis_ResultadoIPRO.ListIndex = 0
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mMovimiento_Cereal = Nothing
    Set mMovimiento_Cereal_Analisis = Nothing
    Set frmMovimiento_Cereal_Detalle = Nothing
End Sub

'============================================================
'COMPROBANTE NUMERO
Private Sub maskedtextboxComprobanteNumero_GotFocus()
    maskedtextboxComprobanteNumero.SelStart = 0
    maskedtextboxComprobanteNumero.SelLength = Len(maskedtextboxComprobanteNumero.FormattedText)
End Sub

Private Sub maskedtextboxComprobanteNumero_LostFocus()
    maskedtextboxComprobanteNumero.Text = PadStringLeft(maskedtextboxComprobanteNumero.Text, "0", 13)
End Sub

'============================================================
'CTG NUMERO
Private Sub maskedtextboxCtgNumero_GotFocus()
    maskedtextboxCtgNumero.SelStart = 0
    maskedtextboxCtgNumero.SelLength = Len(maskedtextboxCtgNumero.Text)
End Sub

Private Sub cmdVerificarDuplicado_Click()
    Dim Movimiento_Cereal As Movimiento_Cereal
    
    If maskedtextboxCtgNumero.Text = "" Then
        MsgBox "Debe especificar el C.T.G.", vbInformation, App.Title
        If maskedtextboxCtgNumero.Enabled Then
            maskedtextboxCtgNumero.SetFocus
        End If
        Exit Sub
    End If
    
    Set Movimiento_Cereal = New Movimiento_Cereal
    Movimiento_Cereal.CTGNumero = maskedtextboxCtgNumero.Text
    Movimiento_Cereal.NoMatchRaiseError = False
    If Movimiento_Cereal.LoadByCtgNumero() Then
        If Not Movimiento_Cereal.NoMatch Then
            Select Case Movimiento_Cereal.Tipo
                Case MOVIMIENTO_CEREAL_TIPO_ENTRADA, MOVIMIENTO_CEREAL_TIPO_SALIDA, MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA, MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION_NOMBRE
                    If Movimiento_Cereal.Tipo = mMovimiento_Cereal.Tipo Then
                        MsgBox "Esta " & Movimiento_Cereal.TipoNombre & " ya est� cargada en el sistema.", vbExclamation, App.Title
                    Else
                        MsgBox "Esta " & Movimiento_Cereal.TipoNombre & " ya est� cargada en el sistema pero con otro tipo.", vbExclamation, App.Title
                    End If
                Case MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA, MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE
                    If Movimiento_Cereal.Tipo = mMovimiento_Cereal.Tipo Then
                        MsgBox "Este " & Movimiento_Cereal.TipoNombre & " ya est� cargado en el sistema.", vbExclamation, App.Title
                    Else
                        MsgBox "Este " & Movimiento_Cereal.TipoNombre & " ya est� cargado en el sistema pero con otro tipo.", vbExclamation, App.Title
                    End If
            End Select
            Set Movimiento_Cereal = Nothing
            Exit Sub
        End If
    End If
    Set Movimiento_Cereal = Nothing
End Sub

'============================================================
'FECHA CARGA
Private Sub cmdFechaCarga_Anterior_Click()
    dtpFechaCarga.value = DateAdd("d", -1, dtpFechaCarga.value)
    dtpFechaCarga.SetFocus
    dtpFechaCarga_Change
End Sub

Private Sub dtpFechaCarga_Change()
    dtpFechaArribo.value = dtpFechaCarga.value
    dtpFechaArribo_Change
End Sub

Private Sub cmdFechaCarga_Siguiente_Click()
    dtpFechaCarga.value = DateAdd("d", 1, dtpFechaCarga.value)
    dtpFechaCarga.SetFocus
    dtpFechaCarga_Change
End Sub

Private Sub cmdFechaCarga_Hoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpFechaCarga.value
    dtpFechaCarga.value = Date
    dtpFechaCarga.SetFocus
    If OldValue <> dtpFechaCarga.value Then
        dtpFechaCarga_Change
    End If
End Sub

'============================================================
'ENTIDAD TITULAR
Private Sub datcboEntidad_Titular_Change()
    datcboProcedencia.BoundText = ""
    
    Select Case mMovimiento_Cereal.Tipo
        Case MOVIMIENTO_CEREAL_TIPO_ENTRADA
            Call CSM_Control_DataCombo.FillFromSQL(datcboProcedencia, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Procedencias", cscpFirstIfUnique)
        Case MOVIMIENTO_CEREAL_TIPO_SALIDA
            Call CSM_Control_DataCombo.FillFromSQL(datcboProcedencia, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Procedencias", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
        Case MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA, MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA, MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE
            Call CSM_Control_DataCombo.FillFromSQL(datcboProcedencia, "usp_Entidad_OrigenDestino_List 0, 0, 1, 1, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Procedencias", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
        Case MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION
            Call CSM_Control_DataCombo.FillFromSQL(datcboProcedencia, "usp_Entidad_OrigenDestino_List 0, 0, 1, 1, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", NULL", "ID", "Nombre", "Procedencias", cscpFirstIfUnique)
    End Select
End Sub

Private Sub cmdEntidad_Click()
    Screen.MousePointer = vbHourglass
    frmEntidad_Lista.Show
    
    On Error Resume Next
    
    If frmEntidad_Lista.WindowState = vbMinimized Then
        frmEntidad_Lista.WindowState = vbNormal
    End If
    frmEntidad_Lista.SetFocus
    Screen.MousePointer = vbDefault
End Sub

'============================================================
'ENTIDAD DESTINO
Private Sub datcboEntidad_Destino_Change()
    datcboDestino.BoundText = ""
    
    Select Case mMovimiento_Cereal.Tipo
        Case MOVIMIENTO_CEREAL_TIPO_ENTRADA
            Call CSM_Control_DataCombo.FillFromSQL(datcboDestino, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Destino.BoundText) & ", " & mMovimiento_Cereal.IDOrigenDestino_Destino, "ID", "Nombre", "Destinos", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
        Case MOVIMIENTO_CEREAL_TIPO_SALIDA
            Call CSM_Control_DataCombo.FillFromSQL(datcboDestino, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Destino.BoundText) & ", " & mMovimiento_Cereal.IDOrigenDestino_Destino, "ID", "Nombre", "Destinos", cscpFirstIfUnique)
        Case MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA
            Call CSM_Control_DataCombo.FillFromSQL(datcboDestino, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Titular.BoundText) & ", " & mMovimiento_Cereal.IDOrigenDestino_Destino, "ID", "Nombre", "Destinos", cscpItemOrFirstIfUnique, Val(Right(pParametro.Planta_IDDefault, 5)))
    End Select
End Sub

'============================================================
'ENTIDAD TRANSPORTISTA
Private Sub datcboEntidad_Transportista_Change()
    Dim KeySave As Long
    
    KeySave = Val(datcboEntidad_Chofer)
    datcboEntidad_Chofer.BoundText = ""
    txtTransporteCamion.Text = ""
    txtTransporteAcoplado.Text = ""
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Chofer, "usp_Entidad_Chofer_List 0, 1, " & IIf(chkEntidad_Chofer_Todos.value = vbChecked, "NULL", Val(datcboEntidad_Transportista.BoundText)) & ", " & mMovimiento_Cereal.IDEntidad_Chofer, "IDEntidad", "Nombre", "Choferes", cscpItemOrFirstIfUnique, KeySave)
End Sub

'============================================================
'ENTIDAD CHOFER
Private Sub chkEntidad_Chofer_Todos_Click()
    Call datcboEntidad_Transportista_Change
End Sub

Private Sub datcboEntidad_Chofer_Change()
    Dim Entidad_Chofer As Entidad_Chofer
    
    If Val(datcboEntidad_Chofer.BoundText) > 0 Then
        Set Entidad_Chofer = New Entidad_Chofer
        Entidad_Chofer.IDEntidad = Val(datcboEntidad_Chofer.BoundText)
        Entidad_Chofer.NoMatchRaiseError = False
        If Entidad_Chofer.Load() Then
            If Not Entidad_Chofer.NoMatch Then
                txtTransporteCamion.Text = Entidad_Chofer.PatenteChasis
                txtTransporteAcoplado.Text = Entidad_Chofer.PatenteAcoplado
            Else
                txtTransporteCamion.Text = ""
                txtTransporteAcoplado.Text = ""
            End If
        End If
        Set Entidad_Chofer = Nothing
    End If
End Sub

'============================================================
'CEREAL
Private Sub datcboCereal_Change()
    Dim Cereal As Cereal
    
    If Val(datcboCereal.BoundText) = 0 Then
        Exit Sub
    End If
        
    Set Cereal = New Cereal
    Cereal.IDCereal = Val(datcboCereal.BoundText)
    If Cereal.Load() Then
        mCerealRealizaAnalisis = Cereal.RealizaAnalisis
        mCerealRealizaAnalisisIPRO = Cereal.RealizaAnalisisIPRO
        Call MostrarControlesDeAnalisis
    End If
    Call LoadComboBoxContratos
    
    If Not mLoading Then
        If mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA And (Not mMovimiento_Cereal.IsNew) And (Not mMovimiento_Cereal.Certificado) And mMovimiento_Cereal.Volatil <> Cereal.MermaVolatilidad Then
            If MsgBox("�Desea modificar el porcentaje de merma vol�til con la del nuevo Cereal seleccionado?", vbQuestion + vbYesNo, App.Title) = vbYes Then
                txtVolatil.Text = Cereal.MermaVolatilidad_Formatted
            End If
        Else
            txtVolatil.Text = Cereal.MermaVolatilidad_Formatted
        End If
    End If
    Set Cereal = Nothing
End Sub

'============================================================
'CONTRATOS
Private Sub cmdContrato_Click()
    Screen.MousePointer = vbHourglass
    On Error Resume Next
    Load frmContrato_Lista
    If Val(datcboEntidad_Destinatario.BoundText) > 0 Then
        frmContrato_Lista.cboComprador.ListIndex = CSM_Control_ComboBox.GetListIndexByItemData(frmContrato_Lista.cboComprador, Val(datcboEntidad_Destinatario.BoundText), cscpItemOrFirst)
    End If
    frmContrato_Lista.Show
    If frmContrato_Lista.WindowState = vbMinimized Then
        frmContrato_Lista.WindowState = vbNormal
    End If
    frmContrato_Lista.SetFocus
    Screen.MousePointer = vbDefault
End Sub

'============================================================
'PESO BRUTO
Private Sub txtPesoBruto_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPesoBruto)
End Sub

Private Sub txtPesoBruto_Change()
    Call CalcularPesoNeto
End Sub

Private Sub txtPesoBruto_LostFocus()
    Call FormatValue_ByTag(txtPesoBruto)
End Sub

'============================================================
'PESO TARA
Private Sub txtPesoTara_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPesoTara)
End Sub

Private Sub txtPesoTara_Change()
    Call CalcularPesoNeto
End Sub

Private Sub txtPesoTara_LostFocus()
    Call FormatValue_ByTag(txtPesoTara)
End Sub

'============================================================
'PESO NETO
Private Sub CalcularPesoNeto()
    If IsNumeric(txtPesoBruto.Text) And IsNumeric(txtPesoTara.Text) Then
        txtPesoNeto.Text = Format(CLng(txtPesoBruto.Text) - CLng(txtPesoTara.Text), "#,##0")
    Else
        txtPesoNeto.Text = ""
    End If
End Sub

'============================================================
'VOLATIL
Private Sub txtVolatil_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtVolatil)
End Sub

Private Sub txtVolatil_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtVolatil)
    Call CSM_Control_TextBox.FormatValue_ByTag(txtVolatil)
End Sub

'============================================================
'HUMEDAD
Private Sub txtHumedad_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtHumedad)
End Sub

Private Sub txtHumedad_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtHumedad)
    Call CSM_Control_TextBox.FormatValue_ByTag(txtHumedad)
End Sub

'============================================================
'ZARANDA
Private Sub txtZaranda_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtZaranda)
End Sub

Private Sub txtZaranda_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtZaranda)
    Call CSM_Control_TextBox.FormatValue_ByTag(txtZaranda)
End Sub

'============================================================
'PROCEDENCIA
Private Sub datcboProcedencia_Change()
    Dim Entidad_OrigDest As Entidad_OrigDest
    
    If Val(datcboProcedencia.BoundText) = 0 Then
        txtProcedenciaDireccion.Text = ""
        txtProcedenciaLocalidad.Text = ""
        txtProcedenciaProvincia.Text = ""
    Else
        Set Entidad_OrigDest = New Entidad_OrigDest
        Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Titular.BoundText)
        Entidad_OrigDest.IDOrigenDestino = Val(datcboProcedencia.BoundText)
        If Entidad_OrigDest.Load Then
            txtProcedenciaDireccion.Text = Entidad_OrigDest.Direccion
            txtProcedenciaLocalidad.Text = Entidad_OrigDest.Localidad.Nombre
            txtProcedenciaProvincia.Text = Entidad_OrigDest.Localidad.Provincia.Nombre
        End If
        Set Entidad_OrigDest = Nothing
    End If
End Sub

Private Sub cmdProcedencia_Click()
    Screen.MousePointer = vbHourglass
    On Error Resume Next
    Load frmEntidad_OrigenDestino_Lista
    If Val(datcboEntidad_Titular.BoundText) > 0 Then
        frmEntidad_OrigenDestino_Lista.cboFilterEntidad.ListIndex = CSM_Control_ComboBox.GetListIndexByItemData(frmEntidad_OrigenDestino_Lista.cboFilterEntidad, Val(datcboEntidad_Titular.BoundText), cscpItemOrFirst)
    End If
    frmEntidad_OrigenDestino_Lista.Show
    If frmEntidad_OrigenDestino_Lista.WindowState = vbMinimized Then
        frmEntidad_OrigenDestino_Lista.WindowState = vbNormal
    End If
    frmEntidad_OrigenDestino_Lista.SetFocus
    Screen.MousePointer = vbDefault
End Sub

'============================================================
'DESTINO
Private Sub datcboDestino_Change()
    Dim Entidad_OrigDest As Entidad_OrigDest
    
    If Val(datcboDestino.BoundText) = 0 Then
        txtDestinoDireccion.Text = ""
        txtDestinoLocalidad.Text = ""
        txtDestinoProvincia.Text = ""
    Else
        Set Entidad_OrigDest = New Entidad_OrigDest
        If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
            Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Destino.BoundText)
        Else
            Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Titular.BoundText)
        End If
        Entidad_OrigDest.IDOrigenDestino = Val(datcboDestino.BoundText)
        If Entidad_OrigDest.Load Then
            txtDestinoDireccion.Text = Entidad_OrigDest.Direccion
            txtDestinoLocalidad.Text = Entidad_OrigDest.Localidad.Nombre
            txtDestinoProvincia.Text = Entidad_OrigDest.Localidad.Provincia.Nombre
            mEntidadOrigenDestinoRealizaAnalisis = Entidad_OrigDest.RealizaAnalisis
            mEntidadOrigenDestinoRealizaAnalisisIPRO = Entidad_OrigDest.RealizaAnalisisIPRO
            Call MostrarControlesDeAnalisis
        End If
        Set Entidad_OrigDest = Nothing
    End If
End Sub

Private Sub cmdDestino_Click()
    Screen.MousePointer = vbHourglass
    Load frmEntidad_OrigenDestino_Lista
    On Error Resume Next
    If Val(datcboEntidad_Destino.BoundText) > 0 Then
        frmEntidad_OrigenDestino_Lista.cboFilterEntidad.ListIndex = CSM_Control_ComboBox.GetListIndexByItemData(frmEntidad_OrigenDestino_Lista.cboFilterEntidad, Val(datcboEntidad_Destino.BoundText), cscpItemOrFirst)
    End If
    frmEntidad_OrigenDestino_Lista.Show
    If frmEntidad_OrigenDestino_Lista.WindowState = vbMinimized Then
        frmEntidad_OrigenDestino_Lista.WindowState = vbNormal
    End If
    frmEntidad_OrigenDestino_Lista.SetFocus
    Screen.MousePointer = vbDefault
End Sub

'============================================================
'CTG CANCELACION
Private Sub txtCTGCancelacion_GotFocus()
    CSM_Control_TextBox.SelAllText txtCTGCancelacion
End Sub

Private Sub txtCTGCancelacion_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtCTGCancelacion
End Sub

'============================================================
'TRANSPORTE CAMION
Private Sub txtTransporteCamion_GotFocus()
    CSM_Control_TextBox.SelAllText txtTransporteCamion
End Sub

Private Sub txtTransporteCamion_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtTransporteCamion
End Sub

'============================================================
'TRANSPORTE ACOPLADO
Private Sub txtTransporteAcoplado_GotFocus()
    CSM_Control_TextBox.SelAllText txtTransporteAcoplado
End Sub

Private Sub txtTransporteAcoplado_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtTransporteAcoplado
End Sub

'============================================================
'TRANSPORTE KILOMETRO
Private Sub txtTransporteKilometro_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransporteKilometro)
End Sub

Private Sub txtTransporteKilometro_LostFocus()
    Call FormatValue_ByTag(txtTransporteKilometro)
End Sub

Private Sub cmdTransporteKilometro_Click()
    Dim Entidad_OrigDest As Entidad_OrigDest
    Dim Kilometro As Integer

    If Val(datcboEntidad_Titular.BoundText) > 0 And Val(datcboProcedencia.BoundText) > 0 Then
        Set Entidad_OrigDest = New Entidad_OrigDest
        Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Titular.BoundText)
        Entidad_OrigDest.IDOrigenDestino = Val(datcboProcedencia.BoundText)
        If Entidad_OrigDest.Load() Then
            Kilometro = Entidad_OrigDest.Kilometro
        End If
        Set Entidad_OrigDest = Nothing
    End If
    
    If Kilometro = 0 And Val(datcboEntidad_Destino.BoundText) > 0 And Val(datcboDestino.BoundText) > 0 Then
        Set Entidad_OrigDest = New Entidad_OrigDest
        Entidad_OrigDest.IDEntidad = Val(datcboEntidad_Destino.BoundText)
        Entidad_OrigDest.IDOrigenDestino = Val(datcboDestino.BoundText)
        If Entidad_OrigDest.Load() Then
            Kilometro = Entidad_OrigDest.Kilometro
        End If
        Set Entidad_OrigDest = Nothing
    End If
    
    If Kilometro > 0 Then
        txtTransporteKilometro.Text = Format(Kilometro, "#,###")
    End If
End Sub

'============================================================
'TRANSPORTE TARIFA DE REFERENCIA Y TARIFA
Private Sub txtTransporteTarifaReferencia_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransporteTarifaReferencia)
End Sub

Private Sub txtTransporteTarifaReferencia_LostFocus()
    Call FormatValue_ByTag(txtTransporteTarifaReferencia)
End Sub

Private Sub cmdTransporteTarifa_Click()
    Dim FleteTarifa As FleteTarifa
    
    If IsNumeric(txtTransporteKilometro.Text) Then
        If CInt(txtTransporteKilometro.Text) > 0 Then
            Set FleteTarifa = New FleteTarifa
            FleteTarifa.IDFleteTabla = pParametro.FleteTabla_IDDefault
            FleteTarifa.Kilometro = CInt(txtTransporteKilometro.Text)
            FleteTarifa.NoMatchRaiseError = False
            If FleteTarifa.Load() Then
                If FleteTarifa.NoMatch Then
                    txtTransporteTarifaReferencia.Text = ""
                    txtTransporteTarifa.Text = ""
                Else
                    txtTransporteTarifaReferencia.Text = FleteTarifa.TarifaReferencia_Formatted
                    txtTransporteTarifa.Text = FleteTarifa.Tarifa_Formatted
                    txtTransporteTarifa.SetFocus
                End If
            End If
            Set FleteTarifa = Nothing
        End If
    End If
End Sub

Private Sub txtTransporteTarifa_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransporteTarifa)
End Sub

Private Sub txtTransporteTarifa_LostFocus()
    Call FormatValue_ByTag(txtTransporteTarifa)
End Sub

'============================================================
'FECHA ARRIBO
Private Sub dtpFechaArribo_Change()
    dtpFechaDescarga.value = dtpFechaArribo.value

    If IsNull(dtpAnalisis_Fecha.value) Then
        dtpAnalisis_Fecha.value = dtpFechaArribo.value
        dtpAnalisis_Fecha.value = Null
    Else
        If DateDiff("d", dtpAnalisis_Fecha.value, dtpFechaArribo.value) > 0 Then
        dtpAnalisis_Fecha.value = dtpFechaArribo.value
        End If
    End If
End Sub

Private Sub cmdFechaArribo_Anterior_Click()
    dtpFechaArribo.value = DateAdd("d", -1, dtpFechaArribo.value)
    dtpFechaArribo.SetFocus
    dtpFechaArribo_Change
End Sub

Private Sub cmdFechaArribo_Siguiente_Click()
    dtpFechaArribo.value = DateAdd("d", 1, dtpFechaArribo.value)
    dtpFechaArribo.SetFocus
    dtpFechaArribo_Change
End Sub

Private Sub cmdFechaArribo_Hoy_Click()
    dtpFechaArribo.value = Date
    dtpFechaArribo.SetFocus
    dtpFechaArribo_Change
End Sub

'============================================================
'FECHA DESCARGA
Private Sub cmdFechaDescarga_Anterior_Click()
    dtpFechaDescarga.value = DateAdd("d", -1, dtpFechaDescarga.value)
    dtpFechaDescarga.SetFocus
End Sub

Private Sub cmdFechaDescarga_Siguiente_Click()
    dtpFechaDescarga.value = DateAdd("d", 1, dtpFechaDescarga.value)
    dtpFechaDescarga.SetFocus
End Sub

Private Sub cmdFechaDescarga_Hoy_Click()
    dtpFechaDescarga.value = Date
    dtpFechaDescarga.SetFocus
End Sub

'============================================================
'TAB CONTROL DE EXTRAS
Private Sub tabExtras_Click()
    Dim Formulario As Variant
    
    picPesadas.Visible = (tabExtras.SelectedItem.Key = "PESADAS")
    Call MostrarControlesDeAnalisis
    picExtras.Visible = (tabExtras.SelectedItem.Key = "EXTRAS")
    picInformacion.Visible = (tabExtras.SelectedItem.Key = "INFORMACION")
    picAuditoria.Visible = (tabExtras.SelectedItem.Key = "AUDITORIA")
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) And tabExtras.SelectedItem.Key = "INFORMACION" Then
        cboFormulariosAplicados.Clear
        For Each Formulario In mMovimiento_Cereal.CFormularioAplicado
            cboFormulariosAplicados.AddItem CStr(Formulario)
        Next Formulario
        If cboFormulariosAplicados.ListCount > 0 Then
            cboFormulariosAplicados.ListIndex = 0
        End If
    End If
End Sub

'============================================================
'PESADAS REDUCIDAS ASOCIADAS A LA CARTA DE PORTE
Private Sub txtPesada_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtPesada(Index))
End Sub

Private Sub txtPesada_LostFocus(Index As Integer)
    Call FormatValue_ByTag(txtPesada(Index))
End Sub

Private Sub cmdPesadasCompletas_Click()
    Call CopiarPesadasReducidasACompletas
    fraPesadasCompletas.Visible = True
    cmdPesadasCalcular.Visible = True
End Sub

Private Sub CopiarPesadasReducidasACompletas()
    Dim Index As Integer
    
    For Index = 0 To 5
        txtPesadaCompleta_Ticket(Index).Text = txtPesada(Index).Text
    Next Index
End Sub

'============================================================
'PESADAS COMPLETAS ASOCIADAS A LA CARTA DE PORTE
Private Sub txtPesadaCompleta_Ticket_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtPesadaCompleta_Ticket(Index))
End Sub

Private Sub txtPesadaCompleta_Ticket_LostFocus(Index As Integer)
    Call FormatValue_ByTag(txtPesadaCompleta_Ticket(Index))
End Sub

Private Sub txtPesadaCompleta_PesoNeto_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtPesadaCompleta_PesoNeto(Index))
End Sub

Private Sub txtPesadaCompleta_PesoNeto_LostFocus(Index As Integer)
    Call FormatValue_ByTag(txtPesadaCompleta_PesoNeto(Index))
End Sub

Private Sub txtPesadaCompleta_Humedad_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtPesadaCompleta_Humedad(Index))
End Sub

Private Sub txtPesadaCompleta_Humedad_LostFocus(Index As Integer)
    Call FormatValue_ByTag(txtPesadaCompleta_Humedad(Index))
    Call FormatValue_ByTag(txtPesadaCompleta_Humedad(Index))
End Sub

Private Sub txtPesadaCompleta_Zaranda_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtPesadaCompleta_Zaranda(Index))
End Sub

Private Sub txtPesadaCompleta_Zaranda_LostFocus(Index As Integer)
    Call FormatValue_ByTag(txtPesadaCompleta_Zaranda(Index))
    Call FormatValue_ByTag(txtPesadaCompleta_Zaranda(Index))
End Sub

Private Sub cmdPesadasReducidas_Click()
    Call CopiarPesadasCompletasAReducidas
    fraPesadasCompletas.Visible = False
    cmdPesadasCalcular.Visible = False
End Sub

Private Sub CopiarPesadasCompletasAReducidas()
    Dim Index As Integer
    
    For Index = 0 To 5
        txtPesada(Index).Text = txtPesadaCompleta_Ticket(Index).Text
    Next Index
End Sub

'============================================================
Private Sub cmdPesadasCalcular_Click()
    Dim Index As Integer
    
    Dim PesoNeto As Long
    Dim SumaPesoNetoPesadas As Long
    Dim SumaHumedades As Single
    Dim CantidadHumedades As Byte
    
    Dim Humedad As Single
    Dim Cereal As Cereal
    Dim MermaSecadoTotal As Long
    Dim Cereal_Humedad As Cereal_Humedad
    
    Dim Zaranda As Single
    Dim MermaZarandaTotal As Long
    
    If Val(datcboCereal.BoundText) = 0 Then
        MsgBox "Debe especificar el Cereal.", vbInformation, App.Title
        datcboCereal.SetFocus
        Exit Sub
    End If
    Set Cereal = New Cereal
    Cereal.IDCereal = Val(datcboCereal.BoundText)
    Call Cereal.Load
    
    SumaPesoNetoPesadas = 0
    MermaSecadoTotal = 0
    For Index = 0 To 5
        'VERIFICO LOS PESOS NETOS
        If Trim(txtPesadaCompleta_PesoNeto(Index).Text) <> "" Then
            If Not IsNumeric(txtPesadaCompleta_PesoNeto(Index).Text) Then
                MsgBox "El Peso Neto de la Pesada N� " & (Index + 1) & " debe ser un valor num�rico.", vbInformation, App.Title
                txtPesadaCompleta_PesoNeto(Index).SetFocus
                Exit Sub
            End If
            If CLng(txtPesadaCompleta_PesoNeto(Index).Text) <= 0 Then
                MsgBox "El Peso Neto de la Pesada N� " & (Index + 1) & " debe ser mayor a cero.", vbInformation, App.Title
                txtPesadaCompleta_PesoNeto(Index).SetFocus
                Exit Sub
            End If
            PesoNeto = CLng(txtPesadaCompleta_PesoNeto(Index).Text)
            SumaPesoNetoPesadas = SumaPesoNetoPesadas + PesoNeto
        End If
        
        'OBTENGO LAS MERMAS POR HUMEDAD
        If Cereal.NoMatch = False Then
            If Trim(txtPesadaCompleta_Humedad(Index).Text) <> "" Then
                If IsNumeric(txtPesadaCompleta_Humedad(Index).Text) Then
                    Humedad = CSng(txtPesadaCompleta_Humedad(Index).Text)
                    If Humedad >= 0 And Humedad < 50 Then
                        SumaHumedades = SumaHumedades + Humedad
                        CantidadHumedades = CantidadHumedades + 1
                        If Not IsNull(Cereal.MermaHumedadBase) Then
                            If Humedad > Cereal.MermaHumedadBase Then
                                'EL MANIPULEO NO CORRESPONDE PORQUE YA SE VA A RESTAR EN LA CP
                                'MermaSecadoPorcentaje = .MermaSecadoManipuleo
                                'MermaSecado = PesoNeto * .MermaSecadoManipuleo_ForCalculate
                                Set Cereal_Humedad = New Cereal_Humedad
                                Cereal_Humedad.IDCereal = Cereal.IDCereal
                                Cereal_Humedad.Humedad = Humedad
                                Cereal_Humedad.NoMatchRaiseError = False
                                If Cereal_Humedad.Load() Then
                                    If Cereal_Humedad.NoMatch Then
                                        Screen.MousePointer = vbDefault
                                        MsgBox "No est� especificada la merma de humedad " & txtPesadaCompleta_Humedad(Index).Text & " para el Cereal: " & Cereal.Nombre & ".", vbExclamation, App.Title
                                    Else
                                        MermaSecadoTotal = MermaSecadoTotal + (PesoNeto * Cereal_Humedad.Merma_ForCalculate)
                                    End If
                                End If
                                Set Cereal_Humedad = Nothing
                            End If
                        End If
                    End If
                End If
            End If
        End If
        
        'OBTENGO LAS MERMAS POR ZARANDEO
        If Trim(txtPesadaCompleta_Zaranda(Index).Text) <> "" Then
            If IsNumeric(txtPesadaCompleta_Zaranda(Index).Text) Then
                Zaranda = CSng(txtPesadaCompleta_Zaranda(Index).Text)
                If Zaranda >= 0 And Zaranda < 50 Then
                    MermaZarandaTotal = MermaZarandaTotal + (PesoNeto * (Zaranda / 100))
                End If
            End If
        End If
    Next Index
    
    'CALCULO LA HUMEDAD CORRESPONDIENTE A LA SUMA DE LAS MERMAS DE LAS PESADAS
    If MermaSecadoTotal = 0 Then
        txtHumedad.Text = Round(SumaHumedades / CantidadHumedades, 1)
    ElseIf SumaPesoNetoPesadas > 0 Then
        Set Cereal_Humedad = New Cereal_Humedad
        Cereal_Humedad.IDCereal = Cereal.IDCereal
        Cereal_Humedad.Merma = MermaSecadoTotal / SumaPesoNetoPesadas * 100
        Cereal_Humedad.NoMatchRaiseError = False
        If Cereal_Humedad.LoadByMerma() Then
            If Not Cereal_Humedad.NoMatch Then
                txtHumedad.Text = Cereal_Humedad.Humedad_Formatted
            End If
        End If
        Set Cereal_Humedad = Nothing
    End If
    Set Cereal = Nothing
    
    'CALCULO LA ZARANDA CORRESPONDIENTE A LA SUMA DE LAS MERMAS DE LAS PESADAS
    If SumaPesoNetoPesadas > 0 Then
        txtZaranda.Text = Round((MermaZarandaTotal / SumaPesoNetoPesadas * 100) + 0.04, 1)
        Call txtZaranda_LostFocus
    End If
    
    MsgBox "La Suma de los Pesos Netos de las Pesadas es: " & Format(SumaPesoNetoPesadas, "#,##0") & " kgs.", vbInformation, App.Title
End Sub

'============================================================
'AN�LISIS - N�MERO DE MUESTRA
Private Sub txtAnalisis_MuestraNumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtAnalisis_MuestraNumero)
End Sub

Private Sub txtAnalisis_MuestraNumero_LostFocus()
    Call FormatValue_ByTag(txtAnalisis_MuestraNumero)
End Sub

Private Sub cmdAnalisis_MuestraNumero_ObtenerSiguiente_Click()
    Dim recData As ADODB.recordset
    
    On Error GoTo ErrorHandler
    
    Screen.MousePointer = vbHourglass
    Set recData = New ADODB.recordset
    recData.Open "SELECT ISNULL(MAX(MuestraNumero), 0) FROM Movimiento_Cereal_Analisis", pDatabase.Connection, adOpenForwardOnly, adLockReadOnly
    txtAnalisis_MuestraNumero.Text = recData(0).value + 1
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    Screen.MousePointer = vbDefault
    CSM_Error.ShowErrorMessage "Forms.Movimiento_Cereal_Detalle.Analisis_MuestraNumero_ObtenerSiguiente", "Error al obtener el siguiente n�mero de muestra."
End Sub

'============================================================
'NOTAS
Private Sub txtNotas_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNotas())
    cmdAceptar.Default = False
End Sub

Private Sub txtNotas_LostFocus()
    cmdAceptar.Default = True
End Sub

'============================================================
'ACEPTAR
Private Sub cmdAceptar_Click()
    If mMovimiento_Cereal.Certificado = CheckBoxConstants.vbChecked Then
        If VerificarDatosAnalisis() Then
            Aceptar_Analisis
        End If
    Else
        If VerificarDatosEncabezado() Then
            If VerificarDatosIntervinientesTraslado() Then
                If VerificarDatosGranos() Then
                    If VerificarDatosProcedenciaYDestino() Then
                        If VerificarDatosTransporte() Then
                            If VerificarDatosDescarga() Then
                                If VerificarDatosPesadas() Then
                                    If VerificarDatosAnalisis() Then
                                        Aceptar_Todos
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
    End If
End Sub
    
Private Sub Aceptar_Todos()
    Dim Index As Integer
    
    With mMovimiento_Cereal
        'ENCABEZADO
        .ComprobanteNumero = Trim(maskedtextboxComprobanteNumero.Text)
        .CTGNumero = maskedtextboxCtgNumero.Text
        .FechaCarga = dtpFechaCarga.value
        
        '1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
        .IDEntidad_Titular = Val(datcboEntidad_Titular.BoundText)
        .IDEntidad_Intermediario = Val(datcboEntidad_Intermediario.BoundText)
        .IDEntidad_RemitenteComercial = Val(datcboEntidad_RemitenteComercial.BoundText)
        .IDEntidad_Corredor = Val(datcboEntidad_Corredor.BoundText)
        .IDEntidad_Entregador = Val(datcboEntidad_Entregador.BoundText)
        .IDEntidad_Destinatario = Val(datcboEntidad_Destinatario.BoundText)
        .IDEntidad_Destino = Val(datcboEntidad_Destino.BoundText)
        .IDEntidad_Transportista = Val(datcboEntidad_Transportista.BoundText)
        .IDEntidad_Chofer = Val(datcboEntidad_Chofer.BoundText)
        
        '2 - DATOS DE LOS GRANOS / ESPECIES TRANSPORTADOS
        .IDCosecha = Val(datcboCosecha.BoundText)
        .IDCereal = Val(datcboCereal.BoundText)
        .IDContrato = Val(datcboContrato.BoundText)
        .PesoBruto_Formatted = txtPesoBruto.Text
        .PesoTara_Formatted = txtPesoTara.Text
        .PesoNeto_Formatted = txtPesoNeto.Text
        
        'DATOS PARA MERMAS
        .Volatil_Formatted = txtVolatil.Text
        .Humedad_Formatted = txtHumedad.Text
        .Zaranda_Formatted = txtZaranda.Text
        
        '2 - PROCEDENCIA DE LA MERCADERIA
        .IDOrigenDestino_Origen = Val(datcboProcedencia.BoundText)
        
        '3 - LUGAR DE DESTINO DE LOS GRANOS
        .IDOrigenDestino_Destino = Val(datcboDestino.BoundText)
        
        '4 - DATOS DEL TRANSPORTE
        .CTGCancelacion = Val(txtCTGCancelacion.Text)
        .TransporteDominioCamion = Trim(txtTransporteCamion.Text)
        .TransporteDominioAcoplado = Trim(txtTransporteAcoplado.Text)
        .TransporteKilometro_Formatted = txtTransporteKilometro.Text
        .TransporteTarifaReferencia_Formatted = txtTransporteTarifaReferencia.Text
        .TransporteTarifa_Formatted = txtTransporteTarifa.Text
        
        '5 - DATOS A COMPLETAR EN EL LUGAR DE DESTINO Y DESCARGA
        .FechaHoraArribo = Format(dtpFechaArribo.value, "Short Date") & " " & Format(dtpHoraArribo.value, "Short Time")
        .FechaHoraDescarga = Format(dtpFechaDescarga.value, "Short Date") & " " & Format(dtpHoraDescarga.value, "Short Time")
        
        'PESADAS
        For Index = 0 To 5
            If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA) Then
                If Trim(txtPesadaCompleta_Ticket(Index).Text) <> "" Then
                    .Movimiento_Cereal_PesadaCompleta_AddFromData CLng(txtPesadaCompleta_Ticket(Index).Text), txtPesadaCompleta_PesoNeto(Index).Text, txtPesadaCompleta_Humedad(Index).Text, txtPesadaCompleta_Zaranda(Index).Text
                End If
            Else
                If Trim(txtPesada(Index).Text) <> "" Then
                    .Movimiento_Cereal_Pesada_AddFromData CLng(txtPesada(Index).Text)
                End If
            End If
        Next Index
        
        'EXTRAS
        .DeclaraIPRO = (chkDeclaraIPRO.value = vbChecked)
        .IDCartaPorte_MotivoAnulacion = Val(datcboAnulada.BoundText)
        .Certificado = IIf(chkIgnorarCertificado.value = CheckBoxConstants.vbChecked, CheckBoxConstants.vbGrayed, CheckBoxConstants.vbUnchecked)
        .Notas = txtNotas.Text
        
        If Not .Update Then
            Exit Sub
        End If
    End With
    
    'AN�LISIS
    Dim Movimiento_Cereal_Analisis_Actual As Movimiento_Cereal_Analisis
    
    If IsNull(dtpAnalisis_Fecha.value) And Trim(txtAnalisis_MuestraNumero.Text) = "" And cboAnalisis_ResultadoIPRO.ListIndex = 0 Then
        ' No se ingresaron datos de an�lisis
        If Not mMovimiento_Cereal.IsNew Then
            ' Es un movimiento existente, as� que si existe el registro, lo elimino
            With mMovimiento_Cereal_Analisis
                .IDMovimiento_Cereal = mMovimiento_Cereal.IDMovimiento_Cereal
                .NoMatchRaiseError = False
                If .Load() Then
                    .Delete
                End If
            End With
        End If
    Else
        ' Se ingresaron los datos del an�lisis
        With mMovimiento_Cereal_Analisis
            .IDMovimiento_Cereal = mMovimiento_Cereal.IDMovimiento_Cereal
            .Fecha = dtpAnalisis_Fecha.value
            .MuestraNumero = IIf(Trim(txtAnalisis_MuestraNumero.Text) = "", 0, Trim(txtAnalisis_MuestraNumero.Text))
            .ResultadoIPRO = CSM_Function.ComboboxListIndex2CheckBoxValue(cboAnalisis_ResultadoIPRO.ListIndex)
            If Not .Update Then
                Exit Sub
            End If
        End With
    End If
        
    Unload Me
End Sub

Private Function VerificarDatosEncabezado() As Boolean
    If Val(datcboEntidad_Titular.BoundText) = 0 Then
        MsgBox "Debe especificar el Titular del Comprobante.", vbInformation, App.Title
        datcboEntidad_Titular.SetFocus
        Exit Function
    End If
    If DateDiff("d", dtpFechaCarga.value, Date) < 0 Then
        MsgBox "La Fecha de Carga no debe ser posterior al d�a de hoy.", vbInformation, App.Title
        dtpFechaCarga.SetFocus
        Exit Function
    End If
'    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
'        If Val(datcboCartaPorte_Talonario.BoundText) = 0 Then
'            MsgBox "Debe especificar el C.E.E. Nro.", vbInformation, App.Title
'            datcboCartaPorte_Talonario.SetFocus
'            Exit Function
'        End If
'        If DateDiff("d", dtpFechaCarga.Value, CDate(Right(datcboCartaPorte_Talonario.Text, 10))) < 0 Then
'            MsgBox "La Fecha de Carga no puede ser mayor a la Fecha de Vencimiento de la Carta de Porte.", vbInformation, App.Title
'            dtpFechaCarga.SetFocus
'            Exit Function
'        End If
'    End If
    
    ' Verifico el N�mero de Comprobante
    If Trim(maskedtextboxComprobanteNumero.Text) = "" Then
        MsgBox "Debe especificar el N�mero de Comprobante.", vbInformation, App.Title
        If maskedtextboxComprobanteNumero.Enabled Then
            maskedtextboxComprobanteNumero.SetFocus
        End If
        Exit Function
    End If
    If Len(Trim(maskedtextboxComprobanteNumero.Text)) < 13 Then
        MsgBox "El N�mero de Comprobante debe contener 13 d�gitos (sin guiones).", vbInformation, App.Title
        If maskedtextboxComprobanteNumero.Enabled Then
            maskedtextboxComprobanteNumero.SetFocus
        End If
        Exit Function
    End If
    
    ' Verifico el C.T.G.
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
        If maskedtextboxCtgNumero.Text = "" Then
            MsgBox "Debe especificar el N�mero de C.T.G.", vbInformation, App.Title
            maskedtextboxCtgNumero.SetFocus
            Exit Function
        End If
        If Len(maskedtextboxCtgNumero.Text) < 11 Then
            MsgBox "El N�mero de C.T.G. debe contener 11 d�gitos.", vbInformation, App.Title
            maskedtextboxCtgNumero.SetFocus
            Exit Function
        End If
    End If
    
    VerificarDatosEncabezado = True
End Function

Private Function VerificarDatosIntervinientesTraslado() As Boolean
    Dim RemitenteMercaderia As Long
    
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
        If Val(datcboEntidad_RemitenteComercial.BoundText) = 0 Then
            MsgBox "Al ser un Comprobante de Salida, debe tener especificado al menos el Remitente Comercial.", vbInformation, App.Title
            datcboEntidad_RemitenteComercial.SetFocus
            Exit Function
        End If
    End If
    
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
        If Val(datcboEntidad_Destinatario.BoundText) = 0 Then
            MsgBox "Debe especificar el Destinatario del Comprobante.", vbInformation, App.Title
            datcboEntidad_Destinatario.SetFocus
            Exit Function
        End If
    End If
    
'   ================================
'   COMENTADO TODO EL 30/08/2015 - YA QUE EXISTEN LAS 2 POSIBILIDADES
'   ACTUALIZADO EL D�A 04/05/2015 - YA QUE EL DESTINATARIO DEBE SER EL TITULAR DE LA PLANTA EN TODOS LOS CASOS
    'ENTRADA: SI EL DESTINATARIO ES DIFERENTE AL DESTINO, RESTRINJO O CONSULTO SI ES CORRECTO
'    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA) Then
'        If Val(datcboEntidad_Destinatario.BoundText) <> Val(datcboEntidad_Destino.BoundText) Then
'            If pParametro.Movimiento_Cereal_PermiteEntradaConDestinatarioDiferente Then
'                If MsgBox("El Destinatario de la Carta de Porte especificado es diferente al Destino de la Mercader�a." & vbCr & vbCr & "�Desea continuar?", vbQuestion + vbYesNo, App.Title) = vbNo Then
'                    datcboEntidad_Destinatario.SetFocus
'                    Exit Sub
'                End If
'            Else
'                MsgBox "El Destinatario de la Carta de Porte especificado no puede ser diferente al Destino de la Mercader�a.", vbExclamation, App.Title
'                datcboEntidad_Destinatario.SetFocus
'                Exit Sub
'            End If
'        End If
'    End If
    'SALIDA: REM.COM./INTERM. DEBE SER UN TITULAR
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
        If Val(datcboEntidad_Intermediario.BoundText) = 0 Then
            RemitenteMercaderia = Val(datcboEntidad_RemitenteComercial.BoundText)
        Else
            RemitenteMercaderia = Val(datcboEntidad_Intermediario.BoundText)
        End If
        Dim Entidad As Entidad
        Set Entidad = New Entidad
        Entidad.IDEntidad = RemitenteMercaderia
        If Entidad.Load() Then
            If Not Entidad.EsTitular Then
                If Val(datcboEntidad_Intermediario.BoundText) = 0 Then
                    MsgBox "El Remitente Comercial debe ser alg�n Titular de la Mercader�a.", vbInformation, App.Title
                    datcboEntidad_RemitenteComercial.SetFocus
                    Exit Function
                Else
                    MsgBox "El Intermediario debe ser alg�n Titular de la Mercader�a.", vbInformation, App.Title
                    datcboEntidad_Intermediario.SetFocus
                    Exit Function
                End If
            End If
        End If
    End If
    
    If datcboEntidad_Destino.Visible Then
        If Val(datcboEntidad_Destino.BoundText) = 0 Then
            MsgBox "Debe especificar el Destino de la Carta de Porte.", vbInformation, App.Title
            datcboEntidad_Destino.SetFocus
            Exit Function
        End If
    End If

    VerificarDatosIntervinientesTraslado = True
End Function

Private Function VerificarDatosGranos() As Boolean
    If Val(datcboCosecha.BoundText) = 0 Then
        MsgBox "Debe especificar la Cosecha.", vbInformation, App.Title
        datcboCosecha.SetFocus
        Exit Function
    End If
    If Val(datcboCereal.BoundText) = 0 Then
        MsgBox "Debe especificar el Cereal.", vbInformation, App.Title
        datcboCereal.SetFocus
        Exit Function
    End If
    
    If Not IsNumeric(txtPesoBruto.Text) Then
        If Trim(txtPesoBruto.Text) = "" Then
            MsgBox "Debe especificar el Peso Bruto.", vbInformation, App.Title
            txtPesoBruto.SetFocus
            Exit Function
        Else
            MsgBox "El Peso Bruto debe ser un valor num�rico.", vbInformation, App.Title
            txtPesoBruto.SetFocus
            Exit Function
        End If
    Else
        If CLng(txtPesoBruto.Text) <= 0 Then
            MsgBox "El Peso Bruto debe ser mayor a cero.", vbInformation, App.Title
            txtPesoBruto.SetFocus
            Exit Function
        End If
        If pParametro.Movimiento_Cereal_PermiteBrutoMayor45000 = False And (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) And CLng(txtPesoBruto.Text) > 45000 Then
            MsgBox "El Peso Bruto es mayor a 45.000 kgs. que es el l�mite permitido.", vbInformation, App.Title
            txtPesoBruto.SetFocus
            Exit Function
        End If
    End If
    
    If Not IsNumeric(txtPesoTara.Text) Then
        If Trim(txtPesoTara.Text) = "" Then
            MsgBox "Debe especificar el Peso Tara.", vbInformation, App.Title
            txtPesoTara.SetFocus
            Exit Function
        Else
            MsgBox "El Peso Tara debe ser un valor num�rico.", vbInformation, App.Title
            txtPesoTara.SetFocus
            Exit Function
        End If
    Else
        If CLng(txtPesoTara.Text) <= 0 Then
            MsgBox "El Peso Tara debe ser mayor a cero.", vbInformation, App.Title
            txtPesoTara.SetFocus
            Exit Function
        End If
    End If
    
    If Not IsNumeric(txtPesoNeto.Text) Then
        If Trim(txtPesoNeto.Text) = "" Then
            MsgBox "Debe especificar el Peso Neto.", vbInformation, App.Title
            txtPesoNeto.SetFocus
            Exit Function
        Else
            MsgBox "El Peso Neto debe ser un valor num�rico.", vbInformation, App.Title
            txtPesoNeto.SetFocus
            Exit Function
        End If
    Else
        If CLng(txtPesoNeto.Text) <= 0 Then
            MsgBox "El Peso Neto debe ser mayor a cero.", vbInformation, App.Title
            txtPesoNeto.SetFocus
            Exit Function
        End If
    End If
    
    If Trim(txtHumedad.Text) <> "" Then
        If Not IsNumeric(txtHumedad.Text) Then
            MsgBox "La Humedad debe ser un valor num�rico.", vbInformation, App.Title
            txtHumedad.SetFocus
            Exit Function
        End If
        If CSng(txtHumedad.Text) < 0 Then
            MsgBox "La Humedad debe ser mayor o igual a cero.", vbInformation, App.Title
            txtHumedad.SetFocus
            Exit Function
        End If
        If CSng(txtHumedad.Text) > 50 Then
            MsgBox "La Humedad debe ser menor o igual a 50.", vbInformation, App.Title
            txtHumedad.SetFocus
            Exit Function
        End If
    End If
    
    If Trim(txtZaranda.Text) <> "" Then
        If Not IsNumeric(txtZaranda.Text) Then
            MsgBox "El Zarandeo debe ser un valor num�rico.", vbInformation, App.Title
            txtZaranda.SetFocus
            Exit Function
        End If
        If CSng(txtZaranda.Text) < 0 Then
            MsgBox "El Zarandeo debe ser mayor o igual a cero.", vbInformation, App.Title
            txtZaranda.SetFocus
            Exit Function
        End If
        If CSng(txtZaranda.Text) > 50 Then
            MsgBox "El Zarandeo debe ser menor o igual a 50.", vbInformation, App.Title
            txtZaranda.SetFocus
            Exit Function
        End If
    End If

    VerificarDatosGranos = True
End Function

Private Function VerificarDatosProcedenciaYDestino() As Boolean
    Dim ent_od As Entidad_OrigDest
    
    If Val(datcboProcedencia.BoundText) = 0 Then
        MsgBox "Debe especificar la Procedencia de la Mercader�a.", vbInformation, App.Title
        datcboProcedencia.SetFocus
        Exit Function
    End If
        
    ' Verificar que la localidad de origen tenga especificado el Partido
    If pParametro.Localidad_VerificarPartido Then
        If mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
            Set ent_od = New Entidad_OrigDest
            ent_od.IDEntidad = Val(datcboEntidad_Titular.BoundText)
            ent_od.IDOrigenDestino = Val(datcboProcedencia.BoundText)
            If ent_od.Load() Then
                If ent_od.Localidad.IDPartido = 0 Then
                    MsgBox "La Localidad de Procedencia de la Mercader�a (" & ent_od.Localidad.Nombre & "), no tiene especificado el Partido al cual pertenece." & vbCr & "Por favor, especif�quelo en la tabla de Localidades.", vbExclamation, App.Title
                    Set ent_od = Nothing
                    Exit Function
                End If
            End If
            Set ent_od = Nothing
        End If
    End If
    
    If mMovimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION And mMovimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA And mMovimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE Then
        If Val(datcboDestino.BoundText) = 0 Then
            MsgBox "Debe especificar el Destino de los Granos.", vbInformation, App.Title
            datcboDestino.SetFocus
            Exit Function
        End If
    End If
    
    If mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA Then
        If Val(datcboProcedencia.BoundText) = Val(datcboDestino.BoundText) Then
            MsgBox "La Procedencia y el Destino de los granos deben ser diferentes.", vbInformation, App.Title
            datcboProcedencia.SetFocus
            Exit Function
        End If
    End If
    
    VerificarDatosProcedenciaYDestino = True
End Function

Private Function VerificarDatosTransporte() As Boolean
    If datcboEntidad_Transportista.Visible Then
        If Val(datcboEntidad_Transportista.BoundText) = 0 Then
            MsgBox "Debe especificar el Transportista de la Carta de Porte.", vbInformation, App.Title
            datcboEntidad_Transportista.SetFocus
            Exit Function
        End If
    End If
    If datcboEntidad_Chofer.Visible Then
        If Val(datcboEntidad_Chofer.BoundText) = 0 Then
            MsgBox "Debe especificar el Chofer de la Carta de Porte.", vbInformation, App.Title
            datcboEntidad_Chofer.SetFocus
            Exit Function
        End If
    End If
    
    VerificarDatosTransporte = True
End Function

Private Function VerificarDatosDescarga() As Boolean
    Dim FechaHoraArribo As Date
    Dim FechaHoraDescarga As Date
    
    If mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
        ' Fecha/hora de arribo
        Select Case DateDiff("d", dtpFechaCarga.value, dtpFechaArribo.value)
            Case Is < 0
                MsgBox "La Fecha de Arribo no debe ser anterior a la Fecha de Carga.", vbInformation, App.Title
                dtpFechaArribo.SetFocus
                Exit Function
            Case Is > pParametro.Movimiento_Cereal_FechaArriboDiasMaximo
                MsgBox "La Fecha de Arribo no debe ser mayor a " & pParametro.Movimiento_Cereal_FechaArriboDiasMaximo & " d�as de la Fecha de Carga.", vbInformation, App.Title
                dtpFechaArribo.SetFocus
                Exit Function
        End Select
        
        ' Fecha/hora de descarga
        FechaHoraArribo = CDate(Format(dtpFechaArribo.value, "Short Date") & " " & Format(dtpHoraArribo.value, "Short Time"))
        FechaHoraDescarga = CDate(Format(dtpFechaDescarga.value, "Short Date") & " " & Format(dtpHoraDescarga.value, "Short Time"))
        If FechaHoraDescarga < FechaHoraArribo Then
            MsgBox "La Fecha/Hora de Descarga debe ser igual o posterior a la Fecha/Hora de Arribo.", vbInformation, App.Title
            dtpFechaDescarga.SetFocus
            Exit Function
        End If
        If DateDiff("d", FechaHoraArribo, FechaHoraDescarga) > pParametro.Movimiento_Cereal_FechaDescargaDiasMaximo Then
            MsgBox "La Fecha de Descarga no debe ser mayor a " & pParametro.Movimiento_Cereal_FechaDescargaDiasMaximo & " d�as de la Fecha de Arribo.", vbInformation, App.Title
            dtpFechaDescarga.SetFocus
            Exit Function
        End If
    End If

    VerificarDatosDescarga = True
End Function

Private Function VerificarDatosPesadas() As Boolean
    Dim SumaPesoNetoPesadas As Long
    Dim Index As Integer
    Dim SubIndex As Integer

    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA) Then
        'VERIFICO LAS PESADAS COMPLETAS
        If Not fraPesadasCompletas.Visible Then
            Call CopiarPesadasReducidasACompletas
        End If
        SumaPesoNetoPesadas = 0
        For Index = 0 To 5
            'TICKET
            If Trim(txtPesadaCompleta_Ticket(Index).Text) <> "" Then
                If Not IsNumeric(txtPesadaCompleta_Ticket(Index).Text) Then
                    MsgBox "La Pesada N� " & (Index + 1) & " debe ser un valor num�rico.", vbInformation, App.Title
                    fraPesadasCompletas.Visible = True
                    txtPesadaCompleta_Ticket(Index).SetFocus
                    Exit Function
                End If
                If Val(txtPesadaCompleta_Ticket(Index).Text) > CSM_Constant.DATATYPE_LONG_VALUE_MAX Then
                    MsgBox "La Pesada N� " & (Index + 1) & " es un n�mero muy grande y no se puede guardar.", vbInformation, App.Title
                    fraPesadasCompletas.Visible = True
                    txtPesadaCompleta_Ticket(Index).SetFocus
                    Exit Function
                End If
                If CLng(txtPesadaCompleta_Ticket(Index).Text) <= 0 Then
                    MsgBox "La Pesada N� " & (Index + 1) & " debe ser mayor a cero.", vbInformation, App.Title
                    fraPesadasCompletas.Visible = True
                    txtPesadaCompleta_Ticket(Index).SetFocus
                    Exit Function
                End If
            End If
            'PESO NETO
            If Trim(txtPesadaCompleta_PesoNeto(Index).Text) <> "" Then
                If Not IsNumeric(txtPesadaCompleta_PesoNeto(Index).Text) Then
                    MsgBox "El Peso Neto de la Pesada N� " & (Index + 1) & " debe ser un valor num�rico.", vbInformation, App.Title
                    txtPesadaCompleta_PesoNeto(Index).SetFocus
                    Exit Function
                End If
                If CLng(txtPesadaCompleta_PesoNeto(Index).Text) < 0 Then
                    MsgBox "El Peso Neto de la Pesada N� " & (Index + 1) & " debe ser mayor a cero.", vbInformation, App.Title
                    txtPesadaCompleta_PesoNeto(Index).SetFocus
                    Exit Function
                End If
                SumaPesoNetoPesadas = SumaPesoNetoPesadas + CLng(txtPesadaCompleta_PesoNeto(Index).Text)
            End If
        Next Index
    Else
        'VERIFICO LAS PESADAS REDUCIDAS
        For Index = 0 To 5
            If Trim(txtPesada(Index).Text) <> "" Then
                If Not IsNumeric(txtPesada(Index).Text) Then
                    MsgBox "La Pesada N� " & (Index + 1) & " debe ser un valor num�rico.", vbInformation, App.Title
                    txtPesada(Index).SetFocus
                    Exit Function
                End If
                If Val(txtPesada(Index).Text) > CSM_Constant.DATATYPE_LONG_VALUE_MAX Then
                    MsgBox "La Pesada N� " & (Index + 1) & " es un n�mero muy grande y no se puede guardar.", vbInformation, App.Title
                    txtPesada(Index).SetFocus
                    Exit Function
                End If
                If CLng(txtPesada(Index).Text) <= 0 Then
                    MsgBox "La Pesada N� " & (Index + 1) & " debe ser mayor a cero.", vbInformation, App.Title
                    txtPesada(Index).SetFocus
                    Exit Function
                End If
            End If
        Next Index
    End If
    
    'VERIFICO QUE NO HAYA DOS PESADAS IGUALES
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA) Then
        'VERIFICO LAS PESADAS COMPLETAS
        For Index = 0 To 5
            For SubIndex = Index + 1 To 5
                If Trim(txtPesadaCompleta_Ticket(Index).Text) <> "" And Trim(txtPesadaCompleta_Ticket(SubIndex).Text) <> "" Then
                    If CLng(txtPesadaCompleta_Ticket(Index).Text) = CLng(txtPesadaCompleta_Ticket(SubIndex).Text) Then
                        MsgBox "El Ticket de la Pesada N� " & (Index + 1) & " es igual al de la Pesada N� " & (SubIndex + 1) & ".", vbInformation, App.Title
                        txtPesadaCompleta_Ticket(SubIndex).SetFocus
                        Exit Function
                    End If
                End If
            Next SubIndex
        Next Index
    Else
        'VERIFICO LAS PESADAS REDUCIDAS
        For Index = 0 To 5
            For SubIndex = Index + 1 To 5
                If Trim(txtPesada(Index).Text) <> "" And Trim(txtPesada(SubIndex).Text) <> "" Then
                    If CLng(txtPesada(Index).Text) = CLng(txtPesada(SubIndex).Text) Then
                        MsgBox "El Ticket de la Pesada N� " & (Index + 1) & " es igual al de la Pesada N� " & (SubIndex + 1) & ".", vbInformation, App.Title
                        txtPesada(SubIndex).SetFocus
                        Exit Function
                    End If
                End If
            Next SubIndex
        Next Index
    End If
    If SumaPesoNetoPesadas > 0 And SumaPesoNetoPesadas <> CLng(txtPesoNeto.Text) Then
        If MsgBox("Hay diferencia entre la suma de los Pesos Netos de las Pesadas y el Peso Neto de la Carta de Porte." & vbCr & vbCr & "Suma Pesadas: " & Format(SumaPesoNetoPesadas, "#,###") & vbCr & "Peso Neto C.P.: " & txtPesoNeto.Text & vbCr & vbCr & "�Desea continuar de todos modos?", vbExclamation + vbYesNo, App.Title) = vbNo Then
            Exit Function
        End If
    End If

    VerificarDatosPesadas = True
End Function

Private Function VerificarDatosAnalisis() As Boolean
    If mMovimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
        VerificarDatosAnalisis = True
        Exit Function
    End If
    If Not mCerealRealizaAnalisis Then
        VerificarDatosAnalisis = True
        Exit Function
    End If
    If Not mEntidadOrigenDestinoRealizaAnalisis Then
        VerificarDatosAnalisis = True
        Exit Function
    End If
    
    If IsNull(dtpAnalisis_Fecha.value) Then
        tabExtras.SelectedItem = tabExtras.Tabs("ANALISIS")
        MsgBox "Debe ingresar la Fecha de An�lisis.", vbInformation, App.Title
        dtpAnalisis_Fecha.SetFocus
        Exit Function
    End If
    If Trim(txtAnalisis_MuestraNumero.Text) = "" Then
        tabExtras.SelectedItem = tabExtras.Tabs("ANALISIS")
        MsgBox "Debe ingresar el N�mero de Muestra del An�lisis.", vbInformation, App.Title
        txtAnalisis_MuestraNumero.SetFocus
        Exit Function
    End If
    If mCerealRealizaAnalisisIPRO And mEntidadOrigenDestinoRealizaAnalisisIPRO Then
        If chkDeclaraIPRO.value = vbUnchecked And cboAnalisis_ResultadoIPRO.ListIndex < 1 Then
            tabExtras.SelectedItem = tabExtras.Tabs("ANALISIS")
            MsgBox "Debe especificar el Resultado IPRO del An�lisis.", vbInformation, App.Title
            cboAnalisis_ResultadoIPRO.SetFocus
            Exit Function
        End If
    End If
    
    If Not IsNull(dtpAnalisis_Fecha.value) Then
        ' Fecha de an�lisis
        Select Case DateDiff("d", dtpFechaArribo.value, dtpAnalisis_Fecha.value)
            Case Is < 0
                MsgBox "La Fecha de An�lisis no debe ser anterior a la Fecha de Arribo.", vbInformation, App.Title
                dtpFechaArribo.SetFocus
                Exit Function
            Case Is > pParametro.Movimiento_Cereal_FechaAnalisisDiasMaximo
                MsgBox "La Fecha de An�lisis no debe ser mayor a " & pParametro.Movimiento_Cereal_FechaAnalisisDiasMaximo & " d�as de la Fecha de Arribo.", vbInformation, App.Title
                dtpFechaArribo.SetFocus
                Exit Function
        End Select
    End If
    If Trim(txtAnalisis_MuestraNumero.Text) <> "" Then
        If Not IsNumeric(txtAnalisis_MuestraNumero.Text) Then
            tabExtras.SelectedItem = tabExtras.Tabs("ANALISIS")
            MsgBox "El N�mero de Muestra del An�lisis debe ser un valor num�rico.", vbInformation, App.Title
            txtAnalisis_MuestraNumero.SetFocus
            Exit Function
        End If
        If CLng(txtAnalisis_MuestraNumero.Text) < 1 Then
            tabExtras.SelectedItem = tabExtras.Tabs("ANALISIS")
            MsgBox "El N�mero de Muestra del An�lisis debe ser mayor a cero.", vbInformation, App.Title
            txtAnalisis_MuestraNumero.SetFocus
            Exit Function
        End If
    End If

    VerificarDatosAnalisis = True
End Function

Private Sub Aceptar_Analisis()
    Dim Movimiento_Cereal_Analisis_Actual As Movimiento_Cereal_Analisis
    
    ' EXTRAS
    If mMovimiento_Cereal.DeclaraIPRO <> (chkDeclaraIPRO.value = vbChecked) Then
        mMovimiento_Cereal.DeclaraIPRO = (chkDeclaraIPRO.value = vbChecked)
        If Not mMovimiento_Cereal.Update Then
            Exit Sub
        End If
    End If
    
    ' ANALISIS
    If IsNull(dtpAnalisis_Fecha.value) And Trim(txtAnalisis_MuestraNumero.Text) = "" And cboAnalisis_ResultadoIPRO.ListIndex = 0 Then
        ' No se ingresaron datos de an�lisis
        If Not mMovimiento_Cereal.IsNew Then
            ' Es un movimiento existente, as� que si existe el registro, lo elimino
            With mMovimiento_Cereal_Analisis
                .IDMovimiento_Cereal = mMovimiento_Cereal.IDMovimiento_Cereal
                .NoMatchRaiseError = False
                If .Load() Then
                    .Delete
                End If
            End With
        End If
    Else
        ' Se ingresaron los datos del an�lisis
        With mMovimiento_Cereal_Analisis
            .IDMovimiento_Cereal = mMovimiento_Cereal.IDMovimiento_Cereal
            .Fecha = dtpAnalisis_Fecha.value
            .MuestraNumero = IIf(Trim(txtAnalisis_MuestraNumero.Text) = "", 0, Trim(txtAnalisis_MuestraNumero.Text))
            .ResultadoIPRO = CSM_Function.ComboboxListIndex2CheckBoxValue(cboAnalisis_ResultadoIPRO.ListIndex)
            If Not .Update Then
                Exit Sub
            End If
        End With
    End If
        
    Unload Me
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Private Sub MostrarYHabilitarControles()
    maskedtextboxComprobanteNumero.Enabled = Not (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE)

    lblCTGNumero.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    maskedtextboxCtgNumero.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    cmdVerificarDuplicado.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    
    lblEntidad_Intermediario.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Intermediario.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_RemitenteComercial.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_RemitenteComercial.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_Corredor.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Corredor.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_Entregador.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Entregador.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_Destinatario.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Destinatario.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_Destino.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Destino.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_Transportista.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Transportista.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    lblEntidad_Chofer.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    chkEntidad_Chofer_Todos.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    datcboEntidad_Chofer.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    
    lblVolatil.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    txtVolatil.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    
    lblHumedad.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    txtHumedad.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    
    lblZaranda.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    txtZaranda.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    
    fraDestino.Visible = (mMovimiento_Cereal.Tipo <> MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION)
    
    fraDatosTransporte.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA)
    fraDatosDescarga.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    
    If (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_SALIDA) Then
        lblKilogramoMulti.Caption = "Kgs. Pendient. RT"
    Else
        lblKilogramoMulti.Caption = "Kgs. Finales"
    End If
    fraPesadasCompletas.Visible = False
    
    lblIgnorarCertificado.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    chkIgnorarCertificado.Visible = (mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA)
    
    picNavegador.Visible = Not mMovimiento_Cereal.IsNew
End Sub

Private Sub MostrarControlesDeAnalisis()
    picAnalisis.Visible = (tabExtras.SelectedItem.Key = "ANALISIS" And mCerealRealizaAnalisis And mEntidadOrigenDestinoRealizaAnalisis)
    
    lblDeclaraIPRO.Visible = (mCerealRealizaAnalisisIPRO And mEntidadOrigenDestinoRealizaAnalisisIPRO)
    chkDeclaraIPRO.Visible = lblDeclaraIPRO.Visible
    lblAnalisis_ResultadoIPRO.Visible = lblDeclaraIPRO.Visible
    cboAnalisis_ResultadoIPRO.Visible = lblDeclaraIPRO.Visible
End Sub

Private Sub LoadComboBoxContratos()
    datcboContrato.BoundText = 0

    Call CSM_Control_DataCombo.FillFromSQL(datcboContrato, "usp_Contrato_List 1, 1, 0, NULL, " & Val(datcboCosecha.BoundText) & ", " & Val(datcboCereal.BoundText) & ", " & mMovimiento_Cereal.IDContrato, "IDContrato", "Nombre", "Contratos", cscpFirstIfUnique)
End Sub

Public Function FillComboBox_Entidad_Titular() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Titular.BoundText)
    Set recData = datcboEntidad_Titular.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Titular.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Intermediario() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Intermediario.BoundText)
    Set recData = datcboEntidad_Intermediario.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Intermediario.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_RemitenteComercial() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_RemitenteComercial.BoundText)
    Set recData = datcboEntidad_RemitenteComercial.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_RemitenteComercial.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Corredor() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Corredor.BoundText)
    Set recData = datcboEntidad_Corredor.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Corredor.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Entregador() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Entregador.BoundText)
    Set recData = datcboEntidad_Entregador.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Entregador.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Destinatario() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Destinatario.BoundText)
    Set recData = datcboEntidad_Destinatario.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Destinatario.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Destino() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Destino.BoundText)
    Set recData = datcboEntidad_Destino.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Destino.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Transportista() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboEntidad_Transportista.BoundText)
    Set recData = datcboEntidad_Transportista.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Transportista.BoundText = KeySave
End Function

Public Function FillComboBox_Entidad_Chofer() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    On Error Resume Next
    KeySave = Val(datcboEntidad_Chofer.BoundText)
    Set recData = datcboEntidad_Chofer.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Chofer.BoundText = KeySave
End Function

Public Function FillComboBox_Cosecha() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboCosecha.BoundText)
    Set recData = datcboCosecha.RowSource
    recData.Requery
    Set recData = Nothing
    datcboCosecha.BoundText = KeySave
End Function

Public Function FillComboBox_Cereal() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboCereal.BoundText)
    Set recData = datcboCereal.RowSource
    recData.Requery
    Set recData = Nothing
    datcboCereal.BoundText = KeySave
End Function

Public Function FillComboBox_Contrato() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    KeySave = Val(datcboContrato.BoundText)
    Set recData = datcboContrato.RowSource
    recData.Requery
    Set recData = Nothing
    datcboContrato.BoundText = KeySave
End Function

Public Function FillComboBox_Procedencia() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    On Error Resume Next
    KeySave = Val(datcboProcedencia.BoundText)
    Set recData = datcboProcedencia.RowSource
    recData.Requery
    Set recData = Nothing
    datcboProcedencia.BoundText = KeySave
End Function

Public Function FillComboBox_Destino() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.recordset
    
    On Error Resume Next
    KeySave = Val(datcboDestino.BoundText)
    Set recData = datcboDestino.RowSource
    recData.Requery
    Set recData = Nothing
    datcboDestino.BoundText = KeySave
End Function

Private Sub Navegar(ByVal Position As String)
    Dim Movimiento_Cereal As Movimiento_Cereal
    Dim recData As ADODB.recordset
    
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        Set recData = frmMovimiento_Cereal_Lista.tdbgrdData.DataSource
        
        If Not (recData.BOF And recData.EOF) Then
            Select Case Position
                Case "FIRST"
                    If recData.AbsolutePosition > 1 Then
                        recData.MoveFirst
                        Set Movimiento_Cereal = New Movimiento_Cereal
                        Movimiento_Cereal.IDMovimiento_Cereal = recData("IDMovimiento_Cereal").value
                        If Movimiento_Cereal.Load() Then
                            Call Me.Startup(Movimiento_Cereal)
                            Call Me.LoadData
                        End If
                        Set Movimiento_Cereal = Nothing
                    End If
                Case "PREVIOUS"
                    If recData.AbsolutePosition > 1 Then
                        recData.MovePrevious
                        Set Movimiento_Cereal = New Movimiento_Cereal
                        Movimiento_Cereal.IDMovimiento_Cereal = recData("IDMovimiento_Cereal").value
                        If Movimiento_Cereal.Load() Then
                            Call Me.Startup(Movimiento_Cereal)
                            Call Me.LoadData
                        End If
                        Set Movimiento_Cereal = Nothing
                    End If
                Case "NEXT"
                    If recData.AbsolutePosition < recData.RecordCount Then
                        recData.MoveNext
                        Set Movimiento_Cereal = New Movimiento_Cereal
                        Movimiento_Cereal.IDMovimiento_Cereal = recData("IDMovimiento_Cereal").value
                        If Movimiento_Cereal.Load() Then
                            Call Me.Startup(Movimiento_Cereal)
                            Call Me.LoadData
                        End If
                        Set Movimiento_Cereal = Nothing
                    End If
                Case "LAST"
                    If recData.AbsolutePosition < recData.RecordCount Then
                        recData.MoveLast
                        Set Movimiento_Cereal = New Movimiento_Cereal
                        Movimiento_Cereal.IDMovimiento_Cereal = recData("IDMovimiento_Cereal").value
                        If Movimiento_Cereal.Load() Then
                            Call Me.Startup(Movimiento_Cereal)
                            Call Me.LoadData
                        End If
                        Set Movimiento_Cereal = Nothing
                    End If
            End Select
        End If
        Set recData = Nothing
    End If
    cmdCancelar.SetFocus
End Sub

Private Sub LimpiarPesadas()
    Dim Index As Integer
    
    For Index = 0 To 5
        txtPesada(Index).Text = ""
        txtPesadaCompleta_Ticket(Index).Text = ""
        txtPesadaCompleta_PesoNeto(Index).Text = ""
        txtPesadaCompleta_Humedad(Index).Text = ""
        txtPesadaCompleta_Zaranda(Index).Text = ""
    Next Index
End Sub
