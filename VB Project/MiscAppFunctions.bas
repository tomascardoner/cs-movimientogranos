Attribute VB_Name = "MiscAppFunctions"
Option Explicit

Public Sub FillSubmenuWithReports(ByVal reportFilenamePrefix As String, ByRef menus As ButtonMenus)
    Dim cReports As Collection
    Dim reportName As Variant
    
    Const REPORT_PARAMETERTYPE_LEN = 4
    
    Set cReports = CSM_File.GetCollectionOfFiles(pDatabase.ReportsPath, reportFilenamePrefix & "*.rpt", False, True, False)
    For Each reportName In cReports
        If Left(Right(CStr(reportName), REPORT_PARAMETERTYPE_LEN), 1) = "@" Then
            menus.Add , CStr(reportName), Mid(CStr(reportName), Len(reportFilenamePrefix) + 1, Len(CStr(reportName)) - Len(reportFilenamePrefix) - (REPORT_PARAMETERTYPE_LEN + 1))
        Else
            menus.Add , CStr(reportName), Mid(CStr(reportName), Len(reportFilenamePrefix) + 1)
        End If
    Next reportName
End Sub

Public Function ShowReport(ByVal reportFilename As String, ByVal reportName, ByVal keyName As String, ByVal keyValue As Long, ByVal recordSelectionFormula As String) As Boolean
    Dim Report As CSC_Report
    
    Screen.MousePointer = vbHourglass
    
    Set Report = New CSC_Report
    With Report
        .ParentForm_hWnd = frmMDI.hwnd
        .FILENAME = pDatabase.ReportsPath & reportFilename & "." & REPORT_FILE_EXTENSION
        .WindowTitle = reportName
        If Right(reportFilename, 4) = REPORT_PARAMETER_KEY Then
            .ParameterAdd(keyName, "", csrpdtNumberInteger, False, False, True).ParameterValue = keyValue
        End If
        If .OpenReport(True) Then
            If Right(reportFilename, 4) <> REPORT_PARAMETER_KEY Then
                .Report.recordSelectionFormula = .Report.recordSelectionFormula & recordSelectionFormula
            End If
            Call .PreviewReport(False)
        End If
    End With
    
    Screen.MousePointer = vbDefault
    ShowReport = True
    Exit Function

ErrorHandler:
    CSM_Error.ShowErrorMessage "Modules.MiscAppFunctions.ShowReport", "Error al mostrar el Reporte."
End Function
