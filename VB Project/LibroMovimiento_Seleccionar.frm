VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmLibroMovimiento_Seleccionar 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Movimientos del Libro"
   ClientHeight    =   2445
   ClientLeft      =   4950
   ClientTop       =   4155
   ClientWidth     =   4785
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "LibroMovimiento_Seleccionar.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2445
   ScaleWidth      =   4785
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   390
      Left            =   2580
      TabIndex        =   8
      Top             =   1860
      Width           =   975
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "&Cancelar"
      Height          =   390
      Left            =   3660
      TabIndex        =   9
      Top             =   1860
      Width           =   975
   End
   Begin VB.ComboBox cboPeriodoAnio 
      Height          =   330
      Left            =   2580
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   1140
      Width           =   855
   End
   Begin VB.ComboBox cboPeriodoMes 
      Height          =   330
      Left            =   840
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1140
      Width           =   1335
   End
   Begin MSDataListLib.DataCombo datcboPlanta 
      Height          =   330
      Left            =   840
      TabIndex        =   1
      Top             =   180
      Width           =   3795
      _ExtentX        =   6694
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSDataListLib.DataCombo datcboRubrica 
      Height          =   330
      Left            =   840
      TabIndex        =   3
      Top             =   660
      Width           =   3795
      _ExtentX        =   6694
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblPlanta 
      AutoSize        =   -1  'True
      Caption         =   "Planta:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   480
   End
   Begin VB.Label lblPeriodoDe 
      AutoSize        =   -1  'True
      Caption         =   "de"
      Height          =   210
      Left            =   2280
      TabIndex        =   6
      Top             =   1200
      Width           =   180
   End
   Begin VB.Label lblRubrica 
      AutoSize        =   -1  'True
      Caption         =   "Rúbrica:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   600
   End
   Begin VB.Label lblPeriodo 
      AutoSize        =   -1  'True
      Caption         =   "Período:"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   585
   End
End
Attribute VB_Name = "frmLibroMovimiento_Seleccionar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim Index As Integer
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL", "ID", "Nombre", "Plantas", cscpItemOrFirstIfUnique, pParametro.Planta_IDDefault)
    
    For Index = 1 To 12
        cboPeriodoMes.AddItem MonthName(Index)
    Next Index
    cboPeriodoMes.ListIndex = Month(DateAdd("m", -1, Date)) - 1
    
    For Index = 2010 To 2099
        cboPeriodoAnio.AddItem Index
    Next Index
    cboPeriodoAnio.ListIndex = Year(DateAdd("m", -1, Date)) - 2010
End Sub

Private Sub datcboPlanta_Change()
    datcboRubrica.BoundText = ""
    Call CSM_Control_DataCombo.FillFromSQL(datcboRubrica, "usp_LibroMovimiento_List 0, 1, 1, " & CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 1) & ", " & CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 2) & ", NULL", "Rubrica", "Nombre", "Libros de Movimientos", cscpFirstIfUnique)
End Sub

Private Sub cmdAceptar_Click()
    If datcboRubrica.BoundText = "" Then
        MsgBox "Debe especificar la Rúbrica.", vbInformation, App.Title
        datcboRubrica.SetFocus
        Exit Sub
    End If
    If cboPeriodoMes.ListIndex = -1 Then
        MsgBox "Debe especificar el Mes del Período.", vbInformation, App.Title
        cboPeriodoMes.SetFocus
        Exit Sub
    End If
    If cboPeriodoAnio.ListIndex = -1 Then
        MsgBox "Debe especificar el Año del Período.", vbInformation, App.Title
        cboPeriodoAnio.SetFocus
        Exit Sub
    End If
    
    Tag = "OK"
    Hide
End Sub

Private Sub cmdCancelar_Click()
    Tag = "CANCEL"
    Hide
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode = vbFormControlMenu Then
        Cancel = True
    End If
End Sub
