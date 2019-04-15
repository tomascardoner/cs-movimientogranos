VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "F1116RT_Cabecera"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario1116RT As Long
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

Private mOrigen_FormularioTipo As String
Private mOrigen_FormularioNumero As String
Private mOrigen_FormularioFecha As Date
Private mOrigen_IDFormulario1116A As Long
Private mOrigen_IDFormulario1116RT As Long
Private mOrigen_IDPartido As Integer

Private mIDCosecha As Byte
Private mIDCereal As Byte

Private mRetiroOTransferencia As String

Private mTotalKilogramo As Long
Private mGeneraNuevoF1116A As Boolean
Private mReceptorIDEntidad As Long
Private mReceptorRazonSocial As String
Private mReceptorDomicilioTipo As Integer
Private mReceptorDomicilioCalle As String
Private mReceptorDomicilioNumero As String
Private mReceptorDomicilioPiso As String
Private mReceptorDomicilioOficina As String
Private mReceptorDomicilioCodigoPostal As String
Private mReceptorDomicilioIDLocalidad As Long
Private mReceptorCUIT As String
Private mReceptorIIBB As String
Private mReceptorIDCategoriaIVA As Integer
Private mReceptorActividad As String
Private mReceptorOperadorNumero As Long

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
Private mCFormulario1116RT_Detalle As Collection

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDFormulario1116RT() As Long
    IDFormulario1116RT = mIDFormulario1116RT
End Property

Public Property Let IDFormulario1116RT(ByVal Value As Long)
    If Value <> mIDFormulario1116RT Then
        mIsDirty = True
    End If
    mIDFormulario1116RT = Value
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

Public Property Get Origen_FormularioTipo() As String
    Origen_FormularioTipo = mOrigen_FormularioTipo
End Property

Public Property Let Origen_FormularioTipo(ByVal Value As String)
    If Value <> mOrigen_FormularioTipo Then
        mIsDirty = True
    End If
    mOrigen_FormularioTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_FormularioNumero() As String
    Origen_FormularioNumero = mOrigen_FormularioNumero
End Property

Public Property Let Origen_FormularioNumero(ByVal Value As String)
    If Value <> mOrigen_FormularioNumero Then
        mIsDirty = True
    End If
    mOrigen_FormularioNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_FormularioFecha() As Date
    Origen_FormularioFecha = mOrigen_FormularioFecha
End Property

Public Property Get Origen_FormularioFecha_Formatted() As String
    Origen_FormularioFecha = Format(mOrigen_FormularioFecha, "Short Date")
End Property

Public Property Let Origen_FormularioFecha(ByVal Value As Date)
    If Value <> mOrigen_FormularioFecha Then
        mIsDirty = True
    End If
    mOrigen_FormularioFecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_IDFormulario1116A() As Long
    Origen_IDFormulario1116A = mOrigen_IDFormulario1116A
End Property

Public Property Let Origen_IDFormulario1116A(ByVal Value As Long)
    If Value <> mOrigen_IDFormulario1116A Then
        mIsDirty = True
    End If
    mOrigen_IDFormulario1116A = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_Formulario1116A_Cabecera() As F1116A_Cabecera
    Static oFormulario1116A_Cabecera As F1116A_Cabecera
    
    If mOrigen_IDFormulario1116A = 0 Then
        Set Origen_Formulario1116A_Cabecera = Nothing
    Else
        If oFormulario1116A_Cabecera Is Nothing Then
            Set oFormulario1116A_Cabecera = New F1116A_Cabecera
        End If
        If oFormulario1116A_Cabecera.IDFormulario1116A <> mOrigen_IDFormulario1116A Then
            oFormulario1116A_Cabecera.IDFormulario1116A = mOrigen_IDFormulario1116A
            Call oFormulario1116A_Cabecera.Load
        End If
        Set Origen_Formulario1116A_Cabecera = oFormulario1116A_Cabecera
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_IDFormulario1116RT() As Long
    Origen_IDFormulario1116RT = mOrigen_IDFormulario1116RT
End Property

Public Property Let Origen_IDFormulario1116RT(ByVal Value As Long)
    If Value <> mOrigen_IDFormulario1116RT Then
        mIsDirty = True
    End If
    mOrigen_IDFormulario1116RT = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_Formulario1116RT_Cabecera() As F1116RT_Cabecera
    Static oFormulario1116RT_Cabecera As F1116RT_Cabecera
    
    If mIDFormulario1116RT = 0 Then
        Set Origen_Formulario1116RT_Cabecera = Nothing
    Else
        If oFormulario1116RT_Cabecera Is Nothing Then
            Set oFormulario1116RT_Cabecera = New F1116RT_Cabecera
        End If
        If oFormulario1116RT_Cabecera.Origen_IDFormulario1116RT <> mOrigen_IDFormulario1116RT Then
            oFormulario1116RT_Cabecera.IDFormulario1116RT = mOrigen_IDFormulario1116RT
            Call oFormulario1116RT_Cabecera.Load
        End If
        Set Origen_Formulario1116RT_Cabecera = oFormulario1116RT_Cabecera
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Origen_IDPartido() As Integer
    Origen_IDPartido = mOrigen_IDPartido
End Property

Public Property Let Origen_IDPartido(ByVal Value As Integer)
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

Public Property Get RetiroOTransferencia() As String
    RetiroOTransferencia = mRetiroOTransferencia
End Property

Public Property Let RetiroOTransferencia(ByVal Value As String)
    If Value <> mRetiroOTransferencia Then
        mIsDirty = True
    End If
    mRetiroOTransferencia = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TotalKilogramo() As Long
    TotalKilogramo = mTotalKilogramo
End Property

Public Property Let TotalKilogramo(ByVal Value As Long)
    If Value <> mTotalKilogramo Then
        mIsDirty = True
    End If
    mTotalKilogramo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get GeneraNuevoF1116A() As Boolean
    GeneraNuevoF1116A = mGeneraNuevoF1116A
End Property

Public Property Let GeneraNuevoF1116A(ByVal Value As Boolean)
    If Value <> mGeneraNuevoF1116A Then
        mIsDirty = True
    End If
    mGeneraNuevoF1116A = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorIDEntidad() As Long
    ReceptorIDEntidad = mReceptorIDEntidad
End Property

Public Property Let ReceptorIDEntidad(ByVal Value As Long)
    If Value <> mReceptorIDEntidad Then
        mIsDirty = True
    End If
    mReceptorIDEntidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorRazonSocial() As String
    ReceptorRazonSocial = mReceptorRazonSocial
End Property

Public Property Let ReceptorRazonSocial(ByVal Value As String)
    If Value <> mReceptorRazonSocial Then
        mIsDirty = True
    End If
    mReceptorRazonSocial = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioTipo() As Integer
    ReceptorDomicilioTipo = mReceptorDomicilioTipo
End Property

Public Property Let ReceptorDomicilioTipo(ByVal Value As Integer)
    If Value <> mReceptorDomicilioTipo Then
        mIsDirty = True
    End If
    mReceptorDomicilioTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioCalle() As String
    ReceptorDomicilioCalle = mReceptorDomicilioCalle
End Property

Public Property Let ReceptorDomicilioCalle(ByVal Value As String)
    If Value <> mReceptorDomicilioCalle Then
        mIsDirty = True
    End If
    mReceptorDomicilioCalle = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioNumero() As String
    ReceptorDomicilioNumero = mReceptorDomicilioNumero
End Property

Public Property Let ReceptorDomicilioNumero(ByVal Value As String)
    If Value <> mReceptorDomicilioNumero Then
        mIsDirty = True
    End If
    mReceptorDomicilioNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioPiso() As String
    ReceptorDomicilioPiso = mReceptorDomicilioPiso
End Property

Public Property Let ReceptorDomicilioPiso(ByVal Value As String)
    If Value <> mReceptorDomicilioPiso Then
        mIsDirty = True
    End If
    mReceptorDomicilioPiso = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioOficina() As String
    ReceptorDomicilioOficina = mReceptorDomicilioOficina
End Property

Public Property Let ReceptorDomicilioOficina(ByVal Value As String)
    If Value <> mReceptorDomicilioOficina Then
        mIsDirty = True
    End If
    mReceptorDomicilioOficina = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioCodigoPostal() As String
    ReceptorDomicilioCodigoPostal = mReceptorDomicilioCodigoPostal
End Property

Public Property Let ReceptorDomicilioCodigoPostal(ByVal Value As String)
    If Value <> mReceptorDomicilioCodigoPostal Then
        mIsDirty = True
    End If
    mReceptorDomicilioCodigoPostal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorDomicilioIDLocalidad() As Long
    ReceptorDomicilioIDLocalidad = mReceptorDomicilioIDLocalidad
End Property

Public Property Let ReceptorDomicilioIDLocalidad(ByVal Value As Long)
    If Value <> mReceptorDomicilioIDLocalidad Then
        mIsDirty = True
    End If
    mReceptorDomicilioIDLocalidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorCUIT() As String
    ReceptorCUIT = mReceptorCUIT
End Property

Public Property Let ReceptorCUIT(ByVal Value As String)
    If Value <> mReceptorCUIT Then
        mIsDirty = True
    End If
    mReceptorCUIT = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorIIBB() As String
    ReceptorIIBB = mReceptorIIBB
End Property

Public Property Let ReceptorIIBB(ByVal Value As String)
    If Value <> mReceptorIIBB Then
        mIsDirty = True
    End If
    mReceptorIIBB = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorIDCategoriaIVA() As Integer
    ReceptorIDCategoriaIVA = mReceptorIDCategoriaIVA
End Property

Public Property Let ReceptorIDCategoriaIVA(ByVal Value As Integer)
    If Value <> mReceptorIDCategoriaIVA Then
        mIsDirty = True
    End If
    mReceptorIDCategoriaIVA = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorActividad() As String
    ReceptorActividad = mReceptorActividad
End Property

Public Property Let ReceptorActividad(ByVal Value As String)
    If Value <> mReceptorActividad Then
        mIsDirty = True
    End If
    mReceptorActividad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ReceptorOperadorNumero() As Long
    ReceptorOperadorNumero = mReceptorOperadorNumero
End Property

Public Property Let ReceptorOperadorNumero(ByVal Value As Long)
    If Value <> mReceptorOperadorNumero Then
        mIsDirty = True
    End If
    mReceptorOperadorNumero = Value
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
    RefreshList_Module.Formulario1116RT IDFormulario1116RT
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CFormulario1116RT_Detalle() As Collection
    Set CFormulario1116RT_Detalle = mCFormulario1116RT_Detalle
End Property

Public Property Set CFormulario1116RT_Detalle(ByRef Value As Collection)
    Set mCFormulario1116RT_Detalle = Value
End Property

