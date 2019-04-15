VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Movimiento_Cereal_Calculo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMovimiento_Cereal As Long
Private mTarifaIndice As Byte
Private mParitariaTarifa As Currency
Private mParitariaImporte As Currency
Private mSecadoTarifa As Currency
Private mSecadoImporte As Currency
Private mHumedadExcesoReal As Single
Private mHumedadExcesoCalculo As Single
Private mSecadoExcesoTarifa As Currency
Private mSecadoExcesoImporte As Currency
Private mZarandeoTarifa As Currency
Private mZarandeoImporte As Currency
Private mFumigadoTarifa As Currency
Private mFumigadoImporte As Currency
Private mMezclaTarifa As Currency
Private mMezclaImporte As Currency
Private mImporteTotal As Currency

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

Public Property Get TarifaIndice() As Byte
    TarifaIndice = mTarifaIndice
End Property

Public Property Let TarifaIndice(ByVal Value As Byte)
    If Value <> mTarifaIndice Then
        mIsDirty = True
    End If
    mTarifaIndice = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ParitariaTarifa() As Currency
    ParitariaTarifa = mParitariaTarifa
End Property

Public Property Let ParitariaTarifa(ByVal Value As Currency)
    If Value <> mParitariaTarifa Then
        mIsDirty = True
    End If
    mParitariaTarifa = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ParitariaImporte() As Currency
    ParitariaImporte = mParitariaImporte
End Property

Public Property Let ParitariaImporte(ByVal Value As Currency)
    If Value <> mParitariaImporte Then
        mIsDirty = True
    End If
    mParitariaImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get SecadoTarifa() As Currency
    SecadoTarifa = mSecadoTarifa
End Property

Public Property Let SecadoTarifa(ByVal Value As Currency)
    If Value <> mSecadoTarifa Then
        mIsDirty = True
    End If
    mSecadoTarifa = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get SecadoImporte() As Currency
    SecadoImporte = mSecadoImporte
End Property

Public Property Let SecadoImporte(ByVal Value As Currency)
    If Value <> mSecadoImporte Then
        mIsDirty = True
    End If
    mSecadoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get HumedadExcesoReal() As Single
    HumedadExcesoReal = mHumedadExcesoReal
End Property

Public Property Let HumedadExcesoReal(ByVal Value As Single)
    If Value <> mHumedadExcesoReal Then
        mIsDirty = True
    End If
    mHumedadExcesoReal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get HumedadExcesoCalculo() As Single
    HumedadExcesoCalculo = mHumedadExcesoCalculo
End Property

Public Property Let HumedadExcesoCalculo(ByVal Value As Single)
    If Value <> mHumedadExcesoCalculo Then
        mIsDirty = True
    End If
    mHumedadExcesoCalculo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get SecadoExcesoTarifa() As Currency
    SecadoExcesoTarifa = mSecadoExcesoTarifa
End Property

Public Property Let SecadoExcesoTarifa(ByVal Value As Currency)
    If Value <> mSecadoExcesoTarifa Then
        mIsDirty = True
    End If
    mSecadoExcesoTarifa = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get SecadoExcesoImporte() As Currency
    SecadoExcesoImporte = mSecadoExcesoImporte
End Property

Public Property Let SecadoExcesoImporte(ByVal Value As Currency)
    If Value <> mSecadoExcesoImporte Then
        mIsDirty = True
    End If
    mSecadoExcesoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ZarandeoTarifa() As Currency
    ZarandeoTarifa = mZarandeoTarifa
End Property

Public Property Let ZarandeoTarifa(ByVal Value As Currency)
    If Value <> mZarandeoTarifa Then
        mIsDirty = True
    End If
    mZarandeoTarifa = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ZarandeoImporte() As Currency
    ZarandeoImporte = mZarandeoImporte
End Property

Public Property Let ZarandeoImporte(ByVal Value As Currency)
    If Value <> mZarandeoImporte Then
        mIsDirty = True
    End If
    mZarandeoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FumigadoTarifa() As Currency
    FumigadoTarifa = mFumigadoTarifa
