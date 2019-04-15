VERSION 5.00
Begin VB.Form frmOptionApplication 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Opciones de la Aplicación"
   ClientHeight    =   3255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4575
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3255
   ScaleWidth      =   4575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame fraMovimiento 
      Caption         =   "Ventana de Movimientos"
      Height          =   735
      Left            =   180
      TabIndex        =   13
      Top             =   1740
      Width           =   4215
      Begin VB.CheckBox chkMovimiento_Lista_Columna_KilogramoFinal_Mostrar 
         Caption         =   "Mostrar columna de Kgs. Finales"
         Height          =   210
         Left            =   180
         TabIndex        =   14
         Top             =   360
         Width           =   3855
      End
   End
   Begin VB.CommandButton cmdRestore 
      Caption         =   "Restaurar"
      Height          =   435
      Left            =   180
      TabIndex        =   17
      Top             =   2640
      Width           =   1275
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "&Cancelar"
      Height          =   435
      Left            =   3120
      TabIndex        =   16
      Top             =   2640
      Width           =   1275
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   435
      Left            =   1740
      TabIndex        =   15
      Top             =   2640
      Width           =   1275
   End
   Begin VB.Frame fraGridRowColor 
      Caption         =   "Color de las Grillas"
      Height          =   1455
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   4215
      Begin VB.CommandButton cmdHighlightRowColorFore 
         Caption         =   "Texto"
         Height          =   255
         Left            =   3300
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   1020
         Width           =   735
      End
      Begin VB.CommandButton cmdHighlightRowColorBack 
         Caption         =   "Fondo"
         Height          =   255
         Left            =   2520
         TabIndex        =   11
         TabStop         =   0   'False
         Top             =   1020
         Width           =   735
      End
      Begin VB.CommandButton cmdEvenRowColorBack 
         Caption         =   "Fondo"
         Height          =   255
         Left            =   2520
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   660
         Width           =   735
      End
      Begin VB.CommandButton cmdEvenRowColorFore 
         Caption         =   "Texto"
         Height          =   255
         Left            =   3300
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   660
         Width           =   735
      End
      Begin VB.CommandButton cmdOddRowColorBack 
         Caption         =   "Fondo"
         Height          =   255
         Left            =   2520
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   300
         Width           =   735
      End
      Begin VB.CommandButton cmdOddRowColorFore 
         Caption         =   "Texto"
         Height          =   255
         Left            =   3300
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   300
         Width           =   735
      End
      Begin VB.Label lblHighlightRowColorSample 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Ejemplo"
         Height          =   270
         Left            =   1290
         TabIndex        =   10
         Top             =   1020
         Width           =   1215
      End
      Begin VB.Label lblHighlightRowColor 
         AutoSize        =   -1  'True
         Caption         =   "Seleccionada:"
         Height          =   210
         Left            =   180
         TabIndex        =   9
         Top             =   1050
         Width           =   1020
      End
      Begin VB.Label lblEvenRowColor 
         AutoSize        =   -1  'True
         Caption         =   "Filas Pares:"
         Height          =   210
         Left            =   180
         TabIndex        =   5
         Top             =   690
         Width           =   840
      End
      Begin VB.Label lblEvenRowColorSample 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Ejemplo"
         Height          =   270
         Left            =   1290
         TabIndex        =   6
         Top             =   660
         Width           =   1215
      End
      Begin VB.Label lblOddRowColor 
         AutoSize        =   -1  'True
         Caption         =   "Filas Impares:"
         Height          =   210
         Left            =   180
         TabIndex        =   1
         Top             =   330
         Width           =   990
      End
      Begin VB.Label lblOddRowColorSample 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Ejemplo"
         Height          =   270
         Left            =   1290
         TabIndex        =   2
         Top             =   300
         Width           =   1215
      End
   End
