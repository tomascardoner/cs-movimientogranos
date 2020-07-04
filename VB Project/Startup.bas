Attribute VB_Name = "Startup"
Option Explicit

'///////////////////////////////////////////////////////////////////
'RUNTIME
Public pIsCompiled As Boolean
Public pTrapErrors As Boolean

'///////////////////////////////////////////////////////////////////
'CONFIGURATION
Public pParametro As Parametro
Public pCSC_Parameter As CSC_Parameter
Public pRegionalSettings As CSC_RegionalSettings

'///////////////////////////////////////////////////////////////////
'DATABASE
Public pDatabase As CSC_Database_ADO_SQL
Public Const DATABASE_IDENTIFIER = "{11BE383C-7B52-4d26-9822-AD15A20FE793}"

'///////////////////////////////////////////////////////////////////
'SESSION DATA
Public pIDUsuario As Byte

'///////////////////////////////////////////////////////////////////
'REPORTS
Public pCRAXDRTApplication As CRAXDRT.Application

Private Sub Main()
    Dim PasswordErrorCount As Long
    Dim ErrorNumber As Long
    Dim StartTime As Date
    Dim Usuario As Usuario

    If App.PrevInstance Then
        CSM_Instance.ActivatePrevious
        Exit Sub
    End If
    
    pIsCompiled = IsCompiled()
    pTrapErrors = pIsCompiled
    
    CSM_ApplicationLog.InitLogging
    
    Screen.MousePointer = vbHourglass
    
    CSM_ApplicationLog.WriteLogEvent "*** Application Starts ***", vbLogEventTypeInformation, False
    
    '//////////////////////////////////////////////////////////////////
    'OBTENGO LOS PARAMETROS DE LA REGISTRY
    Set pParametro = New Parametro
    If Not pParametro.LoadParametersRegistry() Then
        TerminateApplication
        Exit Sub
    End If
    
    frmSplash.MousePointer = vbHourglass
    frmSplash.Show
    DoEvents
    
    PasswordErrorCount = -1
    
    Set pDatabase = New CSC_Database_ADO_SQL
    pDatabase.ParametersSaveToRegistry = False
    Call pDatabase.LoadParameters
    
DATABASECHECKPARAMETERS:
    '//////////////////////////////////////////////////////////////////
    'CHEQUEO LOS PARAMETROS DE CONEXION A LA BASE DE DATOS
    'PRIMERO CHEQUEO QUE ESTEN CARGADOS LOS PARAMETROS FUNDAMENTALES
    If pDatabase.Provider = "" Or pDatabase.UserID = "" Or (pDatabase.DataSource = "") Then
        Screen.MousePointer = vbDefault
        CSF_Database.Show vbModal, frmSplash
        If CSF_Database.Tag = "CANCEL" Then
            TerminateApplication
            Exit Sub
        End If
        Unload CSF_Database
        Set CSF_Database = Nothing
        GoTo DATABASECHECKPARAMETERS
    End If

    frmSplash.MousePointer = vbHourglass
    DoEvents
    
    PasswordErrorCount = -1
    
