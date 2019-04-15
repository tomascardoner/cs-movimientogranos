VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "F1116A_Detalle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDFormulario1116A As Long
Private mIDRemesa As Long
Private mIDMovimiento_Cereal As Long

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

Public Property Get IDRemesa() As Long
    IDRemesa = mIDRemesa
End Property

Public Property Let IDRemesa(ByVal Value As Long)
    If Value <> mIDRemesa Then
        mIsDirty = True
    End If
    mIDRemesa = Value
End Property

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

Public Property Get Movimiento_Cereal() As Movimiento_Cereal
    Static oMovimiento_Cereal As Movimiento_Cereal
    
    If mIDMovimiento_Cereal = 0 Then
        Set Movimiento_Cereal = Nothing
    Else
        If oMovimiento_Cereal Is Nothing Then
            Set oMovimiento_Cereal = New Movimiento_Cereal
        End If
        If oMovimiento_Cereal.IDMovimiento_Cereal <> mIDMovimiento_Cereal Then
            oMovimiento_Cereal.IDMovimiento_Cereal = mIDMovimiento_Cereal
            Call oMovimiento_Cereal.Load
        End If
        Set Movimiento_Cereal = oMovimiento_Cereal
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
    'RefreshList_Module.F1116A_Detalle IDF1116A, IDRemesa
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
    mrecData.Source = "SELECT * FROM Formulario1116A_Detalle"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").Value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Detalle.OpenRecordset", "Error al abrir la tabla de Detalles de Formularios 1116A."
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

    mrecData.Filter = "IDFormulario1116A = " & mIDFormulario1116A & " AND IDRemesa = " & mIDRemesa

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDFormulario1116A = mrecData("IDFormulario1116A").Value
        mIDRemesa = mrecData("IDRemesa").Value
        mIDMovimiento_Cereal = mrecData("IDMovimiento_Cereal").Value
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Detalle.Load", "Error al obtener los datos del Detalle del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "IDRemesa: " & mIDRemesa
End Function

Public Function LoadByIDMovimiento_Cereal() As Boolean
    Dim IDMovimiento_CerealSaved As Long
    
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

    mIDFormulario1116A = 0
    mIDRemesa = 0
    IDMovimiento_CerealSaved = mIDMovimiento_Cereal
    Call InitializeValues
    mIDMovimiento_Cereal = IDMovimiento_CerealSaved

    mrecData.Filter = "IDMovimiento_Cereal = " & mIDMovimiento_Cereal

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDFormulario1116A = mrecData("IDFormulario1116A").Value
        mIDRemesa = mrecData("IDRemesa").Value
        mIDMovimiento_Cereal = mrecData("IDMovimiento_Cereal").Value
    End If
    
    Screen.MousePointer = vbDefault
    LoadByIDMovimiento_Cereal = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.F1116A_Detalle.LoadByIDMovimiento_Cereal", "Error al obtener los datos del Detalle del Formulario 1116A por el ID de Movimiento." & vbCr & vbCr & "IDMovimiento_Cereal: " & mIDMovimiento_Cereal
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDFormulario1116A = 0
        mIDRemesa = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
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
        mrecData("IDFormulario1116A").Value = mIDFormulario1116A
        mrecData("IDRemesa").Value = mIDRemesa
    End If
    mrecData("IDMovimiento_Cereal").Value = mIDMovimiento_Cereal
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
    pDatabase.ShowUpdateErrorMessage "Classes.F1116A_Detalle.Update", "Error al actualizar el Detalle del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "IDRemesa: " & mIDRemesa
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
            MsgBox "No se puede eliminar el Detalle del Formulario 1116A debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.F1116A_Detalle.Delete", "Error al eliminar el Detalle del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "IDRemesa: " & mIDRemesa
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.F1116A_Detalle.Delete", "Error al eliminar el Detalle del Formulario 1116A." & vbCr & vbCr & "IDFormulario1116A: " & mIDFormulario1116A & vbCr & "IDRemesa: " & mIDRemesa
    End If
End Function

Private Sub InitializeValues()
    mIDMovimiento_Cereal = 0
    
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
