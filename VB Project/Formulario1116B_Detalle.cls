VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "F1116B_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario1116B As Long
Private mFormularioTipo As String
Private mFormularioNumero As String
Private mFormularioFecha As Date
Private mIDFormulario1116A As Long
Private mIDFormulario1116RT As Long
Private mIDLocalidad As Long
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

Public Property Get FormularioTipo() As String
    FormularioTipo = mFormularioTipo
End Property

Public Property Let FormularioTipo(ByVal Value As String)
    If Value <> mFormularioTipo Then
        mIsDirty = True
    End If
    mFormularioTipo = Value
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

Public Property Get FormularioFecha() As Date
    FormularioFecha = mFormularioFecha
End Property

Public Property Get FormularioFecha_Formatted() As String
    FormularioFecha = Format(mFormularioFecha, "Short Date")
End Property

Public Property Let FormularioFecha(ByVal Value As Date)
    If Value <> mFormularioFecha Then
        mIsDirty = True
    End If
    mFormularioFecha = Value
End Property

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

Public Property Get Formulario1116A_Cabecera() As F1116A_Cabecera
    Static oFormulario1116A_Cabecera As F1116A_Cabecera
    
    If mIDFormulario1116A = 0 Then
        Set Formulario1116A_Cabecera = Nothing
    Else
        If oFormulario1116A_Cabecera Is Nothing Then
            Set oFormulario1116A_Cabecera = New F1116A_Cabecera
        End If
        If oFormulario1116A_Cabecera.IDFormulario1116A <> mIDFormulario1116A Then
            oFormulario1116A_Cabecera.IDFormulario1116A = mIDFormulario1116A
            Call oFormulario1116A_Cabecera.Load
        End If
        Set Formulario1116A_Cabecera = oFormulario1116A_Cabecera
    End If
End Property

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

Public Property Get Formulario1116RT_Cabecera() As F1116RT_Cabecera
    Static oFormulario1116RT_Cabecera As F1116RT_Cabecera
    
    If mIDFormulario1116RT = 0 Then
        Set Formulario1116RT_Cabecera = Nothing
    Else
        If oFormulario1116RT_Cabecera Is Nothing Then
            Set oFormulario1116RT_Cabecera = New F1116RT_Cabecera
        End If
        If oFormulario1116RT_Cabecera.IDFormulario1116RT <> mIDFormulario1116RT Then
            oFormulario1116RT_Cabecera.IDFormulario1116RT = mIDFormulario1116RT
            Call oFormulario1116RT_Cabecera.Load
        End If
        Set Formulario1116RT_Cabecera = oFormulario1116RT_Cabecera
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDLocalidad() As Long
    IDLocalidad = mIDLocalidad
End Property

Public Property Let IDLocalidad(ByVal Value As Long)
    If Value <> mIDLocalidad Then
        mIsDirty = True
    End If
    mIDLocalidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Localidad() As Localidad
    Static oLocalidad As Localidad
    
    If mIDLocalidad = 0 Then
        Set Localidad = Nothing
    Else
        If oLocalidad Is Nothing Then
            Set oLocalidad = New Localidad
        End If
        If oLocalidad.IDLocalidad <> mIDLocalidad Then
            oLocalidad.IDLocalidad = mIDLocalidad
            Call oLocalidad.Load
        End If
        Set Localidad = oLocalidad
    End If
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
    'RefreshList_Module.Formulario1116B_Detalle IDFormulario1116B, FormularioTipo, FormularioNumero
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
        .CommandText = "usp_Formulario1116B_Detalle_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDFormulario1116B", adInteger, adParamInput, 16, mIDFormulario1116B)
        .Parameters.Append .CreateParameter("FormularioTipo", adChar, adParamInput, 1, mFormularioTipo)
        .Parameters.Append .CreateParameter("FormularioNumero", adVarChar, adParamInput, 13, mFormularioNumero)
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
    ShowErrorMessage "Classes.Formulario1116B_Detalle.Load", "Error al obtener los datos del Detalle del Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & IDFormulario1116B & vbCr & "FormularioTipo: " & FormularioTipo & vbCr & "FormularioNumero: " & FormularioNumero
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mFormularioFecha = recData("FormularioFecha").Value
        mIDFormulario1116A = Val(recData("IDFormulario1116A").Value & "")
        mIDFormulario1116RT = Val(recData("IDFormulario1116RT").Value & "")
        mIDLocalidad = recData("IDLocalidad").Value
        mKilogramoAplicado = recData("KilogramoAplicado").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Formulario1116B_Detalle.GetDataFromRecordset", "Error al obtener los datos del Detalle de l Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & IDFormulario1116B & vbCr & "FormularioTipo: " & FormularioTipo & vbCr & "FormularioNumero: " & FormularioNumero
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario1116B = 0
        mFormularioTipo = ""
        mFormularioNumero = ""

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
            .CommandText = "usp_Formulario1116B_Detalle_Add"
        Else
            .CommandText = "usp_Formulario1116B_Detalle_Update"
        End If
        .CommandType = adCmdStoredProc

        If mIsNew Then
            .Parameters.Append .CreateParameter("IDFormulario1116B", adInteger, adParamOutput)
            .Parameters.Append .CreateParameter("FormularioTipo", adChar, adParamOutput)
            .Parameters.Append .CreateParameter("FormularioNumero", adVarChar, adParamOutput)
        End If
        .Parameters.Append .CreateParameter("FormularioFecha", adDate, adParamInput, , mFormularioFecha)
        .Parameters.Append .CreateParameter("IDFormulario1116A", adInteger, adParamInput, , IIf(mIDFormulario1116A = 0, Null, mIDFormulario1116A))
        .Parameters.Append .CreateParameter("IDFormulario1116RT", adInteger, adParamInput, , IIf(mIDFormulario1116RT = 0, Null, mIDFormulario1116RT))
        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)
        .Parameters.Append .CreateParameter("KilogramoAplicado", adInteger, adParamInput, , mIDLocalidad)

        .Execute
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
    ShowErrorMessage "Classes.Formulario1116B_Detalle.Update", "Error al actualizar el Detalle del Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & IDFormulario1116B & vbCr & "FormularioTipo: " & FormularioTipo & vbCr & "FormularioNumero: " & FormularioNumero
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
        .CommandText = "usp_Formulario1116B_Detalle_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDFormulario1116B", adInteger, adParamInput, 16, mIDFormulario1116B)
        .Parameters.Append .CreateParameter("FormularioTipo", adChar, adParamInput, 1, mFormularioTipo)
        .Parameters.Append .CreateParameter("FormularioNumero", adVarChar, adParamInput, 13, mFormularioNumero)

        .Execute
    End With

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Formulario1116B_Detalle.Delete", "Error al eliminar el Detalle del Formulario 1116B." & vbCr & vbCr & "IDFormulario1116B: " & IDFormulario1116B & vbCr & "FormularioTipo: " & FormularioTipo & vbCr & "FormularioNumero: " & FormularioNumero
End Function

Private Sub InitializeValues()
    FormularioFecha = CSM_Constant.DATE_TIME_FIELD_NULL_VALUE
    IDFormulario1116A = 0
    IDFormulario1116RT = 0
    IDLocalidad = 0

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
