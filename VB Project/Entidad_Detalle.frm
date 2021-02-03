VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmEntidad_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle de la Entidad"
   ClientHeight    =   5325
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6135
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Entidad_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   5325
   ScaleWidth      =   6135
   Begin VB.CommandButton cmdCUIT_Verificar 
      Caption         =   "a"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   11.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2475
      Picture         =   "Entidad_Detalle.frx":0E42
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Verificar"
      Top             =   540
      Width           =   315
   End
   Begin VB.Frame fraNotas 
      Height          =   2835
      Left            =   240
      TabIndex        =   55
      Top             =   1380
      Width           =   5655
      Begin VB.PictureBox picAuditoria 
         BorderStyle     =   0  'None
         Height          =   1395
         Left            =   60
         ScaleHeight     =   1395
         ScaleWidth      =   5475
         TabIndex        =   69
         Top             =   1320
         Width           =   5475
         Begin VB.TextBox txtFechaHora_Modificacion 
            BackColor       =   &H8000000F&
            ForeColor       =   &H8000000D&
            Height          =   315
            Left            =   2100
            TabIndex        =   65
            TabStop         =   0   'False
            Top             =   1080
            Width           =   1575
         End
         Begin VB.TextBox txtUsuario_Creacion 
            BackColor       =   &H8000000F&
            ForeColor       =   &H8000000D&
            Height          =   315
            Left            =   2100
            TabIndex        =   59
            TabStop         =   0   'False
            Top             =   0
            Width           =   3375
         End
         Begin VB.TextBox txtFechaHora_Creacion 
            BackColor       =   &H8000000F&
            ForeColor       =   &H8000000D&
            Height          =   315
            Left            =   2100
            TabIndex        =   61
            TabStop         =   0   'False
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox txtUsuario_Modificacion 
            BackColor       =   &H8000000F&
            ForeColor       =   &H8000000D&
            Height          =   315
            Left            =   2100
            TabIndex        =   63
            TabStop         =   0   'False
            Top             =   720
            Width           =   3375
         End
         Begin VB.Label lblUsuario_Modificacion 
            AutoSize        =   -1  'True
            Caption         =   "Usuario Modificación:"
            Height          =   210
            Left            =   120
            TabIndex        =   62
            Top             =   780
            Width           =   1545
         End
         Begin VB.Label lblFechaHora_Modificacion 
            AutoSize        =   -1  'True
            Caption         =   "Fecha/Hora Modificación:"
            Height          =   210
            Left            =   120
            TabIndex        =   64
            Top             =   1140
            Width           =   1830
         End
         Begin VB.Label lblFechaHora_Creacion 
            AutoSize        =   -1  'True
            Caption         =   "Fecha/Hora Creación:"
            Height          =   210
            Left            =   120
            TabIndex        =   60
            Top             =   420
            Width           =   1575
         End
         Begin VB.Label lblUsuario_Creacion 
            AutoSize        =   -1  'True
            Caption         =   "Usuario Creación:"
            Height          =   210
            Left            =   120
            TabIndex        =   58
            Top             =   60
            Width           =   1290
         End
      End
      Begin VB.TextBox txtNotas 
         Height          =   975
         Left            =   840
         MaxLength       =   8000
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   57
         Top             =   240
         Width           =   4695
      End
      Begin VB.Label lblNotas 
         Caption         =   "Notas:"
         Height          =   195
         Left            =   180
         TabIndex        =   56
         Top             =   240
         Width           =   570
      End
   End
   Begin VB.CommandButton cmdAFIP_ConstanciaInscripcion_Navegar 
      Height          =   315
      Left            =   2820
      Picture         =   "Entidad_Detalle.frx":13CC
      Style           =   1  'Graphical
      TabIndex        =   5
      TabStop         =   0   'False
      ToolTipText     =   "Ver constancia de inscripción"
      Top             =   540
      Width           =   315
   End
   Begin VB.Frame fraImpuestos 
      Height          =   2655
      Left            =   240
      TabIndex        =   36
      Top             =   1380
      Width           =   5655
      Begin VB.CommandButton cmdReFOG_Situacion_Navegar 
         Height          =   315
         Left            =   4620
         Picture         =   "Entidad_Detalle.frx":1956
         Style           =   1  'Graphical
         TabIndex        =   45
         TabStop         =   0   'False
         ToolTipText     =   "Ver situación en el Re.F.O.G."
         Top             =   1680
         Width           =   315
      End
      Begin VB.ComboBox cboReFOG_Situacion 
         Height          =   330
         Left            =   1320
         Style           =   2  'Dropdown List
         TabIndex        =   44
         Top             =   1680
         Width           =   3270
      End
      Begin VB.ComboBox cboGananciaInscripto 
         Height          =   330
         Left            =   1320
         Style           =   2  'Dropdown List
         TabIndex        =   42
         Top             =   1200
         Width           =   1530
      End
      Begin VB.TextBox txtCBU 
         Height          =   315
         Left            =   1320
         MaxLength       =   22
         TabIndex        =   47
         Tag             =   "STRING|EMPTY|NUMBERS|22"
         Top             =   2160
         Width           =   2295
      End
      Begin VB.TextBox txtIIBB 
         Height          =   315
         Left            =   1320
         MaxLength       =   20
         TabIndex        =   40
         Top             =   720
         Width           =   2055
      End
      Begin MSDataListLib.DataCombo datcboCategoriaIVA 
         Height          =   330
         Left            =   1320
         TabIndex        =   38
         Top             =   240
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblReFOG_Situacion 
         Caption         =   "Re.F.O.G.:"
         Height          =   195
         Left            =   180
         TabIndex        =   43
         Top             =   1740
         Width           =   1110
      End
      Begin VB.Label lblGananciaInscripto 
         Caption         =   "Ganancias:"
         Height          =   195
         Left            =   180
         TabIndex        =   41
         Top             =   1260
         Width           =   1110
      End
      Begin VB.Label lblCBU 
         Caption         =   "C.B.U.:"
         Height          =   195
         Left            =   180
         TabIndex        =   46
         Top             =   2220
         Width           =   1110
      End
      Begin VB.Label lblIIBB 
         Caption         =   "II.BB.:"
         Height          =   195
         Left            =   180
         TabIndex        =   39
         Top             =   780
         Width           =   1110
      End
      Begin VB.Label lblCategoriaIVA 
         Caption         =   "Categoría IVA:"
         Height          =   195
         Left            =   180
         TabIndex        =   37
         Top             =   300
         Width           =   1110
      End
   End
   Begin VB.TextBox txtCUIT 
      Height          =   315
      Left            =   1140
      MaxLength       =   11
      TabIndex        =   3
      Tag             =   "STRING|EMPTY|NUMBERS|11"
      Top             =   540
      Width           =   1335
   End
   Begin VB.CheckBox chkActivo 
      Alignment       =   1  'Right Justify
      Caption         =   "Activo:"
      Height          =   210
      Left            =   120
      TabIndex        =   66
      Top             =   4500
      Width           =   1215
   End
   Begin VB.TextBox txtNombre 
      Height          =   315
      Left            =   1140
      MaxLength       =   100
      TabIndex        =   1
      Top             =   120
      Width           =   4875
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   3480
      TabIndex        =   67
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4800
      TabIndex        =   68
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Frame fraEs 
      Height          =   1755
      Left            =   240
      TabIndex        =   7
      Top             =   1380
      Width           =   5655
      Begin VB.CheckBox chkEsClienteSubProducto 
         Alignment       =   1  'Right Justify
         Caption         =   "Cliente SubPr.:"
         Height          =   210
         Left            =   120
         TabIndex        =   17
         Top             =   1380
         Width           =   1395
      End
      Begin VB.CheckBox chkEsRemitenteComercial 
         Alignment       =   1  'Right Justify
         Caption         =   "Rte. Comercial:"
         Height          =   210
         Left            =   120
         TabIndex        =   10
         Top             =   1020
         Width           =   1395
      End
      Begin VB.CheckBox chkEsChofer 
         Alignment       =   1  'Right Justify
         Caption         =   "Chofer:"
         Height          =   210
         Left            =   4140
         TabIndex        =   16
         Top             =   1020
         Width           =   1395
      End
      Begin VB.CheckBox chkEsDestino 
         Alignment       =   1  'Right Justify
         Caption         =   "Destino:"
         Height          =   210
         Left            =   4140
         TabIndex        =   14
         Top             =   300
         Width           =   1395
      End
      Begin VB.CheckBox chkEsTransportista 
         Alignment       =   1  'Right Justify
         Caption         =   "Transportista:"
         Height          =   210
         Left            =   4140
         TabIndex        =   15
         Top             =   660
         Width           =   1395
      End
      Begin VB.CheckBox chkEsDestinatario 
         Alignment       =   1  'Right Justify
         Caption         =   "Destinatario:"
         Height          =   210
         Left            =   2040
         TabIndex        =   13
         Top             =   1020
         Width           =   1395
      End
      Begin VB.CheckBox chkEsEntregador 
         Alignment       =   1  'Right Justify
         Caption         =   "Entregador:"
         Height          =   210
         Left            =   2040
         TabIndex        =   12
         Top             =   660
         Width           =   1395
      End
      Begin VB.CheckBox chkEsCorredor 
         Alignment       =   1  'Right Justify
         Caption         =   "Corredor:"
         Height          =   210
         Left            =   2040
         TabIndex        =   11
         Top             =   300
         Width           =   1395
      End
      Begin VB.CheckBox chkEsIntermediario 
         Alignment       =   1  'Right Justify
         Caption         =   "Intermediario:"
         Height          =   210
         Left            =   120
         TabIndex        =   9
         Top             =   660
         Width           =   1395
      End
      Begin VB.CheckBox chkEsTitular 
         Alignment       =   1  'Right Justify
         Caption         =   "Titular:"
         Height          =   210
         Left            =   120
         TabIndex        =   8
         Top             =   300
         Width           =   1395
      End
   End
   Begin VB.Frame fraChofer 
      Height          =   1635
      Left            =   240
      TabIndex        =   48
      Top             =   1380
      Width           =   5655
      Begin VB.TextBox txtPatenteAcoplado 
         Height          =   315
         Left            =   1320
         MaxLength       =   7
         TabIndex        =   54
         Tag             =   "STRING|EMPTY|UPPER|7"
         Top             =   1200
         Width           =   1035
      End
      Begin VB.TextBox txtPatenteChasis 
         Height          =   315
         Left            =   1320
         MaxLength       =   7
         TabIndex        =   52
         Tag             =   "STRING|EMPTY|UPPER|7"
         Top             =   720
         Width           =   1035
      End
      Begin MSDataListLib.DataCombo datcboEntidad_Transportista 
         Height          =   330
         Left            =   1320
         TabIndex        =   50
         Top             =   240
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblEntidad_Transportista 
         Caption         =   "Transportista:"
         Height          =   195
         Left            =   120
         TabIndex        =   49
         Top             =   300
         Width           =   1110
      End
      Begin VB.Label lblPatenteAcoplado 
         Caption         =   "Acoplado:"
         Height          =   195
         Left            =   120
         TabIndex        =   53
         Top             =   1260
         Width           =   1110
      End
      Begin VB.Label lblPatenteChasis 
         Caption         =   "Chasis:"
         Height          =   195
         Left            =   120
         TabIndex        =   51
         Top             =   780
         Width           =   1110
      End
   End
   Begin VB.Frame fraDomicilio 
      Height          =   2835
      Left            =   240
      TabIndex        =   18
      Top             =   1380
      Width           =   5655
      Begin VB.TextBox txtDomicilioCodigoPostal 
         Height          =   315
         Left            =   1320
         MaxLength       =   4
         TabIndex        =   31
         Tag             =   "STRING|EMPTY|NUMBERS|4"
         Top             =   1500
         Width           =   615
      End
      Begin VB.TextBox txtDomicilioOficina 
         Height          =   315
         Left            =   4440
         MaxLength       =   10
         TabIndex        =   29
         Top             =   1080
         Width           =   975
      End
      Begin VB.TextBox txtDomicilioPiso 
         Height          =   315
         Left            =   2940
         MaxLength       =   10
         TabIndex        =   27
         Top             =   1080
         Width           =   975
      End
      Begin VB.TextBox txtDomicilioNumero 
         Height          =   315
         Left            =   1320
         MaxLength       =   10
         TabIndex        =   25
         Top             =   1080
         Width           =   1095
      End
      Begin VB.OptionButton optDomicilioTipoRural 
         Caption         =   "Rural"
         Height          =   210
         Left            =   2400
         TabIndex        =   21
         Top             =   300
         Width           =   1035
      End
      Begin VB.OptionButton optDomicilioTipoUrbano 
         Caption         =   "Urbano"
         Height          =   210
         Left            =   1320
         TabIndex        =   20
         Top             =   300
         Width           =   1035
      End
      Begin VB.TextBox txtDomicilioCalle 
         Height          =   315
         Left            =   1320
         MaxLength       =   50
         TabIndex        =   23
         Top             =   660
         Width           =   4215
      End
      Begin MSDataListLib.DataCombo datcboDomicilioProvincia 
         Height          =   330
         Left            =   1320
         TabIndex        =   33
         Top             =   1920
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin MSDataListLib.DataCombo datcboDomicilioLocalidad 
         Height          =   330
         Left            =   1320
         TabIndex        =   35
         Top             =   2340
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   582
         _Version        =   393216
         MatchEntry      =   -1  'True
         Style           =   2
         Text            =   ""
      End
      Begin VB.Label lblDomicilioLocalidad 
         Caption         =   "Localidad:"
         Height          =   195
         Left            =   120
         TabIndex        =   34
         Top             =   2400
         Width           =   1110
      End
      Begin VB.Label lblDomicilioCodigoPostal 
         Caption         =   "Código Postal:"
         Height          =   195
         Left            =   120
         TabIndex        =   30
         Top             =   1560
         Width           =   1110
      End
      Begin VB.Label lblDomicilioOficina 
         Caption         =   "Ofic.:"
         Height          =   195
         Left            =   4020
         TabIndex        =   28
         Top             =   1140
         Width           =   390
      End
      Begin VB.Label lblDomicilioPiso 
         Caption         =   "Piso:"
         Height          =   195
         Left            =   2520
         TabIndex        =   26
         Top             =   1140
         Width           =   390
      End
      Begin VB.Label lblDomicilioNumero 
         Caption         =   "Número:"
         Height          =   195
         Left            =   120
         TabIndex        =   24
         Top             =   1140
         Width           =   1110
      End
      Begin VB.Label lblDomicilioTipo 
         Caption         =   "Tipo:"
         Height          =   195
         Left            =   120
         TabIndex        =   19
         Top             =   300
         Width           =   1110
      End
      Begin VB.Label lblDomicilioCalle 
         Caption         =   "Calle:"
         Height          =   195
         Left            =   120
         TabIndex        =   22
         Top             =   720
         Width           =   1110
      End
      Begin VB.Label lblDomicilioProvincia 
         Caption         =   "Provincia:"
         Height          =   195
         Left            =   120
         TabIndex        =   32
         Top             =   1980
         Width           =   1110
      End
   End
   Begin MSComctlLib.TabStrip tabMain 
      Height          =   3315
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   5847
      TabMinWidth     =   882
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   5
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Es:"
            Key             =   "GENERAL"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Domicilio"
            Key             =   "DOMICILIO"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Impuestos"
            Key             =   "IMPUESTOS"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Chofer"
            Key             =   "CHOFER"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Notas"
            Key             =   "NOTAS"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Label lblCUIT 
      Caption         =   "CUIT:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   990
   End
   Begin VB.Label lblNombre 
      Caption         =   "&Nombre:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   990
   End
End
Attribute VB_Name = "frmEntidad_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mEntidad As Entidad

Public Function Startup(ByRef Entidad As Entidad) As Boolean
    Set mEntidad = Entidad
    
    Load Me
    
    Me.Caption = "Entidad - Nueva"
    
    tabMain_Click
    
    'PROVINCIA
    If Not CSM_Control_DataCombo.FillFromSQL(datcboDomicilioProvincia, "(SELECT '-' AS IDProvincia, '" & CSM_Constant.ITEM_NONE_CHARS20 & "' AS Nombre, 1 AS Orden FROM Provincia) UNION (SELECT IDProvincia, Nombre, 2 AS Orden FROM Provincia) ORDER BY Orden, Nombre", "IDProvincia", "Nombre", "Provincias", cscpFirst) Then
        Exit Function
    End If
    'CATEGORIA IVA
    If Not CSM_Control_DataCombo.FillFromSQL(datcboCategoriaIVA, "(SELECT 0 AS IDCategoriaIVA, '" & CSM_Constant.ITEM_NONE_CHARS20 & "' AS Nombre, 1 AS Orden FROM CategoriaIVA) UNION (SELECT IDCategoriaIVA, Nombre, 2 AS Orden FROM CategoriaIVA) ORDER BY Orden, Nombre", "IDCategoriaIVA", "Nombre", "Categorías de IVA", cscpFirst) Then
        Exit Function
    End If
    HabilitarControles_Domicilio
    
    'ENTIDAD TRANSPORTISTA
    If Not CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Transportista, "(SELECT 0 AS IDEntidad, '" & CSM_Constant.ITEM_NONE_CHARS20 & "' AS Nombre, 1 AS Orden FROM Entidad) UNION (SELECT IDEntidad, Nombre, 2 AS Orden FROM Entidad WHERE (Activo = 1 OR IDEntidad = " & mEntidad.Entidad_Chofer.IDEntidad_Transportista & ") AND EsTransportista = 1) ORDER BY Orden, Nombre", "IDEntidad", "Nombre", "Transportistas", cscpFirst) Then
        Exit Function
    End If
    
    chkActivo.Value = vbChecked
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mEntidad
        Me.Caption = "Entidad - " & .IDEntidad

        txtNombre.Text = .Nombre
        txtCUIT.Text = .CUIT
        
        chkEsTitular.Value = IIf(.EsTitular, vbChecked, vbUnchecked)
        chkEsIntermediario.Value = IIf(.EsIntermediario, vbChecked, vbUnchecked)
        chkEsRemitenteComercial.Value = IIf(.EsRemitenteComercial, vbChecked, vbUnchecked)
        chkEsCorredor.Value = IIf(.EsCorredor, vbChecked, vbUnchecked)
        chkEsEntregador.Value = IIf(.EsEntregador, vbChecked, vbUnchecked)
        chkEsDestinatario.Value = IIf(.EsDestinatario, vbChecked, vbUnchecked)
        chkEsDestino.Value = IIf(.EsDestino, vbChecked, vbUnchecked)
        chkEsTransportista.Value = IIf(.EsTransportista, vbChecked, vbUnchecked)
        chkEsChofer.Value = IIf(.EsChofer, vbChecked, vbUnchecked)
        chkEsClienteSubProducto.Value = IIf(.EsClienteSubProducto, vbChecked, vbUnchecked)
        
        If .Entidad_Domicilio.Tipo > 0 And .Entidad_Domicilio.Calle <> "" Then
            optDomicilioTipoUrbano.Value = (.Entidad_Domicilio.Tipo = 1)
            optDomicilioTipoRural.Value = (.Entidad_Domicilio.Tipo = 2)
            txtDomicilioCalle.Text = .Entidad_Domicilio.Calle
            txtDomicilioNumero.Text = .Entidad_Domicilio.Numero
            txtDomicilioPiso.Text = .Entidad_Domicilio.Piso
            txtDomicilioOficina.Text = .Entidad_Domicilio.Oficina
            txtDomicilioCodigoPostal.Text = .Entidad_Domicilio.CodigoPostal
            datcboDomicilioProvincia.BoundText = .Entidad_Domicilio.Localidad.IDProvincia
            datcboDomicilioLocalidad.BoundText = .Entidad_Domicilio.IDLocalidad
        End If
            
        If .EsTitular Or .EsClienteSubProducto Then
            datcboCategoriaIVA.BoundText = .Entidad_Impuesto.IDCategoriaIVA
            txtIIBB.Text = .Entidad_Impuesto.IIBB
            cboGananciaInscripto.ListIndex = .Entidad_Impuesto.GananciaInscripto + 1
            cboReFOG_Situacion.ListIndex = CSM_Control_ComboBox.GetListIndexByText(cboReFOG_Situacion, .Entidad_Impuesto.ReFOG_Situacion, cscpItemOrFirst, 1)
            txtCBU.Text = .Entidad_Impuesto.CBU
        End If
        
        If .EsChofer Then
            datcboEntidad_Transportista.BoundText = .Entidad_Chofer.IDEntidad_Transportista
            txtPatenteChasis.Text = .Entidad_Chofer.PatenteChasis
            txtPatenteAcoplado.Text = .Entidad_Chofer.PatenteAcoplado
        End If
        
        txtNotas.Text = .Notas
        
        'AUDITORÍA
        txtUsuario_Creacion.Text = .UsuarioCreacion.Nombre
        txtFechaHora_Creacion.Text = .FechaHoraCreacion_Formatted
        txtUsuario_Modificacion.Text = .UsuarioModificacion.Nombre
        txtFechaHora_Modificacion.Text = .FechaHoraModificacion_Formatted
    
        chkActivo.Value = IIf(.Activo, vbChecked, vbUnchecked)
        
        Call CSM_Control_TextBox.FormatAll(Me)
    End With
    LoadData = True
