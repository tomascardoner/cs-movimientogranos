VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmMovimiento_Cereal_Exportar 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Exportar Cartas de Porte y Análisis (BolsaTech)"
   ClientHeight    =   4200
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7020
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Movimiento_Cereal_Exportar.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   4200
   ScaleWidth      =   7020
   Begin MSComCtl2.DTPicker dtpFechaDesde 
      Height          =   315
      Left            =   1380
      TabIndex        =   1
      Top             =   180
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   556
      _Version        =   393216
      Format          =   87818241
      CurrentDate     =   43271
      MaxDate         =   73415
      MinDate         =   42736
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "Exportar..."
      Height          =   435
      Left            =   5640
      TabIndex        =   12
      Top             =   3540
      Width           =   1155
   End
   Begin VB.TextBox txtCarpeta 
      Height          =   315
      Left            =   2220
      TabIndex        =   9
      Top             =   2340
      Width           =   4335
   End
   Begin VB.CommandButton cmdCarpeta 
      Caption         =   "..."
      Height          =   300
      Left            =   6570
      TabIndex        =   10
      Top             =   2340
      Width           =   255
   End
   Begin VB.CheckBox chkEliminarArchivos 
      Caption         =   "Eliminar archivos existentes"
      Height          =   210
      Left            =   2220
      TabIndex        =   11
      Top             =   3180
      Value           =   1  'Checked
      Width           =   2655
   End
   Begin VB.CheckBox chkExportarAnalisis 
      Caption         =   "Análisis"
      Height          =   210
      Left            =   180
      TabIndex        =   7
      Top             =   1980
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin VB.CheckBox chkExportarCartasDePorte 
      Caption         =   "Cartas de Porte"
      Height          =   210
      Left            =   180
      TabIndex        =   6
      Top             =   1620
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin MSComCtl2.DTPicker dtpFechaHasta 
      Height          =   315
      Left            =   1380
      TabIndex        =   3
      Top             =   600
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   556
      _Version        =   393216
      Format          =   87818241
      CurrentDate     =   43271
      MaxDate         =   73415
      MinDate         =   42736
   End
   Begin MSDataListLib.DataCombo datcboCereal 
      Height          =   330
      Left            =   1380
      TabIndex        =   5
      Top             =   1020
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   582
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin VB.Label lblCereal 
      AutoSize        =   -1  'True
      Caption         =   "Cereal:"
      Height          =   210
      Left            =   180
      TabIndex        =   4
      Top             =   1080
      Width           =   510
   End
   Begin VB.Label lblFechaHasta 
      AutoSize        =   -1  'True
      Caption         =   "Fecha Hasta:"
      Height          =   210
      Left            =   180
      TabIndex        =   2
      Top             =   660
      Width           =   960
   End
   Begin VB.Label lblFechaDesde 
      AutoSize        =   -1  'True
      Caption         =   "Fecha Desde:"
      Height          =   210
      Left            =   180
      TabIndex        =   0
      Top             =   240
      Width           =   1005
   End
   Begin VB.Label lblCarpeta 
      AutoSize        =   -1  'True
      Caption         =   "Ubicación de los archivos:"
      Height          =   210
      Left            =   180
      TabIndex        =   8
      Top             =   2400
      Width           =   1905
   End
End
Attribute VB_Name = "frmMovimiento_Cereal_Exportar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    dtpFechaDesde.Value = DateSerial(Year(Date), Month(Date), 1)
    dtpFechaHasta.Value = Date
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboCereal, "usp_Cereal_List 0, 0, 1, 0", "IDCereal", "Nombre", "Cereales", cscpFirstIfUnique)
End Sub

Private Sub cmdCarpeta_Click()
    Dim Folder As String
    
    Folder = CSM_CommonDialog.BrowseForFolder(Me.hwnd, "Seleccionar ubicación de destino")
    If Folder <> "" Then
        txtCarpeta.Text = Folder
    End If
End Sub

