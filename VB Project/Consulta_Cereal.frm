VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmConsulta_Cereal 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Resumen de Cuenta Cereal"
   ClientHeight    =   5130
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   8655
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Consulta_Cereal.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5130
   ScaleWidth      =   8655
   Begin VB.TextBox txtTransferidoDeTercero 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Index           =   1
      Left            =   7500
      TabIndex        =   36
      TabStop         =   0   'False
      Top             =   2880
      Width           =   1035
   End
   Begin VB.TextBox txtTransferidoATercero 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Index           =   1
      Left            =   7500
      TabIndex        =   35
      TabStop         =   0   'False
      Top             =   3720
      Width           =   1035
   End
   Begin VB.TextBox txtLiquidado 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   7500
      TabIndex        =   34
      TabStop         =   0   'False
      Top             =   4140
      Width           =   1035
   End
   Begin VB.TextBox txtExistencia 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   7500
      TabIndex        =   31
      TabStop         =   0   'False
      Top             =   4680
      Width           =   1035
   End
   Begin VB.TextBox txtStockActual 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   4500
      TabIndex        =   25
      Top             =   4680
      Width           =   1035
   End
   Begin VB.TextBox txtTransferidoATercero 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Index           =   0
      Left            =   4500
      TabIndex        =   23
      Top             =   3720
      Width           =   1035
   End
   Begin VB.TextBox txtTransferidoDeTercero 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Index           =   0
      Left            =   4500
      TabIndex        =   19
      Top             =   2880
      Width           =   1035
   End
   Begin VB.TextBox txtRetirado 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   7500
      TabIndex        =   29
      TabStop         =   0   'False
      Top             =   3300
      Width           =   1035
   End
   Begin VB.TextBox txtCertificado 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   7500
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   2460
      Width           =   1035
   End
   Begin VB.TextBox txtSalida 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   4500
      TabIndex        =   21
      Top             =   3300
      Width           =   1035
   End
   Begin VB.TextBox txtEntradaNeto 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   4500
      TabIndex        =   17
      Top             =   2460
      Width           =   1035
   End
   Begin VB.TextBox txtEntradaBruto 
      Alignment       =   1  'Right Justify
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   1500
      TabIndex        =   15
      Top             =   2460
      Width           =   1035
   End
   Begin VB.CommandButton cmdImprimir 
      Caption         =   "Imprimir"
      Height          =   375
      Left            =   7500
      TabIndex        =   13
      Top             =   1440
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.CommandButton cmdConsultar 
      Caption         =   "Consultar"
      Height          =   375
      Left            =   6300
      TabIndex        =   12
      Top             =   1440
      Width           =   1035
   End
   Begin MSDataListLib.DataCombo datcboDepositante 
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
   Begin MSDataListLib.DataCombo datcboCosecha 
      Height          =   330
      Left            =   1200
      TabIndex        =   5
      Top             =   960
      Width           =   2415
      _ExtentX        =   4260
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
   Begin MSDataListLib.DataCombo datcboCereal 
      Height          =   330
      Left            =   6120
      TabIndex        =   7
      Top             =   120
      Width           =   2415
      _ExtentX        =   4260
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
   Begin MSComCtl2.DTPicker dtpFecha_Desde 
      Height          =   315
      Left            =   6120
      TabIndex        =   9
      Top             =   540
      Width           =   1635
      _ExtentX        =   2884
      _ExtentY        =   556
      _Version        =   393216
      CheckBox        =   -1  'True
      Format          =   112590849
      CurrentDate     =   40513
      MaxDate         =   55153
      MinDate         =   40513
   End
   Begin MSComCtl2.DTPicker dtpFecha_Hasta 
      Height          =   315
      Left            =   6120
      TabIndex        =   11
      Top             =   960
      Width           =   1635
      _ExtentX        =   2884
      _ExtentY        =   556
      _Version        =   393216
      CheckBox        =   -1  'True
      Format          =   112590849
      CurrentDate     =   40513
      MaxDate         =   55153
      MinDate         =   40513
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
   Begin VB.Label lblTransferidoDeTercero 
      AutoSize        =   -1  'True
      Caption         =   "+ Transferido de 3ro.:"
      Height          =   210
      Index           =   1
      Left            =   5880
      TabIndex        =   39
      Top             =   2940
      Width           =   1575
   End
   Begin VB.Label lblTransferidoATercero 
      AutoSize        =   -1  'True
      Caption         =   "- Transferido a 3ro.:"
      Height          =   210
      Index           =   1
      Left            =   5880
      TabIndex        =   38
      Top             =   3780
      Width           =   1455
   End
   Begin VB.Label lblLiquidado 
      AutoSize        =   -1  'True
      Caption         =   "- Liquidado:"
      Height          =   210
      Left            =   5880
      TabIndex        =   37
      Top             =   4200
      Width           =   840
   End
   Begin VB.Label lblTituloFormulario 
      Alignment       =   2  'Center
      Caption         =   "SEGÚN FORMULARIOS:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5760
      TabIndex        =   33
      Top             =   2040
      Width           =   2715
   End
   Begin VB.Label lblTituloFisico 
      Alignment       =   2  'Center
      Caption         =   "FÍSICO:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2715
      TabIndex        =   32
      Top             =   2040
      Width           =   2955
   End
   Begin VB.Line Line 
      Index           =   1
      X1              =   120
      X2              =   8520
      Y1              =   2280
      Y2              =   2280
   End
   Begin VB.Line Line 
      Index           =   0
      X1              =   5700
      X2              =   5700
      Y1              =   1980
      Y2              =   4965
   End
   Begin VB.Line linVertical 
      X1              =   2700
      X2              =   2700
      Y1              =   1980
      Y2              =   4980
   End
   Begin VB.Label lblExistencia 
      AutoSize        =   -1  'True
      Caption         =   "= Existencia:"
      Height          =   210
      Left            =   5880
      TabIndex        =   30
      Top             =   4740
      Width           =   915
   End
   Begin VB.Line linSuma2 
      BorderStyle     =   3  'Dot
      X1              =   2700
      X2              =   8520
      Y1              =   4560
      Y2              =   4560
   End
   Begin VB.Label lblStockActual 
      AutoSize        =   -1  'True
      Caption         =   "= Stock Actual:"
      Height          =   210
      Left            =   2880
      TabIndex        =   24
      Top             =   4740
      Width           =   1095
   End
   Begin VB.Label lblTransferidoATercero 
      AutoSize        =   -1  'True
      Caption         =   "- Transferido a 3ro.:"
      Height          =   210
      Index           =   0
      Left            =   2880
      TabIndex        =   22
      Top             =   3780
      Width           =   1455
   End
   Begin VB.Label lblTransferidoDeTercero 
      AutoSize        =   -1  'True
      Caption         =   "+ Transferido de 3ro.:"
      Height          =   210
      Index           =   0
      Left            =   2880
      TabIndex        =   18
      Top             =   2940
      Width           =   1575
   End
   Begin VB.Label lblRetirado 
      AutoSize        =   -1  'True
      Caption         =   "- Retirado (con RT):"
      Height          =   210
      Left            =   5880
      TabIndex        =   28
      Top             =   3360
      Width           =   1425
   End
   Begin VB.Label lblCertificado 
      AutoSize        =   -1  'True
      Caption         =   "+ Certificado:"
      Height          =   210
      Left            =   5880
      TabIndex        =   26
      Top             =   2520
      Width           =   960
   End
   Begin VB.Label lblSalida 
      AutoSize        =   -1  'True
      Caption         =   "- Salidas:"
      Height          =   210
      Left            =   2880
      TabIndex        =   20
      Top             =   3360
      Width           =   675
   End
   Begin VB.Label lblEntradaNeto 
      AutoSize        =   -1  'True
      Caption         =   "+ Entradas (Neto):"
      Height          =   210
      Left            =   2880
      TabIndex        =   16
      Top             =   2520
      Width           =   1320
   End
   Begin VB.Label lblEntradaBruto 
      AutoSize        =   -1  'True
      Caption         =   "Entradas (Bruto):"
      Height          =   210
      Left            =   120
      TabIndex        =   14
      Top             =   2520
      Width           =   1245
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
   Begin VB.Line linSeparator 
      X1              =   120
      X2              =   8520
      Y1              =   1980
      Y2              =   1980
   End
   Begin VB.Label lblFecha_Hasta 
      AutoSize        =   -1  'True
      Caption         =   "Hasta:"
      Height          =   210
      Left            =   5040
      TabIndex        =   10
      Top             =   1020
      Width           =   465
   End
   Begin VB.Label lblFecha_Desde 
      AutoSize        =   -1  'True
      Caption         =   "Desde:"
      Height          =   210
      Left            =   5040
      TabIndex        =   8
      Top             =   600
      Width           =   510
   End
   Begin VB.Label lblCereal 
      AutoSize        =   -1  'True
      Caption         =   "Cereal:"
      Height          =   210
      Left            =   5040
      TabIndex        =   6
      Top             =   180
      Width           =   510
   End
   Begin VB.Label lblCosecha 
      AutoSize        =   -1  'True
      Caption         =   "Cosecha:"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1020
      Width           =   690
   End
   Begin VB.Label lblDepositante 
      AutoSize        =   -1  'True
      Caption         =   "Depositante:"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   900
   End