End Function

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    cboGananciaInscripto.AddItem CSM_Constant.ITEM_NONE_CHARS10
    cboGananciaInscripto.AddItem "No Inscripto"
    cboGananciaInscripto.AddItem "Inscripto"
    cboGananciaInscripto.ListIndex = 0
    
    cboReFOG_Situacion.AddItem CSM_Constant.ITEM_NONE_CHARS20
    cboReFOG_Situacion.AddItem REFOG_SITUACION_INEXISTENTE_NOMBRE
    cboReFOG_Situacion.AddItem REFOG_SITUACION_ACTIVO_NOMBRE
    cboReFOG_Situacion.AddItem REFOG_SITUACION_EXCLUIDO_NOMBRE
    cboReFOG_Situacion.AddItem REFOG_SITUACION_SUSPENDIDO_NOMBRE
    cboReFOG_Situacion.ListIndex = 0
    
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mEntidad = Nothing
    Set frmEntidad_Detalle = Nothing
End Sub

Private Sub tabMain_Click()
    Call ShowTabs
End Sub

Private Sub txtDomicilioCalle_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDomicilioCalle)
End Sub

Private Sub txtDomicilioCodigoPostal_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDomicilioCodigoPostal)
End Sub

Private Sub txtDomicilioNumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDomicilioNumero)
End Sub

Private Sub txtDomicilioOficina_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDomicilioOficina)
End Sub

Private Sub txtDomicilioPiso_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDomicilioPiso)
End Sub

Private Sub txtNombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNombre)
End Sub

Private Sub txtCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCUIT)
End Sub

Private Sub txtCUIT_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtCUIT)
End Sub

Private Sub cmdCUIT_Verificar_Click()
    Select Case Len(Trim(txtCUIT.Text))
        Case 0
        Case 10
            txtCUIT.Text = Trim(txtCUIT.Text) & CSM_AFIP.DigitoVerificadorCUIT(Trim(txtCUIT.Text))
        Case 11
            If CSM_AFIP.VerificarCUIT(Trim(txtCUIT.Text)) Then
                MsgBox "El número de CUIT ingresado es correcto.", vbInformation, App.Title
            Else
                MsgBox "El número de CUIT ingresado es incorrecto.", vbExclamation, App.Title
            End If
        Case Else
            MsgBox "Debe ingresar al menos los primeros 10 dígitos del número de CUIT para poder verificarlo.", vbExclamation, App.Title
    End Select
    txtCUIT.SetFocus
End Sub

Private Sub cmdAFIP_ConstanciaInscripcion_Navegar_Click()
    CSM_Instance.Execute Replace(pParametro.AFIP_ConstanciaInscripcion_Link, "%1", txtCUIT.Text)
    txtCUIT.SetFocus
