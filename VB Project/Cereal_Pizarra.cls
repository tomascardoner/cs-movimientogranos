VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cereal_Pizarra"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mFecha As Date
Private mIDCereal As Byte
Private mIDLocalidad As Long
Private mPrecio As Currency

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

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

Public Property Get Precio() As Currency
    Precio = mPrecio
End Property

Public Property Get Precio_Formatted() As String
    If mPrecio = 0 Then
        Precio_Formatted = ""
    Else
        Precio_Formatted = Format(mPrecio, "Currency")
    End If
End Property

Public Property Let Precio(ByVal Value As Currency)
    If Value <> mPrecio Then
        mIsDirty = True
    End If
    mPrecio = Value
End Property

Public Property Let Precio_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        Precio = CCur(Value)
    Else
        Precio = 0
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
    'RefreshList_Module.Cereal_Pizarra IDCereal_Pizarra
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
        .CommandText = "usp_Cereal_Pizarra_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cereal_Pizarra.Load", "Error al obtener los datos de la Pizarra del Cereal." & vbCr & vbCr & "Fecha: " & Fecha_Formatted & vbCr & "IDCereal: " & IDCereal & vbCr & "IDLocalidad: " & IDLocalidad
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

        mFecha = recData("Fecha").Value
        mIDCereal = recData("IDCereal").Value
        mIDLocalidad = recData("IDLocalidad").Value
        mPrecio = IIf(IsNull(recData("Precio").Value), 0, recData("Precio").Value)
    End If
    
    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Cereal_Pizarra.GetDataFromRecordset", "Error al obtener los datos de la Pizarra del Cereal." & vbCr & vbCr & "Fecha: " & Fecha_Formatted & vbCr & "IDCereal: " & IDCereal & vbCr & "IDLocalidad: " & IDLocalidad
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mPrecio = 0
        
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
            .CommandText = "usp_Cereal_Pizarra_Add"
        Else
            .CommandText = "usp_Cereal_Pizarra_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)
        .Parameters.Append .CreateParameter("Precio", adCurrency, adParamInput, , CSM_Function.IfIsZero_Null(mPrecio))

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
    pDatabase.ShowUpdateErrorMessage "Classes.Cereal_Pizarra.Update", "Error al actualizar la Pizarra del Cereal." & vbCr & vbCr & "Fecha: " & Fecha_Formatted & vbCr & "IDCereal: " & IDCereal & vbCr & "IDLocalidad: " & IDLocalidad
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
        .CommandText = "usp_Cereal_Pizarra_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("IDCereal", adTinyInt, adParamInput, , mIDCereal)
        .Parameters.Append .CreateParameter("IDLocalidad", adInteger, adParamInput, , mIDLocalidad)

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
    pDatabase.ShowDeleteErrorMessage "Classes.Cereal_Pizarra.Delete", "Error al eliminar la Pizarra del Cereal." & vbCr & vbCr & "Fecha: " & Fecha_Formatted & vbCr & "IDCereal: " & IDCereal & vbCr & "IDLocalidad: " & IDLocalidad, "No se puede eliminar la Pizarra del Cereal debido a que tiene datos relacionados."
End Function

Private Sub InitializeValues()
    mPrecio = 0

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub
