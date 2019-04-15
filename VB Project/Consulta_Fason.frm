VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "msdatlst.ocx"
Begin VB.Form frmConsulta_Fason 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Consulta de Cuenta Corriente de Fasón"
   ClientHeight    =   2220
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4530
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Consulta_Fason.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2220
   ScaleWidth      =   4530
   Begin VB.ComboBox cboPeriodoAnio 
      Height          =   330
      Left            =   2940
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   960
      Width           =   855
   End
   Begin VB.ComboBox cboPeriodoMes 
      Height          =   330
      Left            =   1200
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   960
      Width           =   1335
   End
   Begin VB.CommandButton cmdImprimir 
      Caption         =   "Imprimir"
      Height          =   375
      Left            =   3360
      TabIndex        =   8
      Top             =   1680
      Width           =   1035
   End
   Begin MSDataListLib.DataCombo datcboEntidad 
      Height          =   330
      Left            =   1200
      TabIndex        =   3
      Top             =   540
      Width           =   3195
      _ExtentX        =   5636
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
   Begin MSDataListLib.DataCombo datcboPlanta 
      Height          =   330
      Left            =   1200
      TabIndex        =   1
      Top             =   120
      Width           =   3195
      _ExtentX        =   5636
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
   Begin VB.Label lblPeriodoDe 
      AutoSize        =   -1  'True
      Caption         =   "de"
      Height          =   210
      Left            =   2640
      TabIndex        =   6
      Top             =   1020
      Width           =   180
   End
   Begin VB.Label lblPeriodo 
      AutoSize        =   -1  'True
      Caption         =   "Período:"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1020
      Width           =   585
   End
   Begin VB.Label lblPlanta 
      AutoSize        =   -1  'True
      Caption         =   "Planta:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   480
   End
   Begin VB.Label lblEntidad 
      AutoSize        =   -1  'True
      Caption         =   "Entidad:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   570
   End
End
Attribute VB_Name = "frmConsulta_Fason"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim Index As Integer
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL ", "ID", "Nombre", "Plantas", cscpFirstIfUnique)
    Call CSM_Control_DataCombo.FillFromSQL(datcboEntidad, "usp_Entidad_ClienteSubProducto_List 0, 1, NULL", "IDEntidad", "Nombre", "Entidades", cscpFirst)

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
    
    If datcboPlanta.BoundText = "" Then
        MsgBox "Debe seleccionar la Planta.", vbInformation, App.Title
        datcboPlanta.SetFocus
        Exit Sub
    End If
    If datcboEntidad.BoundText = "" Then
        MsgBox "Debe seleccionar la Entidad.", vbInformation, App.Title
        datcboEntidad.SetFocus
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
        .FILENAME = pDatabase.ReportsPath & "Entidad - Liquidación de Fasón.rpt"
        .WindowTitle = "Liquidación de Fasón"
        .ParameterAdd("@IDEntidadTitular", "", csrpdtNumberInteger, False, False, True).ParameterValue = Val(CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 1))
        .ParameterAdd("@IDOrigenDestino_Origen", "", csrpdtNumberInteger, False, False, True).ParameterValue = Val(CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 2))
        .ParameterAdd("@IDEntidadDestinatario", "", csrpdtNumberInteger, False, False, True).ParameterValue = Val(datcboEntidad.BoundText)
        .ParameterAdd("@Anio", "", csrpdtNumberInteger, False, False, True).ParameterValue = Val(cboPeriodoAnio.Text)
        .ParameterAdd("@Mes", "", csrpdtNumberInteger, False, False, True).ParameterValue = (cboPeriodoMes.ListIndex + 1)
        If .OpenReport(True) Then
            Call .PreviewReport(False)
        End If
    End With
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmConsulta_Fason = Nothing
End Sub
