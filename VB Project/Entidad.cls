VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Entidad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDEntidad As Long
Private mNombre As String
Private mCUIT As String
Private mEsTitular As Boolean
Private mEsIntermediario As Boolean
Private mEsRemitenteComercial As Boolean
Private mEsCorredor As Boolean
Private mEsEntregador As Boolean
Private mEsDestinatario As Boolean
Private mEsDestino As Boolean
Private mEsTransportista As Boolean
Private mEsChofer As Boolean
Private mEsClienteSubProducto As Boolean
Private mNotas As String
Private mActivo As Boolean

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

Public Property Get CUIT() As String
    CUIT = mCUIT
End Property

Public Property Get CUIT_Formatted() As String
    If Len(Trim(mCUIT)) = 11 Then
        CUIT_Formatted = Left(Trim(mCUIT), 2) & "-" & Mid(Trim(mCUIT), 3, 8) & "-" & Right(Trim(mCUIT), 1)
    Else
        CUIT_Formatted = ""
    End If
End Property

Public Property Let CUIT(ByVal Value As String)
    If Value <> mCUIT Then
        mIsDirty = True
    End If
    mCUIT = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsTitular() As Boolean
    EsTitular = mEsTitular
End Property

Public Property Let EsTitular(ByVal Value As Boolean)
    If Value <> mEsTitular Then
        mIsDirty = True
    End If
    mEsTitular = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsIntermediario() As Boolean
    EsIntermediario = mEsIntermediario
End Property

Public Property Let EsIntermediario(ByVal Value As Boolean)
    If Value <> mEsIntermediario Then
        mIsDirty = True
    End If
    mEsIntermediario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsRemitenteComercial() As Boolean
    EsRemitenteComercial = mEsRemitenteComercial
End Property

Public Property Let EsRemitenteComercial(ByVal Value As Boolean)
    If Value <> mEsRemitenteComercial Then
        mIsDirty = True
    End If
    mEsRemitenteComercial = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsCorredor() As Boolean
    EsCorredor = mEsCorredor
End Property

Public Property Let EsCorredor(ByVal Value As Boolean)
    If Value <> mEsCorredor Then
        mIsDirty = True
    End If
    mEsCorredor = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsEntregador() As Boolean
    EsEntregador = mEsEntregador
End Property

Public Property Let EsEntregador(ByVal Value As Boolean)
    If Value <> mEsEntregador Then
        mIsDirty = True
    End If
    mEsEntregador = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsDestinatario() As Boolean
    EsDestinatario = mEsDestinatario
End Property

Public Property Let EsDestinatario(ByVal Value As Boolean)
    If Value <> mEsDestinatario Then
        mIsDirty = True
    End If
    mEsDestinatario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsDestino() As Boolean
    EsDestino = mEsDestino
End Property

Public Property Let EsDestino(ByVal Value As Boolean)
    If Value <> mEsDestino Then
        mIsDirty = True
    End If
    mEsDestino = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsTransportista() As Boolean
    EsTransportista = mEsTransportista
End Property

Public Property Let EsTransportista(ByVal Value As Boolean)
    If Value <> mEsTransportista Then
        mIsDirty = True
    End If
    mEsTransportista = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsChofer() As Boolean
    EsChofer = mEsChofer
End Property

Public Property Let EsChofer(ByVal Value As Boolean)
    If Value <> mEsChofer Then
        mIsDirty = True
    End If
    mEsChofer = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EsClienteSubProducto() As Boolean
    EsClienteSubProducto = mEsClienteSubProducto
End Property

Public Property Let EsClienteSubProducto(ByVal Value As Boolean)
    If Value <> mEsClienteSubProducto Then
        mIsDirty = True
    End If
    mEsClienteSubProducto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Domicilio() As Entidad_Domicilio
    Static oEntidad_Domicilio As Entidad_Domicilio
    
    If oEntidad_Domicilio Is Nothing Then
        Set oEntidad_Domicilio = New Entidad_Domicilio
        Set oEntidad_Domicilio.Database = pDatabase
    End If
    If oEntidad_Domicilio.IDEntidad <> mIDEntidad Then
        If mIDEntidad = 0 Then
            Set oEntidad_Domicilio = New Entidad_Domicilio
        Else
            oEntidad_Domicilio.IDEntidad = mIDEntidad
            oEntidad_Domicilio.NoMatchRaiseError = False
            Call oEntidad_Domicilio.Load
        End If
    End If
    Set Entidad_Domicilio = oEntidad_Domicilio
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Impuesto() As Entidad_Impuesto
    Static oEntidad_Impuesto As Entidad_Impuesto
    
    If oEntidad_Impuesto Is Nothing Then
        Set oEntidad_Impuesto = New Entidad_Impuesto
        Set oEntidad_Impuesto.Database = pDatabase
    End If
    If oEntidad_Impuesto.IDEntidad <> mIDEntidad Then
        If mIDEntidad = 0 Then
            Set oEntidad_Impuesto = New Entidad_Impuesto
        Else
            oEntidad_Impuesto.IDEntidad = mIDEntidad
            oEntidad_Impuesto.NoMatchRaiseError = False
            Call oEntidad_Impuesto.Load
        End If
    End If
    Set Entidad_Impuesto = oEntidad_Impuesto
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Chofer() As Entidad_Chofer
    Static oEntidad_Chofer As Entidad_Chofer
    
    If oEntidad_Chofer Is Nothing Then
        Set oEntidad_Chofer = New Entidad_Chofer
        Set oEntidad_Chofer.Database = pDatabase
    End If
    If oEntidad_Chofer.IDEntidad <> mIDEntidad Then
        If mIDEntidad = 0 Then
            Set oEntidad_Chofer = New Entidad_Chofer
        Else
            oEntidad_Chofer.IDEntidad = mIDEntidad
            oEntidad_Chofer.NoMatchRaiseError = False
            Call oEntidad_Chofer.Load
        End If
    End If
    Set Entidad_Chofer = oEntidad_Chofer
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