End Sub

Private Sub optDomicilioTipoUrbano_Click()
    HabilitarControles_Domicilio
End Sub

Private Sub optDomicilioTipoRural_Click()
    HabilitarControles_Domicilio
End Sub

Private Sub datcboDomicilioProvincia_Change()
    If datcboDomicilioProvincia.BoundText = "" Or datcboDomicilioProvincia.BoundText = "-" Then
        Set datcboDomicilioLocalidad.DataSource = Nothing
        datcboDomicilioLocalidad.BoundText = ""
    Else
        Call CSM_Control_DataCombo.FillFromSQL(datcboDomicilioLocalidad, "(SELECT 0 AS IDLocalidad, '" & CSM_Constant.ITEM_NONE_CHARS20 & "' AS Nombre, 1 AS Orden FROM Localidad) UNION (SELECT IDLocalidad, Nombre, 2 AS Orden FROM Localidad WHERE IDProvincia = '" & datcboDomicilioProvincia.BoundText & "') ORDER BY Orden, Nombre", "IDLocalidad", "Nombre", "Localidades", cscpFirst)
    End If
End Sub

Private Sub txtIIBB_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtIIBB)
End Sub

Private Sub txtIIBB_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtIIBB)
End Sub

Private Sub cmdReFOG_Situacion_Navegar_Click()
    CSM_Instance.Execute pParametro.AFIP_ConsultaReFOG_Link
    cboReFOG_Situacion.SetFocus
