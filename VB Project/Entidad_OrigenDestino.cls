VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Entidad_OrigDest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDEntidad As Long
Private mIDOrigenDestino As Long
Private mNombre As String
Private mDireccion As String
Private mIDLocalidad As Long
Private mKilometro As Integer
Private mONCCA_Codigo As Long
Private mControlaStock As Boolean
Private mConvierteEnSubProducto As Boolean
Private mRealizaAnalisis As Boolean
Private mRealizaAnalisisIPRO As Boolean
Private mActivo As Boolean

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

Public Property Let IDEntidad(ByVal value As Long)
    If value <> mIDEntidad Then
        mIsDirty = True
    End If
    mIDEntidad = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad Then
        If mIDEntidad = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad
            Call oEntidad.Load
        End If
    End If
    Set Entidad = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDOrigenDestino() As Long
    IDOrigenDestino = mIDOrigenDestino
End Property

Public Property Let IDOrigenDestino(ByVal value As Long)
    If value <> mIDOrigenDestino Then
        mIsDirty = True
    End If
    mIDOrigenDestino = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Nombre() As String
    Nombre = mNombre
End Property

Public Property Let Nombre(ByVal value As String)
    If value <> mNombre Then
        mIsDirty = True
    End If
    mNombre = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Direccion() As String
    Direccion = mDireccion
End Property

Public Property Let Direccion(ByVal value As String)
    If value <> mDireccion Then
        mIsDirty = True
    End If
    mDireccion = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDLocalidad() As Long
    IDLocalidad = mIDLocalidad
End Property

Public Property Let IDLocalidad(ByVal value As Long)
    If value <> mIDLocalidad Then
        mIsDirty = True
    End If
    mIDLocalidad = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Localidad() As Localidad
    Static oLocalidad As Localidad
    
    If oLocalidad Is Nothing Then
        Set oLocalidad = New Localidad
    End If
    If oLocalidad.IDLocalidad <> mIDLocalidad Then
        If mIDLocalidad = 0 Then
            Set oLocalidad = New Localidad
        Else
            oLocalidad.IDLocalidad = mIDLocalidad
            Call oLocalidad.Load
        End If
    End If
    Set Localidad = oLocalidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Kilometro() As Integer
    Kilometro = mKilometro
End Property

Public Property Get Kilometro_Formatted() As String
    If mKilometro = 0 Then
        Kilometro_Formatted = ""
    Else
        Kilometro_Formatted = Format(mKilometro, "#,###")
    End If
End Property

Public Property Let Kilometro(ByVal value As Integer)
    If value <> mKilometro Then
        mIsDirty = True
    End If
    mKilometro = value
End Property

Public Property Let Kilometro_Formatted(ByVal value As String)
    Dim ConvertedValue As Integer
    
    If Not IsNumeric(value) Then
        ConvertedValue = 0
    Else
        ConvertedValue = CInt(value)
    End If
    If ConvertedValue <> mKilometro Then
        mIsDirty = True
    End If
    mKilometro = ConvertedValue
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ONCCA_Codigo() As Long
    ONCCA_Codigo = mONCCA_Codigo
End Property

Public Property Get ONCCA_Codigo_Formatted() As String
    If mONCCA_Codigo = 0 Then
        ONCCA_Codigo_Formatted = ""
    Else
        ONCCA_Codigo_Formatted = Format(mONCCA_Codigo, "#,###")
    End If
End Property

Public Property Let ONCCA_Codigo(ByVal value As Long)
    If value <> mONCCA_Codigo Then
        mIsDirty = True
    End If
    mONCCA_Codigo = value
End Property

Public Property Let ONCCA_Codigo_Formatted(ByVal value As String)
    Dim ConvertedValue As Long
    
    If Not IsNumeric(value) Then
        ConvertedValue = 0
    Else
        ConvertedValue = CLng(value)
    End If
    If ConvertedValue <> mONCCA_Codigo Then
        mIsDirty = True
    End If
    mONCCA_Codigo = ConvertedValue
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ControlaStock() As Boolean
    ControlaStock = mControlaStock
End Property

Public Property Let ControlaStock(ByVal value As Boolean)
    If value <> mControlaStock Then
        mIsDirty = True
    End If
    mControlaStock = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ConvierteEnSubProducto() As Boolean
    ConvierteEnSubProducto = mConvierteEnSubProducto
End Property

Public Property Let ConvierteEnSubProducto(ByVal value As Boolean)
    If value <> mConvierteEnSubProducto Then
        mIsDirty = True
    End If
    mConvierteEnSubProducto = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RealizaAnalisis() As Boolean
    RealizaAnalisis = mRealizaAnalisis
End Property

Public Property Let RealizaAnalisis(ByVal value As Boolean)
    If value <> mRealizaAnalisis Then
        mIsDirty = True
    End If
    mRealizaAnalisis = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RealizaAnalisisIPRO() As Boolean
    RealizaAnalisisIPRO = mRealizaAnalisisIPRO
End Property

Public Property Let RealizaAnalisisIPRO(ByVal value As Boolean)
    If value <> mRealizaAnalisisIPRO Then
        mIsDirty = True
    End If
    mRealizaAnalisisIPRO = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Activo() As Boolean
    Activo = mActivo
