VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmMovimiento_SubProducto_Detalle_Item 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Item del Movimiento de SubProducto"
   ClientHeight    =   3525
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5025
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Movimiento_SubProducto_Detalle_Item.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   3525
   ScaleWidth      =   5025
   Begin VB.TextBox txtCotizacionDolarImporte 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   1620
      MaxLength       =   10
      TabIndex        =   12
      Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
      Top             =   1800
      Width           =   1095
   End
   Begin VB.CommandButton cmdCotizacionDolarFecha_Hoy 
      Height          =   315
      Left            =   3660
      Picture         =   "Movimiento_SubProducto_Detalle_Item.frx":0CCA
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   1380
      Width           =   315
   End
   Begin VB.CommandButton cmdCotizacionDolarFecha_Siguiente 
      Height          =   315
      Left            =   3360
      Picture         =   "Movimiento_SubProducto_Detalle_Item.frx":0E14
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   1380
      Width           =   300
   End
   Begin VB.CommandButton cmdCotizacionDolarFecha_Anterior 
      Height          =   315
      Left            =   1620
      Picture         =   "Movimiento_SubProducto_Detalle_Item.frx":139E
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   1380
      Width           =   300
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   2940
      TabIndex        =   15
      Top             =   2940
      Width           =   915
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   3960
      TabIndex        =   16
      Top             =   2940
      Width           =   915
   End
   Begin VB.TextBox txtPrecioToneladaPeso 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   1620
      MaxLength       =   10
      TabIndex        =   14
      Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
      Top             =   2220
      Width           =   1095
   End
   Begin VB.TextBox txtPrecioToneladaDolar 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   1620
      MaxLength       =   10
      TabIndex        =   5
      Tag             =   "CURRENCY|EMPTY|NOTZERO|POSITIVE"
      Top             =   960
      Width           =   1095
   End
   Begin VB.TextBox txtKilogramo 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   1620
      MaxLength       =   7
      TabIndex        =   3
      Tag             =   "INTEGER|EMPTY|NOTZERO|POSITIVE"
      Top             =   540
      Width           =   1095
   End
   Begin MSDataListLib.DataCombo datcboSubProducto 
      Height          =   330
      Left            =   1620
      TabIndex        =   1
      Top             =   120
      Width           =   3255
      _ExtentX        =   5741
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin MSComCtl2.DTPicker dtpCotizacionDolarFecha 
      Height          =   315
      Left            =   1920
      TabIndex        =   8
      Top             =   1380
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   100859905
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin VB.Label lblCotizacionDolarImporte 
      AutoSize        =   -1  'True
      Caption         =   "Cotización USD:"
      Height          =   210
      Left            =   120
      TabIndex        =   11
      Top             =   1860
      Width           =   1155
   End
   Begin VB.Label lblCotizacionDolarFecha 
      AutoSize        =   -1  'True
      Caption         =   "Cotización Fecha:"
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   1440
      Width           =   1290
   End
   Begin VB.Label lblPrecioToneladaPeso 
      AutoSize        =   -1  'True
      Caption         =   "Precio x Tn. ($):"
      Height          =   210
      Left            =   120
      TabIndex        =   13
      Top             =   2280
      Width           =   1155
   End
   Begin VB.Label lblPrecioToneladaDolar 
      AutoSize        =   -1  'True
      Caption         =   "Precio x Tn. (USD):"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1020
      Width           =   1380
   End
   Begin VB.Label lblKilogramo 
      AutoSize        =   -1  'True
      Caption         =   "Kilogramos:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   840
   End
   Begin VB.Label lblSubProducto 
      AutoSize        =   -1  'True
      Caption         =   "SubProducto:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   975
   End
End
Attribute VB_Name = "frmMovimiento_SubProducto_Detalle_Item"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean
Private mLoading As Boolean

Private mMovimiento_SubProducto_Detalle As Movimiento_SubProducto_Det

Public Function Startup(ByRef Movimiento_SubProducto_Detalle As Movimiento_SubProducto_Det) As Boolean
    Set mMovimiento_SubProducto_Detalle = Movimiento_SubProducto_Detalle
    
    mLoading = True
    
    Load Me
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboSubProducto, "SELECT IDSubProducto, Nombre FROM SubProducto WHERE Activo = 1 ORDER BY Nombre DESC", "IDSubProducto", "Nombre", "SubProductos", cscpFirstIfUnique)
    
    dtpCotizacionDolarFecha.Value = Date
    
    Startup = True
    mLoading = False
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
    Set mMovimiento_SubProducto_Detalle = Nothing
    Set frmMovimiento_SubProducto_Detalle_Item = Nothing
