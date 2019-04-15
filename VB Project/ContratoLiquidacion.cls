VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ContratoLiquidacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDContrato As Long
Private mIDLiquidacion As Byte
Private mNumero As String
Private mFecha As Date
Private mKilogramo As Long
Private mPrecio As Currency
Private mImporteNeto As Currency
Private mNotas As String

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

Public Property Get IDLiquidacion() As Byte
    IDLiquidacion = mIDLiquidacion
End Property

Public Property Let IDLiquidacion(ByVal Value As Byte)
    If Value <> mIDLiquidacion Then
        mIsDirty = True
    End If
    mIDLiquidacion = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Numero() As String
    Numero = mNumero
End Property

Public Property Let Numero(ByVal Value As String)
    If Value <> mNumero Then
        mIsDirty = True
    End If
    mNumero = Value
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

Public Property Get Kilogramo() As Long
    Kilogramo = mKilogramo
End Property

Public Property Get Kilogramo_Formatted() As String
    Kilogramo_Formatted = Format(mKilogramo, "#,###")
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

Public Property Get ImporteNeto() As Currency
    ImporteNeto = mImporteNeto
End Property

Public Property Get ImporteNeto_Formatted() As String
    ImporteNeto_Formatted = Format(mImporteNeto, "Currency")
End Property

Public Property Let ImporteNeto(ByVal Value As Currency)
    If Value <> mImporteNeto Then
        mIsDirty = True
    End If
    mImporteNeto = Value
End Property

Public Property Let ImporteNeto_Formatted(ByVal Value As String)
    If IsNumeric(Value) Then
        ImporteNeto = CCur(Value)
    Else
        ImporteNeto = 0
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
    RefreshList_Module.ContratoLiquidacion IDContrato, IDLiquidacion
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
        .CommandText = "usp_ContratoLiquidacion_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , mIDContrato)
        .Parameters.Append .CreateParameter("IDLiquidacion", adTinyInt, adParamInput, , mIDLiquidacion)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.ContratoLiquidacion.Load", "Error al obtener los datos de la Liqduiación del Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato & vbCr & "IDLiquidacion: " & IDLiquidacion
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

        mIDContrato = recData("IDContrato").Value
        mIDLiquidacion = recData("IDLiquidacion").Value
        mNumero = recData("Numero").Value
        mFecha = recData("Fecha").Value
        mKilogramo = recData("Kilogramo").Value
        mPrecio = recData("Precio").Value
        mImporteNeto = recData("ImporteNeto").Value
        mNotas = recData("Notas").Value & ""
    End If
    
    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Contrato.GetDataFromRecordset", "Error al obtener los datos de la Liquidación del Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato & vbCr & "IDLiquidacion: " & IDLiquidacion
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDLiquidacion = 0
        mNumero = ""

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
            .CommandText = "usp_ContratoLiquidacion_Add"
        Else
            .CommandText = "usp_ContratoLiquidacion_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , mIDContrato)
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDLiquidacion", adTinyInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDLiquidacion", adTinyInt, adParamInput, , mIDLiquidacion)
        End If
        .Parameters.Append .CreateParameter("Numero", adVarChar, adParamInput, 20, mNumero)
        .Parameters.Append .CreateParameter("Fecha", adDate, adParamInput, , mFecha)
        .Parameters.Append .CreateParameter("Kilogramo", adInteger, adParamInput, , mKilogramo)
        .Parameters.Append .CreateParameter("Precio", adCurrency, adParamInput, , CSM_Function.IfIsZero_Null(mPrecio))
        .Parameters.Append .CreateParameter("Notas", adVarChar, adParamInput, 8000, CSM_Function.IfIsZeroLenghtString_Null(mNotas))

        .Execute

        If mIsNew Then
            mIDLiquidacion = .Parameters("IDLiquidacion").Value
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
    pDatabase.ShowUpdateErrorMessage "Classes.ContratoLiquidacion.Update", "Error al actualizar la Liquidación del Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato & vbCr & "IDLiquidacion: " & IDLiquidacion, "*", "Ya existe una Liquidación en este Contrato con el mismo Número."
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
        .CommandText = "usp_ContratoLiquidacion_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDContrato", adInteger, adParamInput, , mIDContrato)
        .Parameters.Append .CreateParameter("IDLiquidacion", adTinyInt, adParamInput, , mIDLiquidacion)

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
    pDatabase.ShowDeleteErrorMessage "Classes.ContratoLiquidacion.Delete", "Error al eliminar la Liquidación del Contrato." & vbCr & vbCr & "IDContrato: " & IDContrato & vbCr & "IDLiquidacion: " & IDLiquidacion, "No se puede eliminar la Liquidación del Contrato debido a que tiene datos relacionados."
End Function

Private Sub InitializeValues()
    mNumero = ""
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    mKilogramo = 0
    mPrecio = 0
    mNotas = ""

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Private Sub Class_Initialize()
    InitializeValues
    mNoMatchRaiseError = True
    mRefreshListSkip = False
End Sub
