VERSION 5.00
Begin VB.Form frmFiltrar 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Filtrar"
   ClientHeight    =   1515
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5970
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Filtrar.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1515
   ScaleWidth      =   5970
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtNombre 
      Height          =   315
      Left            =   960
      MaxLength       =   50
      TabIndex        =   1
      Top             =   180
      Width           =   4815
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   435
      Left            =   3660
      TabIndex        =   2
      Top             =   900
      Width           =   975
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   435
      Left            =   4860
      TabIndex        =   3
      Top             =   900
      Width           =   915
   End
   Begin VB.Label lblNombre 
      AutoSize        =   -1  'True
      Caption         =   "Nombre:"
      Height          =   210
      Left            =   180
      TabIndex        =   0
      Top             =   240
      Width           =   600
   End
End
Attribute VB_Name = "frmFiltrar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private Sub Form_Load()
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub txtNombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNombre)
End Sub

Private Sub cmdAceptar_Click()
    If Trim(txtNombre.Text) = "" Then
        MsgBox "Debe ingresar el Nombre a buscar.", vbInformation, App.Title
        txtNombre.SetFocus
        Exit Sub
    End If
    
    Me.Tag = "OK"
    Me.Hide
End Sub

Private Sub cmdCancelar_Click()
    Me.Tag = "CANCEL"
    Me.Hide
End Sub
