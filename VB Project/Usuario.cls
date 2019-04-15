VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Usuario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDUsuario As Integer
Private mNombre As String
Private mPassword As String
Private mIDUsuarioGrupo As Integer
Private mActivo As Integer

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDUsuario() As Integer
    IDUsuario = mIDUsuario
End Property

Public Property Let IDUsuario(ByVal Value As Integer)
    If Value <> mIDUsuario Then
        mIsDirty = True
    End If
    mIDUsuario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Nombre() As String
    Nombre = mNombre
End Property

Public Property Let Nombre(ByVal Value As String)
    If Value <> mNombre Then
        mIsDirty = True
    End If
    mNombre = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Password() As String
    Password = mPassword
End Property

Public Property Let Password(ByVal Value As String)
    If Value <> mPassword Then
        mIsDirty = True
    End If
    mPassword = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDUsuarioGrupo() As Integer
    IDUsuarioGrupo = mIDUsuarioGrupo
End Property

Public Property Let IDUsuarioGrupo(ByVal Value As Integer)
    If Value <> mIDUsuarioGrupo Then
        mIsDirty = True
    End If
    mIDUsuarioGrupo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Activo() As Integer
    Activo = mActivo
End Property

Public Property Let Activo(ByVal Value As Integer)
    If Value <> mActivo Then
        mIsDirty = True
    End If
    mActivo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IsNew() As Boolean
    IsNew = mIsNew
End Property

Public Property Get IsCopy() As Boolean
    IsCopy = mIsCopy
End Property

Public Property Get IsDirty() As Boolean
    IsDirty = mIsDirty
End Property

Public Sub MakeDirty()
    mIsDirty = True
End Sub

Public Property Get NoMatch() As Boolean
    NoMatch = mNoMatch
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get NoMatchRaiseError() As Boolean
    NoMatchRaiseError = mNoMatchRaiseError
End Property

Public Property Let NoMatchRaiseError(ByVal Value As Boolean)
    mNoMatchRaiseError = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RefreshListSkip() As Boolean
    RefreshListSkip = mRefreshListSkip
End Property

Public Property Let RefreshListSkip(ByVal Value As Boolean)
    mRefreshListSkip = Value
End Property

Public Sub RefreshList()
    'RefreshList_Module.Usuario IDUsuario
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Function Load() As Boolean
    Dim cmdSP As ADODB.command
    Dim recData As ADODB.Recordset

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Call InitializeValues

    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Usuario_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, , mIDUsuario)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Screen.MousePointer = vbHourglass

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Usuario.Load", "Error al obtener los datos del Usuario." & vbCr & vbCr & "IDUsuario: " & IDUsuario
End Function

Public Function LoadByNombre() As Boolean
    Dim cmdSP As ADODB.command
    Dim recData As ADODB.Recordset
    Dim NombreSave As String

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    NombreSave = mNombre
    Call InitializeValues
    mNombre = NombreSave

    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Usuario_GetByNombre"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Screen.MousePointer = vbHourglass

    LoadByNombre = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Usuario.LoadByNombre", "Error al obtener los datos del Usuario." & vbCr & vbCr & "Nombre: " & Nombre
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDUsuario = recData("IDUsuario").Value
        mNombre = recData("Nombre").Value
        mPassword = recData("Password").Value
        mIDUsuarioGrupo = recData("IDUsuarioGrupo").Value
        mActivo = recData("Activo").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Usuario.GetDataFromRecordset", "Error al obtener los datos del Usuario." & vbCr & vbCr & "IDUsuario: " & IDUsuario
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDUsuario = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        If mIsNew Then
            .CommandText = "usp_Usuario_Add"
        Else
            .CommandText = "usp_Usuario_Update"
        End If
        .CommandType = adCmdStoredProc

        If mIsNew Then
            .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, 16, mIDUsuario)
        End If
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("Password", adVarChar, adParamInput, 50, mPassword)
        .Parameters.Append .CreateParameter("IDUsuarioGrupo", adTinyInt, adParamInput, 16, mIDUsuarioGrupo)
        .Parameters.Append .CreateParameter("Activo", adTinyInt, adParamInput, 1, mActivo)

        .Execute

        If mIsNew Then
            mIDUsuario = .Parameters("IDUsuario").Value
        End If
    End With

    mIsCopy = False
    mIsDirty = False

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Update = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Usuario.Update", "Error al actualizar el Usuario." & vbCr & vbCr & "IDUsuario: " & IDUsuario
End Function

Public Function Delete() As Boolean
    Dim cmdSP As ADODB.command

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Usuario_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, 16, mIDUsuario)

        .Execute
    End With

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Usuario.Delete", "Error al eliminar el Usuario." & vbCr & vbCr & "IDUsuario: " & IDUsuario
End Function

Private Sub InitializeValues()
    Nombre = ""
    Password = ""
    IDUsuarioGrupo = 0
    Activo = True

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    Call InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub

Private Sub Class_Terminate()
    'TERMINATE CODE
End Sub

Public Function LogIn() As Boolean
    Call CSM_Registry.SetValue_ToApplication_CurrentUser("", "LastUserName", Nombre)
    frmMDI.stbMain.Panels("USERNAME").Text = Nombre
    
'    Set pCPermiso = New CPermiso
'    pCPermiso.IDUsuarioGrupo = IDUsuarioGrupo
'    pCPermiso.Load

'    '//////////////////////////////////////////////////////////////////
'    'OBTENGO LOS PARAMETROS DEL USUARIO
'    If Not pParametro.InitializeUserParameters Then
'        Exit Function
'    End If
'    If Not pParametro.LoadUserParameters() Then
'        Exit Function
'    End If
        
    LogIn = True
End Function

Public Sub LogOut()
    CSM_Forms.UnloadAll "frmMDI"
    frmMDI.stbMain.Panels("USUARIO").Text = ""
End Sub

