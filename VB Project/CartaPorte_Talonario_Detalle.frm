VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "msdatlst.ocx"
Begin VB.Form frmCartaPorte_Talonario_Detalle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalle del Talonario de Cartas de Porte"
   ClientHeight    =   2340
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6855
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "CartaPorte_Talonario_Detalle.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2340
   ScaleWidth      =   6855
   Begin MSComCtl2.DTPicker dtpFechaVencimiento 
      Height          =   315
      Left            =   1920
      TabIndex        =   3
      Top             =   660
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   556
      _Version        =   393216
      Format          =   102367233
      CurrentDate     =   40647
   End
   Begin VB.TextBox txtCEENumero 
      Height          =   315
      Left            =   1920
      MaxLength       =   14
      TabIndex        =   1
      Tag             =   "STRING|EMPTY|NUMBERS|14"
      Top             =   180
      Width           =   1575
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   4200
      TabIndex        =   6
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   5520
      TabIndex        =   7
      Top             =   1800
      Width           =   1215
   End
   Begin MSDataListLib.DataCombo datcboEntidad 
      Height          =   330
      Left            =   1920
      TabIndex        =   5
      Top             =   1140
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin VB.Label lblEntidadNombre 
      Caption         =   "Entidad:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   990
   End
   Begin VB.Label lblFechaVencimiento 
      Caption         =   "Fecha de Vencimiento:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   1770
   End
   Begin VB.Label lblCEENumero 
      Caption         =   "C.E.E. Número:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1170
   End
End
Attribute VB_Name = "frmCartaPorte_Talonario_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mKeyDecimal As Boolean

Private mCartaPorte_Talonario As CartaPorte_Talonario

Public Property Get IDCartaPorte_Talonario() As Long
    IDCartaPorte_Talonario = mCartaPorte_Talonario.IDCartaPorte_Talonario
End Property

Public Function Startup(ByRef CartaPorte_Talonario As CartaPorte_Talonario) As Boolean
    Set mCartaPorte_Talonario = CartaPorte_Talonario
    
    Load Me
    
    Me.Caption = "Talonario de Cartas de Porte - Nuevo"
    
    dtpFechaVencimiento.Value = Date
    
    If Not CSM_Control_DataCombo.FillFromSQL(datcboEntidad, "SELECT IDEntidad, Nombre FROM Entidad WHERE EsTitular = 1 AND (Activo = 1 OR IDEntidad = " & mCartaPorte_Talonario.IDEntidad & ") ORDER BY Nombre", "IDEntidad", "Nombre", "Entidades", cscpItemOrNone, mCartaPorte_Talonario.IDEntidad) Then
        Exit Function
    End If
    
    Startup = True
End Function

Public Function LoadData() As Boolean
    With mCartaPorte_Talonario
        Me.Caption = "Talonario de Cartas de Porte - " & .IDCartaPorte_Talonario
    
        txtCEENumero.Text = .CEENumero
        dtpFechaVencimiento.Value = .FechaVencimiento
        datcboEntidad.BoundText = .IDEntidad
                
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
    Set mCartaPorte_Talonario = Nothing
    Set frmCartaPorte_Talonario_Detalle = Nothing
End Sub

Private Sub txtCEENumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCEENumero)
End Sub

Private Sub txtCEENumero_LostFocus()
    Call CSM_Control_TextBox.FormatValue_ByTag(txtCEENumero)
End Sub

Private Sub cmdAceptar_Click()
    If Trim(txtCEENumero.Text) = "" Then
        MsgBox "Debe ingresar el Número de C.E.E.", vbInformation, App.Title
        txtCEENumero.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtCEENumero.Text)) < 14 Then
        MsgBox "El Número de C.E.E. debe contener 14 dígitos.", vbInformation, App.Title
        txtCEENumero.SetFocus
        Exit Sub
    End If
    If Val(datcboEntidad.BoundText) = 0 Then
        MsgBox "Debe especificar la Entidad.", vbInformation, App.Title
        datcboEntidad.SetFocus
        Exit Sub
    End If
    
    With mCartaPorte_Talonario
        .CEENumero = txtCEENumero.Text
        .FechaVencimiento = dtpFechaVencimiento.Value
        .IDEntidad = Val(datcboEntidad.BoundText)
        
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
