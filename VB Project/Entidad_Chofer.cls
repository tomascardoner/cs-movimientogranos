VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Entidad_Chofer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDEntidad As Long
Private mIDEntidad_Transportista As Long
Private mPatenteChasis As String
Private mPatenteAcoplado As String

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

Public Property Get IDEntidad() As Long
    IDEntidad = mIDEntidad
End Property

Public Property Let IDEntidad(ByVal Value As Long)
    If Value <> mIDEntidad Then
        mIsDirty = True
    End If
    mIDEntidad = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad() As Entidad
    Static oEntidad As Entidad
    
    If oEntidad Is Nothing Then
        Set oEntidad = New Entidad
    End If
    If oEntidad.IDEntidad <> mIDEntidad Then
        If mIDEntidad = 0 Then
            Set oEntidad = New Entidad
        Else
            oEntidad.IDEntidad = mIDEntidad
            Call oEntidad.Load
        End If
    End If
    Set Entidad = oEntidad
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDEntidad_Transportista() As Long
    IDEntidad_Transportista = mIDEntidad_Transportista
End Property

Public Property Let IDEntidad_Transportista(ByVal Value As Long)
    If Value <> mIDEntidad_Transportista Then
        mIsDirty = True
    End If
    mIDEntidad_Transportista = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Transportista() As Entidad
    Static oEntidad As Entidad
    
    If mIDEntidad_Transportista = 0 Then
        Set Entidad_Transportista = Nothing
    Else
        If oEntidad Is Nothing Then
            Set oEntidad = New Entidad
        End If
        If oEntidad.IDEntidad <> mIDEntidad_Transportista Then
            oEntidad.IDEntidad = mIDEntidad_Transportista
            Call oEntidad.Load
        End If
        Set Entidad_Transportista = oEntidad
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PatenteChasis() As String
    PatenteChasis = mPatenteChasis
End Property

Public Property Let PatenteChasis(ByVal Value As String)
    If Value <> mPatenteChasis Then
        mIsDirty = True
    End If
    mPatenteChasis = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get PatenteAcoplado() As String
    PatenteAcoplado = mPatenteAcoplado
End Property

Public Property Let PatenteAcoplado(ByVal Value As String)
    If Value <> mPatenteAcoplado Then
        mIsDirty = True
    End If
    mPatenteAcoplado = Value
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
    RefreshList_Module.Entidad_Chofer IDEntidad
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
    mrecData.Source = "SELECT * FROM Entidad_Chofer"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").Value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Chofer.OpenRecordset", "Error al abrir la tabla de Entidades de tipo Chofer."
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

    mrecData.Filter = "IDEntidad = " & mIDEntidad

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mIDEntidad_Transportista = Val(mrecData("IDEntidad_Transportista").Value & "")
        mPatenteChasis = Trim(mrecData("PatenteChasis").Value & "")
        mPatenteAcoplado = Trim(mrecData("PatenteAcoplado").Value & "")
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Chofer.Load", "Error al obtener los datos de la Entidad de tipo Chofer." & vbCr & vbCr & "IDEntidad: " & IDEntidad
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDEntidad = 0

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
        mrecData("IDEntidad").Value = mIDEntidad
    End If

    mrecData("IDEntidad_Transportista").Value = IIf(IDEntidad_Transportista = 0, Null, IDEntidad_Transportista)
    mrecData("PatenteChasis").Value = IIf(Trim(mPatenteChasis) = "", Null, Trim(mPatenteChasis))
    mrecData("PatenteAcoplado").Value = IIf(Trim(mPatenteAcoplado) = "", Null, Trim(mPatenteAcoplado))
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
    pDatabase.ShowUpdateErrorMessage "Classes.Entidad_Chofer.Update", "Error al actualizar la Entidad de tipo Chofer." & vbCr & vbCr & "IDEntidad: " & IDEntidad
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
            MsgBox "No se puede eliminar la Entidad de tipo Chofer debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.Entidad.Delete", "Error al eliminar la Entidad de tipo Chofer." & vbCr & vbCr & "IDEntidad: " & IDEntidad
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.Entidad.Delete", "Error al eliminar la Entidad de tipo Chofer." & vbCr & vbCr & "IDEntidad: " & IDEntidad
    End If
End Function

Private Sub InitializeValues()
    IDEntidad_Transportista = 0
    mPatenteChasis = ""
    mPatenteAcoplado = ""
    mIDEntidad_Transportista = 0

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
