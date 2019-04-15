VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Moneda"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMoneda As Integer
Private mNombre As String
Private mSimbolo As String
Private mCodigoAFIP As String
Private mActivo As Boolean

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

Public Property Get IDMoneda() As Integer
    IDMoneda = mIDMoneda
End Property

Public Property Let IDMoneda(ByVal Value As Integer)
    If Value <> mIDMoneda Then
        mIsDirty = True
    End If
    mIDMoneda = Value
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

Public Property Get Simbolo() As String
    Simbolo = mSimbolo
End Property

Public Property Let Simbolo(ByVal Value As String)
    If Value <> mSimbolo Then
        mIsDirty = True
    End If
    mSimbolo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CodigoAFIP() As String
    CodigoAFIP = mCodigoAFIP
End Property

Public Property Let CodigoAFIP(ByVal Value As String)
    If Value <> mCodigoAFIP Then
        mIsDirty = True
    End If
    mCodigoAFIP = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Activo() As Boolean
    Activo = mActivo
End Property

Public Property Let Activo(ByVal Value As Boolean)
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
    'RefreshList_Module.Moneda IDMoneda
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
        .CommandText = "usp_Moneda_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamInput, , mIDMoneda)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Moneda.Load", "Error al obtener los datos de la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean
    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        If pTrapErrors Then
            On Error GoTo ErrorHandler
        End If

        mIDMoneda = recData("IDMoneda").Value
        mNombre = recData("Nombre").Value
        mSimbolo = recData("Simbolo").Value & ""
        mCodigoAFIP = recData("CodigoAFIP").Value & ""
        mActivo = recData("Activo").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Moneda.GetDataFromRecordset", "Error al obtener los datos de la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDMoneda = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command

    If Not mIsDirty Then
        Update = True
        Exit Function
    End If

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        If mIsNew Then
            .CommandText = "usp_Moneda_Add"
        Else
            .CommandText = "usp_Moneda_Update"
        End If
        .CommandType = adCmdStoredProc

        If mIsNew Then
            .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamInput, , mIDMoneda)
        End If
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("Simbolo", adVarChar, adParamInput, 10, CSM_Function.IfIsZeroLenghtString_Null(mSimbolo))
        .Parameters.Append .CreateParameter("CodigoAFIP", adChar, adParamInput, 3, CSM_Function.IfIsZeroLenghtString_Null(mCodigoAFIP))
        .Parameters.Append .CreateParameter("Activo", adBoolean, adParamInput, , mActivo)

        .Execute

        If mIsNew Then
            mIDMoneda = .Parameters("IDMoneda").Value
        End If
    End With
    Set cmdSP = Nothing

    mIsCopy = False
    mIsDirty = False

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Update = True
    Exit Function

ErrorHandler:
    pDatabase.ShowUpdateErrorMessage "Classes.Moneda.Update", "Error al actualizar la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda, "", "*", "Ya existe una Moneda con el mismo Nombre."
    Set cmdSP = Nothing
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
        .CommandText = "usp_Moneda_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamInput, , mIDMoneda)

        .Execute
    End With
    Set cmdSP = Nothing

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function

ErrorHandler:
    pDatabase.ShowDeleteErrorMessage "Classes.Moneda.Delete", "Error al eliminar la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda, "No se puede eliminar la Moneda debido a que tiene datos relacionados."
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mNombre = ""
    mSimbolo = ""
    mCodigoAFIP = ""
    mActivo = True

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
