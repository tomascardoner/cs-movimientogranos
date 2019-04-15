VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmConsulta_LibroSubproducto 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Libro de SubProductos"
   ClientHeight    =   1860
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4425
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Consulta_LibroSubproducto.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1860
   ScaleWidth      =   4425
   Begin VB.CommandButton cmdImprimir 
      Caption         =   "Imprimir"
      Height          =   375
      Left            =   3240
      TabIndex        =   6
      Top             =   1320
      Width           =   1035
   End
   Begin VB.ComboBox cboPeriodoMes 
      Height          =   330
      Left            =   1320
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   600
      Width           =   1335
   End
   Begin VB.ComboBox cboPeriodoAnio 
      Height          =   330
      Left            =   3060
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   600
      Width           =   855
   End
   Begin MSDataListLib.DataCombo datcboSubProducto 
      Height          =   330
      Left            =   1320
      TabIndex        =   1
      Top             =   120
      Width           =   2955
      _ExtentX        =   5212
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
   Begin VB.Label lblPeriodo 
      AutoSize        =   -1  'True
      Caption         =   "Período:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   660
      Width           =   585
   End
   Begin VB.Label lblPeriodoDe 
      AutoSize        =   -1  'True
      Caption         =   "de"
      Height          =   210
      Left            =   2760
      TabIndex        =   4
      Top             =   660
      Width           =   180
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
Attribute VB_Name = "frmConsulta_LibroSubproducto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim Index As Integer
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboSubProducto, "usp_SubProducto_List 0, 0, 0, 1, NULL", "IDSubProducto", "Nombre", "SubProductos", cscpItemOrFirstIfUnique)
    
    For Index = 1 To 12
        cboPeriodoMes.AddItem MonthName(Index)
    Next Index
    cboPeriodoMes.ListIndex = Month(DateAdd("m", -1, Date)) - 1
    
    For Index = 2012 To 2099
        cboPeriodoAnio.AddItem Index
    Next Index
    cboPeriodoAnio.ListIndex = Year(DateAdd("m", -1, Date)) - 2012
End Sub

Private Sub cmdImprimir_Click()
    Dim Report As CSC_Report
    
    If Val(datcboSubProducto.BoundText) = 0 Then
        MsgBox "Debe seleccionar el SubProducto.", vbInformation, App.Title
        datcboSubProducto.SetFocus
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

    Screen.MousePointer = vbHourglass
    
    Set Report = New CSC_Report
    With Report
        .ParentForm_hWnd = frmMDI.hwnd
        .FILENAME = pDatabase.ReportsPath & "Libro Movimiento - SubProducto.rpt"
        .WindowTitle = "Libro de Movimientos de SubProductos"
        .ParameterAdd("@IDSubProducto", "", csrpdtNumberInteger, False, False, True).ParameterValue = Val(datcboSubProducto.BoundText)
        .ParameterAdd("@Anio", "", csrpdtNumberInteger, False, False, True).ParameterValue = Val(cboPeriodoAnio.Text)
        .ParameterAdd("@Mes", "", csrpdtNumberInteger, False, False, True).ParameterValue = (cboPeriodoMes.ListIndex + 1)
        If .OpenReport(True) Then
            Call .PreviewReport(False)
        End If
    End With
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmConsulta_LibroSubproducto = Nothing
End Sub