End Property

Public Property Let FumigadoTarifa(ByVal Value As Currency)
    If Value <> mFumigadoTarifa Then
        mIsDirty = True
    End If
    mFumigadoTarifa = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FumigadoImporte() As Currency
    FumigadoImporte = mFumigadoImporte
End Property

Public Property Let FumigadoImporte(ByVal Value As Currency)
    If Value <> mFumigadoImporte Then
        mIsDirty = True
    End If
    mFumigadoImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MezclaTarifa() As Currency
    MezclaTarifa = mMezclaTarifa
End Property

Public Property Let MezclaTarifa(ByVal Value As Currency)
    If Value <> mMezclaTarifa Then
        mIsDirty = True
    End If
    mMezclaTarifa = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MezclaImporte() As Currency
    MezclaImporte = mMezclaImporte
End Property

Public Property Let MezclaImporte(ByVal Value As Currency)
    If Value <> mMezclaImporte Then
        mIsDirty = True
    End If
    mMezclaImporte = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ImporteTotal() As Currency
    ImporteTotal = mImporteTotal
End Property

Public Property Let ImporteTotal(ByVal Value As Currency)
    If Value <> mImporteTotal Then
        mIsDirty = True
    End If
    mImporteTotal = Value
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
        .CommandText = "usp_Movimiento_Cereal_Calculo_Get"
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
    ShowErrorMessage "Classes.Movimiento_Cereal_Calculo.Load", "Error al obtener los datos del Cálculo del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
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
        mTarifaIndice = CSM_Function.IfIsNull_Zero(recData("TarifaIndice").Value)
        mParitariaTarifa = recData("ParitariaTarifa").Value
        mParitariaImporte = recData("ParitariaImporte").Value
        mSecadoTarifa = recData("SecadoTarifa").Value
        mSecadoImporte = recData("SecadoImporte").Value
        mHumedadExcesoReal = recData("HumedadExcesoReal").Value
        mHumedadExcesoCalculo = recData("HumedadExcesoCalculo").Value
        mSecadoExcesoTarifa = recData("SecadoExcesoTarifa").Value
        mSecadoExcesoImporte = recData("SecadoExcesoImporte").Value
        mZarandeoTarifa = recData("ZarandeoTarifa").Value
        mZarandeoImporte = recData("ZarandeoImporte").Value
        mFumigadoTarifa = recData("FumigadoTarifa").Value
        mFumigadoImporte = recData("FumigadoImporte").Value
        mMezclaTarifa = recData("MezclaTarifa").Value
        mMezclaImporte = recData("MezclaImporte").Value
        mImporteTotal = recData("ImporteTotal").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal_Calculo.GetDataFromRecordset", "Error al obtener los datos del Cálculo del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
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
            .CommandText = "usp_Movimiento_Cereal_Calculo_Add"
        Else
            .CommandText = "usp_Movimiento_Cereal_Calculo_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        .Parameters.Append .CreateParameter("TarifaIndice", adTinyInt, adParamInput, , mTarifaIndice)
        .Parameters.Append .CreateParameter("ParitariaTarifa", adCurrency, adParamInput, , mParitariaTarifa)
        .Parameters.Append .CreateParameter("ParitariaImporte", adCurrency, adParamInput, , mParitariaImporte)
        .Parameters.Append .CreateParameter("SecadoTarifa", adCurrency, adParamInput, , mSecadoTarifa)
        .Parameters.Append .CreateParameter("SecadoImporte", adCurrency, adParamInput, , mSecadoImporte)
        .Parameters.Append .CreateParameter("HumedadExcesoReal", adDecimal, adParamInput, , mHumedadExcesoReal)
        .Parameters("HumedadExcesoReal").Precision = 3
        .Parameters("HumedadExcesoReal").NumericScale = 1
        .Parameters.Append .CreateParameter("HumedadExcesoCalculo", adDecimal, adParamInput, , mHumedadExcesoCalculo)
        .Parameters("HumedadExcesoCalculo").Precision = 3
        .Parameters("HumedadExcesoCalculo").NumericScale = 1
        .Parameters.Append .CreateParameter("SecadoExcesoTarifa", adCurrency, adParamInput, , mSecadoExcesoTarifa)
        .Parameters.Append .CreateParameter("SecadoExcesoImporte", adCurrency, adParamInput, , mSecadoExcesoImporte)
        .Parameters.Append .CreateParameter("ZarandeoTarifa", adCurrency, adParamInput, , mZarandeoTarifa)
        .Parameters.Append .CreateParameter("ZarandeoImporte", adCurrency, adParamInput, , mZarandeoImporte)
        .Parameters.Append .CreateParameter("FumigadoTarifa", adCurrency, adParamInput, , mFumigadoTarifa)
        .Parameters.Append .CreateParameter("FumigadoImporte", adCurrency, adParamInput, , mFumigadoImporte)
        .Parameters.Append .CreateParameter("MezclaTarifa", adCurrency, adParamInput, , mMezclaTarifa)
        .Parameters.Append .CreateParameter("MezclaImporte", adCurrency, adParamInput, , mMezclaImporte)
        .Parameters.Append .CreateParameter("ImporteTotal", adCurrency, adParamInput, , mImporteTotal)

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
    ShowErrorMessage "Classes.Movimiento_Cereal_Calculo.Update", "Error al actualizar el Cálculo del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
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
        .CommandText = "usp_Movimiento_Cereal_Calculo_Delete"
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
    ShowErrorMessage "Classes.Movimiento_Cereal_Calculo.Delete", "Error al eliminar el Cálculo del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mTarifaIndice = 0
    mParitariaTarifa = 0
    mParitariaImporte = 0
    mSecadoTarifa = 0
    mSecadoImporte = 0
    mHumedadExcesoReal = 0
    mHumedadExcesoCalculo = 0
    mSecadoExcesoTarifa = 0
    mSecadoExcesoImporte = 0
    mZarandeoTarifa = 0
    mZarandeoImporte = 0
    mFumigadoTarifa = 0
    mFumigadoImporte = 0
    mMezclaTarifa = 0
    mMezclaImporte = 0
    mImporteTotal = 0

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

