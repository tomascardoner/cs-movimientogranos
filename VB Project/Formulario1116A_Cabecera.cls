VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "F1116A_Cabecera"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario1116A As Long
Private mIDFormulario1116_Talonario As Long

Private mFormularioNumero As String
Private mFecha As Date

Private mDepositarioIDEntidad As Long
Private mDepositarioIDPlanta As Integer

Private mDepositanteIDEntidad As Long
Private mDepositanteRazonSocial As String
Private mDepositanteDomicilioTipo As Byte
Private mDepositanteDomicilioCalle As String
Private mDepositanteDomicilioNumero As String
Private mDepositanteDomicilioPiso As String
Private mDepositanteDomicilioOficina As String
Private mDepositanteDomicilioCodigoPostal As String
Private mDepositanteDomicilioIDLocalidad As Long
Private mDepositanteCUIT As String
Private mDepositanteIIBB As String
Private mDepositanteIDCategoriaIVA As Byte

Private mIDCosecha As Byte
Private mIDCereal As Byte

Private mTarifaGastoGeneral As Currency
Private mTarifaZarandeo As Currency
Private mTarifaSecadoDesde As Single
Private mTarifaSecadoHasta As Single
Private mTarifaSecado As Currency
Private mTarifaSecadoPuntoExceso As Currency
Private mTarifaOtro As Currency

Private mOrigen_IDPartido As Integer

Private mLugarEntregaDescripcion As String
Private mLugarEntregaIDProvincia As String
Private mLugarYFecha As String

Private mPesoBruto As Long
Private mMermaVolatilPorcentaje As Single
Private mMermaVolatilKilogramo As Long
Private mMermaSecadoPorcentaje As Single
Private mMermaSecadoKilogramo As Long
Private mMermaZarandeoPorcentaje As Single
Private mMermaZarandeoKilogramo As Long
Private mMermaTotal As Long
Private mPesoNeto As Long

Private mGastoGeneral As Currency
Private mGastoSecado As Currency
Private mGastoZarandeo As Currency
Private mGastoOtro As Currency
Private mGastoIVARI As Currency
Private mGastoIVARNI As Currency
Private mGastoTotal As Currency
Private mGastoIDCondicionPago As Integer

Private mKilogramoAplicado As Long

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES
Private mCFormulario1116A_Detalle As Collection

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDFormulario1116A() As Long
    IDFormulario1116A = mIDFormulario1116A
End Property

Public Property Let IDFormulario1116A(ByVal Value As Long)
    If Value <> mIDFormulario1116A Then
        mIsDirty = True
    End If
    mIDFormulario1116A = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDFormulario1116_Talonario() As Long
    IDFormulario1116_Talonario = mIDFormulario1116_Talonario
End Property

Public Property Let IDFormulario1116_Talonario(ByVal Value As Long)
    If Value <> mIDFormulario1116_Talonario Then
        mIsDirty = True
    End If
    mIDFormulario1116_Talonario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Formulario1116_Talonario() As F1116_Talonario
    Static oFormulario1116_Talonario As F1116_Talonario
    
    If mIDFormulario1116_Talonario = 0 Then
        Set Formulario1116_Talonario = Nothing
    Else
        If oFormulario1116_Talonario Is Nothing Then
            Set oFormulario1116_Talonario = New F1116_Talonario
        End If
        If oFormulario1116_Talonario.IDFormulario1116_Talonario <> mIDFormulario1116_Talonario Then
            oFormulario1116_Talonario.IDFormulario1116_Talonario = mIDFormulario1116_Talonario
            Call oFormulario1116_Talonario.Load
        End If
        Set Formulario1116_Talonario = oFormulario1116_Talonario
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FormularioNumero() As String
    FormularioNumero = mFormularioNumero
End Property

Public Property Let FormularioNumero(ByVal Value As String)
    If Value <> mFormularioNumero Then
        mIsDirty = True
    End If
    mFormularioNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Fecha() As Date
    Fecha = mFecha
End Property

Public Property Get Fecha_Formatted() As String
    Fecha = Format(mFecha, "Short Date")
End Property

Public Property Let Fecha(ByVal Value As Date)
    If Value <> mFecha Then
        mIsDirty = True
    End If
    mFecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositarioIDEntidad() As Long
    DepositarioIDEntidad = mDepositarioIDEntidad
End Property

Public Property Let DepositarioIDEntidad(ByVal Value As Long)
    If Value <> mDepositarioIDEntidad Then
        mIsDirty = True
    End If
    mDepositarioIDEntidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositarioIDPlanta() As Long
    DepositarioIDPlanta = mDepositarioIDPlanta
End Property