End Sub

Private Sub txtCBU_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCBU)
End Sub

Private Sub txtCBU_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtCBU)
End Sub

Private Sub txtPatenteChasis_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPatenteChasis)
End Sub

Private Sub txtPatenteChasis_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtPatenteChasis)
End Sub

Private Sub txtPatenteAcoplado_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPatenteAcoplado)
End Sub

Private Sub txtPatenteAcoplado_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtPatenteAcoplado)
End Sub

Private Sub txtNotas_GotFocus()
    cmdAceptar.Default = False
    Call CSM_Control_TextBox.SelAllText(txtNotas)
End Sub

Private Sub txtNotas_LostFocus()
    cmdAceptar.Default = True
End Sub

Private Sub cmdAceptar_Click()
    If Trim(txtNombre.Text) = "" Then
        MsgBox "Debe ingresar el Nombre de la Entidad.", vbInformation, App.Title
        txtNombre.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtCUIT.Text)) = 0 Then
        MsgBox "El CUIT está incompleto, ya que debe contener 11 números (sin guiones).", vbInformation, App.Title
        txtCUIT.SetFocus
        Exit Sub
    End If
    
    If Len(Trim(txtCUIT.Text)) < 11 Then
        MsgBox "El CUIT está incompleto, ya que debe contener 11 números (sin guiones).", vbInformation, App.Title
        txtCUIT.SetFocus
        Exit Sub
    End If
    If Not CSM_AFIP.VerificarCUIT_SinGuiones(txtCUIT.Text) Then
        MsgBox "El CUIT ingresado es incorrecto. Verifíquelo.", vbInformation, App.Title
        txtCUIT.SetFocus
        Exit Sub
    End If
    With mEntidad
        .Nombre = txtNombre.Text
        .CUIT = txtCUIT.Text
        
        .EsTitular = (chkEsTitular.Value = vbChecked)
        .EsIntermediario = (chkEsIntermediario.Value = vbChecked)
        .EsRemitenteComercial = (chkEsRemitenteComercial.Value = vbChecked)
        .EsCorredor = (chkEsCorredor.Value = vbChecked)
        .EsEntregador = (chkEsEntregador.Value = vbChecked)
        .EsDestinatario = (chkEsDestinatario.Value = vbChecked)
        .EsDestino = (chkEsDestino.Value = vbChecked)
        .EsTransportista = (chkEsTransportista.Value = vbChecked)
        
        If .EsTitular And chkEsTitular.Value = vbUnchecked Then
            .Entidad_Domicilio.Delete
        End If
        .EsTitular = (chkEsTitular.Value = vbChecked)
        
        If .EsChofer And chkEsChofer.Value = vbUnchecked Then
            .Entidad_Chofer.Delete
        End If
        .EsChofer = (chkEsChofer.Value = vbChecked)
        
        .EsClienteSubProducto = (chkEsClienteSubProducto.Value = vbChecked)
        
        .Notas = txtNotas.Text
        
        .Activo = (chkActivo.Value = vbChecked)
        If .Update Then
            If (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value) And Trim(txtDomicilioCalle.Text) <> "" Then
                .Entidad_Domicilio.Tipo = Switch(optDomicilioTipoUrbano.Value, 1, optDomicilioTipoRural.Value, 2)
                .Entidad_Domicilio.Calle = Trim(txtDomicilioCalle.Text)
                .Entidad_Domicilio.Numero = Trim(txtDomicilioNumero.Text)
                .Entidad_Domicilio.Piso = Trim(txtDomicilioPiso.Text)
                .Entidad_Domicilio.Oficina = Trim(txtDomicilioOficina.Text)
                .Entidad_Domicilio.CodigoPostal = Trim(txtDomicilioCodigoPostal.Text)
                .Entidad_Domicilio.IDLocalidad = Val(datcboDomicilioLocalidad.BoundText)
                Call .Entidad_Domicilio.Update
            End If
            If chkEsTitular.Value = vbChecked Or chkEsClienteSubProducto.Value = vbChecked Then
                .Entidad_Impuesto.IDCategoriaIVA = Val(datcboCategoriaIVA.BoundText)
                .Entidad_Impuesto.IIBB = Trim(txtIIBB.Text)
                .Entidad_Impuesto.GananciaInscripto = cboGananciaInscripto.ListIndex - 1
                .Entidad_Impuesto.ReFOG_Situacion = IIf(cboReFOG_Situacion.ListIndex = 0, "", Left(cboReFOG_Situacion.Text, 1))
                .Entidad_Impuesto.CBU = Trim(txtCBU.Text)
                Call .Entidad_Impuesto.Update
            End If
            If chkEsChofer.Value = vbChecked Then
                .Entidad_Chofer.IDEntidad_Transportista = Val(datcboEntidad_Transportista.BoundText)
                .Entidad_Chofer.PatenteChasis = Trim(txtPatenteChasis.Text)
                .Entidad_Chofer.PatenteAcoplado = Trim(txtPatenteAcoplado.Text)
                Call .Entidad_Chofer.Update
            End If
            
            Unload Me
        End If
    End With
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Private Sub ShowTabs()
    fraEs.Visible = (tabMain.SelectedItem.Key = "GENERAL")
    fraDomicilio.Visible = (tabMain.SelectedItem.Key = "DOMICILIO")
    fraImpuestos.Visible = (tabMain.SelectedItem.Key = "IMPUESTOS" And (chkEsTitular.Value = vbChecked Or chkEsClienteSubProducto.Value = vbChecked))
    fraChofer.Visible = (tabMain.SelectedItem.Key = "CHOFER" And chkEsChofer.Value = vbChecked)
    fraNotas.Visible = (tabMain.SelectedItem.Key = "NOTAS")
End Sub

Private Sub HabilitarControles_Domicilio()
    txtDomicilioCalle.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
    txtDomicilioNumero.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
    txtDomicilioPiso.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
    txtDomicilioOficina.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
    
    txtDomicilioCodigoPostal.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
    datcboDomicilioProvincia.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
    datcboDomicilioLocalidad.Visible = (optDomicilioTipoUrbano.Value Or optDomicilioTipoRural.Value)
End Sub

Public Function FillComboBox_Entidad() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboEntidad_Transportista.BoundText)
    Set recData = datcboEntidad_Transportista.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad_Transportista.BoundText = KeySave
End Function
