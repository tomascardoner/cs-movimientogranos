VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "F1116_Talonario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario1116_Talonario As Long
Private mFormularioTipo As String
Private mPrefijo As String
Private mPrefijoSeparador As String
Private mNumeroInicio As String
Private mNumeroFin As String
Private mNumeroUltimo As String
Private mCantidad As Long
Private mCAC As String
Private mFechaVencimiento As Date
Private mFechaEntrega As Date

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

Public Property Get IDFormulario1116_Talonario() As Long
    IDFormulario1116_Talonario = mIDFormulario1116_Talonario
End Property

Public Property Let IDFormulario1116_Talonario(ByVal Value As Long)
    If Value <> mIDFormulario1116_Talonario Then
        mIsDirty = True
    End If
    mIDFormulario1116_Talonario = Value
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

Public Property Get Prefijo() As String
    Prefijo = mPrefijo
End Property

Public Property Let Prefijo(ByVal Value As String)
    If Value <> mPrefijo Then
        mIsDirty = True
    End If
    mPrefijo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PrefijoSeparador() As String
    PrefijoSeparador = mPrefijoSeparador
End Property

Public Property Let PrefijoSeparador(ByVal Value As String)
    If Value <> mPrefijoSeparador Then
        mIsDirty = True
    End If
    mPrefijoSeparador = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get NumeroInicio() As String
    NumeroInicio = mNumeroInicio
End Property

Public Property Get NumeroInicio_Number() As Long
    NumeroInicio_Number = Val(mNumeroInicio)
End Property

Public Property Get NumeroInicio_Formatted() As String
    NumeroInicio_Formatted = mPrefijo & mPrefijoSeparador & NumeroInicio
End Property

Public Property Let NumeroInicio(ByVal Value As String)
    If Value <> mNumeroInicio Then
        mIsDirty = True
    End If
    mNumeroInicio = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get NumeroFin() As String
    NumeroFin = mNumeroFin
End Property

Public Property Get NumeroFin_Number() As Long
    NumeroFin_Number = Val(mNumeroFin)
End Property

Public Property Get NumeroFin_Formatted() As String
    NumeroFin_Formatted = mPrefijo & mPrefijoSeparador & NumeroFin
End Property

Public Property Let NumeroFin(ByVal Value As String)
    If Value <> mNumeroFin Then
        mIsDirty = True
    End If
    mNumeroFin = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get NumeroUltimo() As String
    NumeroUltimo = mNumeroUltimo
End Property

Public Property Get NumeroUltimo_Number() As Long
    NumeroUltimo_Number = Val(mNumeroUltimo)
End Property

Public Property Get NumeroUltimo_Formatted() As String
    NumeroUltimo_Formatted = mPrefijo & mPrefijoSeparador & NumeroUltimo
End Property

Public Property Let NumeroUltimo(ByVal Value As String)
    If Value <> mNumeroUltimo Then
        mIsDirty = True
    End If
    mNumeroUltimo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get NumeroProximo() As String
    NumeroProximo = CSM_String.PadStringLeft(NumeroUltimo_Number + 1, "0", Len(NumeroUltimo))
End Property

Public Property Get NumeroProximo_Number() As Long
    NumeroProximo_Number = NumeroUltimo_Number + 1
End Property

Public Property Get NumeroProximo_Formatted() As String
    NumeroProximo_Formatted = mPrefijo & mPrefijoSeparador & NumeroProximo
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Cantidad() As Long
    Cantidad = mCantidad
End Property

Public Property Let Cantidad(ByVal Value As Long)
    If Value <> mCantidad Then
        mIsDirty = True
    End If
    mCantidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CAC() As String
    CAC = mCAC
End Property

Public Property Let CAC(ByVal Value As String)
    If Value <> mCAC Then
        mIsDirty = True
    End If
    mCAC = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaVencimiento() As Date
    FechaVencimiento = mFechaVencimiento
End Property

Public Property Get FechaVencimiento_Formatted() As String
    FechaVencimiento_Formatted = Format(mFechaVencimiento, "Short Date")
End Property

Public Property Let FechaVencimiento(ByVal Value As Date)
    If Value <> mFechaVencimiento Then
        mIsDirty = True
    End If
    mFechaVencimiento = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get FechaEntrega() As Date
    FechaEntrega = mFechaEntrega
End Property

Public Property Get FechaEntrega_Formatted() As String
    FechaEntrega_Formatted = Format(mFechaEntrega, "Short Date")
End Property

Public Property Let FechaEntrega(ByVal Value As Date)
    If Value <> mFechaEntrega Then
        mIsDirty = True
    End If
    mFechaEntrega = Value
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
    'RefreshList_Module.F1116_Talonario IDF1116_Talonario
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
    mrecData.Source = "SELECT * FROM Formulario1116_Talonario"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").Value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.F1116_Talonario.OpenRecordset", "Error al abrir la tabla de Talonarios de Formularios 1116."
    If Not mrecData Is Nothing Then
        Set mrecData = Nothing
    End If
End Function

Public Function Load() As Boolean
    Dim Index As Long
    
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

    mrecData.Filter = "IDFormulario1116_Talonario = " & mIDFormulario1116_Talonario

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDFormulario1116_Talonario = mrecData("IDFormulario1116_Talonario").Value
        mFormularioTipo = mrecData("FormularioTipo").Value
        mPrefijo = mrecData("Prefijo").Value
        mPrefijoSeparador = mrecData("PrefijoSeparador").Value & ""
        mNumeroInicio = mrecData("NumeroInicio").Value
        mNumeroFin = mrecData("NumeroFin").Value
        mNumeroUltimo = IIf(IsNull(mrecData("NumeroUltimo").Value), mrecData("NumeroInicio").Value - 1, mrecData("NumeroUltimo").Value)
        mCantidad = mrecData("Cantidad").Value
        mCAC = mrecData("CAC").Value
        mFechaVencimiento = CSM_Function.IfIsNull_ZeroDate(mrecData("FechaVencimiento").Value)
        mFechaEntrega = CSM_Function.IfIsNull_ZeroDate(mrecData("FechaEntrega").Value)
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116_Talonario.Load", "Error al obtener los datos del Talonario de Formularios 1116." & vbCr & vbCr & "IDFormulario1116_Talonario: " & IDFormulario1116_Talonario
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario1116_Talonario = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim recMaxID As ADODB.Recordset

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
        'GET NEW ID
        Set recMaxID = New ADODB.Recordset
        Set recMaxID.ActiveConnection = pDatabase.Connection
        recMaxID.CursorType = adOpenForwardOnly
        recMaxID.LockType = adLockReadOnly
        recMaxID.Source = "SELECT MAX(IDF1116_Talonario) AS MaxID FROM F1116_Talonario"
        recMaxID.Open , , , , adCmdText
        mIDFormulario1116_Talonario = Val(recMaxID("MaxID").Value & "") + 1
        recMaxID.Close
        Set recMaxID = Nothing
        mrecData.AddNew
        mrecData("IDFormulario1116_Talonario").Value = mIDFormulario1116_Talonario
    End If

    mrecData("FormularioTipo").Value = mFormularioTipo
    mrecData("Prefijo").Value = mPrefijo
    mrecData("PrefijoSeparador").Value = IIf(mPrefijoSeparador = "", Null, mPrefijoSeparador)
    mrecData("NumeroInicio").Value = mNumeroInicio
    mrecData("NumeroFin").Value = mNumeroFin
    mrecData("NumeroUltimo").Value = IIf(mNumeroUltimo = "", mNumeroInicio, mNumeroUltimo)
    mrecData("Cantidad").Value = mCantidad
    mrecData("CAC").Value = Trim(mCAC)
    mrecData("FechaVencimiento").Value = CSM_Function.IfIsZeroDate_Null(mFechaVencimiento)
    mrecData("FechaEntrega").Value = CSM_Function.IfIsZeroDate_Null(mFechaEntrega)
    mrecData.Update

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
    pDatabase.ShowUpdateErrorMessage "Classes.F1116_Talonario.Update", "Error al actualizar el Talonario de Formularios 1116." & vbCr & vbCr & "IDFormulario1116_Talonario: " & IDFormulario1116_Talonario, "*", "Ya existe un Talonario con el mismo nombre."
    If Not recMaxID Is Nothing Then
        If recMaxID.State = adStateOpen Then
            recMaxID.Close
        End If
        Set recMaxID = Nothing
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
            MsgBox "No se puede eliminar el F1116_Talonario debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.F1116_Talonario.Delete", "Error al eliminar el F1116_Talonario." & vbCr & vbCr & "IDF1116_Talonario: " & IDFormulario1116_Talonario
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.F1116_Talonario.Delete", "Error al eliminar el F1116_Talonario." & vbCr & vbCr & "IDF1116_Talonario: " & IDFormulario1116_Talonario
    End If
End Function

Private Sub InitializeValues()
    mFormularioTipo = ""
    mPrefijo = ""
    mPrefijoSeparador = ""
    mNumeroInicio = ""
    mNumeroFin = ""
    mNumeroUltimo = ""
    mCantidad = 0
    mCAC = ""
    mFechaVencimiento = DATE_TIME_FIELD_NULL_VALUE
    mFechaEntrega = DATE_TIME_FIELD_NULL_VALUE

    mIsNew = True
    mIsCopy = False
    mIsDirty = False
End Sub

Public Function GetFullFormattedNumero(ByVal Value As Long) As String
    GetFullFormattedNumero = Prefijo & PrefijoSeparador & CSM_String.PadStringLeft(Value, "0", Len(mNumeroInicio))
End Function

Public Function ListNumerosDisponiblesOTodos(ByVal Todos As Boolean) As Collection
    If Todos Then
        Set ListNumerosDisponiblesOTodos = ListNumerosTodos
    Else
        Set ListNumerosDisponiblesOTodos = ListNumerosDisponibles
    End If
End Function

Public Function ListNumerosTodos() As Collection
    Dim Index As Long
    Dim CNumeros As Collection
    
    Set CNumeros = New Collection
    For Index = NumeroInicio_Number To NumeroInicio_Number + Cantidad - 1
        CNumeros.Add GetFullFormattedNumero(Index)
    Next Index
    
    Set ListNumerosTodos = CNumeros
End Function

Public Function ListNumerosDisponibles() As Collection
    Dim Index As Long
    Dim CNumeros As Collection
    
    Set CNumeros = New Collection
    For Index = NumeroUltimo_Number + 1 To NumeroInicio_Number - 1 + Cantidad
        CNumeros.Add GetFullFormattedNumero(Index)
    Next Index
    
    Set ListNumerosDisponibles = CNumeros
End Function

Public Function ListNumerosUtilizados() As Collection
    Dim Index As Long
    Dim CNumeros As Collection
    
    Set CNumeros = New Collection
    For Index = NumeroInicio_Number To NumeroUltimo_Number
        CNumeros.Add GetFullFormattedNumero(Index)
    Next Index
    
    Set ListNumerosUtilizados = CNumeros
End Function

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