Public Property Get Activo() As Boolean
    Activo = mActivo
End Property

Public Property Let Activo(ByVal Value As Boolean)
    If Value <> mActivo Then
        mIsDirty = True
    End If
    mActivo = Value
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
    RefreshList_Module.Entidad IDEntidad
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
        .CommandText = "usp_Entidad_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Entidad.Load", "Error al obtener los datos de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDEntidad = recData("IDEntidad").Value
        mNombre = recData("Nombre").Value
        mCUIT = recData("CUIT").Value & ""
        mEsTitular = recData("EsTitular").Value
        mEsIntermediario = recData("EsIntermediario").Value
        mEsRemitenteComercial = recData("EsRemitenteComercial").Value
        mEsCorredor = recData("EsCorredor").Value
        mEsEntregador = recData("EsEntregador").Value
        mEsDestinatario = recData("EsDestinatario").Value
        mEsDestino = recData("EsDestino").Value
        mEsTransportista = recData("EsTransportista").Value
        mEsChofer = recData("EsChofer").Value
        mEsClienteSubProducto = recData("EsClienteSubProducto").Value
        mNotas = recData("Notas").Value & ""
        mActivo = recData("Activo").Value
        
        'DATOS DEL REGISTRO
        mIDUsuarioCreacion = recData("IDUsuarioCreacion").Value
        mFechaHoraCreacion = recData("FechaHoraCreacion").Value
        mIDUsuarioModificacion = recData("IDUsuarioModificacion").Value
        mFechaHoraModificacion = recData("FechaHoraModificacion").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad.GetDataFromRecordset", "Error al obtener los datos de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDEntidad = 0

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
            .CommandText = "usp_Entidad_Add"
        Else
            .CommandText = "usp_Entidad_Update"
        End If
        .CommandType = adCmdStoredProc

        If mIsNew Then
            .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        End If
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 100, mNombre)
        .Parameters.Append .CreateParameter("CUIT", adChar, adParamInput, 11, CSM_Function.IfIsZeroLenghtString_Null(mCUIT))
        .Parameters.Append .CreateParameter("EsTitular", adBoolean, adParamInput, , mEsTitular)
        .Parameters.Append .CreateParameter("EsIntermediario", adBoolean, adParamInput, , mEsIntermediario)
        .Parameters.Append .CreateParameter("EsRemitenteComercial", adBoolean, adParamInput, , mEsRemitenteComercial)
        .Parameters.Append .CreateParameter("EsCorredor", adBoolean, adParamInput, , mEsCorredor)
        .Parameters.Append .CreateParameter("EsEntregador", adBoolean, adParamInput, , mEsEntregador)
        .Parameters.Append .CreateParameter("EsDestinatario", adBoolean, adParamInput, , mEsDestinatario)
        .Parameters.Append .CreateParameter("EsDestino", adBoolean, adParamInput, , mEsDestino)
        .Parameters.Append .CreateParameter("EsTransportista", adBoolean, adParamInput, , mEsTransportista)
        .Parameters.Append .CreateParameter("EsChofer", adBoolean, adParamInput, , mEsChofer)
        .Parameters.Append .CreateParameter("EsClienteSubProducto", adBoolean, adParamInput, , mEsClienteSubProducto)
        .Parameters.Append .CreateParameter("Notas", adVarChar, adParamInput, 8000, CSM_Function.IfIsZeroLenghtString_Null(mNotas))
        .Parameters.Append .CreateParameter("Activo", adBoolean, adParamInput, , mActivo)
        .Parameters.Append .CreateParameter("IDUsuario", adTinyInt, adParamInput, , pIDUsuario)

        .Execute

        If mIsNew Then
            mIDEntidad = .Parameters("IDEntidad").Value
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
    pDatabase.ShowUpdateErrorMessage "Classes.Entidad.Update", "Error al actualizar la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad, "AK__Entidad__Nombre", "Ya existe una Entidad con el mismo Nombre.", "AK__Entidad__CUIT", "Ya existe una Entidad con el mismo CUIT."
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
        .CommandText = "usp_Entidad_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)

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
    pDatabase.ShowDeleteErrorMessage "Classes.Entidad.Delete", "Error al eliminar la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad, "No se puede eliminar la Entidad debido a que tiene datos relacionados."
End Function

Private Sub InitializeValues()
    mNombre = ""
    mCUIT = ""
    mEsTitular = False
    mEsIntermediario = False
    mEsRemitenteComercial = False
    mEsCorredor = False
    mEsEntregador = False
    mEsDestinatario = False
    mEsDestino = False
    mEsTransportista = False
    mEsChofer = False
    mEsClienteSubProducto = False
    mNotas = ""
    mActivo = 1

    'DATOS DEL REGISTRO
    mIDUsuarioCreacion = 0
    mFechaHoraCreacion = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    mIDUsuarioModificacion = 0
    mFechaHoraModificacion = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub

