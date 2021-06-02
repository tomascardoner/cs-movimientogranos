VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Movimiento_Cereal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMovimiento_Cereal As Long
Private mTipo As String

'ENCABEZADO
Private mComprobanteNumero As String
Private mIDCartaPorte_Talonario As Long
Private mCTGNumero As Long
Private mFechaCarga As Date

'1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
Private mIDEntidad_Titular As Long
Private mIDEntidad_Intermediario As Long
Private mIDEntidad_RemitenteComercial As Long
Private mIDEntidad_Corredor As Long
Private mIDEntidad_Entregador As Long
Private mIDEntidad_Destinatario As Long
Private mIDEntidad_Destino As Long
Private mIDEntidad_Transportista As Long
Private mIDEntidad_Chofer As Long

'2 - DATOS DE LOS GRANOS / ESPECIES TRANSPORTADOS
Private mIDCosecha As Byte
Private mIDCereal As Byte
Private mIDContrato As Long
Private mPesoBruto As Long
Private mPesoTara As Long
Private mPesoNeto As Long

'DATOS PARA MERMAS
Private mVolatil As Single
Private mHumedad As Single
Private mZaranda As Single
Private mMermaVolatilKilogramo As Long
Private mMermaHumedadPorcentaje As Single
Private mMermaHumedadKilogramo As Long
Private mMermaZarandaKilogramo As Long
Private mPesoFinal As Long

'2 - PROCEDENCIA DE LA MERCADERIA
Private mIDOrigenDestino_Origen As Integer

'3 - LUGAR DE DESTINO DE LOS GRANOS
Private mIDOrigenDestino_Destino As Integer

'4 - DATOS DEL TRANSPORTE
Private mCTGCancelacion As Long
Private mTransporteDominioCamion As String
Private mTransporteDominioAcoplado As String
Private mTransporteKilometro As Long
Private mTransporteTarifaReferencia As Currency
Private mTransporteTarifa As Currency

'5 - DATOS A COMPLETAR EN EL LUGAR DE DESTINO Y DESCARGA
Private mFechaHoraArribo As Date
Private mFechaHoraDescarga As Date

'DATOS EXTRAS
Private mDeclaraIPRO As Boolean
Private mIDCartaPorte_MotivoAnulacion As Byte
Private mNotas As String
Private mCalculo_TarifaIndice As Integer

'DATOS DEL REGISTRO
Private mIDUsuarioCreacion As Byte
Private mFechaHoraCreacion As Date
Private mIDUsuarioModificacion As Byte
Private mFechaHoraModificacion As Date
Private mFechaHoraLiquidacionServicio As Date
Private mFechaHoraEnvioBolsaTech As Date
Private mCertificado As Boolean
Private mKilogramoAplicado As Long

'DATOS ADICIONALES
Private mCFormularioAplicado As Collection

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES
Private mCMovimiento_Cereal_Pesada As Collection
Private mCMovimiento_Cereal_Pesada_Updated As Collection

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDMovimiento_Cereal() As Long
    IDMovimiento_Cereal = mIDMovimiento_Cereal
End Property

Public Property Get IDMovimiento_Cereal_Formatted() As String
    IDMovimiento_Cereal_Formatted = Format(mIDMovimiento_Cereal, "#,###")
End Property

Public Property Let IDMovimiento_Cereal(ByVal Value As Long)
    If Value <> mIDMovimiento_Cereal Then
        mIsDirty = True
    End If
    mIDMovimiento_Cereal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Tipo() As String
    Tipo = mTipo
End Property

Public Property Get TipoNombre() As String
    Select Case mTipo
        Case MOVIMIENTO_CEREAL_TIPO_ENTRADA
            TipoNombre = MOVIMIENTO_CEREAL_TIPO_ENTRADA_NOMBRE
        Case MOVIMIENTO_CEREAL_TIPO_SALIDA
            TipoNombre = MOVIMIENTO_CEREAL_TIPO_SALIDA_NOMBRE
        Case MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA
            TipoNombre = MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA_NOMBRE
        Case MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION
            TipoNombre = MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION_NOMBRE
        Case MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA
            TipoNombre = MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA_NOMBRE
        Case MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE
            TipoNombre = MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE_NOMBRE
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
    cmdData.CommandText = "SELECT ISNULL(CAST(MAX(ComprobanteNumero) as int), 0) + 1 FROM Movimiento_Cereal WHERE Tipo = ? AND IDCosecha = ?"
    cmdData.Parameters.Append cmdData.CreateParameter(, adChar, adParamInput, 1, mTipo)
    cmdData.Parameters.Append cmdData.CreateParameter(, adTinyInt, adParamInput, 1, mIDCosecha)
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdText
    If Not recData.EOF Then
        mComprobanteNumero = Format(recData(0).Value, String(12, "0"))
    End If
    recData.Close
    Set recData = Nothing
    Exit Sub
    
ErrorHandler:
    CSM_Error.ShowErrorMessage "Classes.Movimiento_Cereal.GetProximoComprobanteNumero", "Error al obtener el siguiente Número de Comprobante."
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDCartaPorte_Talonario() As Long
    IDCartaPorte_Talonario = mIDCartaPorte_Talonario
End Property

Public Property Let IDCartaPorte_Talonario(ByVal Value As Long)
    If Value <> mIDCartaPorte_Talonario Then
        mIsDirty = True
    End If
    mIDCartaPorte_Talonario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CartaPorte_Talonario() As CartaPorte_Talonario
    Static oCartaPorte_Talonario As CartaPorte_Talonario
    
    If oCartaPorte_Talonario Is Nothing Then
        Set oCartaPorte_Talonario = New CartaPorte_Talonario
        Set oCartaPorte_Talonario.Database = pDatabase
    End If
    If oCartaPorte_Talonario.IDCartaPorte_Talonario <> mIDCartaPorte_Talonario Then
        If mIDCartaPorte_Talonario = 0 Then
            Set oCartaPorte_Talonario = New CartaPorte_Talonario
        Else
            oCartaPorte_Talonario.IDCartaPorte_Talonario = mIDCartaPorte_Talonario
            Call oCartaPorte_Talonario.Load
        End If
    End If
    Set CartaPorte_Talonario = oCartaPorte_Talonario
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CTGNumero() As Long
    CTGNumero = mCTGNumero
End Property

Public Property Get CTGNumero_Formatted() As String
    If mCTGNumero = 0 Then
        CTGNumero_Formatted = ""
    Else
        CTGNumero_Formatted = Format(mCTGNumero, "#,###")
    End If
End Property

Public Property Let CTGNumero(ByVal Value As Long)
    If Value <> mCTGNumero Then
        mIsDirty = True
    End If
    mCTGNumero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaCarga() As Date
    FechaCarga = mFechaCarga
End Property

Public Property Get FechaCarga_Formatted() As String
    FechaCarga_Formatted = Format(mFechaCarga, "Short Date")
End Property

Public Property Let FechaCarga(ByVal Value As Date)
    If Value <> mFechaCarga Then
        mIsDirty = True
    End If
    mFechaCarga = Value
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

Public Property Get IDEntidad_Intermediario() As Long
    IDEntidad_Intermediario = mIDEntidad_Intermediario
End Property

Public Property Let IDEntidad_Intermediario(ByVal Value As Long)
    If Value <> mIDEntidad_Intermediario Then
        mIsDirty = True
    End If
    mIDEntidad_Intermediario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Intermediario() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Intermediario Then
        If mIDEntidad_Intermediario = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Intermediario
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Intermediario = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_RemitenteComercial() As Long
    IDEntidad_RemitenteComercial = mIDEntidad_RemitenteComercial
End Property

Public Property Let IDEntidad_RemitenteComercial(ByVal Value As Long)
    If Value <> mIDEntidad_RemitenteComercial Then
        mIsDirty = True
    End If
    mIDEntidad_RemitenteComercial = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_RemitenteComercial() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_RemitenteComercial Then
        If mIDEntidad_RemitenteComercial = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_RemitenteComercial
            Call oEntidad.Load
        End If
    End If
    Set Entidad_RemitenteComercial = oEntidad
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

Public Property Get Entidad_Corredor() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Corredor Then
        If mIDEntidad_Corredor = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Corredor
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Corredor = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Entregador() As Long
    IDEntidad_Entregador = mIDEntidad_Entregador
End Property

Public Property Let IDEntidad_Entregador(ByVal Value As Long)
    If Value <> mIDEntidad_Entregador Then
        mIsDirty = True
    End If
    mIDEntidad_Entregador = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Entregador() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Entregador Then
        If mIDEntidad_Entregador = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Entregador
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Entregador = oEntidad
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

Public Property Get Entidad_Destino() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad_Destino Then
        If mIDEntidad_Destino = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad_Destino
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Destino = oEntidad
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

Public Function GetIDEntidad_Depositante(ByVal IDTitular As Long, ByVal IDIntermediario As Long, ByVal IDRemitenteComercial As Long) As Long
    If IDIntermediario = 0 Then
        If IDRemitenteComercial = 0 Then
            GetIDEntidad_Depositante = IDTitular
        Else
            GetIDEntidad_Depositante = IDRemitenteComercial
        End If
    Else
        GetIDEntidad_Depositante = IDIntermediario
    End If
End Function

Public Property Get IDEntidad_Depositante() As Long
    Select Case mTipo
        Case MOVIMIENTO_CEREAL_TIPO_ENTRADA, MOVIMIENTO_CEREAL_TIPO_SALIDA
            If mIDEntidad_Intermediario = 0 Then
                If mIDEntidad_RemitenteComercial = 0 Then
                    IDEntidad_Depositante = mIDEntidad_Titular
                Else
                    IDEntidad_Depositante = mIDEntidad_RemitenteComercial
                End If
            Else
                IDEntidad_Depositante = mIDEntidad_Intermediario
            End If
            
        Case MOVIMIENTO_CEREAL_TIPO_TRANSFERENCIAINTERNA, MOVIMIENTO_CEREAL_TIPO_SALIDAPRODUCCION, MOVIMIENTO_CEREAL_TIPO_AJUSTEBAJA, MOVIMIENTO_CEREAL_TIPO_AJUSTESUBE
            IDEntidad_Depositante = mIDEntidad_Titular
    End Select
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Depositante() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> IDEntidad_Depositante Then
        If IDEntidad_Depositante = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = IDEntidad_Depositante
            Call oEntidad.Load
        End If
    End If
    Set Entidad_Depositante = oEntidad
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

Public Property Get Cosecha() As Cosecha
    Static oCosecha As Cosecha
    
    If oCosecha Is Nothing Then
        Set oCosecha = New Cosecha
        Set oCosecha.Database = pDatabase
    End If
    If oCosecha.IDCosecha <> mIDCosecha Then
        If mIDCosecha = 0 Then
            Set oCosecha = New Cosecha
        Else
            oCosecha.IDCosecha = mIDCosecha
            Call oCosecha.Load
        End If
    End If
    Set Cosecha = oCosecha
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

Public Property Get Cereal() As Cereal
    Static oCereal As Cereal
    
    If oCereal Is Nothing Then
        Set oCereal = New Cereal
        Set oCereal.Database = pDatabase
    End If
    If oCereal.IDCereal <> mIDCereal Then
        If mIDCereal = 0 Then
            Set oCereal = New Cereal
        Else
            oCereal.IDCereal = mIDCereal
            Call oCereal.Load
        End If
    End If
    Set Cereal = oCereal
End Property

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

Public Property Get PesoBruto() As Long
    PesoBruto = mPesoBruto
End Property

Public Property Get PesoBruto_Formatted() As String
    PesoBruto_Formatted = Format(mPesoBruto, "#,###")
End Property

Public Property Let PesoBruto(ByVal Value As Long)
    If Value <> mPesoBruto Then
        mIsDirty = True
    End If
    mPesoBruto = Value
End Property

Public Property Let PesoBruto_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        PesoBruto = CLng(Value)
    Else
        PesoBruto = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PesoTara() As Long
    PesoTara = mPesoTara
End Property

Public Property Get PesoTara_Formatted() As String
    PesoTara_Formatted = Format(mPesoTara, "#,###")
End Property

Public Property Let PesoTara(ByVal Value As Long)
    If Value <> mPesoTara Then
        mIsDirty = True
    End If
    mPesoTara = Value
End Property

Public Property Let PesoTara_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        PesoTara = CLng(Value)
    Else
        PesoTara = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PesoNeto() As Long
    PesoNeto = mPesoNeto
End Property

Public Property Get PesoNeto_Formatted() As String
    PesoNeto_Formatted = Format(mPesoNeto, "#,###")
End Property

Public Property Let PesoNeto(ByVal Value As Long)
    If Value <> mPesoNeto Then
        mIsDirty = True
    End If
    mPesoNeto = Value
End Property

Public Property Let PesoNeto_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        PesoNeto = CLng(Value)
    Else
        PesoNeto = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Volatil() As Single
    Volatil = mVolatil
End Property

Public Property Get Volatil_Formatted() As String
    If mVolatil > -1 Then
        Volatil_Formatted = Format(mVolatil, "0.00")
    Else
        Volatil_Formatted = ""
    End If
End Property

Public Property Let Volatil(ByVal Value As Single)
    If Value <> mVolatil Then
        mIsDirty = True
    End If
    mVolatil = Value
End Property

Public Property Let Volatil_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Volatil = CSng(Value)
    Else
        Volatil = -1
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Humedad() As Single
    Humedad = mHumedad
End Property

Public Property Get Humedad_ForCalculate() As Single
    If mHumedad = -1 Then
        Humedad_ForCalculate = 0
    Else
        Humedad_ForCalculate = mHumedad
    End If
End Property

Public Property Get Humedad_Formatted() As String
    If mHumedad > -1 Then
        Humedad_Formatted = Format(mHumedad, "0.0")
    Else
        Humedad_Formatted = ""
    End If
End Property

Public Property Let Humedad(ByVal Value As Single)
    If Value <> mHumedad Then
        mIsDirty = True
    End If
    mHumedad = Value
End Property

Public Property Let Humedad_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Humedad = CSng(Value)
    Else
        Humedad = -1
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Zaranda() As Single
    Zaranda = mZaranda
End Property

Public Property Get Zaranda_ForCalculate() As Single
    If mZaranda = -1 Then
        Zaranda_ForCalculate = 0
    Else
        Zaranda_ForCalculate = mZaranda
    End If
End Property

Public Property Get Zaranda_Formatted() As String
    If mZaranda > -1 Then
        Zaranda_Formatted = Format(mZaranda, "0.0")
    Else
        Zaranda_Formatted = ""
    End If
End Property

Public Property Let Zaranda(ByVal Value As Single)
    If Value <> mZaranda Then
        mIsDirty = True
    End If
    mZaranda = Value
End Property

Public Property Let Zaranda_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Zaranda = CSng(Value)
    Else
        Zaranda = -1
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaVolatilKilogramo() As Long
    MermaVolatilKilogramo = mMermaVolatilKilogramo
End Property

Public Property Get MermaVolatilKilogramo_Formatted() As String
    MermaVolatilKilogramo_Formatted = Format(mMermaVolatilKilogramo, "#,###")
End Property

Public Property Let MermaVolatilKilogramo(ByVal Value As Long)
    If Value <> mMermaVolatilKilogramo Then
        mIsDirty = True
    End If
    mMermaVolatilKilogramo = Value
End Property

Public Property Let MermaVolatilKilogramo_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        MermaVolatilKilogramo = CLng(Value)
    Else
        MermaVolatilKilogramo = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaHumedadPorcentaje() As Single
    MermaHumedadPorcentaje = mMermaHumedadPorcentaje
End Property

Public Property Get MermaHumedadPorcentaje_Formatted() As String
    If mMermaHumedadPorcentaje > -1 Then
        MermaHumedadPorcentaje_Formatted = Format(mMermaHumedadPorcentaje, "0.0")
    Else
        MermaHumedadPorcentaje_Formatted = ""
    End If
End Property

Public Property Let MermaHumedadPorcentaje(ByVal Value As Single)
    If Value <> mMermaHumedadPorcentaje Then
        mIsDirty = True
    End If
    mMermaHumedadPorcentaje = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaHumedadKilogramo() As Long
    MermaHumedadKilogramo = mMermaHumedadKilogramo
End Property

Public Property Get MermaHumedadKilogramo_Formatted() As String
    MermaHumedadKilogramo_Formatted = Format(mMermaHumedadKilogramo, "#,###")
End Property

Public Property Let MermaHumedadKilogramo(ByVal Value As Long)
    If Value <> mMermaHumedadKilogramo Then
        mIsDirty = True
    End If
    mMermaHumedadKilogramo = Value
End Property

Public Property Let MermaHumedadKilogramo_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        MermaHumedadKilogramo = CLng(Value)
    Else
        MermaHumedadKilogramo = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaZarandaKilogramo() As Long
    MermaZarandaKilogramo = mMermaZarandaKilogramo
End Property

Public Property Get MermaZarandaKilogramo_Formatted() As String
    MermaZarandaKilogramo_Formatted = Format(mMermaZarandaKilogramo, "#,###")
End Property

Public Property Let MermaZarandaKilogramo(ByVal Value As Long)
    If Value <> mMermaZarandaKilogramo Then
        mIsDirty = True
    End If
    mMermaZarandaKilogramo = Value
End Property

Public Property Let MermaZarandaKilogramo_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        MermaZarandaKilogramo = CLng(Value)
    Else
        MermaZarandaKilogramo = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PesoFinal() As Long
    PesoFinal = mPesoFinal
End Property

Public Property Get PesoFinal_Formatted() As String
    PesoFinal_Formatted = Format(mPesoFinal, "#,###")
End Property

Public Property Let PesoFinal(ByVal Value As Long)
    If Value <> mPesoFinal Then
        mIsDirty = True
    End If
    mPesoFinal = Value
End Property

Public Property Let PesoFinal_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        PesoFinal = CLng(Value)
    Else
        PesoFinal = 0
    End If
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
            oOrigenDestino_Destino.IDEntidad = mIDEntidad_Destino
            oOrigenDestino_Destino.IDOrigenDestino = mIDOrigenDestino_Destino
            Call oOrigenDestino_Destino.Load
        End If
    End If
    Set OrigenDestino_Destino = oOrigenDestino_Destino
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CTGCancelacion() As Long
    CTGCancelacion = mCTGCancelacion
End Property

Public Property Get CTGCancelacion_Formatted() As String
    If mCTGCancelacion = 0 Then
        CTGCancelacion_Formatted = ""
    Else
        CTGCancelacion_Formatted = mCTGCancelacion
    End If
End Property

Public Property Let CTGCancelacion(ByVal Value As Long)
    If Value <> mCTGCancelacion Then
        mIsDirty = True
    End If
    mCTGCancelacion = Value
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

Public Property Get FechaHoraArribo() As Date
    FechaHoraArribo = mFechaHoraArribo
End Property

Public Property Get FechaHoraArribo_Formatted() As String
    If mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE Then
        FechaHoraArribo_Formatted = ""
    Else
        FechaHoraArribo_Formatted = Format(mFechaHoraArribo, "Short Date") & " " & Format(mFechaHoraArribo, "Short Time")
    End If
End Property

