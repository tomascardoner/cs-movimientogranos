VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmFormulario_Exportar 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Exportar Certificados"
   ClientHeight    =   5145
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   6960
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Formulario_Exportar.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   5145
   ScaleWidth      =   6960
   Begin VB.CheckBox chkCrearSubCarpeta 
      Caption         =   "Crear Sub-carpeta con Fecha de Presentación"
      Height          =   210
      Left            =   2220
      TabIndex        =   14
      Top             =   3840
      Value           =   1  'Checked
      Width           =   4035
   End
   Begin VB.TextBox txtPresentacionInfo 
      BackColor       =   &H8000000F&
      Height          =   735
      Left            =   2160
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   6
      Top             =   1020
      Width           =   3495
   End
   Begin VB.ComboBox cboPresentacionFecha 
      Height          =   330
      Left            =   2160
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   660
      Width           =   1515
   End
   Begin MSComCtl2.DTPicker dtpPresentacionFecha 
      Height          =   315
      Left            =   2160
      TabIndex        =   4
      Top             =   660
      Visible         =   0   'False
      Width           =   1515
      _ExtentX        =   2672
      _ExtentY        =   556
      _Version        =   393216
      Format          =   98566145
      CurrentDate     =   41656
      MaxDate         =   55153
      MinDate         =   40179
   End
   Begin VB.OptionButton optPresentacionTipoSemanal 
      Caption         =   "Semanal"
      Height          =   210
      Left            =   3300
      TabIndex        =   2
      Top             =   300
      Value           =   -1  'True
      Width           =   1035
   End
   Begin VB.OptionButton optPresentacionTipoDiaria 
      Caption         =   "Diaria"
      Height          =   210
      Left            =   2160
      TabIndex        =   1
      Top             =   300
      Width           =   1035
   End
   Begin VB.CheckBox chkEliminarArchivos 
      Caption         =   "Eliminar archivos existentes"
      Height          =   210
      Left            =   2220
      TabIndex        =   15
      Top             =   4200
      Value           =   1  'Checked
      Width           =   2655
   End
   Begin VB.CheckBox chkFormularioAnulado 
      Caption         =   "Certificados y C.P. Anulados"
      Height          =   210
      Left            =   3360
      TabIndex        =   10
      Top             =   2460
      Value           =   1  'Checked
      Width           =   3375
   End
   Begin VB.CommandButton cmdCarpeta 
      Caption         =   "..."
      Height          =   300
      Left            =   6570
      TabIndex        =   13
      Top             =   3360
      Width           =   255
   End
   Begin VB.TextBox txtCarpeta 
      Height          =   315
      Left            =   2220
      TabIndex        =   12
      Top             =   3360
      Width           =   4335
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "Exportar..."
      Height          =   435
      Left            =   5640
      TabIndex        =   16
      Top             =   4560
      Width           =   1155
   End
   Begin VB.CheckBox chkFormulario1116RT 
      Caption         =   "Certificados de Retiro / Transferencia"
      Height          =   210
      Left            =   3360
      TabIndex        =   9
      Top             =   2100
      Value           =   1  'Checked
      Width           =   3375
   End
   Begin VB.CheckBox chkFormulario1116B 
      Caption         =   "Liquidaciones"
      Height          =   210
      Left            =   180
      TabIndex        =   8
      Top             =   2460
      Value           =   1  'Checked
      Width           =   3375
   End
   Begin VB.CheckBox chkFormulario1116A 
      Caption         =   "Certificados de Depósito"
      Height          =   210
      Left            =   180
      TabIndex        =   7
      Top             =   2100
      Value           =   1  'Checked
      Width           =   3375
   End
   Begin VB.Label lblPresentacionFecha 
      AutoSize        =   -1  'True
      Caption         =   "Fecha de Presentación:"
      Height          =   210
      Left            =   180
      TabIndex        =   3
      Top             =   720
      Width           =   1710
   End
   Begin VB.Label lblPresentacionTipo 
      AutoSize        =   -1  'True
      Caption         =   "Tipo de Presentación:"
      Height          =   210
      Left            =   180
      TabIndex        =   0
      Top             =   300
      Width           =   1560
   End
   Begin VB.Label lblCarpeta 
      AutoSize        =   -1  'True
      Caption         =   "Ubicación de los archivos:"
      Height          =   210
      Left            =   180
      TabIndex        =   11
      Top             =   3420
      Width           =   1905
   End
