VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Contrato"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDContrato As Long
Private mNumero As String
Private mNumeroComprador As String
Private mFecha As Date
Private mIDCosecha As Byte
Private mIDCereal As Byte
Private mIDEntidad_Comprador As Long
Private mIDEntidad_Corredor As Long
Private mIDEntidad_Destino As Long
Private mIDOrigenDestino_Destino As Integer
Private mKilogramo As Long
Private mPrecioTipo As String
Private mPrecio As Currency
Private mEntregaDesde As Date
Private mEntregaHasta As Date
Private mCerrado As Boolean
Private mNotas As String

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDContrato() As Long
    IDContrato = mIDContrato
End Property

Public Property Let IDContrato(ByVal Value As Long)
    If Value <> mIDContrato Then
        mIsDirty = True
    End If
    mIDContrato = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Numero() As String
    Numero = mNumero
End Property

Public Property Let Numero(ByVal Value As String)
    If Value <> mNumero Then
        mIsDirty = True
    End If
    mNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get NumeroComprador() As String
    NumeroComprador = mNumeroComprador
End Property

Public Property Let NumeroComprador(ByVal Value As String)
    If Value <> mNumeroComprador Then
        mIsDirty = True
    End If
    mNumeroComprador = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Fecha() As Date
    Fecha = mFecha
End Property

Public Property Get Fecha_Formatted() As String
    Fecha_Formatted = Format(mFecha, "Short Date")
End Property

Public Property Let Fecha(ByVal Value As Date)
    If Value <> mFecha Then
        mIsDirty = True
    End If
    mFecha = Value
End Property

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

Public Property Get IDEntidad_Comprador() As Long
    IDEntidad_Comprador = mIDEntidad_Comprador
End Property

Public Property Let IDEntidad_Comprador(ByVal Value As Long)
    If Value <> mIDEntidad_Comprador Then
        mIsDirty = True
    End If
    mIDEntidad_Comprador = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Corredor() As Long
    IDEntidad_Corredor = mIDEntidad_Corredor
End Property

Public Property Let IDEntidad_Corredor(ByVal Value As Long)
    If Value <> mIDEntidad_Corredor Then
        mIsDirty = True
    End If
    mIDEntidad_Corredor = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Destino() As Long
    IDEntidad_Destino = mIDEntidad_Destino
End Property

Public Property Let IDEntidad_Destino(ByVal Value As Long)
    If Value <> mIDEntidad_Destino Then
        mIsDirty = True
    End If
    mIDEntidad_Destino = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDOrigenDestino_Destino() As Integer
    IDOrigenDestino_Destino = mIDOrigenDestino_Destino
End Property

Public Property Let IDOrigenDestino_Destino(ByVal Value As Integer)
    If Value <> mIDOrigenDestino_Destino Then
        mIsDirty = True
    End If
    mIDOrigenDestino_Destino = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Kilogramo() As Long
    Kilogramo = mKilogramo
End Property

Public Property Get Kilogramo_Formatted() As String
    Kilogramo_Formatted = Format(mKilogramo, "#,###")
End Property

Public Property Let Kilogramo(ByVal Value As Long)
    If Value <> mKilogramo Then
        mIsDirty = True
    End If
    mKilogramo = Value
End Property

Public Property Let Kilogramo_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Kilogramo = CLng(Value)
    Else
        Kilogramo = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PrecioTipo() As String
    PrecioTipo = mPrecioTipo
End Property

Public Property Get PrecioTipo_ListIndex() As Integer
    Select Case mPrecioTipo
        Case CONTRATO_PRECIO_TIPO_AFIJAR
            PrecioTipo_ListIndex = 0
        Case CONTRATO_PRECIO_TIPO_PESOS
            PrecioTipo_ListIndex = 1
        Case CONTRATO_PRECIO_TIPO_DOLARES
            PrecioTipo_ListIndex = 2
    End Select
End Property

Public Property Let PrecioTipo(ByVal Value As String)
    If Value <> mPrecioTipo Then
        mIsDirty = True
    End If
    mPrecioTipo = Value
End Property

Public Property Let PrecioTipo_ListIndex(ByVal Value As Integer)
    Select Case Value
        Case 0
            PrecioTipo = CONTRATO_PRECIO_TIPO_AFIJAR
        Case 1
            PrecioTipo = CONTRATO_PRECIO_TIPO_PESOS
        Case 2
            PrecioTipo = CONTRATO_PRECIO_TIPO_DOLARES
    End Select
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Precio() As Currency
    Precio = mPrecio
End Property

Public Property Get Precio_Formatted() As String
    If mPrecio = 0 Then
        Precio_Formatted = ""
    Else
        Precio_Formatted = Format(mPrecio, "Currency")
    End If
End Property

Public Property Let Precio(ByVal Value As Currency)
    If Value <> mPrecio Then
        mIsDirty = True
    End If
    mPrecio = Value
End Property

Public Property Let Precio_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Precio = CCur(Value)
    Else
        Precio = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EntregaDesde() As Date
    EntregaDesde = mEntregaDesde
End Property

Public Property Let EntregaDesde(ByVal Value As Date)
    If Value <> mEntregaDesde Then
        mIsDirty = True
    End If
    mEntregaDesde = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EntregaHasta() As Date
    EntregaHasta = mEntregaHasta
End Property

Public Property Let EntregaHasta(ByVal Value As Date)
    If Value <> mEntregaHasta Then
        mIsDirty = True
    End If
    mEntregaHasta = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Cerrado() As Boolean
    Cerrado = mCerrado
End Property

