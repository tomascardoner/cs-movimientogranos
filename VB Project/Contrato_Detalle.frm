VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmContrato_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Contrato"
   ClientHeight    =   5160
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10965
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Contrato_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   5160
   ScaleWidth      =   10965
   Begin VB.CommandButton cmdDestino 
      Caption         =   "…"
      Height          =   315
      Left            =   4320
      TabIndex        =   22
      TabStop         =   0   'False
      ToolTipText     =   "Orígenes / Destinos"
      Top             =   3720
      Width           =   255
   End
   Begin VB.CommandButton cmdEntidad 
      Caption         =   "…"
      Height          =   315
      Left            =   1080
      TabIndex        =   14
      TabStop         =   0   'False
      ToolTipText     =   "Entidades"
      Top             =   2460
      Width           =   255
   End
   Begin VB.TextBox txtNotas 
      Height          =   2955
      Left            =   6120
      MaxLength       =   8000
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   40
      Top             =   1500
      Width           =   4695
   End
   Begin VB.CommandButton cmdEntregaDesde_Anterior 
      Height          =   315
      Left            =   6120
      Picture         =   "Contrato_Detalle.frx":08CA
      Style           =   1  'Graphical
      TabIndex        =   29
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   120
      Width           =   300
   End
   Begin VB.CommandButton cmdEntregaDesde_Siguiente 
      Height          =   315
      Left            =   7860
      Picture         =   "Contrato_Detalle.frx":0E54
      Style           =   1  'Graphical
      TabIndex        =   31
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   120
      Width           =   300
   End
   Begin VB.CommandButton cmdEntregaDesde_Hoy 
      Height          =   315
      Left            =   8160
      Picture         =   "Contrato_Detalle.frx":13DE
      Style           =   1  'Graphical
      TabIndex        =   32
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   120
      Width           =   315
   End
   Begin VB.CommandButton cmdEntregaHasta_Anterior 
      Height          =   315
      Left            =   6120
      Picture         =   "Contrato_Detalle.frx":1528
      Style           =   1  'Graphical
      TabIndex        =   34
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   540
      Width           =   300
   End
   Begin VB.CommandButton cmdEntregaHasta_Siguiente 
      Height          =   315
      Left            =   7860
      Picture         =   "Contrato_Detalle.frx":1AB2
      Style           =   1  'Graphical
      TabIndex        =   36
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   540
      Width           =   300
   End
   Begin VB.CommandButton cmdEntregaHasta_Hoy 
      Height          =   315
      Left            =   8160
      Picture         =   "Contrato_Detalle.frx":203C
      Style           =   1  'Graphical
      TabIndex        =   37
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   540
      Width           =   315
   End
   Begin VB.ComboBox cboPrecioTipo 
      Height          =   330
      Left            =   1380
      Style           =   2  'Dropdown List
      TabIndex        =   26
      Top             =   4680
      Width           =   1095
   End
   Begin VB.TextBox txtPrecio 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   2580
      MaxLength       =   15
      TabIndex        =   27
      Tag             =   "CURRENCY|NOTEMPTY|NOTZERO|POSITIVE"
      Top             =   4680
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.TextBox txtKilogramo 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   1380
      MaxLength       =   7
      TabIndex        =   24
      Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
      Top             =   4260
      Width           =   1095
   End
   Begin VB.CommandButton cmdFecha_Anterior 
      Height          =   315
      Left            =   1380
      Picture         =   "Contrato_Detalle.frx":2186
      Style           =   1  'Graphical
      TabIndex        =   5
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   960
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Siguiente 
      Height          =   315
      Left            =   3120
      Picture         =   "Contrato_Detalle.frx":2710
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   960
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Hoy 
      Height          =   315
      Left            =   3420
      Picture         =   "Contrato_Detalle.frx":2C9A
      Style           =   1  'Graphical
      TabIndex        =   8
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   960
      Width           =   315
   End
   Begin VB.TextBox txtNumeroComprador 
      Height          =   315
      Left            =   1380
      MaxLength       =   20
      TabIndex        =   3
      Tag             =   "STRING|NOTEMPTY|NONE|20"
      Top             =   540
      Width           =   1455
   End
   Begin VB.TextBox txtNumero 
      Height          =   315
      Left            =   1380
      MaxLength       =   20
      TabIndex        =   1
      Tag             =   "STRING|NOTEMPTY|NONE|20"
      Top             =   120
      Width           =   1455
   End
   Begin VB.CheckBox chkCerrado 
      Alignment       =   1  'Right Justify
      Caption         =   "Cerrado:"
      Height          =   210
      Left            =   4920
      TabIndex        =   38
      Top             =   1080
      Width           =   1395
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   8280
      TabIndex        =   41
      Top             =   4620
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   9600
      TabIndex        =   42
      Top             =   4620
      Width           =   1215
   End
   Begin MSComCtl2.DTPicker dtpFecha 
      Height          =   315
      Left            =   1680
      TabIndex        =   6
      Top             =   960
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   104595457
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin MSDataListLib.DataCombo datcboCosecha 
      Height          =   330
      Left            =   1380
      TabIndex        =   10
      Top             =   1500
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
      Left            =   1380
      TabIndex        =   12
      Top             =   1920
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
   Begin MSDataListLib.DataCombo datcboEntidad_Corredor 
      Height          =   330
      Left            =   1380
      TabIndex        =   17
      Top             =   2880
      Width           =   3195
      _ExtentX        =   5636
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin MSDataListLib.DataCombo datcboEntidad_Comprador 
      Height          =   330
      Left            =   1380
      TabIndex        =   15
      Top             =   2460
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
      Left            =   1380
      TabIndex        =   19
      Top             =   3300
      Width           =   3195
      _ExtentX        =   5636
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin MSComCtl2.DTPicker dtpEntregaDesde 
      Height          =   315
      Left            =   6420
      TabIndex        =   30
      Top             =   120
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   104595457
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin MSComCtl2.DTPicker dtpEntregaHasta 
      Height          =   315
      Left            =   6420
      TabIndex        =   35
      Top             =   540
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   104595457
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin MSDataListLib.DataCombo datcboDestino 
      Height          =   330
      Left            =   1380
      TabIndex        =   21
      Top             =   3720
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
      Caption         =   "Destino (Lugar):"
      Height          =   210
      Left            =   120
      TabIndex        =   20
      Top             =   3780
      Width           =   1170
   End
   Begin VB.Label lblNotas 
      Caption         =   "Notas:"
      Height          =   195
      Left            =   4920
      TabIndex        =   39
      Top             =   1500
      Width           =   570
   End
   Begin VB.Line linVertical 
      X1              =   4740
      X2              =   4740
      Y1              =   60
      Y2              =   5040
   End
   Begin VB.Label lblEntregaDesde 
      AutoSize        =   -1  'True
      Caption         =   "Entrega Desde:"
      Height          =   210
      Left            =   4920
      TabIndex        =   28
      Top             =   180
      Width           =   1110
   End
   Begin VB.Label lblEntregaHasta 
      AutoSize        =   -1  'True
      Caption         =   "Entrega Hasta:"
      Height          =   210
      Left            =   4920
      TabIndex        =   33
      Top             =   600
      Width           =   1065
   End
   Begin VB.Label lblEntidad_Corredor 
      AutoSize        =   -1  'True
      Caption         =   "Corredor:"
      Height          =   210
      Left            =   120
      TabIndex        =   16
      Top             =   2940
      Width           =   690
   End
   Begin VB.Label lblEntidad_Comprador 
      AutoSize        =   -1  'True
      Caption         =   "Comprador:"
      Height          =   210
      Left            =   120
      TabIndex        =   13
      Top             =   2520
      Width           =   840
   End
   Begin VB.Label lblEntidad_Destino 
      AutoSize        =   -1  'True
      Caption         =   "Destino:"
      Height          =   210
      Left            =   120
      TabIndex        =   18
      Top             =   3360
      Width           =   585
   End
   Begin VB.Label lblPrecio 
      AutoSize        =   -1  'True
      Caption         =   "Precio x ton.:"
      Height          =   210
      Left            =   120
      TabIndex        =   25
      Top             =   4740
      Width           =   945
   End
   Begin VB.Label lblKilogramo 
      AutoSize        =   -1  'True
      Caption         =   "Kilogramos:"
      Height          =   210
      Left            =   120
      TabIndex        =   23
      Top             =   4320
      Width           =   840
   End
   Begin VB.Label lblCereal 
      AutoSize        =   -1  'True
      Caption         =   "Cereal:"
      Height          =   210
      Left            =   120
      TabIndex        =   11
      Top             =   1980
      Width           =   510
   End
   Begin VB.Label lblCosecha 
      AutoSize        =   -1  'True
      Caption         =   "Cosecha:"
      Height          =   210
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   690
   End
   Begin VB.Label lblFecha 
      AutoSize        =   -1  'True
      Caption         =   "Fecha:"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1020
      Width           =   495
   End
   Begin VB.Label lblNumeroComprador 
      AutoSize        =   -1  'True
      Caption         =   "N° Comprador:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1050
   End
   Begin VB.Label lblNumero 
      AutoSize        =   -1  'True
      Caption         =   "Número:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   600
   End