Public Property Let DepositarioIDPlanta(ByVal Value As Long)
    If Value <> mDepositarioIDPlanta Then
        mIsDirty = True
    End If
    mDepositarioIDPlanta = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteIDEntidad() As Long
    DepositanteIDEntidad = mDepositanteIDEntidad
End Property

Public Property Let DepositanteIDEntidad(ByVal Value As Long)
    If Value <> mDepositanteIDEntidad Then
        mIsDirty = True
    End If
    mDepositanteIDEntidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteRazonSocial() As String
    DepositanteRazonSocial = mDepositanteRazonSocial
End Property

Public Property Let DepositanteRazonSocial(ByVal Value As String)
    If Value <> mDepositanteRazonSocial Then
        mIsDirty = True
    End If
    mDepositanteRazonSocial = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioTipo() As Byte
    DepositanteDomicilioTipo = mDepositanteDomicilioTipo
End Property

Public Property Let DepositanteDomicilioTipo(ByVal Value As Byte)
    If Value <> mDepositanteDomicilioTipo Then
        mIsDirty = True
    End If
    mDepositanteDomicilioTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioCalle() As String
    DepositanteDomicilioCalle = mDepositanteDomicilioCalle
End Property

Public Property Let DepositanteDomicilioCalle(ByVal Value As String)
    If Value <> mDepositanteDomicilioCalle Then
        mIsDirty = True
    End If
    mDepositanteDomicilioCalle = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioNumero() As String
    DepositanteDomicilioNumero = mDepositanteDomicilioNumero
End Property

Public Property Let DepositanteDomicilioNumero(ByVal Value As String)
    If Value <> mDepositanteDomicilioNumero Then
        mIsDirty = True
    End If
    mDepositanteDomicilioNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioPiso() As String
    DepositanteDomicilioPiso = mDepositanteDomicilioPiso
End Property

Public Property Let DepositanteDomicilioPiso(ByVal Value As String)
    If Value <> mDepositanteDomicilioPiso Then
        mIsDirty = True
    End If
    mDepositanteDomicilioPiso = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioOficina() As String
    DepositanteDomicilioOficina = mDepositanteDomicilioOficina
End Property

Public Property Let DepositanteDomicilioOficina(ByVal Value As String)
    If Value <> mDepositanteDomicilioOficina Then
        mIsDirty = True
    End If
    mDepositanteDomicilioOficina = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioDireccion() As String
    If mDepositanteDomicilioCalle <> "" Then
        DepositanteDomicilioDireccion = mDepositanteDomicilioCalle
        If mDepositanteDomicilioNumero <> "" Then
            DepositanteDomicilioDireccion = DepositanteDomicilioDireccion & " " & mDepositanteDomicilioNumero
            If mDepositanteDomicilioPiso <> "" Then
                DepositanteDomicilioDireccion = DepositanteDomicilioDireccion & " " & IIf(IsNumeric(mDepositanteDomicilioPiso), "P.", "") & mDepositanteDomicilioPiso
                If mDepositanteDomicilioOficina <> "" Then
                    DepositanteDomicilioDireccion = DepositanteDomicilioDireccion & " """ & mDepositanteDomicilioNumero & """"
                End If
            End If
        End If
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioCodigoPostal() As String
    DepositanteDomicilioCodigoPostal = mDepositanteDomicilioCodigoPostal
End Property

Public Property Let DepositanteDomicilioCodigoPostal(ByVal Value As String)
    If Value <> mDepositanteDomicilioCodigoPostal Then
        mIsDirty = True
    End If
    mDepositanteDomicilioCodigoPostal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioIDLocalidad() As Long
    DepositanteDomicilioIDLocalidad = mDepositanteDomicilioIDLocalidad
End Property

Public Property Let DepositanteDomicilioIDLocalidad(ByVal Value As Long)
    If Value <> mDepositanteDomicilioIDLocalidad Then
        mIsDirty = True
    End If
    mDepositanteDomicilioIDLocalidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteDomicilioLocalidad() As Localidad
    Static oLocalidad As Localidad
    
    If mDepositanteDomicilioIDLocalidad = 0 Then
        Set DepositanteDomicilioLocalidad = Nothing
    Else
        If oLocalidad Is Nothing Then
            Set oLocalidad = New Localidad
        End If
        If oLocalidad.IDLocalidad <> mDepositanteDomicilioIDLocalidad Then
            oLocalidad.IDLocalidad = mDepositanteDomicilioIDLocalidad
            Call oLocalidad.Load
        End If
        Set DepositanteDomicilioLocalidad = oLocalidad
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteCUIT() As String
    DepositanteCUIT = mDepositanteCUIT
End Property

Public Property Let DepositanteCUIT(ByVal Value As String)
    If Value <> mDepositanteCUIT Then
        mIsDirty = True
    End If
    mDepositanteCUIT = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteIIBB() As String
    DepositanteIIBB = mDepositanteIIBB
End Property

Public Property Let DepositanteIIBB(ByVal Value As String)
    If Value <> mDepositanteIIBB Then
        mIsDirty = True
    End If
    mDepositanteIIBB = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteIDCategoriaIVA() As Long
    DepositanteIDCategoriaIVA = mDepositanteIDCategoriaIVA
End Property

Public Property Let DepositanteIDCategoriaIVA(ByVal Value As Long)
    If Value <> mDepositanteIDCategoriaIVA Then
        mIsDirty = True
    End If
    mDepositanteIDCategoriaIVA = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDCereal() As Long
    IDCereal = mIDCereal
End Property

Public Property Let IDCereal(ByVal Value As Long)
    If Value <> mIDCereal Then
        mIsDirty = True
    End If
    mIDCereal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Cereal() As Cereal
    Static oCereal As Cereal
    
    If mIDCereal = 0 Then
        Set Cereal = Nothing
    Else
        If oCereal Is Nothing Then
            Set oCereal = New Cereal
        End If
        If oCereal.IDCereal <> mIDCereal Then
            oCereal.IDCereal = mIDCereal
            Call oCereal.Load
        End If
        Set Cereal = oCereal
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDCosecha() As Long
    IDCosecha = mIDCosecha
End Property

Public Property Let IDCosecha(ByVal Value As Long)
    If Value <> mIDCosecha Then
        mIsDirty = True
    End If
    mIDCosecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Cosecha() As Cosecha
    Static oCosecha As Cosecha
    
    If mIDCosecha = 0 Then
        Set Cosecha = Nothing
    Else
        If oCosecha Is Nothing Then
            Set oCosecha = New Cosecha
        End If
        If oCosecha.IDCosecha <> mIDCosecha Then
            oCosecha.IDCosecha = mIDCosecha
            Call oCosecha.Load
        End If
        Set Cosecha = oCosecha
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_IDPartido() As Long
    Origen_IDPartido = mOrigen_IDPartido
End Property

Public Property Let Origen_IDPartido(ByVal Value As Long)
    If Value <> mOrigen_IDPartido Then
        mIsDirty = True
    End If
    mOrigen_IDPartido = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_Partido() As Partido
    Static oOrigen_Partido As Partido
    
    If mOrigen_IDPartido = 0 Then
        Set Origen_Partido = Nothing
    Else
        If oOrigen_Partido Is Nothing Then
            Set oOrigen_Partido = New Partido
        End If
        If oOrigen_Partido.IDPartido <> mOrigen_IDPartido Then
            oOrigen_Partido.IDPartido = mOrigen_IDPartido
            Call oOrigen_Partido.Load
        End If
        Set Origen_Partido = oOrigen_Partido
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get LugarEntregaDescripcion() As String
    LugarEntregaDescripcion = mLugarEntregaDescripcion
End Property

Public Property Let LugarEntregaDescripcion(ByVal Value As String)
    If Value <> mLugarEntregaDescripcion Then
        mIsDirty = True
    End If
    mLugarEntregaDescripcion = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get LugarEntregaIDProvincia() As String
    LugarEntregaIDProvincia = mLugarEntregaIDProvincia
End Property

Public Property Let LugarEntregaIDProvincia(ByVal Value As String)
    If Value <> mLugarEntregaIDProvincia Then
        mIsDirty = True
    End If
    mLugarEntregaIDProvincia = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get LugarYFecha() As String
    LugarYFecha = mLugarYFecha
End Property

Public Property Let LugarYFecha(ByVal Value As String)
    If Value <> mLugarYFecha Then
        mIsDirty = True
    End If
    mLugarYFecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PesoBruto() As Long
    PesoBruto = mPesoBruto
End Property

Public Property Let PesoBruto(ByVal Value As Long)
    If Value <> mPesoBruto Then
        mIsDirty = True
    End If
    mPesoBruto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaVolatilPorcentaje() As Single
    MermaVolatilPorcentaje = mMermaVolatilPorcentaje
End Property

Public Property Let MermaVolatilPorcentaje(ByVal Value As Single)
    If Value <> mMermaVolatilPorcentaje Then
        mIsDirty = True
    End If
    mMermaVolatilPorcentaje = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaVolatilKilogramo() As Long
    MermaVolatilKilogramo = mMermaVolatilKilogramo
End Property

Public Property Let MermaVolatilKilogramo(ByVal Value As Long)
    If Value <> mMermaVolatilKilogramo Then
        mIsDirty = True
    End If
    mMermaVolatilKilogramo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaSecadoPorcentaje() As Single
    MermaSecadoPorcentaje = mMermaSecadoPorcentaje
End Property

Public Property Let MermaSecadoPorcentaje(ByVal Value As Single)
    If Value <> mMermaSecadoPorcentaje Then
        mIsDirty = True
    End If
    mMermaSecadoPorcentaje = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaSecadoKilogramo() As Long
    MermaSecadoKilogramo = mMermaSecadoKilogramo
End Property

Public Property Let MermaSecadoKilogramo(ByVal Value As Long)
    If Value <> mMermaSecadoKilogramo Then
        mIsDirty = True
    End If
    mMermaSecadoKilogramo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaZarandeoPorcentaje() As Single
    MermaZarandeoPorcentaje = mMermaZarandeoPorcentaje
End Property

Public Property Let MermaZarandeoPorcentaje(ByVal Value As Single)
    If Value <> mMermaZarandeoPorcentaje Then
        mIsDirty = True
    End If
    mMermaZarandeoPorcentaje = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaZarandeoKilogramo() As Long
    MermaZarandeoKilogramo = mMermaZarandeoKilogramo
End Property

Public Property Let MermaZarandeoKilogramo(ByVal Value As Long)
    If Value <> mMermaZarandeoKilogramo Then
        mIsDirty = True
    End If
    mMermaZarandeoKilogramo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaTotal() As Long
    MermaTotal = mMermaTotal
End Property

Public Property Let MermaTotal(ByVal Value As Long)
    If Value <> mMermaTotal Then
        mIsDirty = True
    End If
    mMermaTotal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PesoNeto() As Long
    PesoNeto = mPesoNeto
End Property

Public Property Let PesoNeto(ByVal Value As Long)
    If Value <> mPesoNeto Then
        mIsDirty = True
    End If
    mPesoNeto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoGeneral() As Currency
    GastoGeneral = mGastoGeneral
End Property

Public Property Let GastoGeneral(ByVal Value As Currency)
    If Value <> mGastoGeneral Then
        mIsDirty = True
    End If
    mGastoGeneral = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoSecado() As Currency
    GastoSecado = mGastoSecado
End Property

Public Property Let GastoSecado(ByVal Value As Currency)
    If Value <> mGastoSecado Then
        mIsDirty = True
    End If
    mGastoSecado = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoZarandeo() As Currency
    GastoZarandeo = mGastoZarandeo
End Property

Public Property Let GastoZarandeo(ByVal Value As Currency)
    If Value <> mGastoZarandeo Then
        mIsDirty = True
    End If
    mGastoZarandeo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoOtro() As Currency
    GastoOtro = mGastoOtro
End Property

Public Property Let GastoOtro(ByVal Value As Currency)
    If Value <> mGastoOtro Then
        mIsDirty = True
    End If
    mGastoOtro = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoIVARI() As Currency
    GastoIVARI = mGastoIVARI
End Property

Public Property Let GastoIVARI(ByVal Value As Currency)
    If Value <> mGastoIVARI Then
        mIsDirty = True
    End If
    mGastoIVARI = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoIVARNI() As Currency
    GastoIVARNI = mGastoIVARNI
End Property

Public Property Let GastoIVARNI(ByVal Value As Currency)
    If Value <> mGastoIVARNI Then
        mIsDirty = True
    End If
    mGastoIVARNI = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoTotal() As Currency
    GastoTotal = mGastoTotal
End Property

Public Property Let GastoTotal(ByVal Value As Currency)
    If Value <> mGastoTotal Then
        mIsDirty = True
    End If
    mGastoTotal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GastoIDCondicionPago() As Long
    GastoIDCondicionPago = mGastoIDCondicionPago
End Property

Public Property Let GastoIDCondicionPago(ByVal Value As Long)
    If Value <> mGastoIDCondicionPago Then
        mIsDirty = True
    End If
    mGastoIDCondicionPago = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get KilogramoAplicado() As Long
    KilogramoAplicado = mKilogramoAplicado
End Property

Public Property Let KilogramoAplicado(ByVal Value As Long)
    If Value <> mKilogramoAplicado Then
        mIsDirty = True
    End If
    mKilogramoAplicado = Value
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
    RefreshList_Module.Formulario1116A mIDFormulario1116A
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CFormulario1116A_Detalle() As Collection
    Set CFormulario1116A_Detalle = mCFormulario1116A_Detalle
End Property

Public Property Set CFormulario1116A_Detalle(ByRef Value As Collection)
    Set mCFormulario1116A_Detalle = Value
End Property

Public Property Get Formulario1116A_Detalle(ByVal Index As Variant) As F1116A_Detalle
    Set Formulario1116A_Detalle = mCFormulario1116A_Detalle(Index)
End Property

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
        .CommandText = "usp_Formulario1116A_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116A", adInteger, adParamInput, , mIDFormulario1116A)
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
    ShowErrorMessage "Classes.F1116A_Cabecera.Load", "Error al obtener los datos del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A
End Function

Public Function LoadByFormularioNumero() As Boolean
    Dim FormularioNumeroSave As String
    
    Dim cmdSP As ADODB.command
    Dim recData As ADODB.Recordset

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    FormularioNumeroSave = mFormularioNumero
    Call InitializeValues
    IDFormulario1116A = 0
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116A_GetByFormularioNumero"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("FormularioNumero", adVarChar, adParamInput, 13, FormularioNumeroSave)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Screen.MousePointer = vbHourglass

    LoadByFormularioNumero = GetDataFromRecordset(recData)
    
    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Cabecera.LoadByFormularioNumero", "Error al obtener los datos del Formulario 1116A." & vbCr & vbCr & "Formulario Nº: " & FormularioNumero
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDFormulario1116_Talonario = recData("IDFormulario1116_Talonario").Value

        'ENCABEZADO
        mFormularioNumero = recData("FormularioNumero").Value
        mFecha = recData("Fecha").Value

        'DEPOSITARIO
        mDepositarioIDEntidad = recData("DepositarioIDEntidad").Value
        mDepositarioIDPlanta = recData("DepositarioIDPlanta").Value

        'DEPOSITANTE
        mDepositanteIDEntidad = recData("DepositanteIDEntidad").Value
        mDepositanteRazonSocial = recData("DepositanteRazonSocial").Value
        mDepositanteDomicilioTipo = recData("DepositanteDomicilioTipo").Value
        mDepositanteDomicilioCalle = recData("DepositanteDomicilioCalle").Value
        mDepositanteDomicilioNumero = recData("DepositanteDomicilioNumero").Value & ""
        mDepositanteDomicilioPiso = recData("DepositanteDomicilioPiso").Value & ""
        mDepositanteDomicilioOficina = recData("DepositanteDomicilioOficina").Value & ""
        mDepositanteDomicilioCodigoPostal = recData("DepositanteDomicilioCodigoPostal").Value & ""
        mDepositanteDomicilioIDLocalidad = recData("DepositanteDomicilioIDLocalidad").Value
        mDepositanteCUIT = recData("DepositanteCUIT").Value
        mDepositanteIIBB = recData("DepositanteIIBB").Value & ""
        mDepositanteIDCategoriaIVA = CSM_Function.IfIsNull_Zero(recData("DepositanteIDCategoriaIVA").Value)

        'CEREAL
        mIDCereal = recData("IDCereal").Value
        mIDCosecha = recData("IDCosecha").Value

        'TARIFAS
        mTarifaGastoGeneral = CSM_Function.IfIsNull_Zero(recData("TarifaGastoGeneral").Value)
        mTarifaZarandeo = CSM_Function.IfIsNull_Zero(recData("TarifaZarandeo").Value)
        mTarifaSecadoDesde = CSM_Function.IfIsNull_Zero(recData("TarifaSecadoDesde").Value)
        mTarifaSecadoHasta = CSM_Function.IfIsNull_Zero(recData("TarifaSecadoHasta").Value)
        mTarifaSecado = CSM_Function.IfIsNull_Zero(recData("TarifaSecado").Value)
        mTarifaSecadoPuntoExceso = CSM_Function.IfIsNull_Zero(recData("TarifaSecadoPuntoExceso").Value)
        mTarifaOtro = CSM_Function.IfIsNull_Zero(recData("TarifaOtro").Value)

        'ORIGEN DE LA MERCADERIA
        mOrigen_IDPartido = recData("Origen_IDPartido").Value
        
        'DESTINO DE LA MERCADERIA
        mLugarEntregaDescripcion = recData("LugarEntregaDescripcion").Value
        mLugarEntregaIDProvincia = recData("LugarEntregaIDProvincia").Value
        mLugarYFecha = recData("LugarYFecha").Value

        'KILOGRAMOS
        mPesoBruto = recData("PesoBruto").Value
        mMermaVolatilPorcentaje = recData("MermaVolatilPorcentaje").Value
        mMermaVolatilKilogramo = recData("MermaVolatilKilogramo").Value
        mMermaSecadoPorcentaje = recData("MermaSecadoPorcentaje").Value
        mMermaSecadoKilogramo = recData("MermaSecadoKilogramo").Value
        mMermaZarandeoPorcentaje = recData("MermaZarandeoPorcentaje").Value
        mMermaZarandeoKilogramo = recData("MermaZarandeoKilogramo").Value
        mMermaTotal = recData("MermaTotal").Value
        mPesoNeto = recData("PesoNeto").Value

        'GASTOS
        mGastoGeneral = IIf(IsNull(recData("GastoGeneral").Value), 0, recData("GastoGeneral").Value)
        mGastoSecado = IIf(IsNull(recData("GastoSecado").Value), 0, recData("GastoSecado").Value)
        mGastoZarandeo = IIf(IsNull(recData("GastoZarandeo").Value), 0, recData("GastoZarandeo").Value)
        mGastoOtro = IIf(IsNull(recData("GastoOtro").Value), 0, recData("GastoOtro").Value)
        mGastoIVARI = IIf(IsNull(recData("GastoIVARI").Value), 0, recData("GastoIVARI").Value)
        mGastoIVARNI = IIf(IsNull(recData("GastoIVARNI").Value), 0, recData("GastoIVARNI").Value)
        mGastoTotal = IIf(IsNull(recData("GastoTotal").Value), 0, recData("GastoTotal").Value)
        mGastoIDCondicionPago = IIf(IsNull(recData("GastoIDCondicionPago").Value), 0, recData("GastoIDCondicionPago").Value)

        mKilogramoAplicado = recData("KilogramoAplicado").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Cabecera.GetDataFromRecordset", "Error al leer los datos del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & IDFormulario1116A
End Function

Public Function LoadDetalles() As Boolean
    Dim recData As ADODB.Recordset
    Dim Formulario1116A_Detalle  As F1116A_Detalle

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set recData = New ADODB.Recordset
    Set recData.ActiveConnection = pDatabase.Connection
    recData.CursorType = adOpenKeyset
    recData.LockType = adLockOptimistic
    recData.Source = "SELECT Formulario1116A_Detalle.IDFormulario1116A, Formulario1116A_Detalle.IDRemesa, Formulario1116A_Detalle.CartaPorteFecha, Formulario1116A_Detalle.ComprobanteNumero FROM Formulario1116A_Detalle"
    recData.Open , , , , adCmdText
    recData.Sort = "CartaPorteFecha, ComprobanteNumero"

    recData.Filter = "IDF1116A = " & mIDFormulario1116A

    Do While Not recData.EOF
        Set Formulario1116A_Detalle = New F1116A_Detalle
        With Formulario1116A_Detalle
            .IDFormulario1116A = mIDFormulario1116A
            .IDRemesa = recData("IDRemesa").Value
            If Not .Load() Then
                recData.Close
                Set recData = Nothing
                Exit Function
            End If
            mCFormulario1116A_Detalle.Add Formulario1116A_Detalle, KEY_STRINGER & .IDRemesa
        End With
        Set Formulario1116A_Detalle = Nothing
    
        recData.MoveNext
    Loop
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    LoadDetalles = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Cabecera.LoadDetalles", "Error al obtener los Detalles del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario1116A = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command
    
    Dim IDMovimiento_Cereal_Cereal_Item As Variant
    Dim Formulario1116A_Detalle As F1116A_Detalle
    
    Dim IDMovimiento_Cereal_Cereal_StringList As String

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
        .CommandText = "usp_Formulario1116A_Add"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116A", adInteger, adParamOutput)
        .Parameters.Append .CreateParameter("IDFormulario1116_Talonario", adInteger, adParamInput, , mIDFormulario1116_Talonario)
        .Parameters.Append .CreateParameter("FormularioNumero", adVarChar, adParamInput, 13, mFormularioNumero)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("DepositarioIDEntidad", adInteger, adParamInput, , mDepositarioIDEntidad)
        .Parameters.Append .CreateParameter("DepositarioIDPlanta", adSmallInt, adParamInput, , mDepositarioIDPlanta)
        .Parameters.Append .CreateParameter("DepositanteIDEntidad", adInteger, adParamInput, , mDepositanteIDEntidad)
        .Parameters.Append .CreateParameter("DepositanteRazonSocial", adVarChar, adParamInput, 100, UCase(mDepositanteRazonSocial))
        .Parameters.Append .CreateParameter("DepositanteDomicilioTipo", adTinyInt, adParamInput, , mDepositanteDomicilioTipo)
        .Parameters.Append .CreateParameter("DepositanteDomicilioCalle", adVarChar, adParamInput, 50, IIf(mDepositanteDomicilioCalle = "", Null, UCase(mDepositanteDomicilioCalle)))
        .Parameters.Append .CreateParameter("DepositanteDomicilioNumero", adVarChar, adParamInput, 10, IIf(mDepositanteDomicilioNumero = "", Null, UCase(mDepositanteDomicilioNumero)))
        .Parameters.Append .CreateParameter("DepositanteDomicilioPiso", adVarChar, adParamInput, 10, IIf(mDepositanteDomicilioPiso = "", Null, UCase(mDepositanteDomicilioPiso)))
        .Parameters.Append .CreateParameter("DepositanteDomicilioOficina", adVarChar, adParamInput, 10, IIf(mDepositanteDomicilioOficina = "", Null, UCase(mDepositanteDomicilioOficina)))
        .Parameters.Append .CreateParameter("DepositanteDomicilioCodigoPostal", adVarChar, adParamInput, 8, IIf(mDepositanteDomicilioCodigoPostal = "", Null, UCase(mDepositanteDomicilioCodigoPostal)))
        .Parameters.Append .CreateParameter("DepositanteDomicilioIDLocalidad", adInteger, adParamInput, , IIf(mDepositanteDomicilioIDLocalidad = 0, Null, mDepositanteDomicilioIDLocalidad))
        .Parameters.Append .CreateParameter("DepositanteCUIT", adChar, adParamInput, 13, mDepositanteCUIT)
        .Parameters.Append .CreateParameter("DepositanteIIBB", adVarChar, adParamInput, 20, IIf(mDepositanteIIBB = "", Null, mDepositanteIIBB))
        .Parameters.Append .CreateParameter("DepositanteIDCategoriaIVA", adTinyInt, adParamInput, , IIf(mDepositanteIDCategoriaIVA = 0, Null, mDepositanteIDCategoriaIVA))
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("TarifaGastosGenerales", adCurrency, adParamInput, , Null)
        .Parameters.Append .CreateParameter("TarifaZarandeo", adCurrency, adParamInput, , Null)
        .Parameters.Append .CreateParameter("TarifaSecadoDesde", adDecimal, adParamInput, , Null)
        .Parameters("TarifaSecadoDesde").Precision = 3
        .Parameters("TarifaSecadoDesde").NumericScale = 1
        .Parameters.Append .CreateParameter("TarifaSecadoHasta", adDecimal, adParamInput, 3, Null)
        .Parameters("TarifaSecadoHasta").Precision = 3
        .Parameters("TarifaSecadoHasta").NumericScale = 1
        .Parameters.Append .CreateParameter("TarifaSecado", adCurrency, adParamInput, , Null)
        .Parameters.Append .CreateParameter("TarifaSecadoPuntoExceso", adCurrency, adParamInput, , Null)
        .Parameters.Append .CreateParameter("TarifaOtro", adCurrency, adParamInput, , Null)
        .Parameters.Append .CreateParameter("Origen_IDPartido", adSmallInt, adParamInput, , mOrigen_IDPartido)
        .Parameters.Append .CreateParameter("LugarEntregaDescripcion", adVarChar, adParamInput, 100, UCase(mLugarEntregaDescripcion))
        .Parameters.Append .CreateParameter("LugarEntregaIDProvincia", adChar, adParamInput, 1, mLugarEntregaIDProvincia)
        .Parameters.Append .CreateParameter("LugarYFecha", adVarChar, adParamInput, 100, UCase(mLugarYFecha))
        .Parameters.Append .CreateParameter("GastoGeneral", adCurrency, adParamInput, , mGastoGeneral)
        .Parameters.Append .CreateParameter("GastoSecado", adCurrency, adParamInput, , mGastoSecado)
        .Parameters.Append .CreateParameter("GastoZarandeo", adCurrency, adParamInput, , mGastoZarandeo)
        .Parameters.Append .CreateParameter("GastoOtro", adCurrency, adParamInput, , mGastoOtro)
        .Parameters.Append .CreateParameter("GastoIVARI", adCurrency, adParamInput, , mGastoIVARI)
        .Parameters.Append .CreateParameter("GastoIVARNI", adCurrency, adParamInput, , mGastoIVARNI)
        .Parameters.Append .CreateParameter("GastoTotal", adCurrency, adParamInput, , mGastoTotal)
        .Parameters.Append .CreateParameter("GastoIDCondicionPago", adSmallInt, adParamInput, , mGastoIDCondicionPago)
        For Each Formulario1116A_Detalle In mCFormulario1116A_Detalle
            IDMovimiento_Cereal_Cereal_StringList = IDMovimiento_Cereal_Cereal_StringList & CStr(Formulario1116A_Detalle.IDMovimiento_Cereal) & STRING_LIST_SEPARATOR
        Next Formulario1116A_Detalle
        .Parameters.Append .CreateParameter("StringListOfIDMovimiento_Cereal_Cereal", adVarChar, adParamInput, 1000, IDMovimiento_Cereal_Cereal_StringList)
        
        .Execute
        
        If mIsNew Then
            mIDFormulario1116A = .Parameters("IDFormulario1116A").Value
        End If
    End With

    mIsNew = False
    mIsCopy = False
    mIsDirty = False
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Update = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Cabecera.Update", "Error al actualizar el Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

'Public Function UpdateKilogramoSinAplicarRestar(ByVal KilogramoAplicado As Long) As Boolean
'    If mrecData Is Nothing Then
'        If Not OpenRecordset() Then
'            Exit Function
'        End If
'    Else
'        If mrecData.State <> adStateOpen Then
'            If Not OpenRecordset() Then
'                Exit Function
'            End If
'        End If
'    End If
'
'    If pTrapErrors Then
'        On Error GoTo ErrorHandler
'    End If
'
'    Screen.MousePointer = vbHourglass
'    mKilogramoSinAplicar = mKilogramoSinAplicar - KilogramoAplicado
'    mrecData("KilogramoSinAplicar").Value = mKilogramoSinAplicar
'    mrecData.Update
'
'    mIsDirty = False
'
'    Screen.MousePointer = vbDefault
'    UpdateKilogramoSinAplicarRestar = True
'    Exit Function
'
'ErrorHandler:
'    If pDatabase.Connection.Errors.Count > 0 Then
'        If pDatabase.Connection.Errors(0).NativeError = pDatabase.ERROR_DUPLICATE_KEY Then
'            Screen.MousePointer = vbDefault
'            MsgBox "Ya existe un Formulario 1116A con el mismo ID o Número.", vbExclamation, App.Title
'        Else
'            ShowErrorMessage "Classes.F1116_Cabecera.UpdateKilogramoSinAplicarRestar", "Error al actualizar el Formulario 1116A." & vbCr & vbCr & "IDF1116A: " & mIDFormulario1116A
'        End If
'        If mrecData.EditMode = adEditAdd Or mrecData.EditMode = adEditInProgress Then
'            mrecData.CancelUpdate
'        End If
'    Else
'        ShowErrorMessage "Classes.F1116_Cabecera.UpdateKilogramoSinAplicarRestar", "Error al actualizar el Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A
'    End If
'End Function
'
Public Function Delete() As Boolean
    Dim cmdSP As ADODB.command

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116A_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116A", adInteger, adParamInput, , mIDFormulario1116A)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Cabecera.Delete", "Error al eliminar el Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Sub InitializeValues()
    mIDFormulario1116_Talonario = 0
    
    mFormularioNumero = ""
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    
    mDepositarioIDEntidad = 0
    mDepositarioIDPlanta = 0
    
    mDepositanteIDEntidad = 0
    mDepositanteRazonSocial = ""
    mDepositanteDomicilioTipo = 0
    mDepositanteDomicilioCalle = ""
    mDepositanteDomicilioNumero = ""
    mDepositanteDomicilioPiso = ""
    mDepositanteDomicilioOficina = ""
    mDepositanteDomicilioCodigoPostal = ""
    mDepositanteDomicilioIDLocalidad = 0
    mDepositanteCUIT = ""
    mDepositanteIIBB = ""
    mDepositanteIDCategoriaIVA = 0
    
    mIDCereal = 0
    mIDCosecha = 0
    
    mTarifaGastoGeneral = 0
    mTarifaZarandeo = 0
    mTarifaSecadoDesde = 0
    mTarifaSecadoHasta = 0
    mTarifaSecado = 0
    mTarifaSecadoPuntoExceso = 0
    mTarifaOtro = 0
    
    mOrigen_IDPartido = 0
    
    mLugarEntregaDescripcion = ""
    mLugarEntregaIDProvincia = ""
    mLugarYFecha = ""
    
    mPesoBruto = -1
    mMermaVolatilPorcentaje = -1
    mMermaVolatilKilogramo = -1
    mMermaSecadoPorcentaje = -1
    mMermaSecadoKilogramo = -1
    mMermaZarandeoPorcentaje = -1
    mMermaZarandeoKilogramo = -1
    mMermaTotal = -1
    mPesoNeto = -1
    
    mGastoGeneral = 0
    mGastoSecado = 0
    mGastoZarandeo = 0
    mGastoOtro = 0
    mGastoIVARI = 0
    mGastoIVARNI = 0
    mGastoTotal = 0
    mGastoIDCondicionPago = 0
    
    KilogramoAplicado = 0
    
    Set mCFormulario1116A_Detalle = New Collection

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub

Private Sub Class_Terminate()
    Set mCFormulario1116A_Detalle = Nothing
End Sub
