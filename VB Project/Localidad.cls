VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Localidad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDLocalidad As Long
Private mNombre As String
Private mIDPartido As Long
Private mIDProvincia As String

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'DATABASE VARIABLES

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDLocalidad() As Long
    IDLocalidad = mIDLocalidad
End Property

Public Property Let IDLocalidad(ByVal Value As Long)
    If Value <> mIDLocalidad Then
        mIsDirty = True
    End If
    mIDLocalidad = Value
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

Public Property Get IDPartido() As Long
    IDPartido = mIDPartido
End Property

Public Property Let IDPartido(ByVal Value As Long)
    If Value <> mIDPartido Then
        mIsDirty = True
    End If
    mIDPartido = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Partido() As Partido
    Static oPartido As Partido
    
    If mIDPartido = 0 Then
        Set Partido = Nothing
    Else
        If oPartido Is Nothing Then
            Set oPartido = New Partido
        End If
        If oPartido.IDPartido <> mIDPartido Then
            oPartido.IDPartido = mIDPartido
            Call oPartido.Load
        End If
        Set Partido = oPartido
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDProvincia() As String
    IDProvincia = mIDProvincia
End Property

Public Property Let IDProvincia(ByVal Value As String)
    If Value <> mIDProvincia Then
        mIsDirty = True
    End If
    mIDProvincia = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Provincia() As Provincia
    Static oProvincia As Provincia
    
    If oProvincia Is Nothing Then
        Set oProvincia = New Provincia
    End If
    If oProvincia.IDProvincia <> mIDProvincia Then
        If mIDProvincia = "" Then
            Set oProvincia = New Provincia
        Else
            oProvincia.IDProvincia = mIDProvincia
            Call oProvincia.Load
        End If
    End If
    Set Provincia = oProvincia
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
    RefreshList_Module.Localidad IDLocalidad
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
        .CommandText = "usp_Localidad_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Localidad.Load", "Error al obtener los datos de la Localidad." & vbCr & vbCr & "IDLocalidad: " & IDLocalidad
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDLocalidad = recData("IDLocalidad").Value
        mNombre = recData("Nombre").Value
        mIDPartido = CSM_Function.IfIsNull_Zero(recData("IDPartido").Value)
        mIDProvincia = recData("IDProvincia").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Localidad.GetDataFromRecordset", "Error al obtener los datos del Localidad." & vbCr & vbCr & "IDLocalidad: " & IDLocalidad
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDLocalidad = 0

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
            .CommandText = "usp_Localidad_Add"
        Else
            .CommandText = "usp_Localidad_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("IDPartido", adSmallInt, adParamInput, , CSM_Function.IfIsZero_Null(mIDPartido))
        .Parameters.Append .CreateParameter("IDProvincia", adChar, adParamInput, 1, mIDProvincia)

        .Execute

        If mIsNew Then
            mIDLocalidad = .Parameters("IDLocalidad").Value
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
    pDatabase.ShowUpdateErrorMessage "Classes.Localidad.Update", "Error al actualizar la Localidad." & vbCr & vbCr & "IDLocalidad: " & IDLocalidad, "*", "Ya existe una Localidad con el mismo nombre."
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
        .CommandText = "usp_Localidad_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)

        .Execute
    End With

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    pDatabase.ShowDeleteErrorMessage "Classes.Localidad.Delete", "Error al eliminar la Localidad." & vbCr & vbCr & "IDLocalidad: " & IDLocalidad, "No se puede eliminar la Localidad debido a que tiene datos relacionados."
End Function

Private Sub InitializeValues()
    mNombre = ""
    mIDPartido = 0
    mIDProvincia = ""

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub

