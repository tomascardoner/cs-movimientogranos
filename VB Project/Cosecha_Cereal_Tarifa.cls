VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cosecha_Cereal_Tarifa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDCosecha As Byte
Private mIDCereal As Byte
Private mIndice As Integer
Private mIDEntidad As Long
Private mIDOrigenDestino_Origen As Integer
Private mIDOrigenDestino_Destino As Integer
Private mNombre As String
Private mFechaDesde As Date
Private mFechaHasta As Date
Private mTarifaParitariaImporte As Currency
Private mTarifaSecadoTipo As String
Private mTarifaSecadoInicialPunto As Single
Private mTarifaSecadoInicialImporte As Currency
Private mTarifaSecadoPuntoExcesoImporte As Currency
Private mTarifaSecadoHumedadBase As Single
Private mTarifaSecadoHumedadMargenLibre As Single
Private mTarifaSecadoHumedadRedondeoPuntoTipo As String
Private mTarifaZarandeoImporte As Currency
Private mTarifaFumigadoImporte As Currency
Private mTarifaMezclaImporte As Currency
Private mAlmacenajeTipo As String
Private mAlmacenajeDiaGracia As Integer
Private mAlmacenajeInicio As Date
Private mAlmacenajePorcentajeMensual As Single

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

Public Property Get Indice() As Integer
    Indice = mIndice
End Property

Public Property Let Indice(ByVal Value As Integer)
    If Value <> mIndice Then
        mIsDirty = True
    End If
    mIndice = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad() As Long
    IDEntidad = mIDEntidad
End Property

Public Property Let IDEntidad(ByVal Value As Long)
    If Value <> mIDEntidad Then
        mIsDirty = True
    End If
    mIDEntidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDOrigenDestino_Origen() As Integer
    IDOrigenDestino_Origen = mIDOrigenDestino_Origen
End Property

Public Property Let IDOrigenDestino_Origen(ByVal Value As Integer)
    If Value <> mIDOrigenDestino_Origen Then
        mIsDirty = True
    End If
    mIDOrigenDestino_Origen = Value
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

Public Property Get FechaDesde() As Date
    FechaDesde = mFechaDesde
End Property

Public Property Let FechaDesde(ByVal Value As Date)
    If Value <> mFechaDesde Then
        mIsDirty = True
    End If
    mFechaDesde = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaHasta() As Date
    FechaHasta = mFechaHasta
End Property

Public Property Let FechaHasta(ByVal Value As Date)
    If Value <> mFechaHasta Then
        mIsDirty = True
    End If
    mFechaHasta = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaParitariaImporte() As Currency
    TarifaParitariaImporte = mTarifaParitariaImporte
End Property

Public Property Get TarifaParitariaImporte_Formatted() As String
    TarifaParitariaImporte_Formatted = Format(mTarifaParitariaImporte, "Currency")
End Property

Public Property Let TarifaParitariaImporte(ByVal Value As Currency)
    If Value <> mTarifaParitariaImporte Then
        mIsDirty = True
    End If
    mTarifaParitariaImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoTipo() As String
    TarifaSecadoTipo = mTarifaSecadoTipo
End Property

Public Property Let TarifaSecadoTipo(ByVal Value As String)
    If Value <> mTarifaSecadoTipo Then
        mIsDirty = True
    End If
    mTarifaSecadoTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoInicialPunto() As Single
    TarifaSecadoInicialPunto = mTarifaSecadoInicialPunto
End Property

Public Property Let TarifaSecadoInicialPunto(ByVal Value As Single)
    If Value <> mTarifaSecadoInicialPunto Then
        mIsDirty = True
    End If
    mTarifaSecadoInicialPunto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoInicialImporte() As Currency
    TarifaSecadoInicialImporte = mTarifaSecadoInicialImporte
End Property

Public Property Get TarifaSecadoInicialImporte_Formatted() As String
    TarifaSecadoInicialImporte_Formatted = Format(mTarifaSecadoInicialImporte, "Currency")
End Property

Public Property Let TarifaSecadoInicialImporte(ByVal Value As Currency)
    If Value <> mTarifaSecadoInicialImporte Then
        mIsDirty = True
    End If
    mTarifaSecadoInicialImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoPuntoExcesoImporte() As Currency
    TarifaSecadoPuntoExcesoImporte = mTarifaSecadoPuntoExcesoImporte
End Property

Public Property Get TarifaSecadoPuntoExcesoImporte_Formatted() As String
    TarifaSecadoPuntoExcesoImporte_Formatted = Format(mTarifaSecadoPuntoExcesoImporte, "Currency")
End Property

Public Property Let TarifaSecadoPuntoExcesoImporte(ByVal Value As Currency)
    If Value <> mTarifaSecadoPuntoExcesoImporte Then
        mIsDirty = True
    End If
    mTarifaSecadoPuntoExcesoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoHumedadBase() As Single
    TarifaSecadoHumedadBase = mTarifaSecadoHumedadBase
End Property

Public Property Let TarifaSecadoHumedadBase(ByVal Value As Single)
    If Value <> mTarifaSecadoHumedadBase Then
        mIsDirty = True
    End If
    mTarifaSecadoHumedadBase = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoHumedadMargenLibre() As Single
    TarifaSecadoHumedadMargenLibre = mTarifaSecadoHumedadMargenLibre
End Property

Public Property Let TarifaSecadoHumedadMargenLibre(ByVal Value As Single)
    If Value <> mTarifaSecadoHumedadMargenLibre Then
        mIsDirty = True
    End If
    mTarifaSecadoHumedadMargenLibre = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaSecadoHumedadRedondeoPuntoTipo() As String
    TarifaSecadoHumedadRedondeoPuntoTipo = mTarifaSecadoHumedadRedondeoPuntoTipo
End Property

Public Property Let TarifaSecadoHumedadRedondeoPuntoTipo(ByVal Value As String)
    If Value <> mTarifaSecadoHumedadRedondeoPuntoTipo Then
        mIsDirty = True
    End If
    mTarifaSecadoHumedadRedondeoPuntoTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaZarandeoImporte() As Currency
    TarifaZarandeoImporte = mTarifaZarandeoImporte
End Property

Public Property Get TarifaZarandeoImporte_Formatted() As String
    TarifaZarandeoImporte_Formatted = Format(mTarifaZarandeoImporte, "Currency")
End Property

Public Property Let TarifaZarandeoImporte(ByVal Value As Currency)
    If Value <> mTarifaZarandeoImporte Then
        mIsDirty = True
    End If
    mTarifaZarandeoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaFumigadoImporte() As Currency
    TarifaFumigadoImporte = mTarifaFumigadoImporte
End Property

Public Property Get TarifaFumigadoImporte_Formatted() As String
    TarifaFumigadoImporte_Formatted = Format(mTarifaFumigadoImporte, "Currency")
End Property

Public Property Let TarifaFumigadoImporte(ByVal Value As Currency)
    If Value <> mTarifaFumigadoImporte Then
        mIsDirty = True
    End If
    mTarifaFumigadoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TarifaMezclaImporte() As Currency
    TarifaMezclaImporte = mTarifaMezclaImporte
End Property

Public Property Get TarifaMezclaImporte_Formatted() As String
    TarifaMezclaImporte_Formatted = Format(mTarifaMezclaImporte, "Currency")
End Property

Public Property Let TarifaMezclaImporte(ByVal Value As Currency)
    If Value <> mTarifaMezclaImporte Then
        mIsDirty = True
    End If
    mTarifaMezclaImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get AlmacenajeTipo() As String
    AlmacenajeTipo = mAlmacenajeTipo
End Property

Public Property Let AlmacenajeTipo(ByVal Value As String)
    If Value <> mAlmacenajeTipo Then
        mIsDirty = True
    End If
    mAlmacenajeTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get AlmacenajeDiaGracia() As Integer
    AlmacenajeDiaGracia = mAlmacenajeDiaGracia
End Property

Public Property Let AlmacenajeDiaGracia(ByVal Value As Integer)
    If Value <> mAlmacenajeDiaGracia Then
        mIsDirty = True
    End If
    mAlmacenajeDiaGracia = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get AlmacenajeInicio() As Date
    AlmacenajeInicio = mAlmacenajeInicio
End Property

Public Property Let AlmacenajeInicio(ByVal Value As Date)
    If Value <> mAlmacenajeInicio Then
        mIsDirty = True
    End If
    mAlmacenajeInicio = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get AlmacenajePorcentajeMensual() As Single
    AlmacenajePorcentajeMensual = mAlmacenajePorcentajeMensual
End Property

Public Property Let AlmacenajePorcentajeMensual(ByVal Value As Single)
    If Value <> mAlmacenajePorcentajeMensual Then
        mIsDirty = True
    End If
    mAlmacenajePorcentajeMensual = Value
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
        .CommandText = "usp_Cosecha_Cereal_Tarifa_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("Indice", adSmallInt, adParamInput, , mIndice)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cosecha_Cereal_Tarifa.Load", "Error al obtener los datos de la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice
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
        mIDEntidad = CSM_Function.IfIsNull_Zero(recData("IDEntidad").Value)
        mIDOrigenDestino_Origen = CSM_Function.IfIsNull_Zero(recData("IDOrigenDestino_Origen").Value)
        mIDOrigenDestino_Destino = CSM_Function.IfIsNull_Zero(recData("IDOrigenDestino_Destino").Value)
        mNombre = recData("Nombre").Value
        mFechaDesde = CSM_Function.IfIsNull_ZeroDate(recData("FechaDesde").Value)
        mFechaHasta = CSM_Function.IfIsNull_ZeroDate(recData("FechaHasta").Value)
        mTarifaParitariaImporte = recData("TarifaParitariaImporte").Value
        mTarifaSecadoTipo = recData("TarifaSecadoTipo").Value
        mTarifaSecadoInicialPunto = recData("TarifaSecadoInicialPunto").Value
        mTarifaSecadoInicialImporte = recData("TarifaSecadoInicialImporte").Value
        mTarifaSecadoPuntoExcesoImporte = recData("TarifaSecadoPuntoExcesoImporte").Value
        mTarifaSecadoHumedadBase = CSM_Function.IfIsNull_Zero(recData("TarifaSecadoHumedadBase").Value)
        mTarifaSecadoHumedadMargenLibre = CSM_Function.IfIsNull_Zero(recData("TarifaSecadoHumedadMargenLibre").Value)
        mTarifaSecadoHumedadRedondeoPuntoTipo = recData("TarifaSecadoHumedadRedondeoPuntoTipo").Value
        mTarifaZarandeoImporte = recData("TarifaZarandeoImporte").Value
        mTarifaFumigadoImporte = recData("TarifaFumigadoImporte").Value
        mTarifaMezclaImporte = recData("TarifaMezclaImporte").Value
        mAlmacenajeTipo = recData("AlmacenajeTipo").Value
        Select Case mAlmacenajeTipo
            Case ALMACENAJE_TIPO_DIAS_GRACIA_FIJO
                mAlmacenajeDiaGracia = CSM_Function.IfIsNull_Zero(recData("AlmacenajeDiaGracia").Value)
                mAlmacenajeInicio = DATE_TIME_FIELD_NULL_VALUE
            Case ALMACENAJE_TIPO_DIAS_GRACIA_SI_RETIRA_ANTES
                mAlmacenajeDiaGracia = CSM_Function.IfIsNull_Zero(recData("AlmacenajeDiaGracia").Value)
                mAlmacenajeInicio = DATE_TIME_FIELD_NULL_VALUE
            Case ALMACENAJE_TIPO_FECHA_FIJA
                mAlmacenajeDiaGracia = 0
                mAlmacenajeInicio = CSM_Function.IfIsNull_ZeroDate(recData("AlmacenajeInicio").Value)
        End Select
        mAlmacenajePorcentajeMensual = recData("AlmacenajePorcentajeMensual").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cosecha_Cereal_Tarifa.GetDataFromRecordset", "Error al obtener los datos de la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDCosecha = 0
        mIDCereal = 0
        mIndice = 0

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
            .CommandText = "usp_Cosecha_Cereal_Tarifa_Add"
        Else
            .CommandText = "usp_Cosecha_Cereal_Tarifa_Update"
        End If
        .CommandType = adCmdStoredProc

        'ENCABEZADO
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        If mIsNew Then
            .Parameters.Append .CreateParameter("Indice", adSmallInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("Indice", adSmallInt, adParamInput, , mIndice)
        End If
        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        .Parameters.Append .CreateParameter("IDOrigenDestino_Origen", adSmallInt, adParamInput, , mIDOrigenDestino_Origen)
        .Parameters.Append .CreateParameter("IDOrigenDestino_Destino", adSmallInt, adParamInput, , mIDOrigenDestino_Destino)
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("FechaDesde", adDate, adParamInput, , mFechaDesde)
        .Parameters.Append .CreateParameter("FechaHasta", adDate, adParamInput, , mFechaHasta)
        
        'PARITARIA
        .Parameters.Append .CreateParameter("TarifaParitariaImporte", adCurrency, adParamInput, , mTarifaParitariaImporte)
        
        'SECADO
        .Parameters.Append .CreateParameter("TarifaSecadoTipo", adChar, adParamInput, 1, mTarifaSecadoTipo)
        .Parameters.Append .CreateParameter("TarifaSecadoInicialPunto", adDecimal, adParamInput, , mTarifaSecadoInicialPunto)
        .Parameters("TarifaSecadoInicialPunto").Precision = 3
        .Parameters("TarifaSecadoInicialPunto").NumericScale = 1
        .Parameters.Append .CreateParameter("TarifaSecadoInicialImporte", adCurrency, adParamInput, , mTarifaSecadoInicialImporte)
        .Parameters.Append .CreateParameter("TarifaSecadoPuntoExcesoImporte", adCurrency, adParamInput, , mTarifaSecadoPuntoExcesoImporte)
        .Parameters.Append .CreateParameter("TarifaSecadoHumedadBase", adDecimal, adParamInput, , mTarifaSecadoHumedadBase)
        .Parameters("TarifaSecadoHumedadBase").Precision = 3
        .Parameters("TarifaSecadoHumedadBase").NumericScale = 1
        .Parameters.Append .CreateParameter("TarifaSecadoHumedadMargenLibre", adDecimal, adParamInput, , mTarifaSecadoHumedadMargenLibre)
        .Parameters("TarifaSecadoHumedadMargenLibre").Precision = 1
        .Parameters("TarifaSecadoHumedadMargenLibre").NumericScale = 1
        .Parameters.Append .CreateParameter("TarifaSecadoHumedadRedondeoPuntoTipo", adChar, adParamInput, 1, mTarifaSecadoHumedadRedondeoPuntoTipo)
        
        'ZARANDEO, FUMIGADO, MEZCLA
        .Parameters.Append .CreateParameter("TarifaZarandeoImporte", adCurrency, adParamInput, , mTarifaZarandeoImporte)
        .Parameters.Append .CreateParameter("TarifaFumigadoImporte", adCurrency, adParamInput, , mTarifaFumigadoImporte)
        .Parameters.Append .CreateParameter("TarifaMezclaImporte", adCurrency, adParamInput, , mTarifaMezclaImporte)
        
        'ALMACENAJE
        .Parameters.Append .CreateParameter("AlmacenajeTipo", adChar, adParamInput, 1, mAlmacenajeTipo)
        Select Case mAlmacenajeTipo
            Case ALMACENAJE_TIPO_DIAS_GRACIA_FIJO
                .Parameters.Append .CreateParameter("AlmacenajeDiaGracia", adSmallInt, adParamInput, , mAlmacenajeDiaGracia)
                .Parameters.Append .CreateParameter("AlmacenajeInicio", adDate, adParamInput, , Null)
            Case ALMACENAJE_TIPO_DIAS_GRACIA_SI_RETIRA_ANTES
                .Parameters.Append .CreateParameter("AlmacenajeDiaGracia", adSmallInt, adParamInput, , mAlmacenajeDiaGracia)
                .Parameters.Append .CreateParameter("AlmacenajeInicio", adDate, adParamInput, , Null)
            Case ALMACENAJE_TIPO_FECHA_FIJA
                .Parameters.Append .CreateParameter("AlmacenajeDiaGracia", adSmallInt, adParamInput, , Null)
                .Parameters.Append .CreateParameter("AlmacenajeInicio", adDate, adParamInput, , CSM_Function.IfIsZeroDate_Null(mAlmacenajeInicio))
        End Select
        .Parameters.Append .CreateParameter("AlmacenajePorcentajeMensual", adDecimal, adParamInput, , mAlmacenajePorcentajeMensual)
        .Parameters("AlmacenajePorcentajeMensual").Precision = 2
        .Parameters("AlmacenajePorcentajeMensual").NumericScale = 1

        .Execute

        If mIsNew Then
            mIndice = .Parameters("Indice").Value
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
    ShowErrorMessage "Classes.Cosecha_Cereal_Tarifa.Update", "Error al actualizar la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice
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
        .CommandText = "usp_Cosecha_Cereal_Tarifa_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("Indice", adSmallInt, adParamInput, , mIndice)

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
    ShowErrorMessage "Classes.Cosecha_Cereal_Tarifa.Delete", "Error al eliminar la Tarifa." & vbCr & vbCr & "IDCosecha: " & IDCosecha & vbCr & "IDCereal: " & IDCereal & vbCr & "Indice: " & Indice
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mIDEntidad = 0
    mIDOrigenDestino_Origen = 0
    mIDOrigenDestino_Destino = 0
    mNombre = ""
    mFechaDesde = DATE_TIME_FIELD_NULL_VALUE
    mFechaHasta = DATE_TIME_FIELD_NULL_VALUE
    
    mTarifaParitariaImporte = 0
    mTarifaSecadoTipo = ""
    mTarifaSecadoInicialPunto = 0
    mTarifaSecadoInicialImporte = 0
    mTarifaSecadoPuntoExcesoImporte = 0
    mTarifaSecadoHumedadBase = 0
    mTarifaSecadoHumedadMargenLibre = 0
    mTarifaSecadoHumedadRedondeoPuntoTipo = ""
    mTarifaZarandeoImporte = 0
    mTarifaFumigadoImporte = 0
    mTarifaMezclaImporte = 0
    mAlmacenajeTipo = ""
    mAlmacenajeDiaGracia = 0
    mAlmacenajeInicio = DATE_TIME_FIELD_NULL_VALUE
    mAlmacenajePorcentajeMensual = 0

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
