VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "msdatlst.ocx"
Begin VB.Form frmLocalidad_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle de la Localidad"
   ClientHeight    =   2880
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6150
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Localidad_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   2880
   ScaleWidth      =   6150
   Begin VB.CheckBox chkProvincia 
      Height          =   210
      Left            =   960
      TabIndex        =   7
      Top             =   1140
      Width           =   195
   End
   Begin VB.CheckBox chkNombre 
      Height          =   210
      Left            =   960
      TabIndex        =   4
      Top             =   660
      Width           =   195
   End
   Begin VB.CheckBox chkIDLocalidad 
      Height          =   210
      Left            =   960
      TabIndex        =   1
      Top             =   180
      Width           =   195
   End
   Begin VB.TextBox txtIDLocalidad 
      Enabled         =   0   'False
      Height          =   315
      Left            =   1200
      MaxLength       =   11
      TabIndex        =   2
      Tag             =   "STRING|NOTEMPTY|NUMBERS"
      Top             =   120
      Width           =   1335
   End
   Begin VB.TextBox txtNombre 
      Enabled         =   0   'False
      Height          =   315
      Left            =   1200
      MaxLength       =   50
      TabIndex        =   5
      Tag             =   "STRING|NOTEMPTY|UPPER|50"
      Top             =   600
      Width           =   4815
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   3480
      TabIndex        =   11
      Top             =   2340
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4800
      TabIndex        =   12
      Top             =   2340
      Width           =   1215
   End
   Begin MSDataListLib.DataCombo datcboProvincia 
      Height          =   330
      Left            =   1200
      TabIndex        =   8
      Top             =   1080
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   582
      _Version        =   393216
      Enabled         =   0   'False
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin MSDataListLib.DataCombo datcboPartido 
      Height          =   330
      Left            =   1200
      TabIndex        =   10
      Top             =   1560
      Width           =   4215
      _ExtentX        =   7435
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
      Top             =   1140
      Width           =   990
   End
   Begin VB.Label lblPartido 
      Caption         =   "Partido:"
      Height          =   195
      Left            =   120
      TabIndex        =   9
      Top             =   1620
      Width           =   990
   End
   Begin VB.Label lblIDLocalidad 
      Caption         =   "ID:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   990
   End
   Begin VB.Label lblNombre 
      Caption         =   "&Nombre:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   660
      Width           =   990
   End
End
Attribute VB_Name = "frmLocalidad_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mLocalidad As Localidad

Public Function Startup(ByRef Localidad As Localidad) As Boolean
    Set mLocalidad = Localidad
    
    Load Me
    
    Me.Caption = "Localidad - Nueva"
    
    If Not CSM_Control_DataCombo.FillFromSQL(datcboProvincia, "usp_Provincia_List 0", "IDProvincia", "Nombre", "Provincias", cscpFirstIfUnique) Then
        Exit Function
    End If
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mLocalidad
        Me.Caption = "Localidad - " & Format(.IDLocalidad, "#,###")

        txtIDLocalidad.Text = Format(.IDLocalidad, "#,###")
        txtNombre.Text = .Nombre
        datcboProvincia.BoundText = .IDProvincia
        datcboPartido.BoundText = .IDPartido
        
        Call CSM_Control_TextBox.FormatAll(Me)
    End With
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
    Set mLocalidad = Nothing
    Set frmLocalidad_Detalle = Nothing
End Sub

Private Sub chkIDLocalidad_Click()
    txtIDLocalidad.Enabled = (chkIDLocalidad.Value = vbChecked)
End Sub

Private Sub txtIDLocalidad_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtIDLocalidad)
End Sub

Private Sub txtIDLocalidad_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtIDLocalidad)
End Sub

Private Sub chkNombre_Click()
    txtNombre.Enabled = (chkNombre.Value = vbChecked)
End Sub

Private Sub txtNombre_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtNombre)
End Sub

Private Sub chkProvincia_Click()
    datcboProvincia.Enabled = (chkProvincia.Value = vbChecked)
End Sub

Private Sub datcboProvincia_Change()
    If datcboProvincia.BoundText = "" Or datcboProvincia.BoundText = "-" Then
        Set datcboPartido.DataSource = Nothing
        datcboPartido.BoundText = ""
    Else
        Call CSM_Control_DataCombo.FillFromSQL(datcboPartido, "usp_Partido_List 1, '" & datcboProvincia.BoundText & "'", "IDPartido", "Nombre", "Partidos", cscpFirst)
    End If
End Sub

Private Sub cmdAceptar_Click()
    If Trim(txtIDLocalidad.Text) = "" Then
        MsgBox "Debe ingresar el ID de la Localidad.", vbInformation, App.Title
        txtIDLocalidad.SetFocus
        Exit Sub
    End If
    If Trim(txtNombre.Text) = "" Then
        MsgBox "Debe ingresar el Nombre de la Localidad.", vbInformation, App.Title
        txtNombre.SetFocus
        Exit Sub
    End If
    If datcboProvincia.BoundText = "" Then
        MsgBox "Debe especificar la Provincia a la cual pertenece la Localidad.", vbInformation, App.Title
        datcboProvincia.SetFocus
        Exit Sub
    End If
    If chkIDLocalidad.Value = vbChecked And mLocalidad.IDLocalidad <> CLng(txtIDLocalidad.Text) Then
        If MsgBox("Ha modificado el ID de la Localidad. Tenga en cuenta que este ID está especificado por AFIP y ONCCA. Se recomienda no modificarlo." & vbCr & vbCr & "¿Desea continuar?", vbExclamation + vbYesNo, App.Title) = vbNo Then
            Exit Sub
        End If
    End If
    If chkNombre.Value = vbChecked And mLocalidad.Nombre <> Trim(txtNombre.Text) Then
        If MsgBox("Ha modificado el Nombre de la Localidad. Tenga en cuenta que este Nombre está especificado por AFIP y ONCCA. Se recomienda no modificarlo." & vbCr & vbCr & "¿Desea continuar?", vbExclamation + vbYesNo, App.Title) = vbNo Then
            Exit Sub
        End If
    End If
    If chkProvincia.Value = vbChecked And mLocalidad.IDProvincia <> datcboProvincia.BoundText Then
        If MsgBox("Ha modificado la Provincia de la Localidad. Tenga en cuenta que este dato está especificado por AFIP y ONCCA. Se recomienda no modificarlo." & vbCr & vbCr & "¿Desea continuar?", vbExclamation + vbYesNo, App.Title) = vbNo Then
            Exit Sub
        End If
    End If
    
    With mLocalidad
        If chkIDLocalidad.Value = vbChecked Then
            .IDLocalidad = CLng(txtIDLocalidad.Text)
        End If
        If chkNombre.Value = vbChecked Then
            .Nombre = txtNombre.Text
        End If
        If chkProvincia.Value = vbChecked Then
            .IDProvincia = datcboProvincia.BoundText
        End If
        .IDPartido = Val(datcboPartido.BoundText)
        
        If .Update Then
            Unload Me
        End If
    End With
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
End Sub