Public Property Let Cerrado(ByVal Value As Boolean)
    If Value <> mCerrado Then
        mIsDirty = True
    End If
    mCerrado = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Notas() As String
    Notas = mNotas
End Property

Public Property Let Notas(ByVal Value As String)
    If Value <> mNotas Then
        mIsDirty = True
    End If
    mNotas = Value
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
    RefreshList_Module.Contrato IDContrato
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
        .CommandText = "usp_Contrato_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , mIDContrato)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Contrato.Load", "Error al obtener los datos del Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato
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

        mIDContrato = recData("IDContrato").Value
        mNumero = recData("Numero").Value
        mNumeroComprador = recData("NumeroComprador").Value & ""
        mFecha = recData("Fecha").Value
        mIDCosecha = recData("IDCosecha").Value
        mIDCereal = recData("IDCereal").Value
        mIDEntidad_Comprador = recData("IDEntidad_Comprador").Value
        mIDEntidad_Corredor = CSM_Function.IfIsNull_Zero(recData("IDEntidad_Corredor").Value)
        mIDEntidad_Destino = CSM_Function.IfIsNull_Zero(recData("IDEntidad_Destino").Value)
        mIDOrigenDestino_Destino = CSM_Function.IfIsNull_Zero(recData("IDOrigenDestino_Destino").Value)
        mKilogramo = CSM_Function.IfIsNull_Zero(recData("Kilogramo").Value)
        mPrecioTipo = recData("PrecioTipo").Value
        If mPrecioTipo = CONTRATO_PRECIO_TIPO_AFIJAR Then
            mPrecio = 0
        Else
            mPrecio = CSM_Function.IfIsNull_Zero(recData("Precio").Value)
        End If
        mEntregaDesde = CSM_Function.IfIsNull_ZeroDate(recData("EntregaDesde").Value)
        mEntregaHasta = CSM_Function.IfIsNull_ZeroDate(recData("EntregaHasta").Value)
        mCerrado = recData("Cerrado").Value
        mNotas = recData("Notas").Value & ""
    End If
    
    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Contrato.GetDataFromRecordset", "Error al obtener los datos del Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDContrato = 0
        mNumero = ""
        mNumeroComprador = ""

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
            .CommandText = "usp_Contrato_Add"
        Else
            .CommandText = "usp_Contrato_Update"
        End If
        .CommandType = adCmdStoredProc

        If mIsNew Then
            .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , mIDContrato)
        End If

        .Parameters.Append .CreateParameter("Numero", adVarChar, adParamInput, 20, mNumero)
        .Parameters.Append .CreateParameter("NumeroComprador", adVarChar, adParamInput, 20, CSM_Function.IfIsZeroLenghtString_Null(mNumeroComprador))
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("IDEntidad_Comprador", adInteger, adParamInput, , mIDEntidad_Comprador)
        .Parameters.Append .CreateParameter("IDEntidad_Corredor", adInteger, adParamInput, , CSM_Function.IfIsZero_Null(mIDEntidad_Corredor))
        .Parameters.Append .CreateParameter("IDEntidad_Destino", adInteger, adParamInput, , CSM_Function.IfIsZero_Null(mIDEntidad_Destino))
        .Parameters.Append .CreateParameter("IDOrigenDestino_Destino", adSmallInt, adParamInput, , CSM_Function.IfIsZero_Null(mIDOrigenDestino_Destino))
        .Parameters.Append .CreateParameter("Kilogramo", adInteger, adParamInput, , mKilogramo)
        .Parameters.Append .CreateParameter("PrecioTipo", adChar, adParamInput, 1, mPrecioTipo)
        If mPrecioTipo = CONTRATO_PRECIO_TIPO_AFIJAR Then
            mPrecio = 0
        End If
        .Parameters.Append .CreateParameter("Precio", adCurrency, adParamInput, , CSM_Function.IfIsZero_Null(mPrecio))
        .Parameters.Append .CreateParameter("EntregaDesde", adDate, adParamInput, , CSM_Function.IfIsZeroDate_Null(mEntregaDesde))
        .Parameters.Append .CreateParameter("EntregaHasta", adDate, adParamInput, , CSM_Function.IfIsZeroDate_Null(mEntregaHasta))
        .Parameters.Append .CreateParameter("Cerrado", adBoolean, adParamInput, , mCerrado)
        .Parameters.Append .CreateParameter("Notas", adVarChar, adParamInput, 8000, CSM_Function.IfIsZeroLenghtString_Null(mNotas))

        .Execute

        If mIsNew Then
            mIDContrato = .Parameters("IDContrato").Value
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
    pDatabase.ShowUpdateErrorMessage "Classes.Contrato.Update", "Error al actualizar el Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato, "AK__Contrato__Numero", "Ya existe un Contrato con el mismo Número."
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
        .CommandText = "usp_Contrato_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , mIDContrato)

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
    pDatabase.ShowDeleteErrorMessage "Classes.Contrato.Delete", "Error al eliminar el Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato, "No se puede eliminar el Contrato debido a que tiene datos relacionados."
End Function

Private Sub InitializeValues()
    mNumero = ""
    mNumeroComprador = ""
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    mIDCosecha = 0
    mIDCereal = 0
    mIDEntidad_Comprador = 0
    mIDEntidad_Corredor = 0
    mIDEntidad_Destino = 0
    mIDOrigenDestino_Destino = 0
    mKilogramo = 0
    mPrecioTipo = ""
    mPrecio = 0
    mEntregaDesde = DATE_TIME_FIELD_NULL_VALUE
    mEntregaHasta = DATE_TIME_FIELD_NULL_VALUE
    mCerrado = False
    mNotas = ""

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub
