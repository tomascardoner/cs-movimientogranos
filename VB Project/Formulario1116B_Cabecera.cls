VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "F1116B_Cabecera"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario1116B As Long
Private mOperacionTipo As String
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
Private mDepositanteGanancia_Inscripto As Boolean
Private mDepositanteReFOG_Situacion As String
Private mDepositanteCBU As String

Private mIDCosecha As Byte
Private mIDCereal As Byte

Private mActuoCorredor As Boolean
Private mCondicionOperacionFecha As Date
Private mCondicionOperacionPrecioTonelada As Currency
Private mCondicionOperacionFlete As Currency

Private mOperacionCantidad As Long
Private mOperacionPrecioKilogramo As Currency
Private mOperacionSubtotal As Currency
Private mOperacionAlicuotaIVA As Single
Private mOperacionImporteIVA As Currency
Private mOperacionImporteConIVA As Currency

Private mRetencionImporteAFIP As Currency
Private mRetencionImporteOtra As Currency
Private mTotalImporteNetoAPagar As Currency
Private mTotalIVARG As Currency
Private mTotalPagoSegunCondicion As Currency

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES
Private mCFormulario1116B_Detalle As Collection

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDFormulario1116B() As Long
    IDFormulario1116B = mIDFormulario1116B
End Property

Public Property Let IDFormulario1116B(ByVal Value As Long)
    If Value <> mIDFormulario1116B Then
        mIsDirty = True
    End If
    mIDFormulario1116B = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionTipo() As String
    OperacionTipo = mOperacionTipo
End Property

Public Property Let OperacionTipo(ByVal Value As String)
    If Value <> mOperacionTipo Then
        mIsDirty = True
    End If
    mOperacionTipo = Value
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

Public Property Get DepositanteGanancia_Inscripto() As Integer
    DepositanteGanancia_Inscripto = mDepositanteGanancia_Inscripto
End Property

Public Property Let DepositanteGanancia_Inscripto(ByVal Value As Integer)
    If Value <> mDepositanteGanancia_Inscripto Then
        mIsDirty = True
    End If
    mDepositanteGanancia_Inscripto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteReFOG_Situacion() As String
    DepositanteReFOG_Situacion = mDepositanteReFOG_Situacion
End Property

Public Property Let DepositanteReFOG_Situacion(ByVal Value As String)
    If Value <> mDepositanteReFOG_Situacion Then
        mIsDirty = True
    End If
    mDepositanteReFOG_Situacion = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DepositanteCBU() As String
    DepositanteCBU = mDepositanteCBU
End Property

Public Property Let DepositanteCBU(ByVal Value As String)
    If Value <> mDepositanteCBU Then
        mIsDirty = True
    End If
    mDepositanteCBU = Value
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

Public Property Get ActuoCorredor() As Integer
    ActuoCorredor = mActuoCorredor
End Property

Public Property Let ActuoCorredor(ByVal Value As Integer)
    If Value <> mActuoCorredor Then
        mIsDirty = True
    End If
    mActuoCorredor = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CondicionOperacionFecha() As Date
    CondicionOperacionFecha = mCondicionOperacionFecha
End Property

Public Property Let CondicionOperacionFecha(ByVal Value As Date)
    If Value <> mCondicionOperacionFecha Then
        mIsDirty = True
    End If
    mCondicionOperacionFecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CondicionOperacionPrecioTonelada() As Currency
    CondicionOperacionPrecioTonelada = mCondicionOperacionPrecioTonelada
End Property

Public Property Let CondicionOperacionPrecioTonelada(ByVal Value As Currency)
    If Value <> mCondicionOperacionPrecioTonelada Then
        mIsDirty = True
    End If
    mCondicionOperacionPrecioTonelada = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CondicionOperacionFlete() As Currency
    CondicionOperacionFlete = mCondicionOperacionFlete
End Property

Public Property Let CondicionOperacionFlete(ByVal Value As Currency)
    If Value <> mCondicionOperacionFlete Then
        mIsDirty = True
    End If
    mCondicionOperacionFlete = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionCantidad() As Long
    OperacionCantidad = mOperacionCantidad
End Property

Public Property Let OperacionCantidad(ByVal Value As Long)
    If Value <> mOperacionCantidad Then
        mIsDirty = True
    End If
    mOperacionCantidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionPrecioKilogramo() As Currency
    OperacionPrecioKilogramo = mOperacionPrecioKilogramo
End Property

Public Property Let OperacionPrecioKilogramo(ByVal Value As Currency)
    If Value <> mOperacionPrecioKilogramo Then
        mIsDirty = True
    End If
    mOperacionPrecioKilogramo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionSubtotal() As Currency
    OperacionSubtotal = mOperacionSubtotal
End Property

Public Property Let OperacionSubtotal(ByVal Value As Currency)
    If Value <> mOperacionSubtotal Then
        mIsDirty = True
    End If
    mOperacionSubtotal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionAlicuotaIVA() As Double
    OperacionAlicuotaIVA = mOperacionAlicuotaIVA
End Property

Public Property Let OperacionAlicuotaIVA(ByVal Value As Double)
    If Value <> mOperacionAlicuotaIVA Then
        mIsDirty = True
    End If
    mOperacionAlicuotaIVA = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionImporteIVA() As Currency
    OperacionImporteIVA = mOperacionImporteIVA
End Property

Public Property Let OperacionImporteIVA(ByVal Value As Currency)
    If Value <> mOperacionImporteIVA Then
        mIsDirty = True
    End If
    mOperacionImporteIVA = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get OperacionImporteConIVA() As Currency
    OperacionImporteConIVA = mOperacionImporteConIVA
End Property

Public Property Let OperacionImporteConIVA(ByVal Value As Currency)
    If Value <> mOperacionImporteConIVA Then
        mIsDirty = True
    End If
    mOperacionImporteConIVA = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RetencionImporteAFIP() As Currency
    RetencionImporteAFIP = mRetencionImporteAFIP
End Property

Public Property Let RetencionImporteAFIP(ByVal Value As Currency)
    If Value <> mRetencionImporteAFIP Then
        mIsDirty = True
    End If
    mRetencionImporteAFIP = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RetencionImporteOtra() As Currency
    RetencionImporteOtra = mRetencionImporteOtra
End Property

Public Property Let RetencionImporteOtra(ByVal Value As Currency)
    If Value <> mRetencionImporteOtra Then
        mIsDirty = True
    End If
    mRetencionImporteOtra = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TotalImporteNetoAPagar() As Currency
    TotalImporteNetoAPagar = mTotalImporteNetoAPagar
End Property

Public Property Let TotalImporteNetoAPagar(ByVal Value As Currency)
    If Value <> mTotalImporteNetoAPagar Then
        mIsDirty = True
    End If
    mTotalImporteNetoAPagar = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TotalIVARG() As Currency
    TotalIVARG = mTotalIVARG
End Property

Public Property Let TotalIVARG(ByVal Value As Currency)
    If Value <> mTotalIVARG Then
        mIsDirty = True
    End If
    mTotalIVARG = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TotalPagoSegunCondicion() As Currency
    TotalPagoSegunCondicion = mTotalPagoSegunCondicion
End Property

Public Property Let TotalPagoSegunCondicion(ByVal Value As Currency)
    If Value <> mTotalPagoSegunCondicion Then
        mIsDirty = True
    End If
    mTotalPagoSegunCondicion = Value
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
    RefreshList_Module.Formulario1116B IDFormulario1116B
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CFormulario1116B_Detalle() As Collection
    Set CFormulario1116B_Detalle = mCFormulario1116B_Detalle
End Property

Public Property Set CFormulario1116B_Detalle(ByRef Value As Collection)
    Set mCFormulario1116B_Detalle = Value
End Property