End
Attribute VB_Name = "frmConsulta_Cereal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub datcboCereal_Change()
    Call CleanValues
End Sub

Private Sub datcboCosecha_Change()
    Call CleanValues
End Sub

Private Sub datcboDepositante_Change()
    Call CleanValues
End Sub

Private Sub datcboPlanta_Change()
    Call CleanValues
End Sub

Private Sub dtpFecha_Desde_Change()
    Call CleanValues
End Sub

Private Sub dtpFecha_Hasta_Change()
    Call CleanValues
End Sub

Private Sub Form_Load()
    dtpFecha_Desde.value = Date
    dtpFecha_Desde.value = Null
    dtpFecha_Hasta.value = Date
    dtpFecha_Hasta.value = Null
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboPlanta, "usp_Entidad_OrigenDestino_List 0, " & IIf(pParametro.Planta_MostrarNombreEmpresa, "1", "0") & ", 1, 1, NULL, NULL, NULL ", "ID", "Nombre", "Plantas", cscpItemOrFirstIfUnique, pParametro.Planta_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboDepositante, "usp_Entidad_Titular_List 1, 1, NULL", "IDEntidad", "Nombre", "Depositantes", cscpFirst)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCosecha, "usp_Cosecha_List 0, 1, NULL", "IDCosecha", "Nombre", "Cosechas", cscpItemOrFirst, pParametro.Cosecha_IDDefault)
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "usp_Cereal_List 0, 0, 1, NULL", "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
End Sub

