VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ingreso al Sistema"
   ClientHeight    =   1710
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4335
   Icon            =   "Login.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1710
   ScaleWidth      =   4335
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancelar"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   2340
      TabIndex        =   5
      Top             =   1140
      Width           =   1215
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   780
      TabIndex        =   4
      Top             =   1140
      Width           =   1215
   End
   Begin VB.TextBox txtPassword 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   1260
      MaxLength       =   50
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   600
      Width           =   2910
   End
   Begin VB.TextBox txtNombre 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1260
      MaxLength       =   50
      TabIndex        =   1
      Top             =   120
      Width           =   2910
   End
   Begin VB.Label lblPassword 
      Caption         =   "C&ontraseña:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   180
      TabIndex        =   2
      Top             =   660
      Width           =   885
   End
   Begin VB.Label lblNombre 
      Caption         =   "&Usuario:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   600
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mIntentos As Long
Private mUsuario As Usuario

Public Sub LoadData(ByRef Usuario As Usuario)
    Set mUsuario = Usuario
End Sub

Private Sub cmdCancel_Click()
    mUsuario.IDUsuario = 0
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Dim UsuarioGrupo As UsuarioGrupo
    
    If Trim(txtNombre.Text) = "" Then
        MsgBox "Debe ingresar el Usuario.", vbInformation, App.Title
        txtNombre.SetFocus
        Exit Sub
    End If
    If Trim(txtPassword.Text) = "" Then
        MsgBox "Debe ingresar la Contraseña.", vbInformation, App.Title
        txtPassword.SetFocus
        Exit Sub
    End If
    
    mUsuario.Nombre = LCase(txtNombre.Text)
    mUsuario.NoMatchRaiseError = False
    If Not mUsuario.LoadByNombre() Then
        mUsuario.NoMatchRaiseError = True
        Exit Sub
    End If
    mUsuario.NoMatchRaiseError = True
    If mUsuario.NoMatch Then
        mIntentos = mIntentos + 1
        WriteLogEvent "User Login Failed: User Unknown - Username: " & mUsuario.Nombre, vbLogEventTypeWarning
        MsgBox "El Usuario ingresado no existe.", vbExclamation, App.Title
        txtNombre.SetFocus
        txtNombre_GotFocus
        If mIntentos = 3 Then
            MsgBox "Ha realizado 3 intentos de ingreso incorrectos." & vbCr & "Se cerrará el Sistema.", vbExclamation, App.Title
            mUsuario.IDUsuario = 0
            Unload Me
        End If
        Exit Sub
    End If
    
    If Not mUsuario.Activo Then
        mIntentos = mIntentos + 1
        WriteLogEvent "User Login Failed: User Not Active - Username: " & mUsuario.Nombre, vbLogEventTypeWarning
        MsgBox "El Usuario está desactivado.", vbExclamation, App.Title
        txtNombre.SetFocus
        txtNombre_GotFocus
        If mIntentos = 3 Then
            MsgBox "Ha realizado 3 intentos de ingreso incorrectos." & vbCr & "Se cerrará el Sistema.", vbExclamation, App.Title
            mUsuario.IDUsuario = 0
            Unload Me
        End If
        Exit Sub
    End If
    
    If txtPassword.Text <> mUsuario.Password Then
        mIntentos = mIntentos + 1
        WriteLogEvent "User Login Failed: Wrong Password - Username: " & mUsuario.Nombre, vbLogEventTypeWarning
        MsgBox "La Contraseña ingresada es incorrecta.", vbExclamation, App.Title
        txtPassword.SetFocus
        txtPassword_GotFocus
        If mIntentos = 3 Then
            MsgBox "Ha realizado 3 intentos de ingreso incorrectos." & vbCr & "Se cerrará el Sistema.", vbExclamation, App.Title
            mUsuario.IDUsuario = 0
            Unload Me
        End If
        Exit Sub
    End If
    
    Set UsuarioGrupo = New UsuarioGrupo
    UsuarioGrupo.IDUsuarioGrupo = mUsuario.IDUsuarioGrupo
    If Not UsuarioGrupo.Load() Then
        Set UsuarioGrupo = Nothing
        Exit Sub
    End If
    If Not UsuarioGrupo.Activo Then
        mIntentos = mIntentos + 1
        WriteLogEvent "User Login Failed: User Group Not Active - Username: " & mUsuario.Nombre, vbLogEventTypeWarning
        MsgBox "El Grupo de Usuarios está desactivado.", vbExclamation, App.Title
        txtNombre.SetFocus
        txtNombre_GotFocus
        Set UsuarioGrupo = Nothing
        If mIntentos = 3 Then
            MsgBox "Ha realizado 3 intentos de ingreso incorrectos." & vbCr & "Se cerrará el Sistema.", vbExclamation, App.Title
            mUsuario.IDUsuario = 0
            Unload Me
        End If
        Exit Sub
    End If
    Set UsuarioGrupo = Nothing
    
    Unload Me
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode = vbFormControlMenu Then
        Cancel = True
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmLogin = Nothing
End Sub

Private Sub txtNombre_GotFocus()
    CSM_Control_TextBox.SelAllText txtNombre
End Sub

Private Sub txtPassword_GotFocus()
    CSM_Control_TextBox.SelAllText txtPassword
End Sub