End
Attribute VB_Name = "frmContrato_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mContrato As Contrato

Public Function Startup(ByRef Contrato As Contrato) As Boolean
    Set mContrato = Contrato
    
    Load Me
    
    Me.Caption = "Contrato - Nuevo"
    
    dtpFecha.Value = Date
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboCosecha, "usp_Cosecha_List 0, 1, " & mContrato.IDCosecha, "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirstIfUnique, pParametro.Cosecha_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "usp_Cereal_List 0, 0, 1, " & mContrato.IDCereal, "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
    
    If frmContrato_Lista.cboComprador.ListIndex > 0 Then
        Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Comprador, "usp_Entidad_Destinatario_List 0, 1, " & mContrato.IDEntidad_Comprador, "IDEntidad", "Nombre", "Compradores", cscpItemOrFirstIfUnique, frmContrato_Lista.cboComprador.ItemData(frmContrato_Lista.cboComprador.ListIndex))
    Else
        Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Comprador, "usp_Entidad_Destinatario_List 0, 1, " & mContrato.IDEntidad_Comprador, "IDEntidad", "Nombre", "Compradores", cscpFirstIfUnique)
    End If
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Corredor, "usp_Entidad_Corredor_List 1, 1, " & mContrato.IDEntidad_Corredor, "IDEntidad", "Nombre", "Corredores", cscpFirst)
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad_Destino, "usp_Entidad_Destino_List 0, 1, " & mContrato.IDEntidad_Destino, "IDEntidad", "Nombre", "Destinos", cscpFirstIfUnique)
    
    dtpEntregaDesde.Value = Date
    dtpEntregaHasta.Value = Date
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mContrato
        Me.Caption = "Contrato - " & .IDContrato

        txtNumero.Text = .Numero
        txtNumeroComprador.Text = .NumeroComprador
        dtpFecha.Value = .Fecha
        
        datcboCosecha.BoundText = .IDCosecha
        datcboCereal.BoundText = .IDCereal
        
        txtKilogramo.Text = .Kilogramo_Formatted
        cboPrecioTipo.ListIndex = .PrecioTipo_ListIndex
        txtPrecio.Text = .Precio_Formatted
        
        datcboEntidad_Comprador.BoundText = .IDEntidad_Comprador
        datcboEntidad_Corredor.BoundText = .IDEntidad_Corredor
        datcboEntidad_Destino.BoundText = .IDEntidad_Destino
        datcboDestino.BoundText = .IDOrigenDestino_Destino
        
        dtpEntregaDesde.Value = .EntregaDesde
        dtpEntregaHasta.Value = .EntregaHasta
        
        chkCerrado.Value = IIf(.Cerrado, vbChecked, vbUnchecked)
        txtNotas.Text = .Notas
        
        Call CSM_Control_TextBox.FormatAll(Me)
    End With
    LoadData = True
End Function

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    cboPrecioTipo.AddItem "A Fijar"
    cboPrecioTipo.AddItem "Pesos"
    cboPrecioTipo.AddItem "Dólares"
    
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mContrato = Nothing
    Set frmContrato_Detalle = Nothing
End Sub

'============================================================
'NUMERO
Private Sub txtNumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNumero)
End Sub

'============================================================
'NUMERO COMPRADOR
Private Sub txtNumeroComprador_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNumeroComprador)
End Sub

'============================================================
'FECHA
Private Sub cmdFecha_Anterior_Click()
    dtpFecha.Value = DateAdd("d", -1, dtpFecha.Value)
    dtpFecha.SetFocus
End Sub

Private Sub dtpFecha_Change()
    dtpEntregaDesde.Value = dtpFecha.Value
    dtpEntregaDesde_Change
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
'PRECIO
Private Sub cboPrecioTipo_Click()
    txtPrecio.Visible = (cboPrecioTipo.ListIndex > 0)
End Sub

Private Sub txtPrecio_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPrecio)
End Sub

Private Sub txtPrecio_LostFocus()
    Call FormatValue_ByTag(txtPrecio)
End Sub

'============================================================
'KILOGRAMO
Private Sub txtKilogramo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtKilogramo)
End Sub

Private Sub txtKilogramo_LostFocus()
    Call FormatValue_ByTag(txtKilogramo)
End Sub

'============================================================
'ENTIDADES
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
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboDestino, "usp_Entidad_OrigenDestino_List 0, 0, 1, NULL, NULL, " & Val(datcboEntidad_Destino.BoundText) & ", " & mContrato.IDOrigenDestino_Destino, "ID", "Nombre", "Destinos", cscpFirstIfUnique)
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
'ENTREGA DESDE
Private Sub dtpEntregaDesde_Change()
    dtpEntregaHasta.Value = dtpEntregaDesde.Value
End Sub

Private Sub cmdEntregaDesde_Anterior_Click()
    dtpEntregaDesde.Value = DateAdd("d", -1, dtpEntregaDesde.Value)
    dtpEntregaDesde.SetFocus
    dtpEntregaDesde_Change
End Sub

Private Sub cmdEntregaDesde_Siguiente_Click()
    dtpEntregaDesde.Value = DateAdd("d", 1, dtpEntregaDesde.Value)
    dtpEntregaDesde.SetFocus
    dtpEntregaDesde_Change
End Sub

Private Sub cmdEntregaDesde_Hoy_Click()
    dtpEntregaDesde.Value = Date
    dtpEntregaDesde.SetFocus
    dtpEntregaDesde_Change
End Sub

'============================================================
'ENTREGA HASTA
Private Sub cmdEntregaHasta_Anterior_Click()
    dtpEntregaHasta.Value = DateAdd("d", -1, dtpEntregaHasta.Value)
    dtpEntregaHasta.SetFocus
End Sub

Private Sub cmdEntregaHasta_Siguiente_Click()
    dtpEntregaHasta.Value = DateAdd("d", 1, dtpEntregaHasta.Value)
    dtpEntregaHasta.SetFocus
End Sub

Private Sub cmdEntregaHasta_Hoy_Click()
    dtpEntregaHasta.Value = Date
    dtpEntregaHasta.SetFocus
End Sub

'============================================================
'NOTAS
Private Sub txtNotas_GotFocus()
    cmdAceptar.Default = False
    Call CSM_Control_TextBox.SelAllText(txtNotas)
End Sub

Private Sub txtNotas_LostFocus()
    cmdAceptar.Default = True
End Sub

Private Sub cmdAceptar_Click()
    If Trim(txtNumero.Text) = "" Then
        MsgBox "Debe ingresar el Número del Contrato.", vbInformation, App.Title
        txtNumero.SetFocus
        Exit Sub
    End If
    
    If DateDiff("d", dtpFecha.Value, Date) < 0 Then
        MsgBox "La Fecha no debe ser posterior al día de hoy.", vbInformation, App.Title
        dtpFecha.SetFocus
        Exit Sub
    End If
    
    If Val(datcboCosecha.BoundText) = 0 Then
        MsgBox "Debe especificar la Cosecha.", vbInformation, App.Title
        datcboCosecha.SetFocus
        Exit Sub
    End If
    If Val(datcboCereal.BoundText) = 0 Then
        MsgBox "Debe especificar el Cereal.", vbInformation, App.Title
        datcboCereal.SetFocus
        Exit Sub
    End If
    
    If Val(datcboEntidad_Comprador.BoundText) = 0 Then
        MsgBox "Debe especificar el Comprador.", vbInformation, App.Title
        datcboEntidad_Comprador.SetFocus
        Exit Sub
    End If
    If Val(datcboEntidad_Destino.BoundText) = 0 Then
        MsgBox "Debe especificar el Destino.", vbInformation, App.Title
        datcboEntidad_Destino.SetFocus
        Exit Sub
    End If
    If Val(datcboDestino.BoundText) = 0 Then
        MsgBox "Debe especificar el Lugar de Destino.", vbInformation, App.Title
        datcboDestino.SetFocus
        Exit Sub
    End If
    
    If Trim(txtKilogramo.Text) <> "" Then
        If Not IsNumeric(txtKilogramo.Text) Then
            MsgBox "Los Kilogramos deben ser un valor numérico.", vbInformation, App.Title
            txtKilogramo.SetFocus
            Exit Sub
        End If
        If CLng(txtKilogramo.Text) <= 0 Then
            MsgBox "Los Kilogramos deben ser mayores a cero.", vbInformation, App.Title
            txtKilogramo.SetFocus
            Exit Sub
        End If
    End If
    
    If cboPrecioTipo.ListIndex = -1 Then
        MsgBox "Debe especificarl el Tipo de Precio.", vbInformation, App.Title
        cboPrecioTipo.SetFocus
        Exit Sub
    End If
    If cboPrecioTipo.ListIndex > 0 Then
        If Trim(txtPrecio.Text) <> "" Then
            If Not IsNumeric(txtPrecio.Text) Then
                MsgBox "El Precio debe ser un valor numérico.", vbInformation, App.Title
                txtPrecio.SetFocus
                Exit Sub
            End If
            If CCur(txtPrecio.Text) <= 0 Then
                MsgBox "El Precio debe ser mayor a cero.", vbInformation, App.Title
                txtPrecio.SetFocus
                Exit Sub
            End If
        End If
    End If
    
    If DateDiff("d", dtpEntregaDesde.Value, dtpFecha.Value) > 0 Then
        MsgBox "La Fecha de Entrega Desde no debe ser anterior a la Fecha del Contrato.", vbInformation, App.Title
        dtpEntregaDesde.SetFocus
        Exit Sub
    End If
    If DateDiff("d", dtpEntregaHasta.Value, dtpEntregaDesde.Value) > 0 Then
        MsgBox "La Fecha de Entrega Hasta no debe ser anterior a la Fecha de Entrega Desde.", vbInformation, App.Title
        dtpEntregaHasta.SetFocus
        Exit Sub
    End If
    
    With mContrato
        .Numero = txtNumero.Text
        .NumeroComprador = txtNumeroComprador.Text
        .Fecha = dtpFecha.Value
        
        .IDCosecha = Val(datcboCosecha.BoundText)
        .IDCereal = Val(datcboCereal.BoundText)
        
        .Kilogramo_Formatted = txtKilogramo.Text
        .PrecioTipo_ListIndex = cboPrecioTipo.ListIndex
        .Precio_Formatted = txtPrecio.Text
        
        .IDEntidad_Comprador = Val(datcboEntidad_Comprador.BoundText)
        .IDEntidad_Corredor = Val(datcboEntidad_Corredor.BoundText)
        .IDEntidad_Destino = Val(datcboEntidad_Destino.BoundText)
        .IDOrigenDestino_Destino = Val(datcboDestino.BoundText)
        
        .EntregaDesde = dtpEntregaDesde.Value
        .EntregaHasta = dtpEntregaHasta.Value
        
        .Cerrado = (chkCerrado.Value = vbChecked)
        .Notas = txtNotas.Text
    
        If Not .Update Then
            Exit Sub
        End If
    End With
    
    Unload Me
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub
