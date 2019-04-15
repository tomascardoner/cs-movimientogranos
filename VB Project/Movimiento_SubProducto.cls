VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Movimiento_SubProducto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMovimiento_SubProducto As Long

'ENCABEZADO
Private mTipo As String
Private mComprobanteNumero As String
Private mFecha As Date
Private mCOTNumero As String

'ENTIDADES
Private mIDEntidad_Titular As Long
Private mIDEntidad_Destinatario As Long
Private mIDEntidad_Transportista As Long
Private mIDEntidad_Chofer As Long

'ORIGEN Y DESTINO DE LOS SUBPRODUCTOS
Private mIDOrigenDestino_Origen As Integer
Private mIDOrigenDestino_Destino As Integer

'MOVIMIENTO DE ORIGEN (CONVERSION A SUBPRODUCTO)
Private mIDMovimiento_Cereal As Long

'COTIZACION DEL DOLAR
Private mCotizacionDolarFecha As Date
Private mCotizacionDolarImporte As Currency

'TRANSPORTE
Private mTransporteDominioCamion As String
Private mTransporteDominioAcoplado As String
Private mTransporteKilometro As Long
Private mTransporteTarifaReferencia As Currency
Private mTransporteTarifa As Currency

'DATOS EXTRAS
Private mNotas As String

'DATOS DEL REGISTRO
Private mIDUsuarioCreacion As Byte
Private mFechaHoraCreacion As Date
Private mIDUsuarioModificacion As Byte
Private mFechaHoraModificacion As Date

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES
Private mCMovimiento_SubProducto_Detalle As Collection
Private mCMovimiento_SubProducto_Detalle_ToAdd As Collection
Private mCMovimiento_SubProducto_Detalle_ToUpdate As Collection
Private mCMovimiento_SubProducto_Detalle_ToDelete As Collection

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDMovimiento_SubProducto() As Long
    IDMovimiento_SubProducto = mIDMovimiento_SubProducto
End Property

Public Property Get IDMovimiento_SubProducto_Formatted() As String
    IDMovimiento_SubProducto_Formatted = Format(mIDMovimiento_SubProducto, "#,###")
End Property

Public Property Let IDMovimiento_SubProducto(ByVal Value As Long)
    If Value <> mIDMovimiento_SubProducto Then
        mIsDirty = True
    End If
    mIDMovimiento_SubProducto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Tipo() As String
    Tipo = mTipo
End Property

Public Property Get TipoNombre() As String
    Select Case mTipo
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION
            TipoNombre = MOVIMIENTO_SUBPRODUCTO_TIPO_ENTRADAPRODUCCION_NOMBRE
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA
            TipoNombre = MOVIMIENTO_SUBPRODUCTO_TIPO_SALIDAVENTA_NOMBRE
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA
            TipoNombre = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTEBAJA_NOMBRE
        Case MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE
            TipoNombre = MOVIMIENTO_SUBPRODUCTO_TIPO_AJUSTESUBE_NOMBRE
    End Select
End Property

Public Property Let Tipo(ByVal Value As String)
    If Value <> mTipo Then
        mIsDirty = True
    End If
    mTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ComprobanteNumero() As String
    ComprobanteNumero = mComprobanteNumero
End Property

Public Property Let ComprobanteNumero(ByVal Value As String)
    If Value <> mComprobanteNumero Then
        mIsDirty = True
    End If
    mComprobanteNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Sub GetProximoComprobanteNumero()
    Dim cmdData As ADODB.command
    Dim recData As Recordset
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    Set cmdData.ActiveConnection = pDatabase.Connection
    cmdData.CommandText = "SELECT ISNULL(CAST(MAX(ComprobanteNumero) as int), 0) + 1 FROM Movimiento_SubProducto WHERE Tipo = ?"
    cmdData.Parameters.Append cmdData.CreateParameter(, adChar, adParamInput, 1, mTipo)
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdText
    If Not recData.EOF Then
        mComprobanteNumero = Format(recData(0).Value, String(12, "0"))
    End If
    recData.Close
    Set recData = Nothing
    Exit Sub
    
ErrorHandler:
    CSM_Error.ShowErrorMessage "Classes.Movimiento_SubProducto.GetProximoComprobanteNumero", "Error al obtener el siguiente Número de Comprobante."
End Sub

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

Public Property Get COTNumero() As String
    COTNumero = mCOTNumero
End Property

Public Property Let COTNumero(ByVal Value As String)
    If Value <> mCOTNumero Then
        mIsDirty = True
    End If
    mCOTNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Titular() As Long
    IDEntidad_Titular = mIDEntidad_Titular
End Property

Public Property Let IDEntidad_Titular(ByVal Value As Long)
    If Value <> mIDEntidad_Titular Then
        mIsDirty = True
    End If
    mIDEntidad_Titular = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Titular() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Titular Then
        If mIDEntidad_Titular = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Titular
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Titular = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Destinatario() As Long
    IDEntidad_Destinatario = mIDEntidad_Destinatario
End Property

Public Property Let IDEntidad_Destinatario(ByVal Value As Long)
    If Value <> mIDEntidad_Destinatario Then
        mIsDirty = True
    End If
    mIDEntidad_Destinatario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Destinatario() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Destinatario Then
        If mIDEntidad_Destinatario = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Destinatario
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Destinatario = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Transportista() As Long
    IDEntidad_Transportista = mIDEntidad_Transportista
End Property

Public Property Let IDEntidad_Transportista(ByVal Value As Long)
    If Value <> mIDEntidad_Transportista Then
        mIsDirty = True
    End If
    mIDEntidad_Transportista = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Transportista() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Transportista Then
        If mIDEntidad_Transportista = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Transportista
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Transportista = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Chofer() As Long
    IDEntidad_Chofer = mIDEntidad_Chofer
End Property

Public Property Let IDEntidad_Chofer(ByVal Value As Long)
    If Value <> mIDEntidad_Chofer Then
        mIsDirty = True
    End If
    mIDEntidad_Chofer = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Chofer() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Chofer Then
        If mIDEntidad_Chofer = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Chofer
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Chofer = oEntidad
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

Public Property Get OrigenDestino_Origen() As Entidad_OrigDest
    Static oOrigenDestino_Origen As Entidad_OrigDest
    
    If oOrigenDestino_Origen Is Nothing Then
        Set oOrigenDestino_Origen = New Entidad_OrigDest
    End If
    If oOrigenDestino_Origen.IDEntidad <> mIDEntidad_Titular Or oOrigenDestino_Origen.IDOrigenDestino <> mIDOrigenDestino_Origen Then
        If mIDEntidad_Titular = 0 Or mIDOrigenDestino_Origen = 0 Then
            Set oOrigenDestino_Origen = New Entidad_OrigDest
        Else
            oOrigenDestino_Origen.IDEntidad = mIDEntidad_Titular
            oOrigenDestino_Origen.IDOrigenDestino = mIDOrigenDestino_Origen
            Call oOrigenDestino_Origen.Load
        End If
    End If
    Set OrigenDestino_Origen = oOrigenDestino_Origen
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

Public Property Get OrigenDestino_Destino() As Entidad_OrigDest
    Static oOrigenDestino_Destino As Entidad_OrigDest
    
    If oOrigenDestino_Destino Is Nothing Then
        Set oOrigenDestino_Destino = New Entidad_OrigDest
    End If
    If oOrigenDestino_Destino.IDOrigenDestino <> mIDOrigenDestino_Destino Then
        If mIDOrigenDestino_Destino = 0 Then
            Set oOrigenDestino_Destino = New Entidad_OrigDest
        Else
            oOrigenDestino_Destino.IDEntidad = mIDEntidad_Destinatario
            oOrigenDestino_Destino.IDOrigenDestino = mIDOrigenDestino_Destino
            Call oOrigenDestino_Destino.Load
        End If
    End If
    Set OrigenDestino_Destino = oOrigenDestino_Destino
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CotizacionDolarFecha() As Date
    CotizacionDolarFecha = mCotizacionDolarFecha
End Property

Public Property Get CotizacionDolarFecha_Formatted() As String
    CotizacionDolarFecha_Formatted = Format(mCotizacionDolarFecha, "Short Date")
End Property

Public Property Let CotizacionDolarFecha(ByVal Value As Date)
    If Value <> mCotizacionDolarFecha Then
        mIsDirty = True
    End If
    mCotizacionDolarFecha = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CotizacionDolarImporte() As Currency
    CotizacionDolarImporte = mCotizacionDolarImporte