Public Property Get Formulario1116B_Detalle(ByVal Index As Variant) As F1116B_Detalle
    Set Formulario1116B_Detalle = mCFormulario1116B_Detalle(Index)
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
        .CommandText = "usp_Formulario1116B_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116B", adInteger, adParamInput, , mIDFormulario1116B)
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
    ShowErrorMessage "Classes.F1116B_Cabecera.Load", "Error al obtener los datos del Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & mIDFormulario1116B
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
    IDFormulario1116B = 0
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Formulario1116B_GetByFormularioNumero"
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
    ShowErrorMessage "Classes.F1116B_Cabecera.LoadByFormularioNumero", "Error al obtener los datos del Formulario 1116B." & vbCr & vbCr & "Formulario Nº: " & FormularioNumero
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean
    
    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDFormulario1116B = recData("IDFormulario1116B").Value
        
        'ENCABEZADO
        mOperacionTipo = recData("OperacionTipo").Value
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
        mDepositanteIDCategoriaIVA = Val(recData("DepositanteIDCategoriaIVA").Value & "")
        mDepositanteGanancia_Inscripto = recData("DepositanteGanancia_Inscripto").Value
        mDepositanteReFOG_Situacion = recData("DepositanteReFOG_Situacion").Value
        mDepositanteCBU = recData("DepositanteCBU").Value & ""
        
        'CEREAL
        mIDCereal = recData("IDCereal").Value
        mIDCosecha = recData("IDCosecha").Value
        
        mActuoCorredor = recData("ActuoCorredor").Value
        mCondicionOperacionFecha = recData("CondicionOperacionFecha").Value
        mCondicionOperacionPrecioTonelada = recData("CondicionOperacionPrecioTonelada").Value
        mCondicionOperacionFlete = recData("CondicionOperacionFlete").Value
        
        mOperacionCantidad = recData("OperacionCantidad").Value
        mOperacionPrecioKilogramo = recData("OperacionPrecioKilogramo").Value
        mOperacionSubtotal = recData("OperacionSubtotal").Value
        mOperacionAlicuotaIVA = recData("OperacionAlicuotaIVA").Value
        mOperacionImporteIVA = recData("OperacionImporteIVA").Value
        mOperacionImporteConIVA = recData("OperacionImporteConIVA").Value
        
        mRetencionImporteAFIP = recData("RetencionImporteAFIP").Value
        mRetencionImporteOtra = recData("RetencionImporteOtra").Value
        mTotalImporteNetoAPagar = recData("TotalImporteNetoAPagar").Value
        mTotalIVARG = recData("TotalIVARG").Value
        mTotalPagoSegunCondicion = recData("TotalPagoSegunCondicion").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.F1116B_Cabecera.GetDataFromRecordset", "Error al leer los datos del Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & IDFormulario1116B
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario1116B = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command
    
    Dim Formulario1116B_Detalle As F1116B_Detalle
    
    Dim DetalleStringList As String

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
        .CommandText = "usp_Formulario1116B_Add"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116B", adInteger, adParamOutput)
        .Parameters.Append .CreateParameter("OperacionTipo", adChar, adParamInput, 1, mOperacionTipo)
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
        .Parameters.Append .CreateParameter("DepositanteGanancia_Inscripto", adBoolean, adParamInput, , mDepositanteGanancia_Inscripto)
        .Parameters.Append .CreateParameter("DepositanteReFOG_Situacion", adChar, adParamInput, 1, mDepositanteReFOG_Situacion)
        .Parameters.Append .CreateParameter("DepositanteCBU", adVarChar, adParamInput, 22, IIf(Trim(mDepositanteCBU) = "", Null, Trim(mDepositanteCBU)))
        .Parameters.Append .CreateParameter("IDCosecha", adTinyInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("ActuoCorredor", adBoolean, adParamInput, , mActuoCorredor)
        .Parameters.Append .CreateParameter("CondicionOperacionFecha", adDate, adParamInput, , mCondicionOperacionFecha)
        .Parameters.Append .CreateParameter("CondicionOperacionPrecioTonelada", adCurrency, adParamInput, , mCondicionOperacionPrecioTonelada)
        .Parameters.Append .CreateParameter("CondicionOperacionFlete", adCurrency, adParamInput, , mCondicionOperacionFlete)
        .Parameters.Append .CreateParameter("OperacionCantidad", adInteger, adParamInput, , mOperacionCantidad)
        .Parameters.Append .CreateParameter("OperacionPrecioKilogramo", adCurrency, adParamInput, , mOperacionPrecioKilogramo)
        .Parameters.Append .CreateParameter("OperacionAlicuotaIVA", adDecimal, adParamInput, , mOperacionAlicuotaIVA)
        .Parameters("OperacionAlicuotaIVA").Precision = 3
        .Parameters("OperacionAlicuotaIVA").NumericScale = 1
        For Each Formulario1116B_Detalle In mCFormulario1116B_Detalle
            DetalleStringList = DetalleStringList & Formulario1116B_Detalle.FormularioTipo & STRING_LIST_DELIMITER & IIf(Formulario1116B_Detalle.FormularioTipo = "A", CStr(Formulario1116B_Detalle.IDFormulario1116A), CStr(Formulario1116B_Detalle.IDFormulario1116RT)) & STRING_LIST_DELIMITER & CStr(Formulario1116B_Detalle.KilogramoAplicado) & STRING_LIST_SEPARATOR
        Next Formulario1116B_Detalle
        .Parameters.Append .CreateParameter("StringList", adVarChar, adParamInput, 1000, DetalleStringList)
        
        .Execute
        
        If mIsNew Then
            mIDFormulario1116B = .Parameters("IDFormulario1116B").Value
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
    ShowErrorMessage "Classes.Formulario1116B_Cabecera.Update", "Error al actualizar el Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & mIDFormulario1116B
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
        .CommandText = "usp_Formulario1116B_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario1116B", adInteger, adParamInput, , mIDFormulario1116B)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116B_Cabecera.Delete", "Error al eliminar el Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & mIDFormulario1116B & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Sub InitializeValues()
    mOperacionTipo = ""
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
    mDepositanteGanancia_Inscripto = False
    mDepositanteReFOG_Situacion = ""
    mDepositanteCBU = ""
    
    mIDCereal = 0
    mIDCosecha = 0
    
    mActuoCorredor = False
    mCondicionOperacionFecha = DATE_TIME_FIELD_NULL_VALUE
    mCondicionOperacionPrecioTonelada = 0
    mCondicionOperacionFlete = 0

    mOperacionCantidad = 0
    mOperacionAlicuotaIVA = 0
    mOperacionImporteIVA = 0
    mOperacionImporteConIVA = 0
    
    mRetencionImporteAFIP = 0
    mRetencionImporteOtra = 0
    mTotalImporteNetoAPagar = 0
    mTotalIVARG = 0
    mTotalPagoSegunCondicion = 0
        
    Set mCFormulario1116B_Detalle = New Collection

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
    Set mCFormulario1116B_Detalle = Nothing
End Sub