DATABASEOPEN:
    '//////////////////////////////////////////////////////////////////
    'REALIZO LA CONEXION A LA BASE DE DATOS (ADO)
    ErrorNumber = pDatabase.Connect
    Select Case ErrorNumber
        Case -1
            'SE ABRIO LA CONEXION CON LA BASE DE DATOS
        Case Else
            'ERROR
            Screen.MousePointer = vbDefault
            CSF_Database.Show vbModal, frmSplash
            If CSF_Database.Tag = "CANCEL" Then
                TerminateApplication
                Exit Sub
            End If
            Unload CSF_Database
            Set CSF_Database = Nothing
            GoTo DATABASECHECKPARAMETERS
    End Select
    
    '//////////////////////////////////////////////////////////////////
    'VERIFICO QUE LA BASE DE DATOS SEA LA CORRECTA
    If Not pDatabase.CheckDatabase() Then
        Screen.MousePointer = vbDefault
        CSF_Database.Show vbModal, frmSplash
        If CSF_Database.Tag = "CANCEL" Then
            TerminateApplication
            Exit Sub
        End If
        Unload CSF_Database
        Set CSF_Database = Nothing
        GoTo DATABASECHECKPARAMETERS
    End If
    
    '//////////////////////////////////////////////////////////////////
    'COPIO LOS ARCHIVOS DE BACKUP
    If pIsCompiled Then
        If pDatabase.Backup_RemoteFolder <> "" And pDatabase.Backup_LocalFolder <> "" And pDatabase.Backup_FileName <> "" Then
            CSF_Status.lblStatus.Caption = "Realizando copia de seguridad..."
            CSF_Status.Show
            DoEvents
        
            Call CSM_File.CopyFilesFromFolder(pDatabase.Backup_RemoteFolder, pDatabase.Backup_LocalFolder, pDatabase.Backup_FileName)
            
            Unload CSF_Status
            Set CSF_Status = Nothing
        End If
    End If
    
    Set pCSC_Parameter = New CSC_Parameter
    
    '//////////////////////////////////////////////////////////////////
    'OBTENGO LOS PARAMETROS DE LA BASE DE DATOS
    If Not pParametro.LoadParametersDatabase() Then
        Unload frmMDI
        Exit Sub
    End If
    
    CSM_ApplicationLog.WriteLogEvent "Load MDI Form: INIT", vbLogEventTypeInformation, pParametro.LogAccion_Enabled
    Load frmMDI
    CSM_ApplicationLog.WriteLogEvent "Load MDI Form: DONE", vbLogEventTypeInformation, pParametro.LogAccion_Enabled
        
    frmMDI.Caption = App.Title & IIf(pParametro.DatabaseDescription = "", "", " - " & pParametro.DatabaseDescription)
    
    StartTime = Now
    frmSplash.lblLicenseCompany.Caption = pParametro.CompanyName
    frmMDI.stbMain.Panels("COMPANY_NAME").Text = " " & pParametro.CompanyName & " "
    
    '/////////////////////////////////////////////////////////////////
    'REGIONAL SETTINGS
    Set pRegionalSettings = New CSC_RegionalSettings
    
    '/////////////////////////////////////////////////////////////////
    'ASK FOR LOGIN
    Set Usuario = New Usuario
    If pIsCompiled Then
        Load frmLogin
        frmLogin.LoadData Usuario
    End If
    
    If pIsCompiled Then
        Do While DateDiff("s", StartTime, Now) < 4
            DoEvents
        Loop
    End If
        
    frmMDI.Show
    
    Unload frmSplash
    Set frmSplash = Nothing
    
    Screen.MousePointer = vbDefault

    '/////////////////////////////////////////////////////////////////
    'USUARIO
    If pIsCompiled Then
        frmLogin.txtNombre.Text = CSM_Registry.GetValue_FromApplication_CurrentUser("", "LastUserName", "", csrdtString)
        If frmLogin.txtNombre.Text <> "" Then
            frmLogin.txtNombre.TabIndex = 7
            frmLogin.txtNombre.TabIndex = 7
        End If
        frmLogin.Show vbModal, frmMDI
        If Usuario.IDUsuario = 0 Then
            Set Usuario = Nothing
            Unload frmMDI
            Exit Sub
        End If
        If Not Usuario.LogIn() Then
            Set Usuario = Nothing
            Unload frmMDI
            Exit Sub
        End If
    Else
        Usuario.IDUsuario = USUARIO_ID_ADMINISTRATOR
        If Not Usuario.Load() Then
            Set Usuario = Nothing
            Unload frmMDI
            Exit Sub
        End If
        If Not Usuario.LogIn() Then
            Set Usuario = Nothing
            Unload frmMDI
            Exit Sub
        End If
    End If
    pIDUsuario = Usuario.IDUsuario
    Set Usuario = Nothing
End Sub


' *****************************************************************************
' Purpose:  Unload all Objects and Forms
'
' Method:
'
' Inputs:
'       None
'
' Outputs:
'       None
'
' Errors:
'       This Function no raise Errors.
'
' Asserts:
'
' Developer                 Date            Comments
' ---------                 ----            --------
' Tomas A. Cardoner         23-Jan-2002     Initial creation.
' *****************************************************************************
Public Sub TerminateApplication()
    Static Running As Boolean
    
    If Running Then
        Exit Sub
    End If
    
    Running = True
    CSM_Forms.UnloadAll
    If Not pDatabase Is Nothing Then
        Set pDatabase = Nothing
    End If
    Set pRegionalSettings = Nothing
    Set pParametro = Nothing
    Set pCRAXDRTApplication = Nothing
    
    CSM_ApplicationLog.WriteLogEvent "*** Application Terminate ***", vbLogEventTypeInformation, False
    Running = False
End Sub