End Property

Public Property Get CotizacionDolarImporte_Formatted() As String
    CotizacionDolarImporte_Formatted = Format(mCotizacionDolarImporte, "#,###.###")
End Property

Public Property Let CotizacionDolarImporte(ByVal Value As Currency)
    If Value <> mCotizacionDolarImporte Then
        mIsDirty = True
    End If
    mCotizacionDolarImporte = Value
End Property

Public Property Let CotizacionDolarImporte_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        CotizacionDolarImporte = CCur(Value)
    Else
        CotizacionDolarImporte = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TransporteDominioCamion() As String
    TransporteDominioCamion = mTransporteDominioCamion
End Property

Public Property Let TransporteDominioCamion(ByVal Value As String)
    If Value <> mTransporteDominioCamion Then
        mIsDirty = True
    End If
    mTransporteDominioCamion = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TransporteDominioAcoplado() As String
    TransporteDominioAcoplado = mTransporteDominioAcoplado
End Property

Public Property Let TransporteDominioAcoplado(ByVal Value As String)
    If Value <> mTransporteDominioAcoplado Then
        mIsDirty = True
    End If
    mTransporteDominioAcoplado = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TransporteKilometro() As Integer
    TransporteKilometro = mTransporteKilometro
End Property

Public Property Get TransporteKilometro_Formatted() As String
    TransporteKilometro_Formatted = Format(mTransporteKilometro, "#,###")
End Property

Public Property Let TransporteKilometro(ByVal Value As Integer)
    If Value <> mTransporteKilometro Then
        mIsDirty = True
    End If
    mTransporteKilometro = Value
End Property

Public Property Let TransporteKilometro_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        TransporteKilometro = CInt(Value)
    Else
        TransporteKilometro = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TransporteTarifaReferencia() As Currency
    TransporteTarifaReferencia = mTransporteTarifaReferencia
End Property

Public Property Get TransporteTarifaReferencia_Formatted() As String
    TransporteTarifaReferencia_Formatted = Format(mTransporteTarifaReferencia, "Currency")
End Property

Public Property Let TransporteTarifaReferencia(ByVal Value As Currency)
    If Value <> mTransporteTarifaReferencia Then
        mIsDirty = True
    End If
    mTransporteTarifaReferencia = Value
End Property

Public Property Let TransporteTarifaReferencia_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        TransporteTarifaReferencia = CCur(Value)
    Else
        TransporteTarifaReferencia = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get TransporteTarifa() As Currency
    TransporteTarifa = mTransporteTarifa
End Property

Public Property Get TransporteTarifa_Formatted() As String
    TransporteTarifa_Formatted = Format(mTransporteTarifa, "Currency")
End Property

Public Property Let TransporteTarifa(ByVal Value As Currency)
    If Value <> mTransporteTarifa Then
        mIsDirty = True
    End If
    mTransporteTarifa = Value
End Property

Public Property Let TransporteTarifa_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        TransporteTarifa = CCur(Value)
    Else
        TransporteTarifa = 0
    End If
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

Public Property Get Detalles() As Collection
    Set Detalles = mCMovimiento_SubProducto_Detalle
End Property

'Public Sub Detalle_Add(ByRef Detalle As Movimiento_SubProducto_Det)
'    mCDetalles.Add Detalle
'End Sub
'
'Public Sub Detalle_Delete(ByRef Detalle As Movimiento_SubProducto_Det)
'    If Detalle.IDMovimiento_SubProducto > 0 Then
'        mCDetalles.Remove KEY_STRINGER & Detalle.IDMovimiento
'    End If
'    Set Detalle = Nothing
'End Sub
'
'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDUsuarioCreacion() As Byte
    IDUsuarioCreacion = mIDUsuarioCreacion
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get UsuarioCreacion() As Usuario
    Static oUsuario As Usuario
    
    If oUsuario Is Nothing Then
        Set oUsuario = New Usuario
    End If
    If oUsuario.IDUsuario <> IDUsuarioCreacion Then
        If IDUsuarioCreacion = 0 Then
            Set oUsuario = New Usuario
        Else
            oUsuario.IDUsuario = IDUsuarioCreacion
            Call oUsuario.Load
        End If
    End If
    Set UsuarioCreacion = oUsuario
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaHoraCreacion() As Date
    FechaHoraCreacion = mFechaHoraCreacion
End Property

Public Property Get FechaHoraCreacion_Formatted() As String
    FechaHoraCreacion_Formatted = Format(mFechaHoraCreacion, "Short Date") & " " & Format(mFechaHoraCreacion, "Short Time")
End Property

Public Property Get FechaHoraCreacion_FormattedAsDate() As String
    FechaHoraCreacion_FormattedAsDate = Format(mFechaHoraCreacion, "Short Date")
End Property

Public Property Get FechaHoraCreacion_FormattedAsTime() As String
    FechaHoraCreacion_FormattedAsTime = Format(mFechaHoraCreacion, "Short Time")
End Property

Public Property Let FechaHoraCreacion(ByVal Value As Date)
    If Value <> mFechaHoraCreacion Then
        mIsDirty = True
    End If
    mFechaHoraCreacion = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDUsuarioModificacion() As Byte
    IDUsuarioModificacion = mIDUsuarioModificacion
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get UsuarioModificacion() As Usuario
    Static oUsuario As Usuario
    
    If oUsuario Is Nothing Then
        Set oUsuario = New Usuario
    End If
    If oUsuario.IDUsuario <> IDUsuarioModificacion Then
        If IDUsuarioModificacion = 0 Then
            Set oUsuario = New Usuario
        Else
            oUsuario.IDUsuario = IDUsuarioModificacion
            Call oUsuario.Load
        End If
    End If
    Set UsuarioModificacion = oUsuario
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaHoraModificacion() As Date
    FechaHoraModificacion = mFechaHoraModificacion
End Property

Public Property Get FechaHoraModificacion_Formatted() As String
    FechaHoraModificacion_Formatted = Format(mFechaHoraModificacion, "Short Date") & " " & Format(mFechaHoraModificacion, "Short Time")
End Property

Public Property Get FechaHoraModificacion_FormattedAsDate() As String
    FechaHoraModificacion_FormattedAsDate = Format(mFechaHoraModificacion, "Short Date")
End Property

Public Property Get FechaHoraModificacion_FormattedAsTime() As String
    FechaHoraModificacion_FormattedAsTime = Format(mFechaHoraModificacion, "Short Time")
End Property

Public Property Let FechaHoraModificacion(ByVal Value As Date)
    If Value <> mFechaHoraModificacion Then
        mIsDirty = True
    End If
    mFechaHoraModificacion = Value
End Property

''////////////////////////////////////////////////////////////////////////
''\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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
    RefreshList_Module.Movimiento_SubProducto IDMovimiento_SubProducto
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Sub Movimiento_SubProducto_Detalle_Add(ByRef Movimiento_SubProducto_Detalle As Movimiento_SubProducto_Det)
    On Error GoTo ErrorHandler
    
    mCMovimiento_SubProducto_Detalle_ToUpdate.Add Movimiento_SubProducto_Detalle, KEY_STRINGER & Movimiento_SubProducto_Detalle.Linea
    
ErrorHandler:
End Sub

Public Sub Movimiento_SubProducto_Detalle_AddFromData(ByVal Linea As Byte, ByVal Kilogramo As Long, ByVal PrecioToneladaDolar As Currency, ByVal PrecioToneladaPeso As Currency)
    Dim Movimiento_SubProducto_Detalle As Movimiento_SubProducto_Det
    
    Set Movimiento_SubProducto_Detalle = New Movimiento_SubProducto_Det
    With Movimiento_SubProducto_Detalle
        .IDMovimiento_SubProducto = mIDMovimiento_SubProducto
        .Linea = Linea
        '.Movimiento_Cereal = Me
        .Kilogramo = Kilogramo
        .PrecioToneladaDolar = PrecioToneladaDolar
        .PrecioToneladaPeso = PrecioToneladaPeso
    End With
    
    On Error GoTo ErrorHandler

    mCMovimiento_SubProducto_Detalle_ToUpdate.Add Movimiento_SubProducto_Detalle, KEY_STRINGER & Movimiento_SubProducto_Detalle.Linea
    
ErrorHandler:
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
        .CommandText = "usp_Movimiento_SubProducto_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamInput, , mIDMovimiento_SubProducto)
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
    ShowErrorMessage "Classes.Movimiento_SubProducto.Load", "Error al obtener los datos del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto
End Function

Public Function LoadByComprobanteNumero() As Boolean
    Dim ComprobanteNumeroSave As String
    
    Dim cmdSP As ADODB.command
    Dim recData As ADODB.Recordset

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    ComprobanteNumeroSave = mComprobanteNumero
    Call InitializeValues
    IDMovimiento_SubProducto = 0
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Movimiento_SubProducto_GetByComprobanteNumero"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("ComprobanteNumero", adChar, adParamInput, 12, ComprobanteNumeroSave)
    End With
    
    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Screen.MousePointer = vbHourglass

    LoadByComprobanteNumero = GetDataFromRecordset(recData)
    
    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_SubProducto.LoadByCartaDePorteNumero", "Error al obtener los datos del Movimiento de Cereal." & vbCr & vbCr & "Comprobante Nº: " & ComprobanteNumeroSave
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDMovimiento_SubProducto = recData("IDMovimiento_SubProducto").Value
        mTipo = recData("Tipo").Value
        
        'ENCABEZADO
        mComprobanteNumero = recData("ComprobanteNumero").Value
        mFecha = recData("Fecha").Value
        mCOTNumero = recData("COTNumero").Value & ""
        
        'ENTIDADES
        mIDEntidad_Titular = recData("IDEntidad_Titular").Value
        mIDEntidad_Destinatario = Val(recData("IDEntidad_Destinatario").Value & "")
        mIDEntidad_Transportista = Val(recData("IDEntidad_Transportista").Value & "")
        mIDEntidad_Chofer = Val(recData("IDEntidad_Chofer").Value & "")
        
        'ORIGEN Y DESTINO DE LA MERCADERIA
        mIDOrigenDestino_Origen = Val(recData("IDOrigenDestino_Origen").Value & "")
        mIDOrigenDestino_Destino = Val(recData("IDOrigenDestino_Destino").Value & "")
        
        'COTIZACIÓN DEL DÓLAR
        mCotizacionDolarFecha = IIf(IsNull(recData("CotizacionDolarFecha").Value), CSM_Constant.DATE_TIME_FIELD_NULL_VALUE, recData("CotizacionDolarFecha").Value)
        mCotizacionDolarImporte = IIf(IsNull(recData("CotizacionDolarImporte").Value), 0, recData("CotizacionDolarImporte").Value)
        
        'DATOS DEL TRANSPORTE
        mTransporteDominioCamion = Trim(recData("TransporteDominioCamion").Value & "")
        mTransporteDominioAcoplado = Trim(recData("TransporteDominioAcoplado").Value & "")
        mTransporteKilometro = Val(recData("TransporteKilometro").Value & "")
        mTransporteTarifaReferencia = IIf(IsNull(recData("TransporteTarifaReferencia").Value), 0, recData("TransporteTarifaReferencia").Value)
        mTransporteTarifa = IIf(IsNull(recData("TransporteTarifa").Value), 0, recData("TransporteTarifa").Value)
                
        'DATOS EXTRAS
        mNotas = recData("Notas").Value & ""
        
        'DATOS DEL REGISTRO
        mIDUsuarioCreacion = recData("IDUsuarioCreacion").Value
        mFechaHoraCreacion = recData("FechaHoraCreacion").Value
        mIDUsuarioCreacion = recData("IDUsuarioModificacion").Value
        mFechaHoraModificacion = recData("FechaHoraModificacion").Value
    End If
    
    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_SubProducto.GetDataFromRecordset", "Error al obtener los datos del Movimiento de SubProducto." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto
End Function

Public Function LoadDetalles() As Boolean
    Dim recData As ADODB.Recordset
    Dim Movimiento_SubProducto_Detalle As Movimiento_SubProducto_Det

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set recData = New ADODB.Recordset
    Set recData.ActiveConnection = pDatabase.Connection
    recData.CursorType = adOpenKeyset
    recData.LockType = adLockOptimistic
    recData.Source = "SELECT * FROM Movimiento_SubProducto_Detalle"
    recData.Open , , , , adCmdText
    recData.Sort = "Linea"

    recData.Filter = "IDMovimiento_SubProducto = " & mIDMovimiento_SubProducto

    Do While Not recData.EOF
        Set Movimiento_SubProducto_Detalle = New Movimiento_SubProducto_Det
        With Movimiento_SubProducto_Detalle
            .IDMovimiento_SubProducto = mIDMovimiento_SubProducto
            .Linea = recData("Linea").Value
            .IDSubProducto = recData("IDSubProducto").Value
            .Porcentaje = IIf(IsNull(recData("Porcentaje").Value), 0, recData("Porcentaje").Value)
            .Kilogramo = recData("Kilogramo").Value
            .PrecioToneladaDolar = IIf(IsNull(recData("PrecioToneladaDolar").Value), 0, recData("PrecioToneladaDolar").Value)
            .PrecioToneladaPeso = IIf(IsNull(recData("PrecioToneladaPeso").Value), 0, recData("PrecioToneladaPeso").Value)
            
            mCMovimiento_SubProducto_Detalle.Add Movimiento_SubProducto_Detalle, KEY_STRINGER & .Linea
        End With
        Set Movimiento_SubProducto_Detalle = Nothing
    
        recData.MoveNext
    Loop
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    LoadDetalles = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_SubProducto.LoadDetalles", "Error al obtener los Detalles del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_SubProducto: " & mIDMovimiento_SubProducto
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDMovimiento_SubProducto = 0
        mCOTNumero = ""

        Set mCMovimiento_SubProducto_Detalle = New Collection

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command
    
    Dim Movimiento_SubProducto_Detalle As Movimiento_SubProducto_Det
    Dim StringList As String

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        If mIsNew Then
            .CommandText = "usp_Movimiento_SubProducto_Add"
        Else
            .CommandText = "usp_Movimiento_SubProducto_Update"
        End If
        .CommandType = adCmdStoredProc
        
        'ENCABEZADO
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamInput, , mIDMovimiento_SubProducto)
        End If
        .Parameters.Append .CreateParameter("Tipo", adChar, adParamInput, 1, mTipo)
        .Parameters.Append .CreateParameter("ComprobanteNumero", adVarChar, adParamInput, 12, mComprobanteNumero)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("COTNumero", adVarChar, adParamInput, 16, IIf(Trim(mCOTNumero) = "", Null, Trim(mCOTNumero)))
        
        'ENTIDADES
        .Parameters.Append .CreateParameter("IDEntidad_Titular", adInteger, adParamInput, , mIDEntidad_Titular)
        .Parameters.Append .CreateParameter("IDEntidad_Destinatario", adInteger, adParamInput, , IIf(mIDEntidad_Destinatario = 0, Null, mIDEntidad_Destinatario))
        .Parameters.Append .CreateParameter("IDEntidad_Transportista", adInteger, adParamInput, , IIf(mIDEntidad_Transportista = 0, Null, mIDEntidad_Transportista))
        .Parameters.Append .CreateParameter("IDEntidad_Chofer", adInteger, adParamInput, , IIf(mIDEntidad_Chofer = 0, Null, mIDEntidad_Chofer))
                
        'ORIGEN/DESTINO DE LA MERCADERIA
        .Parameters.Append .CreateParameter("IDOrigenDestino_Origen", adInteger, adParamInput, , mIDOrigenDestino_Origen)
        .Parameters.Append .CreateParameter("IDOrigenDestino_Destino", adInteger, adParamInput, , IIf(mIDOrigenDestino_Destino = 0, Null, mIDOrigenDestino_Destino))
        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , Null)
        
        'DOLAR
        .Parameters.Append .CreateParameter("CotizacionDolarFecha", adDate, adParamInput, , IIf(mCotizacionDolarFecha = DATE_TIME_FIELD_NULL_VALUE, Null, mCotizacionDolarFecha))
        .Parameters.Append .CreateParameter("CotizacionDolarImporte", adCurrency, adParamInput, , IIf(mCotizacionDolarImporte = 0, Null, mCotizacionDolarImporte))
        
        'TRANSPORTE
        .Parameters.Append .CreateParameter("TransporteDominioCamion", adChar, adParamInput, 7, IIf(Trim(mTransporteDominioCamion) = "", Null, mTransporteDominioCamion))
        .Parameters.Append .CreateParameter("TransporteDominioAcoplado", adChar, adParamInput, 7, IIf(Trim(mTransporteDominioAcoplado) = "", Null, mTransporteDominioAcoplado))
        .Parameters.Append .CreateParameter("TransporteKilometro", adSmallInt, adParamInput, , IIf(mTransporteKilometro = 0, Null, mTransporteKilometro))
        .Parameters.Append .CreateParameter("TransporteTarifaReferencia", adCurrency, adParamInput, , IIf(mTransporteTarifaReferencia = 0, Null, mTransporteTarifaReferencia))
        .Parameters.Append .CreateParameter("TransporteTarifa", adCurrency, adParamInput, , IIf(mTransporteTarifa = 0, Null, mTransporteTarifa))
        
        'DATOS EXTRAS
        .Parameters.Append .CreateParameter("Notas", adVarChar, adParamInput, 1000, IIf(Trim(mNotas) = "", Null, Trim(mNotas)))
        .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, , pIDUsuario)
        For Each Movimiento_SubProducto_Detalle In mCMovimiento_SubProducto_Detalle_ToUpdate
            StringList = StringList & Movimiento_SubProducto_Detalle.IDSubProducto & STRING_LIST_DELIMITER & Movimiento_SubProducto_Detalle.Kilogramo_FormattedForSQL & STRING_LIST_DELIMITER & Movimiento_SubProducto_Detalle.PrecioToneladaDolar_FormattedForSQL & STRING_LIST_DELIMITER & Movimiento_SubProducto_Detalle.PrecioToneladaPeso_FormattedForSQL & STRING_LIST_SEPARATOR
        Next Movimiento_SubProducto_Detalle
        .Parameters.Append .CreateParameter("StringList", adVarChar, adParamInput, 1000, StringList)
        
        .Execute
        
        If mIsNew Then
            mIDMovimiento_SubProducto = .Parameters("IDMovimiento_SubProducto").Value
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
    pDatabase.ShowUpdateErrorMessage "Classes.Movimiento_SubProducto.Update", "Error al actualizar el Movimiento de SubProducto." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto & vbCr & "Comprobante Nº: " & mComprobanteNumero
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
        .CommandText = "usp_Movimiento_SubProducto_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamInput, , mIDMovimiento_SubProducto)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_SubProducto.Delete", "Error al eliminar el Movimiento de SubProducto." & vbCr & vbCr & "IDMovimiento_SubProducto: " & mIDMovimiento_SubProducto & vbCr & "Comprobante Nº: " & mComprobanteNumero
