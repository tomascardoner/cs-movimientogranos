VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LibroMovimiento_Det"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mRubrica As Long
Private mFolio As Integer
Private mLinea As Byte
Private mMovimientoTipo As String
Private mFecha As Date
Private mComprobanteTipo As Byte
Private mComprobanteNumero As String
Private mCUIT As String
Private mRemitenteDestinatario As String
Private mIngresoKilogramoBruto As Long
Private mIngresoKilogramoNeto As Long
Private mEgresoKilogramoNeto As Long
Private mSaldoKilogramoNeto As Long
Private mObservacion As String

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

Public Property Get Rubrica() As Long
    Rubrica = mRubrica
End Property

Public Property Let Rubrica(ByVal Value As Long)
    If Value <> mRubrica Then
        mIsDirty = True
    End If
    mRubrica = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Folio() As Integer
    Folio = mFolio
End Property

Public Property Let Folio(ByVal Value As Integer)
    If Value <> mFolio Then
        mIsDirty = True
    End If
    mFolio = Value
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

Public Property Get MovimientoTipo() As String
    MovimientoTipo = mMovimientoTipo
End Property

Public Property Let MovimientoTipo(ByVal Value As String)
    If Value <> mMovimientoTipo Then
        mIsDirty = True
    End If
    mMovimientoTipo = Value
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

Public Property Get ComprobanteTipo() As Byte
    ComprobanteTipo = mComprobanteTipo
End Property

Public Property Let ComprobanteTipo(ByVal Value As Byte)
    If Value <> mComprobanteTipo Then
        mIsDirty = True
    End If
    mComprobanteTipo = Value
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

Public Property Get CUIT() As String
    CUIT = mCUIT
End Property

Public Property Let CUIT(ByVal Value As String)
    If Value <> mCUIT Then
        mIsDirty = True
    End If
    mCUIT = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RemitenteDestinatario() As String
    RemitenteDestinatario = mRemitenteDestinatario
End Property

Public Property Let RemitenteDestinatario(ByVal Value As String)
    If Value <> mRemitenteDestinatario Then
        mIsDirty = True
    End If
    mRemitenteDestinatario = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IngresoKilogramoBruto() As Long
    IngresoKilogramoBruto = mIngresoKilogramoBruto
End Property

Public Property Let IngresoKilogramoBruto(ByVal Value As Long)
    If Value <> mIngresoKilogramoBruto Then
        mIsDirty = True
    End If
    mIngresoKilogramoBruto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IngresoKilogramoNeto() As Long
    IngresoKilogramoNeto = mIngresoKilogramoNeto
End Property

Public Property Let IngresoKilogramoNeto(ByVal Value As Long)
    If Value <> mIngresoKilogramoNeto Then
        mIsDirty = True
    End If
    mIngresoKilogramoNeto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get EgresoKilogramoNeto() As Long
    EgresoKilogramoNeto = mEgresoKilogramoNeto
End Property

Public Property Let EgresoKilogramoNeto(ByVal Value As Long)
    If Value <> mEgresoKilogramoNeto Then
        mIsDirty = True
    End If
    mEgresoKilogramoNeto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get SaldoKilogramoNeto() As Long
    SaldoKilogramoNeto = mSaldoKilogramoNeto
End Property

Public Property Let SaldoKilogramoNeto(ByVal Value As Long)
    If Value <> mSaldoKilogramoNeto Then
        mIsDirty = True
    End If
    mSaldoKilogramoNeto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Observacion() As String
    Observacion = mObservacion
End Property

Public Property Let Observacion(ByVal Value As String)
    If Value <> mObservacion Then
        mIsDirty = True
    End If
    mObservacion = Value
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
    'RefreshList_Module.LibroMovimiento_Detalle Rubrica, Folio, Linea
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Database() As CSC_Database_ADO_SQL
    Set Database = mDatabase
End Property

Public Property Set Database(ByRef Value As CSC_Database_ADO_SQL)
    Set mDatabase = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Function OpenRecordset() As Boolean
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
        
    Screen.MousePointer = vbHourglass
      
    Set mrecData = New ADODB.Recordset
    Set mrecData.ActiveConnection = pDatabase.Connection
    mrecData.CursorType = adOpenKeyset
    mrecData.LockType = adLockOptimistic
    mrecData.Source = "SELECT * FROM LibroMovimiento_Detalle"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").Value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.LibroMovimiento_Detalle.OpenRecordset", "Error al abrir la tabla de LibroMovimiento_Detalle."
    If Not mrecData Is Nothing Then
        Set mrecData = Nothing
    End If
End Function

Public Function Load() As Boolean
    If mrecData Is Nothing Then
        If Not OpenRecordset() Then
            Exit Function
        End If
    Else
        If mrecData.State <> adStateOpen Then
            If Not OpenRecordset() Then
                Exit Function
            End If
        End If
    End If

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass

    Call InitializeValues

    mrecData.Filter = "Rubrica = " & mRubrica & " AND Folio = " & mFolio & " AND Linea = " & mLinea

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mRubrica = mrecData("Rubrica").Value
        mFolio = mrecData("Folio").Value
        mLinea = mrecData("Linea").Value
        mMovimientoTipo = mrecData("MovimientoTipo").Value
        mFecha = mrecData("Fecha").Value
        mComprobanteTipo = Val(mrecData("ComprobanteTipo").Value & "")
        mComprobanteNumero = mrecData("ComprobanteNumero").Value & ""
        mCUIT = mrecData("CUIT").Value & ""
        mRemitenteDestinatario = mrecData("RemitenteDestinatario").Value & ""
        mIngresoKilogramoBruto = Val(mrecData("IngresoKilogramoBruto").Value & "")
        mIngresoKilogramoNeto = Val(mrecData("IngresoKilogramoNeto").Value & "")
        mEgresoKilogramoNeto = Val(mrecData("EgresoKilogramoNeto").Value & "")
        mSaldoKilogramoNeto = mrecData("SaldoKilogramoNeto").Value
        mObservacion = mrecData("Observacion").Value & ""
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.LibroMovimiento_Detalle.Load", "Error al obtener los datos del LibroMovimiento_Detalle." & vbCr & vbCr & "Rubrica: " & Rubrica & vbCr & "Folio: " & Folio & vbCr & "Linea: " & Linea
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mRubrica = 0
        mFolio = 0
        mLinea = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim cmdData As ADODB.command
    
    If Not mIsDirty Then
        Update = True
        Exit Function
    End If

    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
    
    Screen.MousePointer = vbHourglass
    
    Set cmdData = New ADODB.command
    Set cmdData.ActiveConnection = pDatabase.Connection
    If mIsNew Then
        cmdData.CommandText = "usp_LibroMovimiento_Detalle_Add"
    Else
        cmdData.CommandText = "usp_LibroMovimiento_Detalle_Update"
    End If
    cmdData.CommandType = adCmdStoredProc
    cmdData.Parameters.Append cmdData.CreateParameter("Rubrica", adInteger, adParamInput, , mRubrica)
    cmdData.Parameters.Append cmdData.CreateParameter("Folio", adSmallInt, adParamInput, , mFolio)
    cmdData.Parameters.Append cmdData.CreateParameter("Linea", adTinyInt, adParamInput, , mLinea)
    cmdData.Parameters.Append cmdData.CreateParameter("MovimientoTipo", adChar, adParamInput, 1, mMovimientoTipo)
    cmdData.Parameters.Append cmdData.CreateParameter("Fecha", adDate, adParamInput, , mFecha)
    cmdData.Parameters.Append cmdData.CreateParameter("ComprobanteTipo", adTinyInt, adParamInput, , IIf(mComprobanteTipo = 0, Null, mComprobanteTipo))
    cmdData.Parameters.Append cmdData.CreateParameter("ComprobanteNumero", adVarChar, adParamInput, 13, IIf(mComprobanteNumero = "", Null, mComprobanteNumero))
    cmdData.Parameters.Append cmdData.CreateParameter("CUIT", adChar, adParamInput, 13, IIf(mCUIT = "", Null, mCUIT))
    cmdData.Parameters.Append cmdData.CreateParameter("RemitenteDestinatario", adVarChar, adParamInput, 100, IIf(mRemitenteDestinatario = "", Null, mRemitenteDestinatario))
    cmdData.Parameters.Append cmdData.CreateParameter("IngresoKilogramoBruto", adInteger, adParamInput, , IIf(mIngresoKilogramoBruto = 0, Null, mIngresoKilogramoBruto))
    cmdData.Parameters.Append cmdData.CreateParameter("IngresoKilogramoNeto", adInteger, adParamInput, , IIf(mIngresoKilogramoNeto = 0, Null, mIngresoKilogramoNeto))
    cmdData.Parameters.Append cmdData.CreateParameter("EgresoKilogramoBruto", adInteger, adParamInput, , IIf(mEgresoKilogramoNeto = 0, Null, mEgresoKilogramoNeto))
    cmdData.Parameters.Append cmdData.CreateParameter("SaldoKilogramoNeto", adInteger, adParamInput, , mSaldoKilogramoNeto)
    cmdData.Parameters.Append cmdData.CreateParameter("Observacion", adVarChar, adParamInput, 100, IIf(mObservacion = "", Null, mObservacion))
    Call cmdData.Execute
    Set cmdData = Nothing
    
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
    pDatabase.ShowUpdateErrorMessage "Classes.LibroMovimiento_Detalle.Update", "Error al actualizar el Libro de Movimientos." & vbCr & vbCr & "Rubrica: " & Rubrica & vbCr & "Folio: " & Folio & vbCr & "Linea: " & Linea
End Function

Public Function Delete() As Boolean
    If mrecData Is Nothing Then
        If Not OpenRecordset() Then
            Exit Function
        End If
    Else
        If mrecData.State <> adStateOpen Then
            If Not OpenRecordset() Then
                Exit Function
            End If
        End If
    End If
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If

    Screen.MousePointer = vbHourglass
    
    mrecData.Delete
    
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
            MsgBox "No se puede eliminar el Movimiento debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.LibroMovimiento_Detalle.Delete", "Error al eliminar el Movimiento." & vbCr & vbCr & "Rubrica: " & Rubrica & vbCr & "Folio: " & Folio & vbCr & "Linea: " & Linea
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.LibroMovimiento_Detalle.Delete", "Error al eliminar el Movimiento." & vbCr & vbCr & "Rubrica: " & Rubrica & vbCr & "Folio: " & Folio & vbCr & "Linea: " & Linea
    End If
End Function

Private Sub InitializeValues()
    mMovimientoTipo = ""
    mFecha = DATE_TIME_FIELD_NULL_VALUE
    mComprobanteTipo = 0
    mComprobanteNumero = ""
    mCUIT = ""
    mRemitenteDestinatario = ""
    mIngresoKilogramoBruto = 0
    mIngresoKilogramoNeto = 0
    mEgresoKilogramoNeto = 0
    mSaldoKilogramoNeto = 0
    mObservacion = ""

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