Public Property Get FechaHoraArribo_FormattedAsDate() As String
    If mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE Then
        FechaHoraArribo_FormattedAsDate = mFechaCarga
    Else
        FechaHoraArribo_FormattedAsDate = Format(mFechaHoraArribo, "Short Date")
    End If
End Property

Public Property Get FechaHoraArribo_FormattedAsTime() As String
    If mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE Then
        FechaHoraArribo_FormattedAsTime = Time
    Else
        FechaHoraArribo_FormattedAsTime = Format(mFechaHoraArribo, "Short Time")
    End If
End Property

Public Property Let FechaHoraArribo(ByVal Value As Date)
    If Value <> mFechaHoraArribo Then
        mIsDirty = True
    End If
    mFechaHoraArribo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaHoraDescarga() As Date
    FechaHoraDescarga = mFechaHoraDescarga
End Property

Public Property Get FechaHoraDescarga_Formatted() As String
    If mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE Then
        FechaHoraDescarga_Formatted = ""
    Else
        FechaHoraDescarga_Formatted = Format(mFechaHoraDescarga, "Short Date") & " " & Format(mFechaHoraDescarga, "Short Time")
    End If
End Property

Public Property Get FechaHoraDescarga_FormattedAsDate() As Variant
    If mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE Then
        FechaHoraDescarga_FormattedAsDate = mFechaCarga
    Else
        FechaHoraDescarga_FormattedAsDate = Format(mFechaHoraDescarga, "Short Date")
    End If
End Property

Public Property Get FechaHoraDescarga_FormattedAsTime() As Variant
    If mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE Then
        FechaHoraDescarga_FormattedAsTime = Time
    Else
        FechaHoraDescarga_FormattedAsTime = Format(mFechaHoraDescarga, "Short Time")
    End If
End Property

Public Property Let FechaHoraDescarga(ByVal Value As Date)
    If Value <> mFechaHoraDescarga Then
        mIsDirty = True
    End If
    mFechaHoraDescarga = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DeclaraIPRO() As Boolean
    DeclaraIPRO = mDeclaraIPRO
End Property

Public Property Let DeclaraIPRO(ByVal Value As Boolean)
    If Value <> mDeclaraIPRO Then
        mIsDirty = True
    End If
    mDeclaraIPRO = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDCartaPorte_MotivoAnulacion() As Byte
    IDCartaPorte_MotivoAnulacion = mIDCartaPorte_MotivoAnulacion
End Property

Public Property Let IDCartaPorte_MotivoAnulacion(ByVal Value As Byte)
    If Value <> mIDCartaPorte_MotivoAnulacion Then
        mIsDirty = True
    End If
    mIDCartaPorte_MotivoAnulacion = Value
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

Public Property Get Calculo_TarifaIndice() As Integer
    Calculo_TarifaIndice = mCalculo_TarifaIndice
End Property

Public Property Let Calculo_TarifaIndice(ByVal Value As Integer)
    If Value <> mCalculo_TarifaIndice Then
        mIsDirty = True
    End If
    mCalculo_TarifaIndice = Value
End Property

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

Public Property Get FechaHoraLiquidacionServicio() As Date
    FechaHoraLiquidacionServicio = mFechaHoraLiquidacionServicio
End Property

Public Property Get FechaHoraLiquidacionServicio_Formatted() As String
    FechaHoraLiquidacionServicio_Formatted = Format(mFechaHoraLiquidacionServicio, "Short Date") & " " & Format(mFechaHoraLiquidacionServicio, "Short Time")
End Property

Public Property Get FechaHoraLiquidacionServicio_FormattedAsDate() As String
    FechaHoraLiquidacionServicio_FormattedAsDate = Format(mFechaHoraLiquidacionServicio, "Short Date")
End Property

Public Property Get FechaHoraLiquidacionServicio_FormattedAsTime() As String
    FechaHoraLiquidacionServicio_FormattedAsTime = Format(mFechaHoraLiquidacionServicio, "Short Time")
End Property

Public Property Let FechaHoraLiquidacionServicio(ByVal Value As Date)
    If Value <> mFechaHoraLiquidacionServicio Then
        mIsDirty = True
    End If
    mFechaHoraLiquidacionServicio = Value
End Property

''////////////////////////////////////////////////////////////////////////
''\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaHoraEnvioBolsaTech() As Date
    FechaHoraEnvioBolsaTech = mFechaHoraEnvioBolsaTech
End Property

Public Property Get FechaHoraEnvioBolsaTech_Formatted() As String
    FechaHoraEnvioBolsaTech_Formatted = Format(mFechaHoraEnvioBolsaTech, "Short Date") & " " & Format(mFechaHoraEnvioBolsaTech, "Short Time")
End Property

Public Property Get FechaHoraEnvioBolsaTech_FormattedAsDate() As String
    FechaHoraEnvioBolsaTech_FormattedAsDate = Format(mFechaHoraEnvioBolsaTech, "Short Date")
End Property

Public Property Get FechaHoraEnvioBolsaTech_FormattedAsTime() As String
    FechaHoraEnvioBolsaTech_FormattedAsTime = Format(mFechaHoraEnvioBolsaTech, "Short Time")
End Property

Public Property Let FechaHoraEnvioBolsaTech(ByVal Value As Date)
    If Value <> mFechaHoraEnvioBolsaTech Then
        mIsDirty = True
    End If
    mFechaHoraEnvioBolsaTech = Value
End Property

''////////////////////////////////////////////////////////////////////////
''\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Certificado() As Boolean
    Certificado = mCertificado
End Property

Public Property Let Certificado(ByVal Value As Boolean)
    If Value <> mCertificado Then
        mIsDirty = True
    End If
    mCertificado = Value
End Property

''////////////////////////////////////////////////////////////////////////
''\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get KilogramoAplicado() As Long
    KilogramoAplicado = mKilogramoAplicado
End Property

Public Property Get KilogramoAplicado_Formatted() As String
    KilogramoAplicado_Formatted = Format(mKilogramoAplicado, "#,##0")
End Property

Public Property Let KilogramoAplicado(ByVal Value As Long)
    If Value <> mKilogramoAplicado Then
        mIsDirty = True
    End If
    mKilogramoAplicado = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CFormularioAplicado() As Collection
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    
    If mCFormularioAplicado Is Nothing Then
        Set mCFormularioAplicado = New Collection
        
        Set cmdData = New ADODB.command
        Set cmdData.ActiveConnection = pDatabase.Connection
        cmdData.CommandText = "usp_Movimiento_Cereal_FormulariosAplicados"
        cmdData.Parameters.Append cmdData.CreateParameter("@IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        
        Set recData = New ADODB.Recordset
        recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
        
        If recData.State <> adStateClosed Then
            Do While Not recData.EOF
                mCFormularioAplicado.Add recData("Formulario").Value, CSM_Constant.KEY_STRINGER & recData("Formulario").Value
                
                recData.MoveNext
            Loop
            
            recData.Close
            Set recData = Nothing
            Set cmdData = Nothing
        End If
    End If
    Set CFormularioAplicado = mCFormularioAplicado
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

Public Property Get CMovimiento_Cereal_Pesada() As Collection
    Set CMovimiento_Cereal_Pesada = mCMovimiento_Cereal_Pesada
End Property

Public Property Get Movimiento_Cereal_Pesada(ByVal Index As Variant) As Movimiento_Cereal_Pesada
    Set Movimiento_Cereal_Pesada = mCMovimiento_Cereal_Pesada(Index)
End Property

Public Sub Movimiento_Cereal_Pesada_Add(ByRef Movimiento_Cereal_Pesada As Movimiento_Cereal_Pesada)
    On Error GoTo ErrorHandler
    
    mCMovimiento_Cereal_Pesada_Updated.Add Movimiento_Cereal_Pesada, KEY_STRINGER & Movimiento_Cereal_Pesada.IDPesada
    
ErrorHandler:
End Sub

Public Sub Movimiento_Cereal_Pesada_AddFromData(ByVal IDPesada As Long)
    Dim Movimiento_Cereal_Pesada As Movimiento_Cereal_Pesada
    
    Set Movimiento_Cereal_Pesada = New Movimiento_Cereal_Pesada
    Movimiento_Cereal_Pesada.Movimiento_Cereal = Me
    Movimiento_Cereal_Pesada.IDMovimiento_Cereal = mIDMovimiento_Cereal
    Movimiento_Cereal_Pesada.IDPesada = IDPesada
    Movimiento_Cereal_Pesada.Movimiento_Cereal = Me
    
    On Error GoTo ErrorHandler

    mCMovimiento_Cereal_Pesada_Updated.Add Movimiento_Cereal_Pesada, KEY_STRINGER & Movimiento_Cereal_Pesada.IDPesada
    
ErrorHandler:
End Sub

Public Sub Movimiento_Cereal_PesadaCompleta_AddFromData(ByVal IDPesada As Long, ByVal PesoNeto As String, ByVal Humedad As String, ByVal Zaranda As String)
    Dim Movimiento_Cereal_Pesada As Movimiento_Cereal_Pesada
    
    Set Movimiento_Cereal_Pesada = New Movimiento_Cereal_Pesada
    With Movimiento_Cereal_Pesada
        .IDMovimiento_Cereal = mIDMovimiento_Cereal
        .IDPesada = IDPesada
        .Movimiento_Cereal = Me
        .PesoNeto_Formatted = PesoNeto
        .Humedad_Formatted = Humedad
        .Zaranda_Formatted = Zaranda
    End With
    
    On Error GoTo ErrorHandler

    mCMovimiento_Cereal_Pesada_Updated.Add Movimiento_Cereal_Pesada, KEY_STRINGER & Movimiento_Cereal_Pesada.IDPesada
    
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
        .CommandText = "usp_Movimiento_Cereal_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
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
    ShowErrorMessage "Classes.Movimiento_Cereal.Load", "Error al obtener los datos del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
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
    IDMovimiento_Cereal = 0
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Movimiento_Cereal_GetByComprobanteNumero"
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
    ShowErrorMessage "Classes.Movimiento_Cereal.LoadByCartaDePorteNumero", "Error al obtener los datos del Movimiento de Cereal." & vbCr & vbCr & "Comprobante Nº: " & ComprobanteNumeroSave
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDMovimiento_Cereal = recData("IDMovimiento_Cereal").Value
        mTipo = recData("Tipo").Value
        
        'ENCABEZADO
        mComprobanteNumero = recData("ComprobanteNumero").Value
        mIDCartaPorte_Talonario = Val(recData("IDCartaPorte_Talonario").Value & "")
        mCTGNumero = IIf(IsNull(recData("CTGNumero").Value), 0, recData("CTGNumero").Value)
        mFechaCarga = recData("FechaCarga").Value
        
        '1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
        mIDEntidad_Titular = recData("IDEntidad_Titular").Value
        mIDEntidad_Intermediario = Val(recData("IDEntidad_Intermediario").Value & "")
        mIDEntidad_RemitenteComercial = Val(recData("IDEntidad_RemitenteComercial").Value & "")
        mIDEntidad_Corredor = Val(recData("IDEntidad_Corredor").Value & "")
        mIDEntidad_Entregador = Val(recData("IDEntidad_Entregador").Value & "")
        mIDEntidad_Destinatario = Val(recData("IDEntidad_Destinatario").Value & "")
        mIDEntidad_Destino = Val(recData("IDEntidad_Destino").Value & "")
        mIDEntidad_Transportista = Val(recData("IDEntidad_Transportista").Value & "")
        mIDEntidad_Chofer = Val(recData("IDEntidad_Chofer").Value & "")
        
        '2 - DATOS DE LOS GRANOS / ESPECIES TRANSPORTADOS
        mIDCosecha = recData("IDCosecha").Value
        mIDCereal = recData("IDCereal").Value
        mIDContrato = Val(recData("IDContrato").Value & "")
        mPesoBruto = recData("PesoBruto").Value
        mPesoTara = recData("PesoTara").Value
        mPesoNeto = recData("PesoNeto").Value
        
        'DATOS PARA MERMAS
        If mTipo = "E" Then
            mVolatil = IIf(IsNull(recData("Volatil").Value), -1, recData("Volatil").Value)
            mHumedad = IIf(IsNull(recData("Humedad").Value), -1, recData("Humedad").Value)
            mZaranda = IIf(IsNull(recData("Zaranda").Value), -1, recData("Zaranda").Value)
            mMermaVolatilKilogramo = IIf(IsNull(recData("MermaVolatilKilogramo").Value), -1, recData("MermaVolatilKilogramo").Value)
            mMermaHumedadPorcentaje = IIf(IsNull(recData("MermaHumedadPorcentaje").Value), -1, recData("MermaHumedadPorcentaje").Value)
            mMermaHumedadKilogramo = IIf(IsNull(recData("MermaHumedadKilogramo").Value), -1, recData("MermaHumedadKilogramo").Value)
            mMermaZarandaKilogramo = IIf(IsNull(recData("MermaZarandaKilogramo").Value), -1, recData("MermaZarandaKilogramo").Value)
        Else
            mVolatil = -1
            mHumedad = -1
            mZaranda = -1
            mMermaVolatilKilogramo = -1
            mMermaHumedadPorcentaje = -1
            mMermaHumedadKilogramo = -1
            mMermaZarandaKilogramo = -1
        End If
        mPesoFinal = Val(recData("PesoFinal").Value & "")
        
        '2 - PROCEDENCIA DE LA MERCADERIA
        mIDOrigenDestino_Origen = CSM_Function.IfIsNull_Zero(recData("IDOrigenDestino_Origen").Value)
        
        '3 - LUGAR DE DESTINO DE LOS GRANOS
        mIDOrigenDestino_Destino = CSM_Function.IfIsNull_Zero(recData("IDOrigenDestino_Destino").Value)
        
        '4 - DATOS DEL TRANSPORTE
        mCTGCancelacion = CSM_Function.IfIsNull_Zero(recData("CTGCancelacion").Value)
        mTransporteDominioCamion = Trim(recData("TransporteDominioCamion").Value & "")
        mTransporteDominioAcoplado = Trim(recData("TransporteDominioAcoplado").Value & "")
        mTransporteKilometro = CSM_Function.IfIsNull_Zero(recData("TransporteKilometro").Value)
        mTransporteTarifaReferencia = CSM_Function.IfIsNull_Zero(recData("TransporteTarifaReferencia").Value)
        mTransporteTarifa = CSM_Function.IfIsNull_Zero(recData("TransporteTarifa").Value)
        
        '5 - DATOS A COMPLETAR EN EL LUGAR DE DESTINO Y DESCARGA
        If mTipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
            mFechaHoraArribo = CSM_Function.IfIsNull_ZeroDate(recData("FechaHoraArribo").Value)
            mFechaHoraDescarga = CSM_Function.IfIsNull_ZeroDate(recData("FechaHoraDescarga").Value)
        Else
            mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE
            mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE
        End If
        
        'DATOS EXTRAS
        mDeclaraIPRO = recData("DeclaraIPRO").Value
        mIDCartaPorte_MotivoAnulacion = CSM_Function.IfIsNull_Zero(recData("IDCartaPorte_MotivoAnulacion").Value)
        mNotas = recData("Notas").Value & ""
        mCalculo_TarifaIndice = CSM_Function.IfIsNull_Zero(recData("Calculo_TarifaIndice").Value)
        
        'DATOS DEL REGISTRO
        mIDUsuarioCreacion = recData("IDUsuarioCreacion").Value
        mFechaHoraCreacion = recData("FechaHoraCreacion").Value
        mIDUsuarioModificacion = recData("IDUsuarioModificacion").Value
        mFechaHoraModificacion = recData("FechaHoraModificacion").Value
        mFechaHoraLiquidacionServicio = IIf(IsNull(recData("FechaHoraLiquidacionServicio").Value), DATE_TIME_FIELD_NULL_VALUE, recData("FechaHoraLiquidacionServicio").Value)
        mFechaHoraEnvioBolsaTech = IIf(IsNull(recData("FechaHoraEnvioBolsaTech").Value), DATE_TIME_FIELD_NULL_VALUE, recData("FechaHoraEnvioBolsaTech").Value)
        
        mCertificado = IIf(mTipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA, recData("Certificado").Value, False)
        mKilogramoAplicado = Val(recData("KilogramoAplicado").Value & "")
    End If
    
    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal.GetDataFromRecordset", "Error al obtener los datos del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
End Function

Public Function LoadPesadas() As Boolean
    Dim recData As ADODB.Recordset
    Dim Movimiento_Cereal_Pesada As Movimiento_Cereal_Pesada

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Set recData = New ADODB.Recordset
    Set recData.ActiveConnection = pDatabase.Connection
    recData.CursorType = adOpenKeyset
    recData.LockType = adLockOptimistic
    recData.Source = "SELECT * FROM Movimiento_Cereal_Pesada"
    recData.Open , , , , adCmdText
    recData.Sort = "IDPesada"

    recData.Filter = "IDMovimiento_Cereal = " & mIDMovimiento_Cereal

    Do While Not recData.EOF
        Set Movimiento_Cereal_Pesada = New Movimiento_Cereal_Pesada
        With Movimiento_Cereal_Pesada
            .IDMovimiento_Cereal = mIDMovimiento_Cereal
            .IDPesada = recData("IDPesada").Value
            .Movimiento_Cereal = Me
            If mTipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
                .PesoNeto = IIf(IsNull(recData("PesoNeto").Value), 0, recData("PesoNeto").Value)
                .Humedad = IIf(IsNull(recData("Humedad").Value), -1, recData("Humedad").Value)
                .Zaranda = IIf(IsNull(recData("Zaranda").Value), -1, recData("Zaranda").Value)
            Else
                .PesoNeto = 0
                .Humedad = -1
                .Zaranda = -1
            End If
            mCMovimiento_Cereal_Pesada.Add Movimiento_Cereal_Pesada, KEY_STRINGER & .IDPesada
        End With
        Set Movimiento_Cereal_Pesada = Nothing
    
        recData.MoveNext
    Loop
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    LoadPesadas = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal.LoadPesadas", "Error al obtener las Pesadas del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & mIDMovimiento_Cereal
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDMovimiento_Cereal = 0
        mCTGNumero = 0
        
        mPesoBruto = 0
        mPesoTara = 0
        mPesoNeto = 0
        
        mHumedad = -1
        mZaranda = -1
        
        mCTGCancelacion = 0
        
        mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE
        mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE
        mFechaHoraLiquidacionServicio = DATE_TIME_FIELD_NULL_VALUE
        mFechaHoraEnvioBolsaTech = DATE_TIME_FIELD_NULL_VALUE
        
        Set mCMovimiento_Cereal_Pesada = New Collection
        Set mCMovimiento_Cereal_Pesada_Updated = New Collection
        
        mCertificado = False

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command
    
    Dim Movimiento_Cereal_Pesada As Movimiento_Cereal_Pesada
    Dim Movimiento_Cereal_Calculo As Movimiento_Cereal_Calculo
    Dim PesadaStringList As String

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        If mIsNew Then
            .CommandText = "usp_Movimiento_Cereal_Add"
        Else
            .CommandText = "usp_Movimiento_Cereal_Update"
        End If
        .CommandType = adCmdStoredProc
        
        'ENCABEZADO
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamOutput)
            .Parameters.Append .CreateParameter("Tipo", adChar, adParamInput, 1, mTipo)
        Else
            .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        End If
        .Parameters.Append .CreateParameter("ComprobanteNumero", adVarChar, adParamInput, 12, mComprobanteNumero)
        .Parameters.Append .CreateParameter("IDCartaPorte_Talonario", adInteger, adParamInput, , IIf(mIDCartaPorte_Talonario = 0, Null, mIDCartaPorte_Talonario))
        .Parameters.Append .CreateParameter("CTGNumero", adInteger, adParamInput, , IIf(mCTGNumero = 0, Null, mCTGNumero))
        .Parameters.Append .CreateParameter("FechaCarga", adDate, adParamInput, , mFechaCarga)
        
        '1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
        .Parameters.Append .CreateParameter("IDEntidad_Titular", adInteger, adParamInput, , mIDEntidad_Titular)
        .Parameters.Append .CreateParameter("IDEntidad_Intermediario", adInteger, adParamInput, , IIf(mIDEntidad_Intermediario = 0, Null, mIDEntidad_Intermediario))
        .Parameters.Append .CreateParameter("IDEntidad_RemitenteComercial", adInteger, adParamInput, , IIf(mIDEntidad_RemitenteComercial = 0, Null, mIDEntidad_RemitenteComercial))
        .Parameters.Append .CreateParameter("IDEntidad_Corredor", adInteger, adParamInput, , IIf(mIDEntidad_Corredor = 0, Null, mIDEntidad_Corredor))
        .Parameters.Append .CreateParameter("IDEntidad_Entregador", adInteger, adParamInput, , IIf(mIDEntidad_Entregador = 0, Null, mIDEntidad_Entregador))
        .Parameters.Append .CreateParameter("IDEntidad_Destinatario", adInteger, adParamInput, , IIf(mIDEntidad_Destinatario = 0, Null, mIDEntidad_Destinatario))
        .Parameters.Append .CreateParameter("IDEntidad_Destino", adInteger, adParamInput, , IIf(mIDEntidad_Destino = 0, Null, mIDEntidad_Destino))
        .Parameters.Append .CreateParameter("IDEntidad_Transportista", adInteger, adParamInput, , IIf(mIDEntidad_Transportista = 0, Null, mIDEntidad_Transportista))
        .Parameters.Append .CreateParameter("IDEntidad_Chofer", adInteger, adParamInput, , IIf(mIDEntidad_Chofer = 0, Null, mIDEntidad_Chofer))
        
        '2 - DATOS DE LOS GRANOS / ESPECIES TRANSPORTADOS
        .Parameters.Append .CreateParameter("IDCosecha", adSmallInt, adParamInput, , mIDCosecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , CSM_Function.IfIsZero_Null(mIDContrato))
        .Parameters.Append .CreateParameter("PesoBruto", adInteger, adParamInput, , mPesoBruto)
        .Parameters.Append .CreateParameter("PesoTara", adInteger, adParamInput, , mPesoTara)
        .Parameters.Append .CreateParameter("PesoNeto", adInteger, adParamInput, , mPesoNeto)
        
        'DATOS PARA MERMAS
        .Parameters.Append .CreateParameter("Volatil", adDecimal, adParamInput, , IIf(mVolatil = -1, Null, mVolatil))
        .Parameters("Volatil").Precision = 2
        .Parameters("Volatil").NumericScale = 2
        .Parameters.Append .CreateParameter("Humedad", adDecimal, adParamInput, , IIf(mHumedad = -1, Null, mHumedad))
        .Parameters("Humedad").Precision = 3
        .Parameters("Humedad").NumericScale = 1
        .Parameters.Append .CreateParameter("Zaranda", adDecimal, adParamInput, , IIf(mZaranda = -1, Null, mZaranda))
        .Parameters("Zaranda").Precision = 3
        .Parameters("Zaranda").NumericScale = 1
        
        '2 - PROCEDENCIA DE LA MERCADERIA
        .Parameters.Append .CreateParameter("IDOrigenDestino_Origen", adInteger, adParamInput, , IIf(mIDOrigenDestino_Origen = 0, Null, mIDOrigenDestino_Origen))
        
        '3 - LUGAR DE DESTINO DE LOS GRANOS
        .Parameters.Append .CreateParameter("IDOrigenDestino_Destino", adInteger, adParamInput, , mIDOrigenDestino_Destino)
        
        '4 - DATOS DEL TRANSPORTE
        .Parameters.Append .CreateParameter("CTGCancelacion", adInteger, adParamInput, , IIf(mCTGCancelacion = 0, Null, mCTGCancelacion))
        .Parameters.Append .CreateParameter("TransporteDominioCamion", adChar, adParamInput, 7, IIf(Trim(mTransporteDominioCamion) = "", Null, mTransporteDominioCamion))
        .Parameters.Append .CreateParameter("TransporteDominioAcoplado", adChar, adParamInput, 7, IIf(Trim(mTransporteDominioAcoplado) = "", Null, mTransporteDominioAcoplado))
        .Parameters.Append .CreateParameter("TransporteKilometro", adSmallInt, adParamInput, , IIf(mTransporteKilometro = 0, Null, mTransporteKilometro))
        .Parameters.Append .CreateParameter("TransporteTarifaReferencia", adCurrency, adParamInput, , IIf(mTransporteTarifaReferencia = 0, Null, mTransporteTarifaReferencia))
        .Parameters.Append .CreateParameter("TransporteTarifa", adCurrency, adParamInput, , IIf(mTransporteTarifa = 0, Null, mTransporteTarifa))
        
        '5 - DATOS A COMPLETAR EN EL LUGAR DE DESTINO Y DESCARGA
        .Parameters.Append .CreateParameter("FechaHoraArribo", adDate, adParamInput, , IIf(mTipo <> MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE, Null, mFechaHoraArribo))
        .Parameters.Append .CreateParameter("FechaHoraDescarga", adDate, adParamInput, , IIf(mTipo <> MOVIMIENTO_CEREAL_TIPO_ENTRADA Or mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE, Null, mFechaHoraDescarga))
        
        'DATOS EXTRAS
        .Parameters.Append .CreateParameter("DeclaraIPRO", adBoolean, adParamInput, , mDeclaraIPRO)
        .Parameters.Append .CreateParameter("IDCartaPorte_MotivoAnulacion", adTinyInt, adParamInput, , IIf(mIDCartaPorte_MotivoAnulacion = 0, Null, mIDCartaPorte_MotivoAnulacion))
        .Parameters.Append .CreateParameter("Notas", adVarChar, adParamInput, 1000, CSM_Function.IfIsZeroLenghtString_Null(mNotas))
        .Parameters.Append .CreateParameter("Calculo_TarifaIndice", adSmallInt, adParamInput, , CSM_Function.IfIsZero_Null(mCalculo_TarifaIndice))
        .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, , pIDUsuario)
        For Each Movimiento_Cereal_Pesada In mCMovimiento_Cereal_Pesada_Updated
            PesadaStringList = PesadaStringList & Movimiento_Cereal_Pesada.IDPesada & STRING_LIST_DELIMITER & Movimiento_Cereal_Pesada.PesoNeto_FormattedForSQL & STRING_LIST_DELIMITER & Movimiento_Cereal_Pesada.Humedad_FormattedForSQL & STRING_LIST_DELIMITER & Movimiento_Cereal_Pesada.Zaranda_FormattedForSQL & STRING_LIST_SEPARATOR
        Next Movimiento_Cereal_Pesada
        .Parameters.Append .CreateParameter("StringListOfIDPesadaCompleta", adVarChar, adParamInput, 1000, PesadaStringList)
        
        .Execute
        
        If mIsNew Then
            mIDMovimiento_Cereal = .Parameters("IDMovimiento_Cereal").Value
        End If
    End With
    
    Set Movimiento_Cereal_Calculo = New Movimiento_Cereal_Calculo
    Movimiento_Cereal_Calculo.IDMovimiento_Cereal = mIDMovimiento_Cereal
    Movimiento_Cereal_Calculo.NoMatchRaiseError = False
    Movimiento_Cereal_Calculo.RefreshListSkip = True
    If Movimiento_Cereal_Calculo.Load() Then
        Call Movimiento_Cereal_Calculo.Calcular
    End If
    Set Movimiento_Cereal_Calculo = Nothing
        
    mIsCopy = False
    mIsDirty = False
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Update = True
    Exit Function
    
ErrorHandler:
    pDatabase.ShowUpdateErrorMessage "Classes.Movimiento_Cereal.Update", "Error al actualizar el Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal & vbCr & "Comprobante Nº: " & mComprobanteNumero, "*", "Este movimiento ya está cargado en el sistema."
End Function

Public Function UpdateMermas() As Boolean
    Dim cmdSP As ADODB.command
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Movimiento_Cereal_UpdateMerma"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    UpdateMermas = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal.UpdateMermas", "Error al actualizar las mermas del Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal
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
        .CommandText = "usp_Movimiento_Cereal_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal.Delete", "Error al eliminar el Movimiento de Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & mIDMovimiento_Cereal & vbCr & "Comprobante Nº: " & mComprobanteNumero
End Function

Private Sub InitializeValues()
    mTipo = "N"
    
    'ENCABEZADO
    mComprobanteNumero = ""
    mIDCartaPorte_Talonario = 0
    mCTGNumero = 0
    mFechaCarga = DATE_TIME_FIELD_NULL_VALUE
    
    '1 - DATOS DE INTERVINIENTES EN EL TRASLADO DE GRANOS
    mIDEntidad_Titular = 0
    mIDEntidad_Intermediario = 0
    mIDEntidad_RemitenteComercial = 0
    mIDEntidad_Corredor = 0
    mIDEntidad_Entregador = 0
    mIDEntidad_Destinatario = 0
    mIDEntidad_Destino = 0
    mIDEntidad_Transportista = 0
    mIDEntidad_Chofer = 0
    
    '2 - DATOS DE LOS GRANOS / ESPECIES TRANSPORTADOS
    mIDCosecha = 0
    mIDCereal = 0
    mIDContrato = 0
    mPesoBruto = 0
    mPesoTara = 0
    mPesoNeto = 0
    
    'DATOS PARA MERMAS
    mVolatil = -1
    mHumedad = -1
    mZaranda = -1
    mMermaVolatilKilogramo = -1
    mMermaHumedadPorcentaje = -1
    mMermaHumedadKilogramo = -1
    mMermaZarandaKilogramo = -1
    
    mPesoFinal = 0
    
    '2 - PROCEDENCIA DE LA MERCADERIA
    mIDOrigenDestino_Origen = 0
    
    '3 - LUGAR DE DESTINO DE LOS GRANOS
    mIDOrigenDestino_Destino = 0
    
    '4 - DATOS DEL TRANSPORTE
    mCTGCancelacion = 0
    mTransporteDominioCamion = ""
    mTransporteDominioAcoplado = ""
    mTransporteKilometro = 0
    mTransporteTarifaReferencia = 0
    mTransporteTarifa = 0
    
    '5 - DATOS A COMPLETAR EN EL LUGAR DE DESTINO Y DESCARGA
    mFechaHoraArribo = DATE_TIME_FIELD_NULL_VALUE
    mFechaHoraDescarga = DATE_TIME_FIELD_NULL_VALUE
    
    'DATOS EXTRAS
    mDeclaraIPRO = False
    mIDCartaPorte_MotivoAnulacion = 0
    mNotas = ""
    mCalculo_TarifaIndice = 0
    
    'DATOS DEL REGISTRO
    mIDUsuarioCreacion = 0
    mFechaHoraCreacion = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    mIDUsuarioModificacion = 0
    mFechaHoraModificacion = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    mFechaHoraLiquidacionServicio = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    mFechaHoraEnvioBolsaTech = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    mCertificado = False
    mKilogramoAplicado = 0
    
        
    Set mCMovimiento_Cereal_Pesada = New Collection
    Set mCMovimiento_Cereal_Pesada_Updated = New Collection
    
    Set mCFormularioAplicado = Nothing

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
    Set mCMovimiento_Cereal_Pesada = Nothing
    Set mCMovimiento_Cereal_Pesada_Updated = Nothing
End Sub

Public Function ConvertirASubProducto(ByVal IDSubProductoPorcentajeAndKilogramo_StringList As String)
    Dim cmdSP As ADODB.command

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Movimiento_Cereal_A_SubProducto"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_Cereal", adInteger, adParamInput, , mIDMovimiento_Cereal)
        .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, , pIDUsuario)
        .Parameters.Append .CreateParameter("StringListOfIDSubProductoPorcentajeAndKilogramo", adVarChar, adParamInput, 1000, IDSubProductoPorcentajeAndKilogramo_StringList)
        
        .Execute
    End With

    Screen.MousePointer = vbDefault
    ConvertirASubProducto = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal.ConvertirASubProducto", "Error al generar la Conversión a SubProducto."
End Function
