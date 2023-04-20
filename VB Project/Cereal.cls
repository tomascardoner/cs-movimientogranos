VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cereal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDCereal As Long
Private mNombre As String
Private mTipo As String
Private mMermaVolatilidad As Single
Private mMermaHumedadBase As Single
Private mMermaHumedadManipuleo As Single
Private mONCCA_EspecieCodigo As String
Private mONCCA_EspecieNombre As String
Private mONCCA_GranoTipoCodigo As String
Private mONCCA_GranoTipoNombre As String
Private mRealizaAnalisis As Boolean
Private mRealizaAnalisisIPRO As Boolean
Private mActivo As Boolean

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
Private mrecData As ADODB.recordset

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDCereal() As Long
    IDCereal = mIDCereal
End Property

Public Property Let IDCereal(ByVal value As Long)
    If value <> mIDCereal Then
        mIsDirty = True
    End If
    mIDCereal = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Nombre() As String
    Nombre = mNombre
End Property

Public Property Let Nombre(ByVal value As String)
    If value <> mNombre Then
        mIsDirty = True
    End If
    mNombre = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Tipo() As String
    Tipo = mTipo
End Property

Public Property Let Tipo(ByVal value As String)
    If value <> mTipo Then
        mIsDirty = True
    End If
    mTipo = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaVolatilidad() As Single
    MermaVolatilidad = mMermaVolatilidad
End Property

Public Property Get MermaVolatilidad_ForCalculate() As Single
    If mMermaVolatilidad = -1 Then
        MermaVolatilidad_ForCalculate = 0
    Else
        MermaVolatilidad_ForCalculate = mMermaVolatilidad / 100
    End If
End Property

Public Property Get MermaVolatilidad_Formatted() As String
    If mMermaVolatilidad <> -1 Then
        MermaVolatilidad_Formatted = Format(mMermaVolatilidad, "0.00")
    Else
        MermaVolatilidad_Formatted = ""
    End If
End Property

Public Property Let MermaVolatilidad(ByVal value As Single)
    If value <> mMermaVolatilidad Then
        mIsDirty = True
    End If
    mMermaVolatilidad = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaHumedadBase() As Single
    MermaHumedadBase = mMermaHumedadBase
End Property

Public Property Get MermaHumedadBase_ForCalculate() As Single
    If mMermaHumedadBase = -1 Then
        MermaHumedadBase_ForCalculate = 0
    Else
        MermaHumedadBase_ForCalculate = mMermaHumedadBase
    End If
End Property

Public Property Get MermaHumedadBase_Formatted() As String
    If mMermaHumedadBase <> -1 Then
        MermaHumedadBase_Formatted = Format(mMermaHumedadBase, "0.0")
    Else
        MermaHumedadBase_Formatted = ""
    End If
End Property

Public Property Let MermaHumedadBase(ByVal value As Single)
    If value <> mMermaHumedadBase Then
        mIsDirty = True
    End If
    mMermaHumedadBase = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get MermaHumedadManipuleo() As Single
    MermaHumedadManipuleo = mMermaHumedadManipuleo
End Property

Public Property Get MermaHumedadManipuleo_ForCalculate() As Single
    If mMermaHumedadManipuleo = -1 Then
        MermaHumedadManipuleo_ForCalculate = 0
    Else
        MermaHumedadManipuleo_ForCalculate = mMermaHumedadManipuleo / 100
    End If
End Property

Public Property Get MermaHumedadManipuleo_Formatted() As String
    If mMermaHumedadManipuleo <> -1 Then
        MermaHumedadManipuleo_Formatted = Format(mMermaHumedadManipuleo, "0.00")
    Else
        MermaHumedadManipuleo_Formatted = ""
    End If
End Property

Public Property Let MermaHumedadManipuleo(ByVal value As Single)
    If value <> mMermaHumedadManipuleo Then
        mIsDirty = True
    End If
    mMermaHumedadManipuleo = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ONCCA_EspecieCodigo() As String
    ONCCA_EspecieCodigo = mONCCA_EspecieCodigo
End Property

Public Property Let ONCCA_EspecieCodigo(ByVal value As String)
    If value <> mONCCA_EspecieCodigo Then
        mIsDirty = True
    End If
    mONCCA_EspecieCodigo = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ONCCA_EspecieNombre() As String
    ONCCA_EspecieNombre = mONCCA_EspecieNombre
End Property

Public Property Let ONCCA_EspecieNombre(ByVal value As String)
    If value <> mONCCA_EspecieNombre Then
        mIsDirty = True
    End If
    mONCCA_EspecieNombre = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ONCCA_GranoTipoCodigo() As String
    ONCCA_GranoTipoCodigo = mONCCA_GranoTipoCodigo
End Property

Public Property Let ONCCA_GranoTipoCodigo(ByVal value As String)
    If value <> mONCCA_GranoTipoCodigo Then
        mIsDirty = True
    End If
    mONCCA_GranoTipoCodigo = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ONCCA_GranoTipoNombre() As String
    ONCCA_GranoTipoNombre = mONCCA_GranoTipoNombre
End Property

Public Property Let ONCCA_GranoTipoNombre(ByVal value As String)
    If value <> mONCCA_GranoTipoNombre Then
        mIsDirty = True
    End If
    mONCCA_GranoTipoNombre = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RealizaAnalisis() As Boolean
    RealizaAnalisis = mRealizaAnalisis
End Property

Public Property Let RealizaAnalisis(ByVal value As Boolean)
    If value <> mRealizaAnalisis Then
        mIsDirty = True
    End If
    mRealizaAnalisis = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RealizaAnalisisIPRO() As Boolean
    RealizaAnalisisIPRO = mRealizaAnalisisIPRO
End Property

Public Property Let RealizaAnalisisIPRO(ByVal value As Boolean)
    If value <> mRealizaAnalisisIPRO Then
        mIsDirty = True
    End If
    mRealizaAnalisisIPRO = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Activo() As Boolean
    Activo = mActivo
End Property

Public Property Let Activo(ByVal value As Boolean)
    If value <> mActivo Then
        mIsDirty = True
    End If
    mActivo = value
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

Public Property Let NoMatchRaiseError(ByVal value As Boolean)
    mNoMatchRaiseError = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get RefreshListSkip() As Boolean
    RefreshListSkip = mRefreshListSkip
End Property

Public Property Let RefreshListSkip(ByVal value As Boolean)
    mRefreshListSkip = value
End Property

Public Sub RefreshList()
    RefreshList_Module.Cereal IDCereal
End Sub

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get database() As CSC_Database_ADO_SQL
    Set database = mDatabase
End Property

Public Property Set database(ByRef value As CSC_Database_ADO_SQL)
    Set mDatabase = value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Function OpenRecordset() As Boolean
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
        
    Screen.MousePointer = vbHourglass
      
    Set mrecData = New ADODB.recordset
    Set mrecData.ActiveConnection = pDatabase.Connection
    mrecData.CursorType = adOpenKeyset
    mrecData.LockType = adLockOptimistic
    mrecData.Source = "SELECT * FROM Cereal"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Cereal.OpenRecordset", "Error al abrir la tabla de Cereales."
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

    mrecData.Filter = "IDCereal = " & mIDCereal

    If (Not mNoMatchRaiseError) And mrecData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False
    
        mNombre = mrecData("Nombre").value
        mTipo = mrecData("Tipo").value & ""
        mMermaVolatilidad = IIf(IsNull(mrecData("MermaVolatil").value), -1, mrecData("MermaVolatil").value)
        mMermaHumedadBase = IIf(IsNull(mrecData("MermaHumedadBase").value), -1, mrecData("MermaHumedadBase").value)
        mMermaHumedadManipuleo = IIf(IsNull(mrecData("MermaHumedadManipuleo").value), -1, mrecData("MermaHumedadManipuleo").value)
        mONCCA_EspecieCodigo = mrecData("ONCCA_EspecieCodigo").value & ""
        mONCCA_EspecieNombre = mrecData("ONCCA_EspecieNombre").value & ""
        mONCCA_GranoTipoCodigo = mrecData("ONCCA_GranoTipoCodigo").value & ""
        mONCCA_GranoTipoNombre = mrecData("ONCCA_GranoTipoNombre").value & ""
        mRealizaAnalisis = mrecData("RealizaAnalisis").value
        mRealizaAnalisisIPRO = mrecData("RealizaAnalisisIPRO").value
        mActivo = mrecData("Activo").value
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Cereal.Load", "Error al obtener los datos del Cereal." & vbCr & vbCr & "IDCereal: " & IDCereal
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDCereal = 0

        mIsNew = True
        mIsCopy = True
        mIsDirty = True
    End If
End Function

Public Function Update() As Boolean
    Dim recMaxID As ADODB.recordset

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
        Set recMaxID = New ADODB.recordset
        Set recMaxID.ActiveConnection = pDatabase.Connection
        recMaxID.CursorType = adOpenForwardOnly
        recMaxID.LockType = adLockReadOnly
        recMaxID.Source = "SELECT MAX(IDCereal) AS MaxID FROM Cereal"
        recMaxID.Open , , , , adCmdText
        mIDCereal = Val(recMaxID("MaxID").value & "") + 1
        recMaxID.Close
        Set recMaxID = Nothing
        'NEW RECORD
        mrecData.AddNew
        mrecData("IDCereal").value = mIDCereal
    End If

    mrecData("Nombre").value = mNombre
    mrecData("Tipo").value = IIf(Trim(mTipo) = "", Null, mTipo)
    mrecData("MermaVolatilidad").value = IIf(mMermaVolatilidad = -1, Null, mMermaVolatilidad)
    mrecData("MermaHumedadBase").value = IIf(mMermaHumedadBase = -1, Null, mMermaHumedadBase)
    mrecData("MermaHumedadManipuleo").value = IIf(mMermaHumedadManipuleo = -1, Null, mMermaHumedadManipuleo)
    mrecData("ONCCA_EspecieCodigo").value = IIf(Trim(mONCCA_EspecieCodigo) = "", Null, mONCCA_EspecieCodigo)
    mrecData("ONCCA_EspecieNombre").value = IIf(Trim(mONCCA_EspecieNombre) = "", Null, mONCCA_EspecieNombre)
    mrecData("ONCCA_GranoTipoCodigo").value = IIf(Trim(mONCCA_GranoTipoCodigo) = "", Null, mONCCA_GranoTipoCodigo)
    mrecData("ONCCA_GranoTipoNombre").value = IIf(Trim(mONCCA_GranoTipoNombre) = "", Null, mONCCA_GranoTipoNombre)
    mrecData("RealizaAnalisis").value = mRealizaAnalisis
    mrecData("RealizaAnalisisIPRO").value = mRealizaAnalisisIPRO
    mrecData("Activo").value = mActivo
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
    pDatabase.ShowUpdateErrorMessage "Classes.Cereal.Update", "Error al actualizar el Cereal." & vbCr & vbCr & "IDCereal: " & IDCereal, "*", "Ya existe un Cereal con el mismo nombre."
    If mrecData.EditMode = adEditAdd Or mrecData.EditMode = adEditInProgress Then
        mrecData.CancelUpdate
    End If
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
            MsgBox "No se puede eliminar el Cereal debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.Cereal.Delete", "Error al eliminar el Cereal." & vbCr & vbCr & "IDCereal: " & IDCereal
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.Cereal.Delete", "Error al eliminar el Cereal." & vbCr & vbCr & "IDCereal: " & IDCereal
    End If
End Function

Private Sub InitializeValues()
    mNombre = ""
    mTipo = ""
    mMermaVolatilidad = -1
    mMermaHumedadBase = -1
    mMermaHumedadManipuleo = -1
    mONCCA_EspecieCodigo = ""
    mONCCA_EspecieNombre = ""
    mONCCA_GranoTipoCodigo = ""
    mONCCA_GranoTipoNombre = ""
    mRealizaAnalisis = False
    mRealizaAnalisisIPRO = False
    mActivo = True

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