End
Attribute VB_Name = "frmFormulario_Exportar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim PresentacionFecha As Date
    
    Dim Index As Integer
    
    dtpPresentacionFecha.Value = DateAdd("d", -1, Date)
    dtpPresentacionFecha.MaxDate = Date
    
    PresentacionFecha = DateAdd("d", -Weekday(Date) - 1, Date)
    
    For Index = 0 To 730 Step 7
        cboPresentacionFecha.AddItem Format(PresentacionFecha - Index, "Short Date")
        cboPresentacionFecha.ItemData(cboPresentacionFecha.NewIndex) = CLng(PresentacionFecha - Index)
    Next Index
    cboPresentacionFecha.ListIndex = 0
    
    txtCarpeta.Text = CSM_Registry.GetValue_FromApplication_LocalMachine("Export", "DestinationFolder", "", csrdtString)
End Sub

Private Sub optPresentacionTipoDiaria_Click()
    dtpPresentacionFecha.Visible = optPresentacionTipoDiaria.Value
    cboPresentacionFecha.Visible = optPresentacionTipoSemanal.Value
    Call ShowInfoFechas
End Sub

Private Sub optPresentacionTipoSemanal_Click()
    dtpPresentacionFecha.Visible = optPresentacionTipoDiaria.Value
    cboPresentacionFecha.Visible = optPresentacionTipoSemanal.Value
    Call ShowInfoFechas
End Sub

Private Sub dtpPresentacionFecha_Change()
    Call ShowInfoFechas
End Sub

Private Sub cboPresentacionFecha_Click()
    Call ShowInfoFechas
End Sub

Private Sub ShowInfoFechas()
    If optPresentacionTipoDiaria.Value Then
        txtPresentacionInfo.Text = ""
    Else
        txtPresentacionInfo.Text = " Fecha inicial:" & vbTab & Format(DateAdd("d", -6, CDate(cboPresentacionFecha.ItemData(cboPresentacionFecha.ListIndex))), "Short Date") & vbCrLf
        txtPresentacionInfo.Text = txtPresentacionInfo.Text & " Fecha final:" & vbTab & cboPresentacionFecha.Text & vbCrLf
        txtPresentacionInfo.Text = txtPresentacionInfo.Text & " Vencimiento: " & vbTab & Format(DateAdd("d", 1, CDate(cboPresentacionFecha.ItemData(cboPresentacionFecha.ListIndex))), "Short Date") & " al " & Format(DateAdd("d", 3, CDate(cboPresentacionFecha.ItemData(cboPresentacionFecha.ListIndex))), "Short Date") & vbCrLf
    End If
End Sub

Private Sub cmdCarpeta_Click()
    Dim Folder As String
    
    Folder = CSM_CommonDialog.BrowseForFolder(Me.hwnd, "Seleccionar ubicación de destino")
    If Folder <> "" Then
        txtCarpeta.Text = Folder
    End If
End Sub

Private Sub cmdExport_Click()
    Dim FechaDesde As Date
    Dim FechaHasta As Date
    Dim CarpetaDestino As String
    Dim CarpetaDestinoParaGuardar As String
    Dim EliminarArchivos As Boolean
    
    Dim Formularios1116A_Cabecera_Cantidad As Long
    Dim Formularios1116A_Detalle_Cantidad As Long
    Dim Formularios1116B_Cabecera_Cantidad As Long
    Dim Formularios1116B_Detalle_Cantidad As Long
    Dim Formularios1116RT_Retiro_Cabecera_Cantidad As Long
    Dim Formularios1116RT_Retiro_Detalle_Cantidad As Long
    Dim Formularios1116RT_Transferencia_Cantidad As Long
    Dim Formularios_Anulados_Cantidad As Long
    
    Dim ResultText As String
    
    If txtCarpeta.Text = "" Then
        MsgBox "Debe especificar la carpeta de destino de los archivos.", vbInformation, App.Title
        txtCarpeta.SetFocus
        Exit Sub
    End If
    
    If (chkFormulario1116A.Value + chkFormulario1116B.Value + chkFormulario1116RT.Value + chkFormularioAnulado.Value) = vbUnchecked Then
        MsgBox "Debe seleccionar al menos un Tipo de Certificado.", vbInformation, App.Title
        chkFormulario1116A.SetFocus
        Exit Sub
    End If
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    If optPresentacionTipoDiaria.Value Then
        FechaDesde = dtpPresentacionFecha.Value
        FechaHasta = dtpPresentacionFecha.Value
    Else
        FechaHasta = CDate(cboPresentacionFecha.ItemData(cboPresentacionFecha.ListIndex))
        FechaDesde = DateAdd("d", -6, FechaHasta)
    End If
    
    CarpetaDestino = Trim(txtCarpeta.Text)
    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    CarpetaDestinoParaGuardar = CarpetaDestino
    
    If chkCrearSubCarpeta.Value = vbChecked Then
        CarpetaDestino = CarpetaDestino & Format(FechaHasta, "yyyy-mm-dd") & "\"
        If FileSystem.Dir(CarpetaDestino, vbDirectory) = "" Then
            FileSystem.MkDir CarpetaDestino
        End If
    End If
    
    EliminarArchivos = chkEliminarArchivos.Value = vbChecked
    
    If chkFormulario1116A.Value = vbChecked Then
        Formularios1116A_Cabecera_Cantidad = ExportarFormularios1116A_Cabecera(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116A_Cabecera_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
        Formularios1116A_Detalle_Cantidad = ExportarFormularios1116A_Detalle(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116A_Detalle_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
    End If
    If chkFormulario1116B.Value = vbChecked Then
        Formularios1116B_Cabecera_Cantidad = ExportarFormularios1116B_Cabecera(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116B_Cabecera_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
        Formularios1116B_Detalle_Cantidad = ExportarFormularios1116B_Detalle(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116B_Detalle_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
    End If
    If chkFormulario1116RT.Value = vbChecked Then
        Formularios1116RT_Retiro_Cabecera_Cantidad = ExportarFormularios1116RT_Retiro_Cabecera(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116RT_Retiro_Cabecera_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
        Formularios1116RT_Retiro_Detalle_Cantidad = ExportarFormularios1116RT_Retiro_Detalle(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116RT_Retiro_Detalle_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
        Formularios1116RT_Transferencia_Cantidad = ExportarFormularios1116RT_Transferencia(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios1116RT_Transferencia_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
    End If
    If chkFormularioAnulado.Value = vbChecked Then
        Formularios_Anulados_Cantidad = ExportarFormulariosAnulados(FechaDesde, FechaHasta, CarpetaDestino, EliminarArchivos)
        If Formularios_Anulados_Cantidad = -1 Then
            MsgBox "Debido al error ocurrido, se interrumpió el proceso de exportación.", vbExclamation, App.Title
            Exit Sub
        End If
    End If
    
    If (Formularios1116A_Cabecera_Cantidad + Formularios1116A_Detalle_Cantidad + Formularios1116B_Cabecera_Cantidad + Formularios1116B_Detalle_Cantidad + Formularios1116RT_Retiro_Cabecera_Cantidad + Formularios1116RT_Retiro_Detalle_Cantidad + Formularios1116RT_Transferencia_Cantidad + Formularios_Anulados_Cantidad) = 0 Then
        MsgBox "No se han encontrado registros en el período para Exportar.", vbInformation, App.Title
        Exit Sub
    Else
        ResultText = "Se han exportado:" & vbCrLf & vbCrLf
        ResultText = ResultText & "Formularios 1116A (Cabecera): " & Formularios1116A_Cabecera_Cantidad & vbCrLf
        ResultText = ResultText & "Formularios 1116A (Detalle): " & Formularios1116A_Detalle_Cantidad & vbCrLf & vbCrLf
        ResultText = ResultText & "Formularios 1116B (Cabecera): " & Formularios1116B_Cabecera_Cantidad & vbCrLf
        ResultText = ResultText & "Formularios 1116B (Detalle): " & Formularios1116B_Detalle_Cantidad & vbCrLf & vbCrLf
        ResultText = ResultText & "Formularios 1116RT (Retiro - Cabecera): " & Formularios1116RT_Retiro_Cabecera_Cantidad & vbCrLf
        ResultText = ResultText & "Formularios 1116RT (Retiro - Detalle): " & Formularios1116RT_Retiro_Detalle_Cantidad & vbCrLf
        ResultText = ResultText & "Formularios 1116RT (Transferencia): " & Formularios1116RT_Transferencia_Cantidad & vbCrLf & vbCrLf
        ResultText = ResultText & "Formularios Anulados: " & Formularios_Anulados_Cantidad
        
        MsgBox ResultText, vbInformation, App.Title
    End If
    
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Export", "DestinationFolder", Trim(txtCarpeta.Text) & IIf(Right(Trim(txtCarpeta.Text), 1) = "\", "", "\"))
    
    Exit Sub
    
ErrorHandler:
    CSM_Error.ShowErrorMessage "Forms.Formulario_Exportar.Export", "Error al exportar los archivos."
End Sub

Private Function ExportarFormularios1116A_Cabecera(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "C1116A.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Form. 1116A (Cabecera)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116A_Cabecera_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificado").Value), "0", 12)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEstablecimiento").Value, "0", 6)
        
        'DATOS PRODUCTOR
        TextStream = TextStream & CSM_String.CleanNotNumericChars(recData("CUITProductor").Value)
        TextStream = TextStream & CSM_String.PadStringRight(recData("RazonSocialProductor").Value, " ", 30)
        TextStream = TextStream & recData("TipoDomicilioProductor").Value
        TextStream = TextStream & CSM_String.PadStringRight(recData("CalleORutaProductor").Value & "", " ", 35)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(IIf(IsNull(recData("NumeroOKilometroProductor").Value), 0, recData("NumeroOKilometroProductor").Value), "00000.00")
        TextStream = TextStream & CSM_String.PadStringRight(recData("PisoProductor").Value & "", " ", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("OficinaODepartamentoProductor").Value & "", " ", 3)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoLocalidadProductor").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoPartidoProductor").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("CodigoPostalProductor").Value & "", " ", 8)
        
        'DATOS CEREAL
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEspecie").Value, "0", 3)
        TextStream = TextStream & recData("Cosecha").Value
        
        'TARIFAS
        TextStream = TextStream & CSM_String.PadStringLeft(recData("AlmacenajeDiasLibres").Value, "0", 3)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("TarifaAlmacenajeCada100Kg").Value, "0000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("GastosGenerales").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("Zarandeo").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("SecadoDe").Value, "000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("SecadoHasta").Value, "000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("TarifaSecado").Value, "0000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("PuntoExceso").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("TarifaOtros").Value, "0000.00")
        
        'ORIGEN Y DESTINO
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoPartidoOrigen").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoPartidoEntrega").Value, "0", 5)
        
        'ANALISIS
        TextStream = TextStream & CSM_String.PadStringRight(recData("NumeroAnalisis").Value, " ", 10)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NumeroBoletin").Value, "0", 8)
        TextStream = TextStream & IIf(IsNull(recData("FechaAnalisis").Value), "00000000", Format(recData("FechaAnalisis").Value, "ddmmyyyy"))
        TextStream = TextStream & CSM_String.PadStringLeft(recData("Grado").Value, "0", 2)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("Factor").Value, "000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("ContenidoProteico").Value, "000.00")
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CUITLaboratorio").Value, "0", 11)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NombreLaboratorio").Value, " ", 40)
        
        'KILOGRAMOS
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("PesoBruto").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("MermaVolatilKilogramo").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("MermaZarandeoKilogramo").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("MermaSecadoKilogramo").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("PesoNeto").Value, "00000000.00")
        
        'PIE
        TextStream = TextStream & Format(recData("FechaCierre").Value, "ddmmyyyy")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("ImporteIVAServicios").Value, "00000000.00")
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("TotalServicios").Value, "00000000.00")
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NumeroCAC").Value, "0", 14)
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116A_Cabecera = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116A_Cabecera = -1
    ShowErrorMessage "Forms.ExportarFormularios1116A_Cabecera", "Error al exportar los Certificados de Depósito (Cabecera)." '& vbCr & vbCr & "Certificado de Depósito: " & mIDFormulario1116A & vbCr & "Certificado Nº: " & mFormularioNumero