End
Attribute VB_Name = "frmOptionApplication"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAceptar_Click()
    pParametro.GridEvenRowBackColor = lblEvenRowColorSample.BackColor
    pParametro.GridEvenRowForeColor = lblEvenRowColorSample.ForeColor
    pParametro.GridOddRowBackColor = lblOddRowColorSample.BackColor
    pParametro.GridOddRowForeColor = lblOddRowColorSample.ForeColor
    pParametro.GridHighlightRowBackColor = lblHighlightRowColorSample.BackColor
    pParametro.GridHighlightRowForeColor = lblHighlightRowColorSample.ForeColor
    
    pParametro.Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar = (chkMovimiento_Lista_Columna_KilogramoFinal_Mostrar.Value = vbChecked)
    
    If CSM_Forms.IsLoaded("frmEntidad_Lista") Then
        frmEntidad_Lista.SetTrueDBGridAppearance
    End If
    If CSM_Forms.IsLoaded("frmCartaPorteTalonario_Lista") Then
        frmCartaPorte_Talonario_Lista.SetTrueDBGridAppearance
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        frmMovimiento_Cereal_Lista.SetTrueDBGridAppearance
    End If
    
    Unload frmOptionApplication
End Sub

Private Sub cmdCancelar_Click()
    Unload frmOptionApplication
End Sub

Private Sub cmdRestore_Click()
    lblEvenRowColorSample.BackColor = &HFFC0C0
    lblEvenRowColorSample.ForeColor = vbWindowText
    lblOddRowColorSample.BackColor = vbWindowBackground
    lblOddRowColorSample.ForeColor = vbWindowText
    lblHighlightRowColorSample.BackColor = vbHighlight
    lblHighlightRowColorSample.ForeColor = vbWindowBackground
    
    chkMovimiento_Lista_Columna_KilogramoFinal_Mostrar.Value = False
End Sub

Private Sub Form_Load()
    lblEvenRowColorSample.BackColor = pParametro.GridEvenRowBackColor
    lblEvenRowColorSample.ForeColor = pParametro.GridEvenRowForeColor
    lblOddRowColorSample.BackColor = pParametro.GridOddRowBackColor
    lblOddRowColorSample.ForeColor = pParametro.GridOddRowForeColor
    lblHighlightRowColorSample.BackColor = pParametro.GridHighlightRowBackColor
    lblHighlightRowColorSample.ForeColor = pParametro.GridHighlightRowForeColor
    
    chkMovimiento_Lista_Columna_KilogramoFinal_Mostrar.Value = IIf(pParametro.Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar, vbChecked, vbUnchecked)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmOptionApplication = Nothing
End Sub

Private Sub cmdEvenRowColorBack_Click()
    Dim Color As Long
    
    Color = lblEvenRowColorSample.BackColor
    If CSM_CommonDialog.GetColor(Me.hwnd, Color) Then
        lblEvenRowColorSample.BackColor = Color
    End If
End Sub

Private Sub cmdEvenRowColorFore_Click()
    Dim Color As Long
    
    Color = lblEvenRowColorSample.ForeColor
    If CSM_CommonDialog.GetColor(Me.hwnd, Color) Then
        lblEvenRowColorSample.ForeColor = Color
    End If
End Sub

Private Sub cmdOddRowColorBack_Click()
    Dim Color As Long
    
    Color = lblOddRowColorSample.BackColor
    If CSM_CommonDialog.GetColor(Me.hwnd, Color) Then
        lblOddRowColorSample.BackColor = Color
    End If
End Sub

Private Sub cmdOddRowColorFore_Click()
    Dim Color As Long
    
    Color = lblOddRowColorSample.ForeColor
    If CSM_CommonDialog.GetColor(Me.hwnd, Color) Then
        lblOddRowColorSample.ForeColor = Color
    End If
End Sub

Private Sub cmdHighlightRowColorBack_Click()
    Dim Color As Long
    
    Color = lblHighlightRowColorSample.BackColor
    If CSM_CommonDialog.GetColor(Me.hwnd, Color) Then
        lblHighlightRowColorSample.BackColor = Color
    End If
End Sub

Private Sub cmdHighlightRowColorFore_Click()
    Dim Color As Long
    
    Color = lblHighlightRowColorSample.ForeColor
    If CSM_CommonDialog.GetColor(Me.hwnd, Color) Then
        lblHighlightRowColorSample.ForeColor = Color
    End If
End Sub
