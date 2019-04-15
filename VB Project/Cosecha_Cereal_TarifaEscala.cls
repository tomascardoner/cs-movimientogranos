VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cosecha_Cereal_TarifaEscala"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDCosecha As Byte
Private mIDCereal As Byte
Private mIndice As Byte
Private mHumedadExcesoInicio As Single
Private mTipo As String
Private mTarifa As Currency

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

Public Property Get IDCosecha() As Byte
    IDCosecha = mIDCosecha
End Property

Public Property Let IDCosecha(ByVal Value As Byte)
    If Value <> mIDCosecha Then
        mIsDirty = True
    End If
    mIDCosecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDCereal() As Byte
    IDCereal = mIDCereal
End Property

Public Property Let IDCereal(ByVal Value As Byte)
    If Value <> mIDCereal Then
        mIsDirty = True
    End If
    mIDCereal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Indice() As Byte
    Indice = mIndice
End Property

Public Property Let Indice(ByVal Value As Byte)
    If Value <> mIndice Then
        mIsDirty = True
    End If
    mIndice = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get HumedadExcesoInicio() As Single
    HumedadExcesoInicio = mHumedadExcesoInicio
End Property

Public Property Let HumedadExcesoInicio(ByVal Value As Single)
    If Value <> mHumedadExcesoInicio Then
        mIsDirty = True
    End If
    mHumedadExcesoInicio = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Tipo() As String
    Tipo = mTipo
End Property

Public Property Let Tipo(ByVal Value As String)
    If Value <> mTipo Then
        mIsDirty = True
    End If
    mTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Tarifa() As Currency
    Tarifa = mTarifa
End Property

Public Property Let Tarifa(ByVal Value As Currency)
    If Value <> mTarifa Then
        mIsDirty = True
    End If
    mTarifa = Value
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
    'RefreshList_Module.Cosecha_Cereal_Tarifa IDCosecha, IDCereal
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
        .CommandText = "usp_Cosecha_Cereal_TarifaEscala_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("Indice", adTinyInt, adParamInput, , mIndice)
        .Parameters.Append .CreateParameter("HumedadExcesoInicio", adDecimal, adParamInput, , mHumedadExcesoInicio)
        .Parameters("HumedadExcesoInicio").Precision = 3
        .Parameters("HumedadExcesoInicio").NumericScale = 1
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cosecha_Cereal_TarEsc.Load", "Error al obtener los datos de la Escala de la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice & vbCr & "HumedadExcesoInicio: " & HumedadExcesoInicio
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Function LoadByHumedad(ByVal HumedadExceso As Single) As Boolean
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
        .CommandText = "usp_Cosecha_Cereal_TarifaEscala_GetByHumedad"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("Indice", adTinyInt, adParamInput, , mIndice)
        .Parameters.Append .CreateParameter("HumedadExceso", adDecimal, adParamInput, , HumedadExceso)
        .Parameters("HumedadExceso").Precision = 3
        .Parameters("HumedadExceso").NumericScale = 1
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    LoadByHumedad = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cosecha_Cereal_TarEsc.LoadByHumedad", "Error al obtener los datos de la Escala de la Tarifa a partir de la Humedad." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice & vbCr & "HumedadExceso: " & HumedadExceso
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDCosecha = recData("IDCosecha").Value
        mIDCereal = recData("IDCereal").Value
        mIndice = recData("Indice").Value
        mHumedadExcesoInicio = recData("HumedadExcesoInicio").Value
        mTipo = recData("Tipo").Value
        mTarifa = recData("Tarifa").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cosecha_Cereal_TarEsc.GetDataFromRecordset", "Error al obtener los datos de la Escala de la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice & vbCr & "HumedadExcesoInicio: " & HumedadExcesoInicio
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDCosecha = 0
        mIDCereal = 0
        mIndice = 0
        mHumedadExcesoInicio = 0

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
            .CommandText = "usp_Cosecha_Cereal_TarifaEscala_Add"
        Else
            .CommandText = "usp_Cosecha_Cereal_TarifaEscala_Update"
        End If
        .CommandType = adCmdStoredProc

        'ENCABEZADO
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("Indice", adTinyInt, adParamInput, , mIndice)
        .Parameters.Append .CreateParameter("HumedadExcesoInicio", adDecimal, adParamInput, , mHumedadExcesoInicio)
        .Parameters("HumedadExcesoInicio").Precision = 3
        .Parameters("HumedadExcesoInicio").NumericScale = 1
        
        .Parameters.Append .CreateParameter("Tipo", adChar, adParamInput, 1, mTipo)
        .Parameters.Append .CreateParameter("Tarifa", adCurrency, adParamInput, , mTarifa)

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
    ShowErrorMessage "Classes.Cosecha_Cereal_TarEsc.Update", "Error al actualizar la Escala de la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice & vbCr & "HumedadExcesoInicio: " & HumedadExcesoInicio
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
        .CommandText = "usp_Cosecha_Cereal_TarifaEscala_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("Indice", adTinyInt, adParamInput, , mIndice)
        .Parameters.Append .CreateParameter("HumedadExcesoInicio", adDecimal, adParamInput, , mHumedadExcesoInicio)
        .Parameters("HumedadExcesoInicio").Precision = 3
        .Parameters("HumedadExcesoInicio").NumericScale = 1

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
    ShowErrorMessage "Classes.Cosecha_Cereal_TarEsc.Delete", "Error al eliminar la Escala de la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice & vbCr & "HumedadExcesoInicio: " & HumedadExcesoInicio
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mTipo = ""
    mTarifa = 0

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
