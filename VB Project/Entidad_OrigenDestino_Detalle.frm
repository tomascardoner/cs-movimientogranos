VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmEntidad_OrigenDestino_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Orígen / Destino de la Entidad"
   ClientHeight    =   4620
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6180
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Entidad_OrigenDestino_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   4620
   ScaleWidth      =   6180
   Begin VB.CheckBox chkConvierteEnSubProducto 
      Caption         =   "Convierte en SubProducto"
      Height          =   210
      Left            =   180
      TabIndex        =   15
      Top             =   4200
      Width           =   2415
   End
   Begin VB.CheckBox chkControlaStock 
      Caption         =   "Controla Stock"
      Height          =   210
      Left            =   180
      TabIndex        =   14
      Top             =   3840
      Width           =   1515
   End
   Begin MSDataListLib.DataCombo datcboProvincia 
      Height          =   330
      Left            =   1200
      TabIndex        =   7
      Top             =   1740
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin VB.TextBox txtONCCA_Codigo 
      Height          =   315
      Left            =   1200
      MaxLength       =   7
      TabIndex        =   13
      Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
      Top             =   3180
      Width           =   795
   End
   Begin VB.TextBox txtDireccion 
      Height          =   315
      Left            =   1200
      MaxLength       =   255
      TabIndex        =   5
      Top             =   1260
      Width           =   4815
   End
   Begin VB.TextBox txtKilometro 
      Height          =   315
      Left            =   1200
      MaxLength       =   5
      TabIndex        =   11
      Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
      Top             =   2700
      Width           =   795
   End
   Begin VB.TextBox txtNombre 
      Height          =   315
      Left            =   1200
      MaxLength       =   50
      TabIndex        =   3
      Top             =   600
      Width           =   4815
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   3480
      TabIndex        =   16
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4800
      TabIndex        =   17
      Top             =   4080
      Width           =   1215
   End
   Begin MSDataListLib.DataCombo datcboLocalidad 
      Height          =   330
      Left            =   1200
      TabIndex        =   9
      Top             =   2220
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin MSDataListLib.DataCombo datcboEntidad 
      Height          =   330
      Left            =   1200
      TabIndex        =   1
      Top             =   120
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin VB.Label lblProvincia 
      Caption         =   "Provincia:"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Top             =   1800
      Width           =   990
   End
   Begin VB.Label lblLocalidad 
      Caption         =   "Localidad:"
      Height          =   195
      Left            =   120
      TabIndex        =   8
      Top             =   2280
      Width           =   990
   End
   Begin VB.Label lblONCCA_Codigo 
      Caption         =   "Nº Planta:"
      Height          =   195
      Left            =   120
      TabIndex        =   12
      Top             =   3240
      Width           =   990
   End
   Begin VB.Label lblDireccion 
      Caption         =   "&Dirección:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   990
   End
   Begin VB.Line linLinea 
      X1              =   120
      X2              =   6000
      Y1              =   1080
      Y2              =   1080
   End
   Begin VB.Label lblKilometro 
      Caption         =   "Kilómetros:"
      Height          =   195
      Left            =   120
      TabIndex        =   10
      Top             =   2760
      Width           =   990
   End
   Begin VB.Label lblNombre 
      Caption         =   "&Nombre:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   660
      Width           =   990
   End
   Begin VB.Label lblEntidadNombre 
      Caption         =   "Entidad:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   990
   End
End
Attribute VB_Name = "frmEntidad_OrigenDestino_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mEntidad_OrigenDestino As Entidad_OrigDest