Private Sub cmdExport_Click()
    Dim CarpetaDestino As String
    Dim DeletePreviousFile As VbMsgBoxResult
    
    Dim RecordCount As Long
    
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    
    Dim FileNumber_CartasPorte As Integer
    Dim FileNumber_Analisis As Integer
        
    Dim TextStream_CartasPorte As String
    Dim TextStream_Analisis As String
    
    Dim DeclaraIPRO As Boolean
    
    Const CARTASPORTE_FILENAME As String = "CartasPorte.csv"
    Const ANALISIS_FILENAME As String = "Analisis.csv"
    
    If Val(datcboCereal.BoundText) = 0 Then
        MsgBox "Debe seleccionar el Cereal.", vbInformation, App.Title
        datcboCereal.SetFocus
        Exit Sub
    End If
    
    If txtCarpeta.Text = "" Then
        MsgBox "Debe especificar la carpeta de destino de los archivos.", vbInformation, App.Title
        txtCarpeta.SetFocus
        Exit Sub
    End If
    
    If (chkExportarCartasDePorte.Value + chkExportarAnalisis.Value) = vbUnchecked Then
        MsgBox "Debe seleecionar algún tipo de exportación.", vbInformation, App.Title
        chkExportarCartasDePorte.SetFocus
        Exit Sub
    End If
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    CarpetaDestino = Trim(txtCarpeta.Text)
    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If chkExportarCartasDePorte.Value = vbChecked Then
        If FileSystem.Dir(CarpetaDestino & CARTASPORTE_FILENAME) <> "" Then
            If chkEliminarArchivos.Value = vbChecked Then
                FileSystem.Kill CarpetaDestino & CARTASPORTE_FILENAME
            Else
                DeletePreviousFile = MsgBox("Ya existe el archivo (" & CARTASPORTE_FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
                If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                    Exit Sub
                End If
            End If
        End If
    End If
    If chkExportarAnalisis.Value = vbChecked Then
        If FileSystem.Dir(CarpetaDestino & ANALISIS_FILENAME) <> "" Then
            If chkEliminarArchivos.Value = vbChecked Then
                FileSystem.Kill CarpetaDestino & ANALISIS_FILENAME
            Else
                DeletePreviousFile = MsgBox("Ya existe el archivo (" & ANALISIS_FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
                If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                    Exit Sub
                End If
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    If chkExportarCartasDePorte.Value = vbChecked And chkExportarAnalisis.Value = vbChecked Then
        CSF_Status.lblStatus.Caption = "Exportando Cartas de Porte y Análisis..."
    ElseIf chkExportarCartasDePorte.Value = vbChecked Then
        CSF_Status.lblStatus.Caption = "Exportando Cartas de Porte..."
    Else
        CSF_Status.lblStatus.Caption = "Exportando Análisis..."
    End If
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Movimiento_Cereal_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , Val(datcboCereal.BoundText))
        .Parameters.Append .CreateParameter("IDDepositario", adInteger, adParamInput, , CLng(pParametro.Planta_IDDefault \ 100000))
        .Parameters.Append .CreateParameter("IDPlanta", adSmallInt, adParamInput, , Val(Right(pParametro.Planta_IDDefault, 5)))
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , dtpFechaDesde.Value)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , dtpFechaHasta.Value)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream_CartasPorte = ""
    TextStream_Analisis = ""
    Do While Not recData.EOF
        DeclaraIPRO = CBool(recData("DeclaraIPRO").Value)
        If chkExportarCartasDePorte.Value = vbChecked Then
            TextStream_CartasPorte = TextStream_CartasPorte & recData("ComprobanteNumero").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("CTGNumero").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("CerealCodigo").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Destino_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Destinatario_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & Replace(Left(recData("Titular_Nombre").Value & "", 255), ",", "")
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Titular_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & Replace(Left(recData("RemitenteComercial_Nombre").Value & "", 255), ",", "")
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("RemitenteComercial_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("CodigoEstablecimiento").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("LocalidadOrigen").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("LocalidadDestino").Value
            TextStream_CartasPorte = TextStream_CartasPorte & ",TRANSPORTE AUTOMOTOR"
            TextStream_CartasPorte = TextStream_CartasPorte & ","   ' Cantidad de vagones
            TextStream_CartasPorte = TextStream_CartasPorte & ","   ' Identificador de vagones
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Peso").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & IIf(DeclaraIPRO, "INTACTA", "")     ' Tecnología
            TextStream_CartasPorte = TextStream_CartasPorte & "," & IIf(DeclaraIPRO, "", CSM_Function.IfIsNull_ZeroLenghtString(recData("MuestraNumero").Value))
            TextStream_CartasPorte = TextStream_CartasPorte & "," & IIf(DeclaraIPRO, "", recData("LaboratorioCuantitativo").Value)
            TextStream_CartasPorte = TextStream_CartasPorte & "," & IIf(DeclaraIPRO, "", recData("LaboratorioCualitativo").Value)
            TextStream_CartasPorte = TextStream_CartasPorte & "," & Format(recData("FechaDescarga").Value, "dd/mm/yyyy")
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("NumeroPlantaDestino").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & Replace(Left(recData("Corredor_Nombre").Value & "", 255), ",", "")
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Corredor_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & Replace(Left(recData("Intermediario_Nombre").Value & "", 255), ",", "")
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Intermediario_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & Replace(Left(recData("Entregador_Nombre").Value & "", 255), ",", "")
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("Entregador_CUIT").Value
            TextStream_CartasPorte = TextStream_CartasPorte & "," & CSM_String.CleanNotNumericChars(recData("Cosecha").Value)
            TextStream_CartasPorte = TextStream_CartasPorte & "," & recData("ContratoNumero").Value
        End If
        If chkExportarAnalisis.Value = vbChecked And Not DeclaraIPRO Then
            TextStream_Analisis = TextStream_Analisis & recData("MuestraNumero").Value
            TextStream_Analisis = TextStream_Analisis & "," & recData("Destino_CUIT").Value
            TextStream_Analisis = TextStream_Analisis & ",CUALITATIVO"
            TextStream_Analisis = TextStream_Analisis & ",INTACTA"
            TextStream_Analisis = TextStream_Analisis & "," & IIf(recData("ResultadoIPRO").Value, "POSITIVO", "NEGATIVO")
            TextStream_Analisis = TextStream_Analisis & ","         ' Porcentaje Cuantitativo
            TextStream_Analisis = TextStream_Analisis & "," & Format(recData("FechaAnalisis").Value, "dd/mm/yyyy")
            If CBool(recData("ResultadoIPRO").Value) Then
                TextStream_Analisis = TextStream_Analisis & "," & Replace(Left(recData("RemitenteComercial_Nombre").Value & "", 255), ",", "")
                TextStream_Analisis = TextStream_Analisis & "," & recData("RemitenteComercial_CUIT").Value
                TextStream_Analisis = TextStream_Analisis & "," & Replace(Left(recData("Titular_Nombre").Value & "", 255), ",", "")
                TextStream_Analisis = TextStream_Analisis & "," & recData("Titular_CUIT").Value
            Else
                TextStream_Analisis = TextStream_Analisis & ","         ' Remitente Comercial Nombre
                TextStream_Analisis = TextStream_Analisis & ","         ' Remitente Comercial CUIT
                TextStream_Analisis = TextStream_Analisis & ","         ' Titular Nombre
                TextStream_Analisis = TextStream_Analisis & ","         ' Titular CUIT
            End If
        End If
        
        recData.MoveNext
        
        If Not recData.EOF Then
            If chkExportarCartasDePorte.Value = vbChecked Then
                TextStream_CartasPorte = TextStream_CartasPorte & vbCrLf
            End If
            If chkExportarAnalisis.Value = vbChecked And Not DeclaraIPRO Then
                TextStream_Analisis = TextStream_Analisis & vbCrLf
            End If
        End If
    Loop
    
    RecordCount = recData.RecordCount

    recData.Close
    Set recData = Nothing
    
    ' SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If chkExportarCartasDePorte.Value = vbChecked And TextStream_CartasPorte <> "" Then
        FileNumber_CartasPorte = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & CARTASPORTE_FILENAME For Output As #FileNumber_CartasPorte
        Else
            Open CarpetaDestino & CARTASPORTE_FILENAME For Append As #FileNumber_CartasPorte
        End If
        Print #FileNumber_CartasPorte, TextStream_CartasPorte
        Close #FileNumber_CartasPorte
    End If
    If chkExportarCartasDePorte.Value = vbChecked And TextStream_Analisis <> "" Then
        FileNumber_Analisis = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & ANALISIS_FILENAME For Output As #FileNumber_Analisis
        Else
            Open CarpetaDestino & ANALISIS_FILENAME For Append As #FileNumber_Analisis
        End If
        Print #FileNumber_Analisis, TextStream_Analisis
        Close #FileNumber_Analisis
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing
    
    If chkExportarCartasDePorte.Value = vbChecked And chkExportarAnalisis.Value = vbChecked Then
        MsgBox "Se han exportado " & RecordCount & " Cartas de Porte y Análisis.", vbInformation, App.Title
    ElseIf chkExportarCartasDePorte.Value = vbChecked Then
        MsgBox "Se han exportado " & RecordCount & " Cartas de Porte.", vbInformation, App.Title
    Else
        MsgBox "Se han exportado " & RecordCount & " Análisis.", vbInformation, App.Title
    End If

    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    CSM_Error.ShowErrorMessage "Forms.Formulario_Exportar.Export", "Error al exportar los archivos."
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set frmMovimiento_Cereal_Exportar = Nothing
End Sub
