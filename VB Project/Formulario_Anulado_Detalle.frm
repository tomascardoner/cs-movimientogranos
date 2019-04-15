VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmFormulario_Anulado_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Certificado Anulado"
   ClientHeight    =   2985
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4110
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Formulario_Anulado_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   2985
   ScaleWidth      =   4110
   Begin VB.CommandButton cmdFecha_Anterior 
      Height          =   315
      Left            =   1620
      Picture         =   "Formulario_Anulado_Detalle.frx":0CCA
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "Anterior"
      Top             =   1560
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Siguiente 
      Height          =   315
      Left            =   3360
      Picture         =   "Formulario_Anulado_Detalle.frx":1254
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "Siguiente"
      Top             =   1560
      Width           =   300
   End
   Begin VB.CommandButton cmdFecha_Hoy 
      Height          =   315
      Left            =   3660
      Picture         =   "Formulario_Anulado_Detalle.frx":17DE
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      ToolTipText     =   "Hoy"
      Top             =   1560
      Width           =   315
   End
   Begin VB.ComboBox cboAnulacionMotivo 
      Height          =   330
      Left            =   1620
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1080
      Width           =   1215
   End
   Begin VB.TextBox txtFormularioNumero 
      Height          =   315
      Left            =   1620
      MaxLength       =   12
      TabIndex        =   3
      Tag             =   "STRING|NOTEMPTY|UPPER|13"
      Top             =   600
      Width           =   1455
   End
   Begin VB.ComboBox cboFormularioCodigo 
      Height          =   330
      Left            =   1620
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   120
      Width           =   1815
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   11
      Top             =   2460
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   2760
      TabIndex        =   12
      Top             =   2460
      Width           =   1215
   End
   Begin MSComCtl2.DTPicker dtpFecha 
      Height          =   315
      Left            =   1920
      TabIndex        =   8
      Top             =   1560
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   98566145
      CurrentDate     =   40659
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin VB.Label lblFecha 
      AutoSize        =   -1  'True
      Caption         =   "Fecha:"
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   1620
      Width           =   495
   End
   Begin VB.Label lblAnulacionMotivo 
      AutoSize        =   -1  'True
      Caption         =   "Motivo:"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1140
      Width           =   510
   End
   Begin VB.Label lblFormularioNumero 
      AutoSize        =   -1  'True
      Caption         =   "Certificado Nº:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   660
      Width           =   1050
   End
   Begin VB.Label lblFormularioCodigo 
      AutoSize        =   -1  'True
      Caption         =   "Tipo de Formulario:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   1365
   End
End
Attribute VB_Name = "frmFormulario_Anulado_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mFormulario_Anulado As Formulario_Anulado

Private mKeyDecimal As Boolean

'============================================================
'FECHA CARGA
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
'FORMULARIO NUMERO
Private Sub txtFormularioNumero_GotFocus()
    CSM_Control_TextBox.SelAllText txtFormularioNumero
End Sub

Private Sub txtFormularioNumero_LostFocus()
    CSM_Control_TextBox.FormatValue_ByTag txtFormularioNumero
End Sub

Public Function Startup(ByRef Formulario_Anulado As Formulario_Anulado) As Boolean
    Set mFormulario_Anulado = Formulario_Anulado
    
    Load Me
    
    Me.Caption = "Certificado Anulado - Nuevo"
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mFormulario_Anulado
        Me.Caption = "Certificado Anulado - " & .IDFormulario_Anulado
        
        cboFormularioCodigo.ListIndex = .FormularioCodigo - 1
        txtFormularioNumero.Text = .FormularioNumero
        cboAnulacionMotivo.ListIndex = .AnulacionMotivo - 1
        dtpFecha.Value = .Fecha
        
        Call CSM_Control_TextBox.FormatAll(Me)
    End With
    LoadData = True
End Function

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    Call CSM_Control_TextBox.PrepareAll(Me)

    cboFormularioCodigo.AddItem "Formulario 1116A"
    cboFormularioCodigo.AddItem "Formulario 1116RT"
    cboFormularioCodigo.AddItem "Formulario 1116B"
    cboFormularioCodigo.AddItem "Formulario 1116C"
    cboFormularioCodigo.AddItem "Carta de Porte"

    cboAnulacionMotivo.AddItem "Anulado"
    cboAnulacionMotivo.AddItem "Extraviado"
    cboAnulacionMotivo.AddItem "Vencido"
    
    dtpFecha.Value = Date
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mFormulario_Anulado = Nothing
    Set frmFormulario_Anulado_Detalle = Nothing
End Sub

Private Sub cmdAceptar_Click()
    If cboFormularioCodigo.ListIndex = -1 Then
        MsgBox "Debe seleccionar el Tipo de Certificado.", vbInformation, App.Title
        cboFormularioCodigo.SetFocus
        Exit Sub
    End If
    If Trim(txtFormularioNumero.Text) = "" Then
        MsgBox "Debe ingresar el Número del Certificado.", vbInformation, App.Title
        txtFormularioNumero.SetFocus
        Exit Sub
    End If
    If cboAnulacionMotivo.ListIndex = -1 Then
        MsgBox "Debe seleccionar el Motivo.", vbInformation, App.Title
        cboAnulacionMotivo.SetFocus
        Exit Sub
    End If
    
    With mFormulario_Anulado
        .FormularioCodigo = cboFormularioCodigo.ListIndex + 1
        .FormularioNumero = txtFormularioNumero.Text
        .AnulacionMotivo = cboAnulacionMotivo.ListIndex + 1
        .Fecha = dtpFecha.Value
        
        If .Update Then
            Unload Me
        End If
    End With
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub
