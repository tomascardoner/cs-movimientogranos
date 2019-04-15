VERSION 5.00
Begin VB.Form frmEntidad_Filtrar 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Filtrar Entidad"
   ClientHeight    =   1770
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   6315
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Entidad_Filtrar.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1770
   ScaleWidth      =   6315
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   435
      Left            =   5220
      TabIndex        =   2
      Top             =   1140
      Width           =   915
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   435
      Left            =   4020
      TabIndex        =   1
      Top             =   1140
      Width           =   975
   End
   Begin VB.TextBox txtNombre 
      Height          =   315
      Left            =   1320
      MaxLength       =   100
      TabIndex        =   0
      Top             =   180
      Width           =   4815
   End
   Begin VB.TextBox txtCUIT 
      Height          =   315
      Left            =   1320
      MaxLength       =   11
      TabIndex        =   5
      Tag             =   "STRING|EMPTY|NUMBERS|11"
      Top             =   660
      Width           =   1335
   End
   Begin VB.OptionButton optCUIT 
      Caption         =   "&CUIT:"
      Height          =   210
      Left            =   180
      TabIndex        =   4
      Top             =   720
      Width           =   1095
   End
   Begin VB.OptionButton optNombre 
      Caption         =   "&Nombre:"
      Height          =   210
      Left            =   180
      TabIndex        =   3
      Top             =   240
      Value           =   -1  'True
      Width           =   1095
   End
End
Attribute VB_Name = "frmEntidad_Filtrar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private Sub Form_Load()
    Call CSM_Control_TextBox.PrepareAll(Me)
    Call EnableControls
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub optNombre_Click()
    Call EnableControls
End Sub

Private Sub optCUIT_Click()
    Call EnableControls
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

Private Sub cmdAceptar_Click()
    If optNombre.Value Then
        If Trim(txtNombre.Text) = "" Then
            MsgBox "Debe ingresar el Nombre de la Entidad a buscar.", vbInformation, App.Title
            txtNombre.SetFocus
            Exit Sub
        End If
    ElseIf optCUIT.Value Then
        If Len(Trim(txtCUIT.Text)) > 0 Then
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
        End If
    End If
    
    Me.Tag = "OK"
    Me.Hide
End Sub

Private Sub cmdCancelar_Click()
    Me.Tag = "CANCEL"
    Me.Hide
End Sub

Private Sub EnableControls()
    txtNombre.Enabled = optNombre.Value
    txtCUIT.Enabled = optCUIT.Value
End Sub
