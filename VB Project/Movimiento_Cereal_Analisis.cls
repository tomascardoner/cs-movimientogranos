VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Movimiento_Cereal_Analisis"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMovimiento_Cereal As Long
Private mFecha As Date
Private mMuestraNumero As Long
Private mResultadoIPRO As Byte

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

Public Property Get IDMovimiento_Cereal() As Long
    IDMovimiento_Cereal = mIDMovimiento_Cereal
End Property

Public Property Let IDMovimiento_Cereal(ByVal Value As Long)
    If Value <> mIDMovimiento_Cereal Then
        mIsDirty = True
    End If
    mIDMovimiento_Cereal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Movimiento_Cereal() As Movimiento_Cereal
    Static oMovimiento_Cereal As Movimiento_Cereal
    
    If mIDMovimiento_Cereal = 0 Then
        Set Movimiento_Cereal = Nothing
    Else
        If oMovimiento_Cereal Is Nothing Then
            Set oMovimiento_Cereal = New Movimiento_Cereal
        End If
        If oMovimiento_Cereal.IDMovimiento_Cereal <> mIDMovimiento_Cereal Then
            oMovimiento_Cereal.IDMovimiento_Cereal = mIDMovimiento_Cereal
            Call oMovimiento_Cereal.Load
        End If
        Set Movimiento_Cereal = oMovimiento_Cereal
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Fecha() As Date
    Fecha = mFecha
End Property

Public Property Let Fecha(ByVal Value As Date)
    If Value <> mFecha Then
        mIsDirty = True
    End If
    mFecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MuestraNumero() As Long
    MuestraNumero = mMuestraNumero
End Property

Public Property Let MuestraNumero(ByVal Value As Long)
    If Value <> mMuestraNumero Then
        mIsDirty = True
    End If
    mMuestraNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ResultadoIPRO() As Byte
    ResultadoIPRO = mResultadoIPRO
End Property

Public Property Let ResultadoIPRO(ByVal Value As Byte)
    If Value <> mResultadoIPRO Then
        mIsDirty = True
    End If
    mResultadoIPRO = Value
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
    RefreshList_Module.Movimiento_Cereal IDMovimiento_Cereal
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
        .CommandText = "usp_Movimiento_Cereal_Analisis_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal_Analisis.Load", "Error al obtener los datos del Análisis del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDMovimiento_Cereal = recData("IDMovimiento_Cereal").Value
        mFecha = recData("Fecha").Value
        mMuestraNumero = CSM_Function.IfIsNull_ZeroLenghtString(recData("MuestraNumero").Value)
        mResultadoIPRO = CSM_Function.SQLBit2CheckBoxValue(recData("ResultadoIPRO").Value)
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal_Analisis.GetDataFromRecordset", "Error al obtener los datos del Análisis del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDMovimiento_Cereal = 0

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
            .CommandText = "usp_Movimiento_Cereal_Analisis_Add"
        Else
            .CommandText = "usp_Movimiento_Cereal_Analisis_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("MuestraNumero", adInteger, adParamInput, , CSM_Function.IfIsZero_Null(mMuestraNumero))
        .Parameters.Append .CreateParameter("ResultadoIPRO", adBoolean, adParamInput, , CSM_Function.CheckBoxValue2SQLBit(mResultadoIPRO))

        .Execute
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
    pDatabase.ShowUpdateErrorMessage "Classes.Movimiento_Cereal_Analisis.Update", "Error al actualizar el Análisis del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal, "*", "El Número de Muestra del Análisis está duplicado."
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
        .CommandText = "usp_Movimiento_Cereal_Analisis_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)

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
    ShowErrorMessage "Classes.Movimiento_Cereal_Analisis.Delete", "Error al eliminar el Análisis del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    mMuestraNumero = 0
    mResultadoIPRO = 2

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