Public Function Startup(ByRef Entidad_OrigDest As Entidad_OrigDest) As Boolean
    Set mEntidad_OrigenDestino = Entidad_OrigDest
    
    Load Me
    
    Me.Caption = "Origen / Destino de Entidad - Nuevo"
    
    If Not CSM_Control_DataCombo.FillFromSQL(datcboEntidad, "SELECT IDEntidad, Nombre FROM Entidad WHERE (EsTitular = 1 OR EsDestino = 1 OR EsClienteSubProducto = 1) AND (Activo = 1 OR IDEntidad = " & mEntidad_OrigenDestino.IDEntidad & ") ORDER BY Nombre", "IDEntidad", "Nombre", "Entidades", cscpItemOrNone, mEntidad_OrigenDestino.IDEntidad) Then
        Exit Function
    End If
    datcboEntidad.Enabled = True
    
    If Not CSM_Control_DataCombo.FillFromSQL(datcboProvincia, "SELECT IDProvincia, Nombre FROM Provincia ORDER BY Nombre", "IDProvincia", "Nombre", "Provincias", cscpNone) Then
        Exit Function
    End If
        
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mEntidad_OrigenDestino
        Me.Caption = "Origen / Destino de Entidad - " & .IDOrigenDestino
        
        datcboEntidad.BoundText = .IDEntidad
        datcboEntidad.Enabled = False
        
        txtNombre.Text = .Nombre
        
        txtDireccion.Text = .Direccion
        datcboProvincia.BoundText = .Localidad.IDProvincia
        datcboLocalidad.BoundText = .IDLocalidad
        txtKilometro.Text = .Kilometro_Formatted
        txtONCCA_Codigo.Text = .ONCCA_Codigo_Formatted
        
        chkControlaStock.Value = IIf(.ControlaStock, vbChecked, vbUnchecked)
        chkConvierteEnSubProducto.Value = IIf(.ConvierteEnSubProducto, vbChecked, vbUnchecked)
        
        Call CSM_Control_TextBox.FormatAll(Me)
    End With
    LoadData = True
End Function

Private Sub datcboProvincia_Change()
    Call CSM_Control_DataCombo.FillFromSQL(datcboLocalidad, "SELECT IDLocalidad, Nombre FROM Localidad WHERE IDProvincia = '" & datcboProvincia.BoundText & "' ORDER BY Nombre", "IDLocalidad", "Nombre", "Localidades", cscpNone)
End Sub

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mEntidad_OrigenDestino = Nothing
    Set frmEntidad_OrigenDestino_Detalle = Nothing
End Sub

Private Sub txtNombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNombre)
End Sub

Private Sub txtDireccion_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDireccion)
End Sub

Private Sub txtKilometro_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtKilometro)
End Sub

Private Sub txtKilometro_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtKilometro)
End Sub

Private Sub txtONCCA_Codigo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtONCCA_Codigo)
End Sub

Private Sub txtONCCA_Codigo_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtONCCA_Codigo)
End Sub

Private Sub cmdAceptar_Click()
    If Val(datcboEntidad.BoundText) = 0 Then
        MsgBox "Debe seleccionar la Entidad.", vbInformation, App.Title
        datcboEntidad.SetFocus
        Exit Sub
    End If
    If Trim(txtNombre.Text) = "" Then
        MsgBox "Debe ingresar el Nombre del Destino de la Entidad_OrigDest.", vbInformation, App.Title
        txtNombre.SetFocus
        Exit Sub
    End If
    If datcboProvincia.BoundText = "" Then
        MsgBox "Debe seleccionar la Provincia.", vbInformation, App.Title
        datcboProvincia.SetFocus
        Exit Sub
    End If
    If Val(datcboLocalidad.BoundText) = 0 Then
        MsgBox "Debe seleccionar la Localidad.", vbInformation, App.Title
        datcboLocalidad.SetFocus
        Exit Sub
    End If
    With mEntidad_OrigenDestino
        .IDEntidad = Val(datcboEntidad.BoundText)
        .Nombre = txtNombre.Text
        
        .Direccion = txtDireccion.Text
        .IDLocalidad = Val(datcboLocalidad.BoundText)
        .Kilometro_Formatted = txtKilometro.Text
        .ONCCA_Codigo_Formatted = txtONCCA_Codigo.Text
        
        .ControlaStock = (chkControlaStock.Value = vbChecked)
        .ConvierteEnSubProducto = (chkConvierteEnSubProducto.Value = vbChecked)
        
        If .Update Then
            Unload Me
        End If
    End With
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Public Function FillComboBox_Entidad() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboEntidad.BoundText)
    Set recData = datcboEntidad.RowSource
    recData.Requery
    Set recData = Nothing
    datcboEntidad.BoundText = KeySave
End Function

Public Function FillComboBox_Provincia() As Boolean
    Dim KeySave As String
    Dim recData As ADODB.Recordset
    
    KeySave = datcboProvincia.BoundText
    Set recData = datcboProvincia.RowSource
    recData.Requery
    Set recData = Nothing
    datcboProvincia.BoundText = KeySave
End Function

Public Function FillComboBox_Localidad() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboLocalidad.BoundText)
    Set recData = datcboLocalidad.RowSource
    recData.Requery
    Set recData = Nothing
    datcboLocalidad.BoundText = KeySave
End Function