End Function

Private Function ExportarFormularios1116A_Detalle(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "R1116A.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Certificados de Depósito (Detalle)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116A_Detalle_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificado").Value), "0", 12)
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCartaPorte").Value), "0", 12)
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificadoAsociado").Value), "0", 12)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("KilogramosBrutos").Value, "00000000.00")
        TextStream = TextStream & Format(recData("FechaRemesa").Value, "ddmmyyyy")
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116A_Detalle = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116A_Detalle = -1
    ShowErrorMessage "Forms.ExportarFormularios1116A_Detalle", "Error al exportar los Certificados de Depósito (Detalle)." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Function ExportarFormularios1116B_Cabecera(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "C1116BU.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Liquidaciones (Cabecera)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116B_Cabecera_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificado").Value), "0", 12)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEspecie").Value, "0", 3)
        
        'DATOS PRODUCTOR
        TextStream = TextStream & CSM_String.CleanNotNumericChars(recData("CUITProductor").Value)
        TextStream = TextStream & CSM_String.PadStringRight(recData("RazonSocialProductor").Value, " ", 30)
        TextStream = TextStream & recData("TipoDomicilioProductor").Value
        TextStream = TextStream & CSM_String.PadStringRight(recData("CalleORutaProductor").Value & "", " ", 35)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(IIf(IsNull(recData("NumeroOKilometroProductor").Value), 0, recData("NumeroOKilometroProductor").Value), "00000.00")
        TextStream = TextStream & CSM_String.PadStringRight(recData("PisoProductor").Value & "", " ", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("OficinaODepartamentoProductor").Value & "", " ", 5)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoLocalidadProductor").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoPartidoProductor").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("CodigoPostalProductor").Value & "", " ", 8)
        
        'DATOS CORREDOR
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CUITCorredor").Value, "0", 11)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("RazonSocialCorredor").Value, " ", 30)
        
        'IMPORTES
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("ImporteRetencionIVA").Value, "00000000.00")
        TextStream = TextStream & recData("SignoPesoNetoKilogramo").Value
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("PesoNetoKilogramo").Value, "00000000.00")
        TextStream = TextStream & recData("SignoImporteBruto").Value
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("ImporteBruto").Value, "00000000.00")
        
        'PIE
        TextStream = TextStream & Format(recData("FechaCierre").Value, "ddmmyyyy")
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NumeroCAC").Value, "0", 14)
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116B_Cabecera = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116B_Cabecera = -1
    ShowErrorMessage "Forms.ExportarFormularios1116B_Cabecera", "Error al exportar las Liquidaciones (Cabecera)." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Function ExportarFormularios1116B_Detalle(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "R1116B.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Liquidaciones (Detalle)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116B_Detalle_ListForExport"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificado").Value), "0", 12)
        TextStream = TextStream & recData("TipoCertificadoART").Value
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificadoART").Value), "0", 12)

        recData.MoveNext

        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount

    recData.Close
    Set recData = Nothing

    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116B_Detalle = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116B_Detalle = -1
    ShowErrorMessage "Forms.ExportarFormularios1116B_Detalle", "Error al exportar las Liquidaciones (Detalle)." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Function ExportarFormularios1116RT_Retiro_Cabecera(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "C1116R.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Certificados RT (Retiro-Cabecera)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    'CABECERA DE LOS FORMULARIOS DE RETIRO
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116RT_Retiro_Cabecera_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroFormularioRT").Value), "0", 12)
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroFormularioA").Value), "0", 12)
        TextStream = TextStream & IIf(CBool(recData("GeneraNuevoF1116A").Value), "1", "2")
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEstablecimiento").Value, "0", 6)
        
        'DATOS CEREAL
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEspecie").Value, "0", 3)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoTipoGrano").Value, "0", 2)
        
        'DATOS DEPOSITANTE
        TextStream = TextStream & CSM_String.CleanNotNumericChars(recData("CUITDepositante").Value)
        TextStream = TextStream & CSM_String.PadStringRight(recData("RazonSocialDepositante").Value, " ", 30)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoLocalidadDepositante").Value, "0", 5)
        TextStream = TextStream & recData("TipoDomicilioDepositante").Value
        TextStream = TextStream & CSM_String.PadStringRight(recData("CalleORutaDepositante").Value & "", " ", 35)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(IIf(IsNull(recData("NumeroOKilometroDepositante").Value), 0, recData("NumeroOKilometroDepositante").Value), "00000.00")
        TextStream = TextStream & CSM_String.PadStringRight(recData("PisoDepositante").Value & "", " ", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("OficinaODepartamentoDepositante").Value & "", " ", 3)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoPartidoDepositante").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("CodigoPostalDepositante").Value, " ", 8)
        
        'PIE
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NumeroCAC").Value, "0", 14)
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116RT_Retiro_Cabecera = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116RT_Retiro_Cabecera = -1
    ShowErrorMessage "Forms.ExportarFormularios1116RT_Retiro_Cabecera", "Error al exportar los Certificados RT (Retiro - Cabecera)." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Function ExportarFormularios1116RT_Retiro_Detalle(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "R1116R.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Certificados RT (Retiro-Detalle)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    'DETALLE DE LOS FORMULARIOS DE RETIRO
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116RT_Retiro_Detalle_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroFormularioRT").Value), "0", 12)
        TextStream = TextStream & Format(recData("FechaRetiro").Value, "ddmmyyyy")
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCartaPorte").Value), "0", 12)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("KilogramosRetiro").Value, "00000000.00")
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
        
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116RT_Retiro_Detalle = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116RT_Retiro_Detalle = -1
    ShowErrorMessage "Forms.ExportarFormularios1116RT_Retiro_Detalle", "Error al exportar los Certificados RT (Retiro - Detalle)." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Function ExportarFormularios1116RT_Transferencia(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "1116T.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        End If
    End If
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Certificados RT (Transferencia)..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116RT_Transferencia_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroFormularioRT").Value), "0", 12)
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroFormularioA").Value), "0", 12)
        TextStream = TextStream & Format(recData("FechaTransferencia").Value, "ddmmyyyy")
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEstablecimiento").Value, "0", 6)
        
        'DATOS CEREAL
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoEspecie").Value, "0", 3)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoTipoGrano").Value, "0", 2)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(recData("KilogramosTransferencia").Value, "00000000.00")
        
        'DATOS DEPOSITANTE
        TextStream = TextStream & CSM_String.CleanNotNumericChars(recData("CUITDepositante").Value)
        TextStream = TextStream & CSM_String.PadStringRight(recData("RazonSocialDepositante").Value, " ", 30)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoLocalidadDepositante").Value, "0", 5)
        TextStream = TextStream & recData("TipoDomicilioDepositante").Value
        TextStream = TextStream & CSM_String.PadStringRight(recData("CalleORutaDepositante").Value & "", " ", 35)
        TextStream = TextStream & CSM_String.FormatDoubleToString_NoGrouping_CommaAsDecimal(IIf(IsNull(recData("NumeroOKilometroDepositante").Value), 0, recData("NumeroOKilometroDepositante").Value), "00000.00")
        TextStream = TextStream & CSM_String.PadStringRight(recData("PisoDepositante").Value & "", " ", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("OficinaODepartamentoDepositante").Value & "", " ", 3)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoPartidoDepositante").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringRight(recData("CodigoPostalDepositante").Value, " ", 8)
        
        'DATOS RECEPTOR
        TextStream = TextStream & CSM_String.CleanNotNumericChars(recData("CUITReceptor").Value)
        TextStream = TextStream & CSM_String.PadStringRight(recData("RazonSocialReceptor").Value, " ", 50)
        TextStream = TextStream & recData("SituacionAnteIVAReceptor").Value
        TextStream = TextStream & CSM_String.PadStringRight(recData("DomicilioFiscalReceptor").Value, " ", 70)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoLocalidadReceptor").Value, "0", 5)
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NumeroONCCAReceptor").Value & "", "0", 10)
        TextStream = TextStream & recData("RolReceptor").Value
        
        'PIE
        TextStream = TextStream & CSM_String.PadStringLeft(recData("NumeroCAC").Value, "0", 14)
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormularios1116RT_Transferencia = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormularios1116RT_Transferencia = -1
    ShowErrorMessage "Forms.ExportarFormularios1116RT_Transferencia", "Error al exportar los Certificados RT (Transferencia)." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Function ExportarFormulariosAnulados(ByVal FechaDesde As Date, FechaHasta As Date, ByVal CarpetaDestino As String, ByVal EliminarArchivosAntes As Boolean) As Long
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim RecordCount As Long
    Dim FileNumber As Integer
    
    Dim DeletePreviousFile As VbMsgBoxResult
    Dim TextStream As String
    
    Const FILENAME As String = "ANULAFIP.txt"

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    CarpetaDestino = CarpetaDestino & IIf(Right(CarpetaDestino, 1) = "\", "", "\")
    If FileSystem.Dir(CarpetaDestino & FILENAME) <> "" Then
        If EliminarArchivosAntes Then
            FileSystem.Kill CarpetaDestino & FILENAME
        Else
            DeletePreviousFile = MsgBox("Ya existe el archivo (" & FILENAME & ") en la carpeta de destino (" & CarpetaDestino & ")." & vbCr & vbCr & "<Sí> para sobreescribirlo, <No> para agregar al final del archivo", vbExclamation + vbYesNoCancel, App.Title)
            If DeletePreviousFile = VbMsgBoxResult.vbCancel Then
                Exit Function
            End If
        End If
    End If
    
    Screen.MousePointer = vbHourglass

    CSF_Status.lblStatus.Caption = "Exportando Certificados Anulados..."
    CSF_Status.Show
    CSF_Status.SetFocus
    DoEvents
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario_Anulado_ListForExport"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , FechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , FechaHasta)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    TextStream = ""
    Do While Not recData.EOF
        'FORMULARIO
        TextStream = TextStream & CSM_String.PadStringLeft(recData("CodigoFormulario").Value, "0", 2)
        TextStream = TextStream & CSM_String.PadStringLeft(CSM_String.CleanNotNumericChars(recData("NumeroCertificadoAnular").Value), "0", 12)
        TextStream = TextStream & recData("Motivo").Value
        
        recData.MoveNext
        
        If Not recData.EOF Then
            TextStream = TextStream & vbCrLf
        End If
    Loop
    
    RecordCount = recData.RecordCount
    
    recData.Close
    Set recData = Nothing
    
    'SI CORRESPONDE, ABRO EL ARCHIVO Y GRABO LOS DATOS
    If TextStream <> "" Then
        FileNumber = FreeFile()
        If DeletePreviousFile = VbMsgBoxResult.vbYes Then
            Open CarpetaDestino & FILENAME For Output As #FileNumber
        Else
            Open CarpetaDestino & FILENAME For Append As #FileNumber
        End If
        Print #FileNumber, TextStream
        Close #FileNumber
    End If
    
    Unload CSF_Status
    Set CSF_Status = Nothing

    ExportarFormulariosAnulados = RecordCount
    Screen.MousePointer = vbDefault
    Exit Function
    
ErrorHandler:
    ExportarFormulariosAnulados = -1
    ShowErrorMessage "Forms.ExportarFormulariosAnulados", "Error al exportar los Certificados Anulados." '& vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function
