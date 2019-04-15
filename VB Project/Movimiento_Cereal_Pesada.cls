VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Movimiento_Cereal_Pesada"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDMovimiento_Cereal As Long
Private mIDPesada As Long
Private mMovimiento_Cereal As Movimiento_Cereal
Private mPesoNeto As Long
Private mHumedad As Single
Private mZaranda As Single

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

Public Property Get IDMovimiento_Cereal() As Long
    IDMovimiento_Cereal = mIDMovimiento_Cereal
End Property

Public Property Let IDMovimiento_Cereal(ByVal Value As Long)
    If Value <> mIDMovimiento_Cereal Then
        mIsDirty = True
    End If
    mIDMovimiento_Cereal = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDPesada() As Long
    IDPesada = mIDPesada
End Property

Public Property Let IDPesada(ByVal Value As Long)
    If Value <> mIDPesada Then
        mIsDirty = True
    End If
    mIDPesada = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Movimiento_Cereal() As Movimiento_Cereal
    Set Movimiento_Cereal = mMovimiento_Cereal
End Property

Public Property Let Movimiento_Cereal(ByRef Movimiento_Cereal As Movimiento_Cereal)
    Set mMovimiento_Cereal = Movimiento_Cereal
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PesoNeto() As Long
    PesoNeto = mPesoNeto
End Property

Public Property Get PesoNeto_Formatted() As String
    PesoNeto_Formatted = Format(mPesoNeto, "#,###")
End Property

Public Property Get PesoNeto_FormattedForSQL() As String
    PesoNeto_FormattedForSQL = IIf(mPesoNeto = 0, "NULL", mPesoNeto)
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

Public Property Get Humedad_FormattedForSQL() As String
    Humedad_FormattedForSQL = IIf(mHumedad = -1, "NULL", CSM_String.FormatDecimalToSQL(mHumedad))
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

Public Property Get Zaranda_FormattedForSQL() As String
    Zaranda_FormattedForSQL = IIf(mZaranda = -1, "NULL", CSM_String.FormatDecimalToSQL(mZaranda))
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
    'RefreshList_Module.Movimiento_Cereal_Pesada IDMovimiento_Cereal
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
    mrecData.Source = "SELECT * FROM Movimiento_Cereal_Pesada"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").Value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal_Pesada.OpenRecordset", "Error al abrir la tabla de Pesadas por Movimiento_Cereal."
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

    mrecData.Filter = "IDMovimiento_Cereal = " & mIDMovimiento_Cereal & " AND IDPesada = " & mIDPesada

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDMovimiento_Cereal = mrecData("IDMovimiento_Cereal").Value
        mIDPesada = mrecData("IDPesada").Value
        If mMovimiento_Cereal.Tipo = MOVIMIENTO_CEREAL_TIPO_ENTRADA Then
            mPesoNeto = IIf(IsNull(mrecData("PesoNeto").Value), 0, mrecData("PesoNeto").Value)
            mHumedad = IIf(IsNull(mrecData("Humedad").Value), -1, mrecData("Humedad").Value)
            mZaranda = IIf(IsNull(mrecData("Zaranda").Value), -1, mrecData("Zaranda").Value)
        Else
            mPesoNeto = 0
            mHumedad = -1
            mZaranda = -1
        End If
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Movimiento_Cereal_Pesada.Load", "Error al obtener los datos de la Pesada del Movimiento_Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal & vbCr & "IDPesada: " & IDPesada
End Function

Public Function Update() As Boolean
    If Not mIsDirty Then
        Update = True
        Exit Function
    End If

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
    
    If mIsNew Then
        mrecData.AddNew
        mrecData("IDMovimiento_Cereal").Value = mIDMovimiento_Cereal
    End If

    mrecData("IDPesada").Value = mIDPesada
    mrecData("PesoNeto").Value = IIf(mPesoNeto <= 0, Null, mPesoNeto)
    mrecData("Humedad").Value = IIf(mHumedad = -1, Null, mHumedad)
    mrecData("Zaranda").Value = IIf(mZaranda = -1, Null, mZaranda)
    mrecData.Update

    mIsCopy = False
    mIsDirty = False
    
    If Not mRefreshListSkip Then
        Call RefreshList
    End If
    
    Screen.MousePointer = vbDefault
    Update = True
    Exit Function
    
ErrorHandler:
    pDatabase.ShowUpdateErrorMessage "Classes.Movimiento_Cereal_Pesada.Update", "Error al actualizar la Pesada del Movimiento_Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal & vbCr & "IDPesada: " & IDPesada
    If mrecData.EditMode = adEditAdd Or mrecData.EditMode = adEditInProgress Then
        mrecData.CancelUpdate
    End If
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
            MsgBox "No se puede eliminar la Pesada del Movimiento_Cereal debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.Movimiento_Cereal_Pesada.Delete", "Error al eliminar la Pesada del Movimiento_Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal & vbCr & "IDPesada: " & IDPesada
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.Movimiento_Cereal_Pesada.Delete", "Error al eliminar la Pesada del Movimiento_Cereal." & vbCr & vbCr & "IDMovimiento_Cereal: " & IDMovimiento_Cereal & vbCr & "IDPesada: " & IDPesada
    End If
End Function

Private Sub InitializeValues()
    mPesoNeto = 0
    mHumedad = -1
    mZaranda = -1
    
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