End Property

Public Property Let Activo(ByVal value As Boolean)
    If value <> mActivo Then
        mIsDirty = True
    End If
    mActivo = value
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

Public Property Let NoMatchRaiseError(ByVal value As Boolean)
    mNoMatchRaiseError = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RefreshListSkip() As Boolean
    RefreshListSkip = mRefreshListSkip
End Property

Public Property Let RefreshListSkip(ByVal value As Boolean)
    mRefreshListSkip = value
End Property

Public Sub RefreshList()
    RefreshList_Module.Entidad_OrigDest IDEntidad, IDOrigenDestino
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Function Load() As Boolean
    Dim cmdSP As ADODB.command
    Dim recData As ADODB.recordset

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Call InitializeValues

    Set cmdSP = New ADODB.command
    With cmdSP
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_Entidad_OrigenDestino_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        .Parameters.Append .CreateParameter("IDOrigenDestino", adSmallInt, adParamInput, , mIDOrigenDestino)
    End With

    Set recData = New ADODB.recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Destino.Load", "Error al obtener los datos del Origen / Destino de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDOrigenDestino: " & IDOrigenDestino
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDEntidad = recData("IDEntidad").value
        mIDOrigenDestino = recData("IDOrigenDestino").value
        mNombre = recData("Nombre").value
        mDireccion = recData("Direccion").value
        mIDLocalidad = recData("IDLocalidad").value
        mKilometro = CSM_Function.IfIsNull_Zero(recData("Kilometro").value)
        mONCCA_Codigo = CSM_Function.IfIsNull_Zero(recData("ONCCA_Codigo").value)
        mControlaStock = recData("ControlaStock").value
        mConvierteEnSubProducto = recData("ConvierteEnSubProducto").value
        mRealizaAnalisis = recData("RealizaAnalisis").value
        mRealizaAnalisisIPRO = recData("RealizaAnalisisIPRO").value
        mActivo = recData("Activo").value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad_OrigenDestino.GetDataFromRecordset", "Error al obtener los datos del Origen / Destino de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDOrigenDestino: " & IDOrigenDestino
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDOrigenDestino = 0

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
            .CommandText = "usp_Entidad_OrigenDestino_Add"
        Else
            .CommandText = "usp_Entidad_OrigenDestino_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDOrigenDestino", adSmallInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDOrigenDestino", adSmallInt, adParamInput, , mIDOrigenDestino)
        End If
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("Direccion", adVarChar, adParamInput, 250, mDireccion)
        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)
        .Parameters.Append .CreateParameter("Kilometro", adSmallInt, adParamInput, , CSM_Function.IfIsZero_Null(mKilometro))
        .Parameters.Append .CreateParameter("ONCCA_Codigo", adInteger, adParamInput, , CSM_Function.IfIsZero_Null(mONCCA_Codigo))
        .Parameters.Append .CreateParameter("ControlaStock", adBoolean, adParamInput, , mControlaStock)
        .Parameters.Append .CreateParameter("ConvierteEnSubProducto", adBoolean, adParamInput, , mConvierteEnSubProducto)
        .Parameters.Append .CreateParameter("RealizaAnalisis", adBoolean, adParamInput, , mRealizaAnalisis)
        .Parameters.Append .CreateParameter("RealizaAnalisisIPRO", adBoolean, adParamInput, , mRealizaAnalisisIPRO)
        .Parameters.Append .CreateParameter("Activo", adBoolean, adParamInput, , mActivo)

        .Execute

        If mIsNew Then
            mIDEntidad = .Parameters("IDEntidad").value
            mIDOrigenDestino = .Parameters("IDOrigenDestino").value
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
    pDatabase.ShowUpdateErrorMessage "Classes.Entidad_Destino.Update", "Error al actualizar el Origen / Destino de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDOrigenDestino: " & IDOrigenDestino, "*", "Ya existe un Origen / Destino de la Entidad con el mismo Nombre o Nº ONCCA."
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
        .CommandText = "usp_Entidad_OrigenDestino_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        .Parameters.Append .CreateParameter("IDOrigenDestino", adSmallInt, adParamInput, , mIDOrigenDestino)

        .Execute
    End With

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    If pDatabase.Connection.Errors.Count > 0 Then
        If pDatabase.Connection.Errors(0).NativeError = pDatabase.ERROR_RELATED_RECORDS Then
            Screen.MousePointer = vbDefault
            MsgBox "No se puede eliminar el Origen / Destino de la Entidad debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.Entidad_Destino.Delete", "Error al eliminar el Origen / Destino de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDOrigenDestino: " & IDOrigenDestino
        End If
    Else
        ShowErrorMessage "Classes.Entidad_Destino.Delete", "Error al eliminar el Origen / Destino de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDOrigenDestino: " & IDOrigenDestino
    End If
End Function

Private Sub InitializeValues()
    mNombre = ""
    mDireccion = ""
    mIDLocalidad = 0
    mKilometro = 0
    mONCCA_Codigo = 0
    mControlaStock = False
    mConvierteEnSubProducto = False
    mRealizaAnalisis = False
    mRealizaAnalisisIPRO = False
    mActivo = True

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub
