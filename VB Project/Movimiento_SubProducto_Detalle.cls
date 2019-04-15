VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Movimiento_SubProducto_Det"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMovimiento_SubProducto As Long
Private mLinea As Byte
Private mIDSubProducto As Byte
Private mPorcentaje As Single
Private mKilogramo As Long
Private mPrecioToneladaDolar As Currency
Private mPrecioToneladaPeso As Currency

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES

Public Property Get IDMovimiento_SubProducto() As Long
    IDMovimiento_SubProducto = mIDMovimiento_SubProducto
End Property

Public Property Let IDMovimiento_SubProducto(ByVal Value As Long)
    If Value <> mIDMovimiento_SubProducto Then
        mIsDirty = True
    End If
    mIDMovimiento_SubProducto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Linea() As Byte
    Linea = mLinea
End Property

Public Property Let Linea(ByVal Value As Byte)
    If Value <> mLinea Then
        mIsDirty = True
    End If
    mLinea = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDSubProducto() As Byte
    IDSubProducto = mIDSubProducto
End Property

Public Property Let IDSubProducto(ByVal Value As Byte)
    If Value <> mIDSubProducto Then
        mIsDirty = True
    End If
    mIDSubProducto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get SubProducto() As SubProducto
    Static oSubProducto As SubProducto
    
    If oSubProducto Is Nothing Then
        Set oSubProducto = New SubProducto
    End If
    If oSubProducto.IDSubProducto <> mIDSubProducto Then
        If mIDSubProducto = 0 Then
            Set oSubProducto = New SubProducto
        Else
            oSubProducto.IDSubProducto = mIDSubProducto
            Call oSubProducto.Load
        End If
    End If
    Set SubProducto = oSubProducto
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Porcentaje() As Single
    Porcentaje = mPorcentaje
End Property

Public Property Let Porcentaje(ByVal Value As Single)
    If Value <> mPorcentaje Then
        mIsDirty = True
    End If
    mPorcentaje = Value
End Property
'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Kilogramo() As Long
    Kilogramo = mKilogramo
End Property

Public Property Get Kilogramo_Formatted() As String
    Kilogramo_Formatted = Format(Abs(mKilogramo), "#,###")
End Property

Public Property Get Kilogramo_FormattedForSQL() As String
    Kilogramo_FormattedForSQL = IIf(mKilogramo = 0, "NULL", mKilogramo)
End Property

Public Property Let Kilogramo(ByVal Value As Long)
    If Value <> mKilogramo Then
        mIsDirty = True
    End If
    mKilogramo = Value
End Property

Public Property Let Kilogramo_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Kilogramo = CLng(Value)
    Else
        Kilogramo = 0
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PrecioToneladaDolar() As Currency
    PrecioToneladaDolar = mPrecioToneladaDolar
End Property

Public Property Get PrecioToneladaDolar_Formatted() As String
    If mPrecioToneladaDolar > -1 Then
        PrecioToneladaDolar_Formatted = Format(mPrecioToneladaDolar, "Currency")
    Else
        PrecioToneladaDolar_Formatted = ""
    End If
End Property

Public Property Get PrecioToneladaDolar_FormattedForSQL() As String
    PrecioToneladaDolar_FormattedForSQL = IIf(mPrecioToneladaDolar = -1, "NULL", CSM_String.FormatCurrencyToSQL(mPrecioToneladaDolar))
End Property

Public Property Let PrecioToneladaDolar(ByVal Value As Currency)
    If Value <> mPrecioToneladaDolar Then
        mIsDirty = True
    End If
    mPrecioToneladaDolar = Value
End Property

Public Property Let PrecioToneladaDolar_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        PrecioToneladaDolar = CCur(Value)
    Else
        PrecioToneladaDolar = -1
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PrecioToneladaPeso() As Currency
    PrecioToneladaPeso = mPrecioToneladaPeso
End Property

Public Property Get PrecioToneladaPeso_Formatted() As String
    If mPrecioToneladaPeso > -1 Then
        PrecioToneladaPeso_Formatted = Format(mPrecioToneladaPeso, "Currency")
    Else
        PrecioToneladaPeso_Formatted = ""
    End If
End Property

Public Property Get PrecioToneladaPeso_FormattedForSQL() As String
    PrecioToneladaPeso_FormattedForSQL = IIf(mPrecioToneladaPeso = -1, "NULL", CSM_String.FormatCurrencyToSQL(mPrecioToneladaPeso))