Private Sub cmdConsultar_Click()
    Dim cmdSP As ADODB.command
    Dim recData As ADODB.recordset
    
    If datcboPlanta.BoundText = "" Then
        MsgBox "Debe seleccionar la Planta.", vbInformation, App.Title
        datcboPlanta.SetFocus
        Exit Sub
    End If
    If datcboDepositante.BoundText = "" Then
        MsgBox "Debe seleccionar el Depositante.", vbInformation, App.Title
        datcboDepositante.SetFocus
        Exit Sub
    End If
    If datcboCosecha.BoundText = "" Then
        MsgBox "Debe seleccionar la Cosecha.", vbInformation, App.Title
        datcboCosecha.SetFocus
        Exit Sub
    End If
    If datcboCereal.BoundText = "" Then
        MsgBox "Debe seleccionar el Cereal.", vbInformation, App.Title
        datcboCereal.SetFocus
        Exit Sub
    End If

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        If Val(datcboDepositante.BoundText) = 0 Then
            .CommandText = "usp_Cereal_Saldo"
        Else
            .CommandText = "usp_Entidad_SaldoCereal"
        End If
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDEntidad_Depositario", adInteger, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 1))
        .Parameters.Append .CreateParameter("IDPlanta", adSmallInt, adParamInput, , CSM_Control_DataCombo.GetSubID(datcboPlanta, 5, 2))
        If Val(datcboDepositante.BoundText) > 0 Then
            .Parameters.Append .CreateParameter("IDEntidad_Depositante", adInteger, adParamInput, , Val(datcboDepositante.BoundText))
        End If
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , Val(datcboCosecha.BoundText))
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , Val(datcboCereal.BoundText))
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , dtpFecha_Desde.value)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , dtpFecha_Hasta.value & " 23:59:59")
    End With
    
    Set recData = New ADODB.recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    txtEntradaBruto.Text = Format(recData("EntradaBruto").value, "#,##0")
    
    txtEntradaNeto.Text = Format(recData("EntradaNeto").value, "#,##0")
    If Val(datcboDepositante.BoundText) = 0 Then
        txtTransferidoDeTercero(0).Text = ""
    Else
        txtTransferidoDeTercero(0).Text = Format(recData("TransferidoDeTercero").value, "#,##0")
    End If
    txtSalida.Text = Format(recData("Salida").value, "#,##0")
    If Val(datcboDepositante.BoundText) = 0 Then
        txtTransferidoATercero(0).Text = ""
    Else
        txtTransferidoATercero(0).Text = Format(recData("TransferidoATercero").value, "#,##0")
    End If
    txtStockActual.Text = Format(recData("StockActual").value, "#,##0")
    
    txtCertificado.Text = Format(recData("Certificado").value, "#,##0")
    If Val(datcboDepositante.BoundText) = 0 Then
        txtTransferidoDeTercero(1).Text = ""
    Else
        txtTransferidoDeTercero(1).Text = Format(recData("TransferidoDeTercero").value, "#,##0")
    End If
    txtRetirado.Text = Format(recData("Retirado").value, "#,##0")
    If Val(datcboDepositante.BoundText) = 0 Then
        txtTransferidoATercero(1).Text = ""
    Else
        txtTransferidoATercero(1).Text = Format(recData("TransferidoATercero").value, "#,##0")
    End If
    txtLiquidado.Text = Format(recData("Liquidado").value, "#,##0")
    txtExistencia.Text = Format(recData("Existencia").value, "#,##0")
    
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    ShowErrorMessage "Forms.Consulta_Cereal.Consultar", "Error al obtener los datos del Resumen de Cuenta de Cereal."
End Sub