End Sub

    
Private Sub datcboSubProducto_Change()
    Dim SubProducto As SubProducto
    
    If Val(datcboSubProducto.BoundText) > 0 Then
        Set SubProducto = New SubProducto
        SubProducto.IDSubProducto = Val(datcboSubProducto.BoundText)
        If SubProducto.Load() Then
            lblKilogramo.Visible = True
            txtKilogramo.Visible = True
            lblPrecioToneladaDolar.Visible = SubProducto.UtilizaPrecioDolar
            txtPrecioToneladaDolar.Visible = SubProducto.UtilizaPrecioDolar
            lblCotizacionDolarFecha.Visible = SubProducto.UtilizaPrecioDolar
            cmdCotizacionDolarFecha_Anterior.Visible = SubProducto.UtilizaPrecioDolar
            dtpCotizacionDolarFecha.Visible = SubProducto.UtilizaPrecioDolar
            cmdCotizacionDolarFecha_Siguiente.Visible = SubProducto.UtilizaPrecioDolar
            cmdCotizacionDolarFecha_Hoy.Visible = SubProducto.UtilizaPrecioDolar
            lblCotizacionDolarImporte.Visible = SubProducto.UtilizaPrecioDolar
            txtCotizacionDolarImporte.Visible = SubProducto.UtilizaPrecioDolar
            lblPrecioToneladaPeso.Visible = True
            txtPrecioToneladaPeso.Visible = True
        End If
        Set SubProducto = Nothing
    Else
        lblKilogramo.Visible = False
        txtKilogramo.Visible = False
        lblPrecioToneladaDolar.Visible = False
        txtPrecioToneladaDolar.Visible = False
        lblCotizacionDolarFecha.Visible = False
        cmdCotizacionDolarFecha_Anterior.Visible = False
        dtpCotizacionDolarFecha.Visible = False
        cmdCotizacionDolarFecha_Siguiente.Visible = False
        cmdCotizacionDolarFecha_Hoy.Visible = False
        lblCotizacionDolarImporte.Visible = False
        txtCotizacionDolarImporte.Visible = False
        lblPrecioToneladaPeso.Visible = False
        txtPrecioToneladaPeso.Visible = False
    End If
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
'PRECIO DOLARES
Private Sub txtPrecioToneladaDolar_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPrecioToneladaDolar)
End Sub

Private Sub txtPrecioToneladaDolar_LostFocus()
    Call FormatValue_ByTag(txtPrecioToneladaDolar)
End Sub

'============================================================
'COTIZACION DOLAR FECHA
Private Sub cmdCotizacionDolarFecha_Anterior_Click()
    dtpCotizacionDolarFecha.Value = DateAdd("d", -1, dtpCotizacionDolarFecha.Value)
    dtpCotizacionDolarFecha.SetFocus
End Sub

Private Sub cmdCotizacionDolarFecha_Siguiente_Click()
    dtpCotizacionDolarFecha.Value = DateAdd("d", 1, dtpCotizacionDolarFecha.Value)
    dtpCotizacionDolarFecha.SetFocus
End Sub

Private Sub cmdCotizacionDolarFecha_Hoy_Click()
    Dim OldValue As Date
    
    OldValue = dtpCotizacionDolarFecha.Value
    dtpCotizacionDolarFecha.Value = Date
    dtpCotizacionDolarFecha.SetFocus
End Sub

'============================================================
'COTIZACION DOLAR IMPORTE
Private Sub txtCotizacionDolarImporte_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCotizacionDolarImporte)
End Sub

Private Sub txtCotizacionDolarImporte_LostFocus()
    Call FormatValue_ByTag(txtCotizacionDolarImporte)
End Sub

'============================================================
'PRECIO PESOS
Private Sub txtPrecioToneladaPeso_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtPrecioToneladaPeso)
End Sub

Private Sub txtPrecioToneladaPeso_LostFocus()
    Call FormatValue_ByTag(txtPrecioToneladaPeso)
End Sub

Public Function FillComboBox_SubProducto() As Boolean
    Dim KeySave As Long
    Dim recData As ADODB.Recordset
    
    KeySave = Val(datcboSubProducto.BoundText)
    Set recData = datcboSubProducto.RowSource
    recData.Requery
    Set recData = Nothing
    datcboSubProducto.BoundText = KeySave
End Function