End Function

Private Sub InitializeValues()
    mTipo = "N"
    
    'ENCABEZADO
    mComprobanteNumero = ""
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    mCOTNumero = ""
    
    '1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
    mIDEntidad_Titular = 0
    mIDEntidad_Destinatario = 0
    mIDEntidad_Transportista = 0
    mIDEntidad_Chofer = 0
    
    'ORIGEN/DESTINO DE LA MERCADERIA
    mIDOrigenDestino_Origen = 0
    mIDOrigenDestino_Destino = 0
    mIDMovimiento_Cereal = 0
    mCotizacionDolarFecha = DATE_TIME_FIELD_NULL_VALUE
    mCotizacionDolarImporte = 0
    
    '4 - DATOS DEL TRANSPORTE
    mTransporteDominioCamion = ""
    mTransporteDominioAcoplado = ""
    mTransporteKilometro = 0
    mTransporteTarifaReferencia = 0
    mTransporteTarifa = 0
    
    'DATOS EXTRAS
    mNotas = ""
        
    'DATOS DEL REGISTRO
    mIDUsuarioCreacion = 0
    mFechaHoraCreacion = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    mIDUsuarioModificacion = 0
    mFechaHoraModificacion = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    
    Set mCMovimiento_SubProducto_Detalle = New Collection
    Set mCMovimiento_SubProducto_Detalle_ToUpdate = New Collection

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
    Set mCMovimiento_SubProducto_Detalle = Nothing
    Set mCMovimiento_SubProducto_Detalle_ToUpdate = Nothing
End Sub
