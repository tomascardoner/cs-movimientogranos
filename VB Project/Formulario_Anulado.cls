VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Formulario_Anulado"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario_Anulado As Long
Private mFormularioCodigo As Byte
Private mFormularioNumero As String
Private mAnulacionMotivo As Byte
Private mFecha As Date

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'DATABASE VARIABLES
Private mDatabase As CSC_Database_ADO_SQL

'INTERNAL VARIABLES
Private mrecData As ADODB.Recordset

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDFormulario_Anulado() As Long
    IDFormulario_Anulado = mIDFormulario_Anulado
End Property

Public Property Let IDFormulario_Anulado(ByVal Value As Long)
    If Value <> mIDFormulario_Anulado Then
        mIsDirty = True
    End If
    mIDFormulario_Anulado = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FormularioCodigo() As Byte
    FormularioCodigo = mFormularioCodigo
End Property

Public Property Let FormularioCodigo(ByVal Value As Byte)
    If Value <> mFormularioCodigo Then
        mIsDirty = True
    End If
    mFormularioCodigo = Value
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

Public Property Get AnulacionMotivo() As Byte
    AnulacionMotivo = mAnulacionMotivo
End Property

Public Property Let AnulacionMotivo(ByVal Value As Byte)
    If Value <> mAnulacionMotivo Then
        mIsDirty = True
    End If
    mAnulacionMotivo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Fecha() As String
    Fecha = mFecha
End Property

Public Property Let Fecha(ByVal Value As String)
    If Value <> mFecha Then
        mIsDirty = True
    End If
    mFecha = Value
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
    RefreshList_Module.Formulario_Anulado IDFormulario_Anulado
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
        .CommandText = "usp_Formulario_Anulado_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario_Anulado", adInteger, adParamInput, , mIDFormulario_Anulado)
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
    ShowErrorMessage "Classes.Formulario_Anulado.Load", "Error al obtener los datos del Formulario Anulado." & vbCr & vbCr & "IDFormulario_Anulado: " & mIDFormulario_Anulado
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDFormulario_Anulado = recData("IDFormulario_Anulado").Value

        mFormularioCodigo = recData("FormularioCodigo").Value
        mFormularioNumero = recData("FormularioNumero").Value
        mAnulacionMotivo = recData("AnulacionMotivo").Value
        mFecha = recData("Fecha").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Formulario_Anulado.GetDataFromRecordset", "Error al leer los datos del Formulario Anulado." & vbCr & vbCr & "IDFormulario_Anulado: " & IDFormulario_Anulado
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario_Anulado = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdSP As ADODB.command

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
        If mIsNew Then
            .CommandText = "usp_Formulario_Anulado_Add"
        Else
            .CommandText = "usp_Formulario_Anulado_Update"
        End If
        .CommandType = adCmdStoredProc
        
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDFormulario_Anulado", adInteger, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDFormulario_Anulado", adInteger, adParamInput, , mIDFormulario_Anulado)
        End If
        .Parameters.Append .CreateParameter("FormularioCodigo", adTinyInt, adParamInput, , mFormularioCodigo)
        .Parameters.Append .CreateParameter("FormularioNumero", adVarChar, adParamInput, 13, mFormularioNumero)
        .Parameters.Append .CreateParameter("AnulacionMotivo", adTinyInt, adParamInput, , mAnulacionMotivo)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        
        .Execute
        
        If mIsNew Then
            mIDFormulario_Anulado = .Parameters("IDFormulario_Anulado").Value
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
    ShowErrorMessage "Classes.Formulario_Anulado.Update", "Error al actualizar el Formulario Anulado." & vbCr & vbCr & "IDFormulario_Anulado: " & mIDFormulario_Anulado & vbCr & "Formulario Nº: " & mFormularioNumero
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
        .CommandText = "usp_Formulario_Anulado_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDFormulario_Anulado", adInteger, adParamInput, , mIDFormulario_Anulado)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento.Delete", "Error al eliminar el Formulario Anulado." & vbCr & vbCr & "IDFormulario_Anulado: " & mIDFormulario_Anulado & vbCr & "Formulario Nº: " & mFormularioNumero
End Function

Private Sub InitializeValues()
    mFormularioCodigo = 0
    mFormularioNumero = ""
    mAnulacionMotivo = 0
    mFecha = DATE_TIME_FIELD_NULL_VALUE

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
    If Not mrecData Is Nothing Then
        If mrecData.State = adStateOpen Then
            mrecData.Close
        End If
        Set mrecData = Nothing
    End If
End Sub