Public Function Calcular() As Boolean
    Dim cmdSP As ADODB.command
    Dim Indice As Integer
    Dim Cosecha_Cereal_Tarifa As Cosecha_Cereal_Tarifa
    Dim Cosecha_Cereal_TarifaEscala As Cosecha_Cereal_TarifaEscala
    
    Dim EscalaCount As Long
    Dim ExcesoACalcular As Single
    Dim HumedadInicioAnterior As Single

    Screen.MousePointer = vbHourglass

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    If Me.Movimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
        'ANTES QUE NADA, DEBO DETERMINAR QUE TARIFA SE DEBE APLICAR.
        If Me.Movimiento_Cereal.Calculo_TarifaIndice > 0 Then
            'ESTÁ ESPECIFICADA EN EL MOVIMIENTO
            Indice = Me.Movimiento_Cereal.Calculo_TarifaIndice
        Else
            'LAS OPCIONES Y ORDEN DE BÚSQUEDA SON:
            '   1) FILTRAR LAS QUE COINCIDAN EL RANGO DE FECHAS CON LA FECHA DEL MOVIMIENTO O QUE NO TENGAN RANGO ESPECIFICADO
            '   2) FILTRAR LAS QUE COINCIDAN CON EL CLIENTE O QUE NO ESPECIFICAN EL CLIENTE, PRIORIZAR LAS DEL CLIENTE
            '   3) DENTRO DE LAS POSIBLES TARIFAS, POR AHORA TOMAR LA PRIMERA (INDICE MENOR). EN EL FUTURO, PREGUNTAR.
            
            Set cmdSP = New ADODB.command
            With cmdSP
                Set .ActiveConnection = pDatabase.Connection
                .CommandText = "usp_Cosecha_Cereal_Tarifa__ObtenerIndice"
                .CommandType = adCmdStoredProc
                
                .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , Me.IDMovimiento_Cereal)
                .Parameters.Append .CreateParameter("Indice", adSmallInt, adParamOutput)
                
                .Execute
                
                If IsNull(.Parameters("Indice").Value) Then
                    Exit Function
                End If
                
                Indice = .Parameters("Indice").Value
            End With
            Set cmdSP = Nothing
        End If
        
        Set Cosecha_Cereal_Tarifa = New Cosecha_Cereal_Tarifa
        With Cosecha_Cereal_Tarifa
            .IDCosecha = Me.Movimiento_Cereal.IDCosecha
            .IDCereal = Me.Movimiento_Cereal.IDCereal
            .Indice = Indice
            If Not .Load() Then
                Set Cosecha_Cereal_Tarifa = Nothing
                Exit Function
            End If
        End With

        'SI CORRESPONDE, CARGO LAS ESCALAS
        If Cosecha_Cereal_Tarifa.TarifaSecadoTipo = CEREAL_TARIFA_SECADO_TIPO_ESCALA Then
            Set Cosecha_Cereal_TarifaEscala = New Cosecha_Cereal_TarifaEscala
            Cosecha_Cereal_TarifaEscala.IDCosecha = Me.Movimiento_Cereal.IDCosecha
            Cosecha_Cereal_TarifaEscala.IDCereal = Me.Movimiento_Cereal.IDCereal
            Cosecha_Cereal_TarifaEscala.Indice = Indice
        End If
    Else
        Exit Function
    End If

    Me.TarifaIndice = Indice
    '====================================================================================
    'TARIFA PARITARIA
    Me.ParitariaTarifa = Cosecha_Cereal_Tarifa.TarifaParitariaImporte
    Me.ParitariaImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.ParitariaTarifa, 2)
    '====================================================================================
    'CALCULO EL ZARANDEO, FUMIGADO Y MEZCLA ANTES DEL SECADO PORQUE EN LAS ESCALAS DE SECADO,
    'SEGÚN EL CASO, TENGO QUE PONER EN CERO ALGUNA DE ESTAS TARIFAS
    '====================================================================================
    'TARIFA ZARANDEO
    Me.ZarandeoTarifa = Cosecha_Cereal_Tarifa.TarifaZarandeoImporte
    Me.ZarandeoImporte = IIf(Me.Movimiento_Cereal.Zaranda > 0, Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.ZarandeoTarifa, 2), 0)
    '====================================================================================
    'TARIFA FUMIGADO
    Me.FumigadoTarifa = Cosecha_Cereal_Tarifa.TarifaFumigadoImporte
    Me.FumigadoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.FumigadoTarifa, 2)
    '====================================================================================
    'TARIFA MEZCLA
    Me.MezclaTarifa = Cosecha_Cereal_Tarifa.TarifaMezclaImporte
    Me.MezclaImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.MezclaTarifa, 2)
    
    If Me.Movimiento_Cereal.Humedad > Me.Movimiento_Cereal.Cereal.MermaHumedadBase Then
        '====================================================================================
        'TARIFA HUMEDAD
        Me.SecadoTarifa = Cosecha_Cereal_Tarifa.TarifaSecadoInicialImporte
        Me.SecadoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.SecadoTarifa, 2)
        '====================================================================================
        'TARIFA EXCESO HUMEDAD
        Me.HumedadExcesoReal = IIf(Me.Movimiento_Cereal.Humedad <= (Cosecha_Cereal_Tarifa.TarifaSecadoHumedadBase + Cosecha_Cereal_Tarifa.TarifaSecadoHumedadMargenLibre), 0, Round(Me.Movimiento_Cereal.Humedad - Me.Movimiento_Cereal.Cereal.MermaHumedadBase, 1))
        Me.HumedadExcesoCalculo = Me.HumedadExcesoReal
        Select Case Cosecha_Cereal_Tarifa.TarifaSecadoHumedadRedondeoPuntoTipo
            Case CEREAL_TARIFA_SECADO_REDONDEOPUNTO_TIPO_NINGUNO
            Case CEREAL_TARIFA_SECADO_REDONDEOPUNTO_TIPO_ENTERO
                Me.HumedadExcesoCalculo = Round(Me.HumedadExcesoCalculo)
            Case CEREAL_TARIFA_SECADO_REDONDEOPUNTO_TIPO_SUPERIOR
                If Me.HumedadExcesoCalculo > Fix(Me.HumedadExcesoCalculo) Then
                    Me.HumedadExcesoCalculo = Fix(Me.HumedadExcesoCalculo) + 1
                End If
            Case CEREAL_TARIFA_SECADO_REDONDEOPUNTO_TIPO_INFERIOR
                If Me.HumedadExcesoCalculo > Fix(Me.HumedadExcesoCalculo) Then
                    Me.HumedadExcesoCalculo = Fix(Me.HumedadExcesoCalculo)
                End If
        End Select
        
        Select Case Cosecha_Cereal_Tarifa.TarifaSecadoTipo
            '////////////////// IMPORTE FIJO
            Case CEREAL_TARIFA_SECADO_TIPO_FIJA
                Me.SecadoExcesoTarifa = Cosecha_Cereal_Tarifa.TarifaSecadoPuntoExcesoImporte
                Me.SecadoExcesoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * CSng(Me.HumedadExcesoCalculo) * Me.SecadoExcesoTarifa, 2)
                
            '////////////////// ESCALA
            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA
                If Me.Movimiento_Cereal.Humedad >= Cosecha_Cereal_Tarifa.TarifaSecadoHumedadBase + Cosecha_Cereal_Tarifa.TarifaSecadoHumedadMargenLibre Then
                    If Cosecha_Cereal_TarifaEscala.LoadByHumedad(Me.HumedadExcesoReal) Then
                        Select Case Cosecha_Cereal_TarifaEscala.Tipo
                            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA_PORPUNTO
                            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA_COMPLETA
                                Me.SecadoExcesoTarifa = Cosecha_Cereal_TarifaEscala.Tarifa
                                Me.SecadoExcesoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.HumedadExcesoCalculo * Me.SecadoExcesoTarifa, 2)
                            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA_FIJO_SECADO
                                Me.SecadoExcesoTarifa = Cosecha_Cereal_TarifaEscala.Tarifa
                                Me.SecadoExcesoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.SecadoExcesoTarifa, 2)
                            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA_FIJO_SECADOYZARANDEO
                                Me.ZarandeoTarifa = 0
                                Me.ZarandeoImporte = 0
                                Me.SecadoExcesoTarifa = Cosecha_Cereal_TarifaEscala.Tarifa
                                Me.SecadoExcesoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.SecadoExcesoTarifa, 2)
                            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA_FIJO_TODOCONCEPTO
                                Me.ParitariaTarifa = 0
                                Me.ParitariaImporte = 0
                                Me.ZarandeoTarifa = 0
                                Me.ZarandeoImporte = 0
                                Me.FumigadoTarifa = 0
                                Me.FumigadoImporte = 0
                                Me.MezclaTarifa = 0
                                Me.MezclaImporte = 0
                                Me.SecadoExcesoTarifa = Cosecha_Cereal_TarifaEscala.Tarifa
                                Me.SecadoExcesoImporte = Round((Me.Movimiento_Cereal.PesoNeto / 100) * Me.SecadoExcesoTarifa, 2)
                        End Select
                    End If
                End If

'            Case CEREAL_TARIFA_SECADO_TIPO_ESCALA_PORPUNTO
'                If Me.Movimiento_Cereal.Humedad >= Me.Movimiento_Cereal.Cereal.SecadoHumedadBase + Me.Movimiento_Cereal.Cereal.SecadoHumedadMargen Then
'                    If Not Cosecha_Cereal_TarifaEscala.LoadByHumedad(CSng(recMovimiento_Cereal_Calculo("HumedadExcesoReal").Value)) Then
'                        recMovimiento_Cereal_Calculo.Close
'                        Set recMovimiento_Cereal_Calculo = Nothing
'                        Set Entidad_Cosecha_Cereal_Tarifa = Nothing
'                        Set Entidad_Cosecha_Cereal_TarifaEscala = Nothing
'                        Set Cosecha_Cereal_Tarifa = Nothing
'                        Set Cosecha_Cereal_TarifaEscala = Nothing
'                        Exit Function
'                    End If
'                End If
'                ExcesoACalcular = Round(CSng(recMovimiento_Cereal_Calculo("HumedadExcesoCalculo").Value) - Cosecha_Cereal_TarifaEscala.HumedadExcesoInicio, 1)
'                If ExcesoACalcular < 1 Then
'                    ExcesoACalcular = 0
'                    EscalaCount = 0
'                    recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value = 0
'                    recMovimiento_Cereal_Calculo("SecadoExcesoImporte").Value = 0
'                Else
'                    EscalaCount = 1
'                    recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value = Cosecha_Cereal_TarifaEscala.TarifaSecadoPuntoExceso
'                    recMovimiento_Cereal_Calculo("SecadoExcesoImporte").Value = Round((Me.Movimiento_Cereal.PesoNeto / 100) * ExcesoACalcular * Cosecha_Cereal_TarifaEscala.TarifaSecadoPuntoExceso, 2)
'                End If
'                HumedadInicioAnterior = Cosecha_Cereal_TarifaEscala.HumedadExcesoInicio
'                Do While Cosecha_Cereal_TarifaEscala.MoveNext()
'                    EscalaCount = EscalaCount + 1
'                    ExcesoACalcular = HumedadInicioAnterior - Cosecha_Cereal_TarifaEscala.HumedadExcesoInicio
'                    HumedadInicioAnterior = Cosecha_Cereal_TarifaEscala.HumedadExcesoInicio
'                    recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value = CCur(recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value) + Cosecha_Cereal_TarifaEscala.TarifaSecadoPuntoExceso
'                    recMovimiento_Cereal_Calculo("SecadoExcesoImporte").Value = CCur(recMovimiento_Cereal_Calculo("SecadoExcesoImporte").Value) + Round((Me.Movimiento_Cereal.PesoNeto / 100) * ExcesoACalcular * Cosecha_Cereal_TarifaEscala.TarifaSecadoPuntoExceso, 2)
'                Loop
'                If recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value > 0 Then
'                    recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value = CCur(recMovimiento_Cereal_Calculo("SecadoExcesoTarifa").Value) / EscalaCount
'                End If
        End Select
    Else
        Me.HumedadExcesoReal = 0
        Me.HumedadExcesoCalculo = 0
        Me.SecadoTarifa = 0
        Me.SecadoImporte = 0
        Me.SecadoExcesoTarifa = 0
        Me.SecadoExcesoImporte = 0
    End If

    'IMPORTES
    Me.ImporteTotal = Me.ParitariaImporte + Me.SecadoImporte + Me.SecadoExcesoImporte + Me.ZarandeoImporte + Me.FumigadoImporte + Me.MezclaImporte
    
    If Me.Update() Then
    End If

    Set Cosecha_Cereal_Tarifa = Nothing
    Set Cosecha_Cereal_TarifaEscala = Nothing

    Screen.MousePointer = vbDefault

    Calcular = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Modules.Movimiento_Cereal_Calculo.Calcular", "Error al guardar los datos del Cálculo del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & mIDMovimiento_Cereal
    Set Cosecha_Cereal_Tarifa = Nothing
    Set Cosecha_Cereal_TarifaEscala = Nothing
End Function
