VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmMonedaCotizacion_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Talonario de Cartas de Porte"
   ClientHeight    =   2730
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5010
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "MonedaCotizacion_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2730
   ScaleWidth      =   5010
   Begin VB.TextBox txtCotizacionVenta 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   900
      MaxLength       =   10
      TabIndex        =   6
      Tag             =   "DECIMAL|NOTEMPTY|NOTZERO|POSITIVE|9999.999"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.TextBox txtCotizacionCompra 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   900
      MaxLength       =   10
      TabIndex        =   4
      Tag             =   "DECIMAL|NOTEMPTY|NOTZERO|POSITIVE|9999.999"
      Top             =   1080
      Width           =   1095
   End
   Begin MSComCtl2.DTPicker dtpFecha 
      Height          =   315
      Left            =   900
      TabIndex        =   2
      Top             =   600
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   556
      _Version        =   393216
      Format          =   75038721
      CurrentDate     =   40647
      MaxDate         =   73415
      MinDate         =   40179
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   2340
      TabIndex        =   7
      Top             =   2220
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   3660
      TabIndex        =   9
      Top             =   2220
      Width           =   1215
   End
   Begin MSDataListLib.DataCombo datcboMoneda 
      Height          =   330
      Left            =   900
      TabIndex        =   1
      Top             =   120
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin VB.Label lblCotizacionVenta 
      Caption         =   "Venta;"
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   1620
      Width           =   750
   End
   Begin VB.Label lblMoneda 
      Caption         =   "Moneda:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   750
   End
   Begin VB.Label lblFecha 
      Caption         =   "Fecha:"
      Height          =   195
      Left            =   120
      TabIndex        =   8
      Top             =   660
      Width           =   750
   End
   Begin VB.Label lblCotizacionCompra 
      Caption         =   "Compra:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1140
      Width           =   750
   End
End
Attribute VB_Name = "frmMonedaCotizacion_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mMonedaCotizacion As MonedaCotizacion

Public Function Startup(ByRef MonedaCotizacion As MonedaCotizacion) As Boolean
    Set mMonedaCotizacion = MonedaCotizacion
    
    Load Me
    
    Me.Caption = "Cotización de Moneda - Nuevo"
        
    If Not CSM_Control_DataCombo.FillFromSQL(datcboMoneda, "usp_Moneda_List 0, 1, NULL", "IDMoneda", "Nombre", "Monedas", cscpItemOrNone, mMonedaCotizacion.IDMoneda) Then
        Exit Function
    End If
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mMonedaCotizacion
        Me.Caption = "Cotización de Moneda"
    
        datcboMoneda.BoundText = mMonedaCotizacion.IDMoneda
        dtpFecha.Value = .Fecha
        txtCotizacionCompra.Text = .CotizacionCompra
        txtCotizacionVenta.Text = .CotizacionVenta
                
        Call CSM_Control_TextBox.FormatAll(Me)
    End With
    
    datcboMoneda.Enabled = mMonedaCotizacion.IsNew
    dtpFecha.Enabled = mMonedaCotizacion.IsNew
        
    LoadData = True
End Function

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
    Set mMonedaCotizacion = Nothing
    Set frmMonedaCotizacion_Detalle = Nothing
End Sub

Private Sub txtCotizacionCompra_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCotizacionCompra)
End Sub

Private Sub txtCotizacionCompra_LostFocus()
    Call FormatValue_ByTag(txtCotizacionCompra)
End Sub

Private Sub txtCotizacionVenta_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCotizacionVenta)
End Sub

Private Sub txtCotizacionVenta_LostFocus()
    Call FormatValue_ByTag(txtCotizacionVenta)
End Sub

Private Sub cmdAceptar_Click()
    If Val(datcboMoneda.BoundText) = 0 Then
        MsgBox "Debe seleccionar la Moneda", vbInformation, App.Title
        datcboMoneda.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtCotizacionCompra.Text)) = 0 Then
        MsgBox "Debe ingresar la Cotización de Compra de la Moneda.", vbInformation, App.Title
        txtCotizacionCompra.SetFocus
        Exit Sub
    End If
    If Not IsNumeric(txtCotizacionCompra.Text) Then
        MsgBox "La Cotización de Compra de la Moneda debe ser un valor numérico.", vbInformation, App.Title
        txtCotizacionCompra.SetFocus
        Exit Sub
    End If
    If CCur(txtCotizacionCompra.Text) <= 0 Then
        MsgBox "La Cotización de Compra de la Moneda debe ser mayor a cero.", vbInformation, App.Title
        txtCotizacionCompra.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtCotizacionVenta.Text)) = 0 Then
        MsgBox "Debe ingresar la Cotización de Venta de la Moneda.", vbInformation, App.Title
        txtCotizacionVenta.SetFocus
        Exit Sub
    End If
    If Not IsNumeric(txtCotizacionVenta.Text) Then
        MsgBox "La Cotización de Venta de la Moneda debe ser un valor numérico.", vbInformation, App.Title
        txtCotizacionVenta.SetFocus
        Exit Sub
    End If
    If CCur(txtCotizacionVenta.Text) <= 0 Then
        MsgBox "La Cotización de Venta de la Moneda debe ser mayor a cero.", vbInformation, App.Title
        txtCotizacionVenta.SetFocus
        Exit Sub
    End If
    
    With mMonedaCotizacion
        .IDMoneda = Val(datcboMoneda.BoundText)
        .Fecha = dtpFecha.Value
        .CotizacionCompra_Formatted = txtCotizacionCompra.Text
        .CotizacionVenta_Formatted = txtCotizacionVenta.Text
        
        If .Update Then
            Unload Me
        End If
    End With
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub

Public Function FillComboBox_Moneda() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboMoneda.BoundText)
    Set recData = datcboMoneda.RowSource
    recData.Requery
    Set recData = Nothing
    datcboMoneda.BoundText = KeySave
End Function