Public Property Get Formulario1116RT_Detalle(ByVal Index As Variant) As F1116RT_Detalle
    Set Formulario1116RT_Detalle = mCFormulario1116RT_Detalle(Index)
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
        .CommandText = "usp_Formulario1116RT_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116RT", adInteger, adParamInput, , mIDFormulario1116RT)
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
    ShowErrorMessage "Classes.F1116RT_Cabecera.Load", "Error al obtener los datos del Formulario 1116RT." & vbCr & vbCr & "IDFormulario1116RT: " & mIDFormulario1116RT
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
    IDFormulario1116RT = 0
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116RT_GetByFormularioNumero"
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
    ShowErrorMessage "Classes.F1116RT_Cabecera.LoadByFormularioNumero", "Error al obtener los datos del Formulario 1116RT." & vbCr & vbCr & "Formulario Nº: " & FormularioNumero
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
        mRetiroOTransferencia = recData("RetiroOTransferencia").Value
        
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
        mDepositanteIDCategoriaIVA = Val(recData("DepositanteIDCategoriaIVA").Value & "")

        'FORMULARIO ORIGEN
        mOrigen_FormularioTipo = recData("Origen_FormularioTipo").Value
        mOrigen_FormularioNumero = recData("Origen_FormularioNumero").Value
        mOrigen_FormularioFecha = recData("Origen_FormularioFecha").Value
        mOrigen_IDFormulario1116A = Val(recData("Origen_IDFormulario1116A").Value & "")
        mOrigen_IDFormulario1116RT = Val(recData("Origen_IDFormulario1116RT").Value & "")
        mOrigen_IDPartido = recData("Origen_IDPartido").Value

        'CEREAL
        mIDCereal = recData("IDCereal").Value
        mIDCosecha = recData("IDCosecha").Value
        
        mTotalKilogramo = recData("TotalKilogramo").Value
        mGeneraNuevoF1116A = recData("GeneraNuevoF1116A").Value

        'RECEPTOR
        mReceptorIDEntidad = Val(recData("ReceptorIDEntidad").Value & "")
        mReceptorRazonSocial = recData("ReceptorRazonSocial").Value & ""
        mReceptorDomicilioTipo = recData("ReceptorDomicilioTipo").Value & ""
        mReceptorDomicilioCalle = recData("ReceptorDomicilioCalle").Value & ""
        mReceptorDomicilioNumero = recData("ReceptorDomicilioNumero").Value & ""
        mReceptorDomicilioPiso = recData("ReceptorDomicilioPiso").Value & ""
        mReceptorDomicilioOficina = recData("ReceptorDomicilioOficina").Value & ""
        mReceptorDomicilioCodigoPostal = recData("ReceptorDomicilioCodigoPostal").Value & ""
        mReceptorDomicilioIDLocalidad = Val(recData("ReceptorDomicilioIDLocalidad").Value & "")
        mReceptorCUIT = recData("ReceptorCUIT").Value & ""
        mReceptorIIBB = recData("ReceptorIIBB").Value & ""
        mReceptorIDCategoriaIVA = Val(recData("ReceptorIDCategoriaIVA").Value & "")
        mReceptorActividad = recData("ReceptorActividad").Value & ""
        mReceptorOperadorNumero = Val(recData("ReceptorOperadorNumero").Value & "")
        
        mKilogramoAplicado = Val(recData("KilogramoAplicado").Value & "")
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.F1116RT_Cabecera.GetDataFromRecordset", "Error al leer los datos del Formulario 1116RT." & vbCr & vbCr & "IDFormulario1116RT: " & IDFormulario1116RT
End Function

Public Function LoadDetalles() As Boolean
    Dim recData As ADODB.Recordset
    Dim Formulario1116RT_Detalle  As F1116RT_Detalle

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set recData = New ADODB.Recordset
    Set recData.ActiveConnection = pDatabase.Connection
    recData.CursorType = adOpenKeyset
    recData.LockType = adLockOptimistic
    recData.Source = "SELECT Formulario1116RT_Detalle.IDFormulario1116RT, Formulario1116RT_Detalle.IDRemesa, Formulario1116RT_Detalle.CartaPorteFecha, Formulario1116RT_Detalle.ComprobanteNumero FROM Formulario1116RT_Detalle"
    recData.Open , , , , adCmdText
    recData.Sort = "CartaPorteFecha, ComprobanteNumero"

    recData.Filter = "IDF1116RT = " & mIDFormulario1116RT

    Do While Not recData.EOF
        Set Formulario1116RT_Detalle = New F1116RT_Detalle
        With Formulario1116RT_Detalle
            .IDFormulario1116RT = mIDFormulario1116RT
            .IDRemesa = recData("IDRemesa").Value
            If Not .Load() Then
                recData.Close
                Set recData = Nothing
                Exit Function
            End If
            mCFormulario1116RT_Detalle.Add Formulario1116RT_Detalle, KEY_STRINGER & .IDRemesa
        End With
        Set Formulario1116RT_Detalle = Nothing
    
        recData.MoveNext
    Loop
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    LoadDetalles = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116RT_Cabecera.LoadDetalles", "Error al obtener los Detalles del Formulario 1116RT." & vbCr & vbCr & "IDFormulario1116RT: " & mIDFormulario1116RT
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario1116RT = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command
    
    Dim IDMovimiento_CerealItem As Variant
    Dim Formulario1116RT_Detalle As F1116RT_Detalle
    
    Dim IDMovimiento_CerealStringList As String

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
        .CommandText = "usp_Formulario1116RT_Add"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116RT", adInteger, adParamOutput)
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
        .Parameters.Append .CreateParameter("Origen_FormularioTipo", adChar, adParamInput, 1, mOrigen_FormularioTipo)
        .Parameters.Append .CreateParameter("Origen_FormularioNumero", adVarChar, adParamInput, 13, mOrigen_FormularioNumero)
        .Parameters.Append .CreateParameter("Origen_FormularioFecha", adDate, adParamInput, , mOrigen_FormularioFecha)
        .Parameters.Append .CreateParameter("Origen_IDFormulario1116A", adInteger, adParamInput, , IIf(mOrigen_IDFormulario1116A = 0, Null, mOrigen_IDFormulario1116A))
        .Parameters.Append .CreateParameter("Origen_IDFormulario1116RT", adInteger, adParamInput, , IIf(mOrigen_IDFormulario1116RT = 0, Null, mOrigen_IDFormulario1116RT))
        .Parameters.Append .CreateParameter("Origen_IDPartido", adSmallInt, adParamInput, , mOrigen_IDPartido)
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("RetiroOTransferencia", adChar, adParamInput, 1, mRetiroOTransferencia)
        .Parameters.Append .CreateParameter("TotalKilogramo", adInteger, adParamInput, , mTotalKilogramo)
        .Parameters.Append .CreateParameter("GeneraNuevoF1116A", adBoolean, adParamInput, , mGeneraNuevoF1116A)
        .Parameters.Append .CreateParameter("ReceptorIDEntidad", adInteger, adParamInput, , mReceptorIDEntidad)
        .Parameters.Append .CreateParameter("ReceptorRazonSocial", adVarChar, adParamInput, 100, UCase(mReceptorRazonSocial))
        .Parameters.Append .CreateParameter("ReceptorDomicilioTipo", adTinyInt, adParamInput, , mReceptorDomicilioTipo)
        .Parameters.Append .CreateParameter("ReceptorDomicilioCalle", adVarChar, adParamInput, 50, IIf(mReceptorDomicilioCalle = "", Null, UCase(mReceptorDomicilioCalle)))
        .Parameters.Append .CreateParameter("ReceptorDomicilioNumero", adVarChar, adParamInput, 10, IIf(mReceptorDomicilioNumero = "", Null, UCase(mReceptorDomicilioNumero)))
        .Parameters.Append .CreateParameter("ReceptorDomicilioPiso", adVarChar, adParamInput, 10, IIf(mReceptorDomicilioPiso = "", Null, UCase(mReceptorDomicilioPiso)))
        .Parameters.Append .CreateParameter("ReceptorDomicilioOficina", adVarChar, adParamInput, 10, IIf(mReceptorDomicilioOficina = "", Null, UCase(mReceptorDomicilioOficina)))
        .Parameters.Append .CreateParameter("ReceptorDomicilioCodigoPostal", adVarChar, adParamInput, 8, IIf(mReceptorDomicilioCodigoPostal = "", Null, UCase(mReceptorDomicilioCodigoPostal)))
        .Parameters.Append .CreateParameter("ReceptorDomicilioIDLocalidad", adInteger, adParamInput, , IIf(mReceptorDomicilioIDLocalidad = 0, Null, mReceptorDomicilioIDLocalidad))
        .Parameters.Append .CreateParameter("ReceptorCUIT", adChar, adParamInput, 13, IIf(mReceptorCUIT = "", Null, mReceptorCUIT))
        .Parameters.Append .CreateParameter("ReceptorIIBB", adVarChar, adParamInput, 20, IIf(mReceptorIIBB = "", Null, mReceptorIIBB))
        .Parameters.Append .CreateParameter("ReceptorIDCategoriaIVA", adTinyInt, adParamInput, , mReceptorIDCategoriaIVA)
        .Parameters.Append .CreateParameter("ReceptorActividad", adVarChar, adParamInput, 50, mReceptorActividad)
        .Parameters.Append .CreateParameter("ReceptorOperadorNumero", adInteger, adParamInput, , mReceptorOperadorNumero)
        For Each Formulario1116RT_Detalle In mCFormulario1116RT_Detalle
            IDMovimiento_CerealStringList = IDMovimiento_CerealStringList & CStr(Formulario1116RT_Detalle.IDMovimiento_Cereal) & STRING_LIST_DELIMITER & CStr(Formulario1116RT_Detalle.KilogramoAplicado) & STRING_LIST_SEPARATOR
        Next Formulario1116RT_Detalle
        .Parameters.Append .CreateParameter("StringListOfIDMovimiento_CerealAndKilogramoAplicado", adVarChar, adParamInput, 1000, IDMovimiento_CerealStringList)
        
        .Execute
        
        If mIsNew Then
            mIDFormulario1116RT = .Parameters("IDFormulario1116RT").Value
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
    ShowErrorMessage "Classes.Formulario1116RT_Cabecera.Update", "Error al actualizar el Formulario 1116RT." & vbCr & vbCr & "IDFormulario1116RT: " & mIDFormulario1116RT
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
        .CommandText = "usp_Formulario1116RT_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116RT", adInteger, adParamInput, , mIDFormulario1116RT)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116RT_Cabecera.Delete", "Error al eliminar el Formulario 1116RT." & vbCr & vbCr & "IDFormulario1116RT: " & mIDFormulario1116RT & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Sub InitializeValues()
    mIDFormulario1116_Talonario = 0
    mFormularioNumero = ""
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    
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
    
    mOrigen_FormularioTipo = ""
    mOrigen_FormularioNumero = ""
    mOrigen_FormularioFecha = DATE_TIME_FIELD_NULL_VALUE
    mOrigen_IDFormulario1116A = 0
    mOrigen_IDFormulario1116RT = 0
    mOrigen_IDPartido = 0
    
    mIDCereal = 0
    mIDCosecha = 0
    
    mRetiroOTransferencia = ""
    mTotalKilogramo = 0
    mGeneraNuevoF1116A = False
    mReceptorIDEntidad = 0
    mReceptorRazonSocial = ""
    mReceptorDomicilioTipo = 0
    mReceptorDomicilioCalle = ""
    mReceptorDomicilioNumero = ""
    mReceptorDomicilioPiso = ""
    mReceptorDomicilioOficina = ""
    mReceptorDomicilioCodigoPostal = ""
    mReceptorDomicilioIDLocalidad = 0
    mReceptorCUIT = ""
    mReceptorIIBB = ""
    mReceptorIDCategoriaIVA = 0
    mReceptorActividad = ""
    mReceptorOperadorNumero = 0
    
    Set mCFormulario1116RT_Detalle = New Collection

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
    Set mCFormulario1116RT_Detalle = Nothing
End Sub