Private Sub txtEntradaBruto_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtEntradaBruto)
End Sub

Private Sub txtEntradaNeto_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtEntradaNeto)
End Sub

Private Sub txtTransferidoDeTercero_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtTransferidoDeTercero(Index))
End Sub

Private Sub txtSalida_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtSalida)
End Sub

Private Sub txtTransferidoATercero_GotFocus(Index As Integer)
    Call CSM_Control_TextBox.SelAllText(txtTransferidoATercero(Index))
End Sub

Private Sub txtStockActual_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtStockActual)
End Sub

Private Sub txtCertificado_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtCertificado)
End Sub

Private Sub txtRetirado_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtRetirado)
End Sub

Private Sub txtLiquidado_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtLiquidado)
End Sub

Private Sub txtExistencia_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtExistencia)
End Sub

Private Sub CleanValues()
    txtEntradaBruto.Text = ""
    
    txtEntradaNeto.Text = ""
    txtTransferidoDeTercero(0).Text = ""
    txtSalida.Text = ""
    txtTransferidoATercero(0).Text = ""
    txtStockActual.Text = ""
    
    txtCertificado.Text = ""
    txtTransferidoDeTercero(1).Text = ""
    txtRetirado.Text = ""
    txtTransferidoATercero(1).Text = ""
    txtLiquidado.Text = ""
    txtExistencia.Text = ""
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmConsulta_Cereal = Nothing
End Sub

