VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MonedaCotizacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMoneda As Integer
Private mFecha As Date
Private mCotizacionCompra As Currency
Private mCotizacionVenta As Currency

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

Public Property Get IDMoneda() As Integer
    IDMoneda = mIDMoneda
End Property

Public Property Let IDMoneda(ByVal Value As Integer)
    If Value <> mIDMoneda Then
        mIsDirty = True
    End If
    mIDMoneda = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Moneda() As Moneda
    Static oMoneda As Moneda
    
    If oMoneda Is Nothing Then
        Set oMoneda = New Moneda
    End If
    If oMoneda.IDMoneda <> mIDMoneda Then
        If mIDMoneda = 0 Then
            Set oMoneda = New Moneda
        Else
            oMoneda.IDMoneda = mIDMoneda
            Call oMoneda.Load
        End If
    End If
    Set Moneda = oMoneda
End Property

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

Public Property Get CotizacionCompra() As Currency
    CotizacionCompra = mCotizacionCompra
End Property

Public Property Get CotizacionCompra_Formatted() As String
    CotizacionCompra_Formatted = Format(mCotizacionCompra, "Currency")
End Property

Public Property Let CotizacionCompra(ByVal Value As Currency)
    If Value <> mCotizacionCompra Then
        mIsDirty = True
    End If
    mCotizacionCompra = Value
End Property

Public Property Let CotizacionCompra_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        CotizacionCompra = CCur(Value)
    Else
        CotizacionCompra = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CotizacionVenta() As Currency
    CotizacionVenta = mCotizacionVenta
End Property

Public Property Get CotizacionVenta_Formatted() As String
    CotizacionVenta_Formatted = Format(mCotizacionVenta, "Currency")
End Property

Public Property Let CotizacionVenta(ByVal Value As Currency)
    If Value <> mCotizacionVenta Then
        mIsDirty = True
    End If
    mCotizacionVenta = Value
End Property

Public Property Let CotizacionVenta_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        CotizacionVenta = CCur(Value)
    Else
        CotizacionVenta = 0
    End If
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
    RefreshList_Module.MonedaCotizacion IDMoneda, Fecha
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
        .CommandText = "usp_MonedaCotizacion_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamInput, , mIDMoneda)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.MonedaCotizacion.Load", "Error al obtener los datos de la Cotización de la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda & vbCr & "Fecha: " & Fecha
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean
    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        If pTrapErrors Then
            On Error GoTo ErrorHandler
        End If

        mIDMoneda = recData("IDMoneda").Value
        mFecha = recData("Fecha").Value
        mCotizacionCompra = recData("CotizacionCompra").Value
        mCotizacionVenta = recData("CotizacionVenta").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.MonedaCotizacion.GetDataFromRecordset", "Error al obtener los datos de la Cotización de la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda & vbCr & "Fecha: " & Fecha
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

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
            .CommandText = "usp_MonedaCotizacion_Add"
        Else
            .CommandText = "usp_MonedaCotizacion_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamInput, , mIDMoneda)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("CotizacionCompra", adCurrency, adParamInput, , mCotizacionCompra)
        .Parameters.Append .CreateParameter("CotizacionVenta", adCurrency, adParamInput, , mCotizacionVenta)

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
    pDatabase.ShowUpdateErrorMessage "Classes.MonedaCotizacion.Update", "Error al actualizar la Cotización de la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda & vbCr & "Fecha: " & Fecha, "", "*", "Ya existe una Cotización de la Moneda con la misma Fecha."
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
        .CommandText = "usp_MonedaCotizacion_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDMoneda", adSmallInt, adParamInput, , mIDMoneda)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)

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
    pDatabase.ShowDeleteErrorMessage "Classes.MonedaCotizacion.Delete", "Error al eliminar la Cotización de la Moneda." & vbCr & vbCr & "IDMoneda: " & IDMoneda & vbCr & "Fecha: " & Fecha, "No se puede eliminar la Cotización de la Moneda debido a que tiene datos relacionados."
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mCotizacionCompra = 0
    mCotizacionVenta = 0

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