End Property

Public Property Let PrecioToneladaPeso(ByVal Value As Currency)
    If Value <> mPrecioToneladaPeso Then
        mIsDirty = True
    End If
    mPrecioToneladaPeso = Value
End Property

Public Property Let PrecioToneladaPeso_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        PrecioToneladaPeso = CCur(Value)
    Else
        PrecioToneladaPeso = -1
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
    'RefreshList_Module.Movimiento_SubProducto IDMovimiento_SubProducto
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
        .CommandText = "usp_Movimiento_SubProducto_Detalle_Get"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamInput, , mIDMovimiento_SubProducto)
        .Parameters.Append .CreateParameter("Linea", adTinyInt, adParamInput, , mLinea)
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
    ShowErrorMessage "Classes.Movimiento_SubProducto_Detalle.Load", "Error al obtener los datos del Detalle del Movimiento de SubProducto." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto & vbCr & "Linea: " & Linea
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDSubProducto = recData("IDSubProducto").Value
        mPorcentaje = recData("Porcentaje").Value
        mKilogramo = recData("Kilogramo").Value
        mPrecioToneladaDolar = IIf(IsNull(recData("PrecioToneladaDolar").Value), -1, recData("PrecioToneladaDolar").Value)
        mPrecioToneladaPeso = IIf(IsNull(recData("PrecioToneladaPeso").Value), -1, recData("PrecioToneladaPeso").Value)
    End If
    
    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_SubProducto_Detalle.GetDataFromRecordset", "Error al obtener los datos del Detalle del Movimiento de SubProducto." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto & vbCr & "Linea: " & Linea
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDMovimiento_SubProducto = 0
        mLinea = 0

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
            .CommandText = "usp_Movimiento_SubProducto_Detalle_Add"
        Else
            .CommandText = "usp_Movimiento_SubProducto_Detalle_Update"
        End If
        .CommandType = adCmdStoredProc
        
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamOutput)
            .Parameters.Append .CreateParameter("Linea", adTinyInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamInput, , mIDMovimiento_SubProducto)
            .Parameters.Append .CreateParameter("Linea", adTinyInt, adParamInput, , mLinea)
        End If
        .Parameters.Append .CreateParameter("IDSubProducto", adTinyInt, adParamInput, , mIDSubProducto)
        .Parameters.Append .CreateParameter("Porcentaje", adDecimal, adParamInput, , mPorcentaje)
        .Parameters.Append .CreateParameter("Kilogramo", adInteger, adParamInput, , mKilogramo)
        .Parameters.Append .CreateParameter("PrecioToneladaDolar", adCurrency, adParamInput, , IIf(mPrecioToneladaDolar = -1, Null, mPrecioToneladaDolar))
        .Parameters.Append .CreateParameter("PrecioToneladaPeso", adCurrency, adParamInput, , IIf(mPrecioToneladaPeso = -1, Null, mPrecioToneladaPeso))
                
        .Execute
        
        If mIsNew Then
            mIDMovimiento_SubProducto = .Parameters("IDMovimiento_SubProducto").Value
            mLinea = .Parameters("Linea").Value
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
    ShowErrorMessage "Classes.Movimiento_SubProducto_Detalle.Update", "Error al actualizar el Movimiento_SubProducto_Detalle." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto & vbCr & "Linea: " & Linea
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
        .CommandText = "usp_Movimiento_SubProducto_Detalle_Delete"
        .CommandType = adCmdStoredProc
        
        .Parameters.Append .CreateParameter("IDMovimiento_SubProducto", adInteger, adParamInput, , mIDMovimiento_SubProducto)
        .Parameters.Append .CreateParameter("Linea", adTinyInt, adParamInput, , mLinea)
        
        .Execute
    End With
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_SubProducto_Detalle.Delete", "Error al eliminar el Movimiento_SubProducto_Detalle." & vbCr & vbCr & "IDMovimiento_SubProducto: " & IDMovimiento_SubProducto & vbCr & "Linea: " & Linea
End Function

Private Sub InitializeValues()
    IDSubProducto = 0
    Porcentaje = 0
    Kilogramo = 0
    PrecioToneladaDolar = -1
    PrecioToneladaPeso = -1

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
