VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Entidad_Domicilio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDEntidad As Long
Private mTipo As Byte
Private mCalle As String
Private mNumero As String
Private mPiso As String
Private mOficina As String
Private mCodigoPostal As String
Private mIDLocalidad As Long

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

Public Property Get Tipo() As Byte
    Tipo = mTipo
End Property

Public Property Let Tipo(ByVal Value As Byte)
    If Value <> mTipo Then
        mIsDirty = True
    End If
    mTipo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Entidad_Transportista() As Entidad
    Static oEntidad As Entidad
    
    If mTipo = 0 Then
        Set Entidad_Transportista = Nothing
    Else
        If oEntidad Is Nothing Then
            Set oEntidad = New Entidad
        End If
        If oEntidad.IDEntidad <> mTipo Then
            oEntidad.IDEntidad = mTipo
            Call oEntidad.Load
        End If
        Set Entidad_Transportista = oEntidad
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Calle() As String
    Calle = mCalle
End Property

Public Property Let Calle(ByVal Value As String)
    If Value <> mCalle Then
        mIsDirty = True
    End If
    mCalle = Value
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

Public Property Get Piso() As String
    Piso = mPiso
End Property

Public Property Let Piso(ByVal Value As String)
    If Value <> mPiso Then
        mIsDirty = True
    End If
    mPiso = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Oficina() As String
    Oficina = mOficina
End Property

Public Property Let Oficina(ByVal Value As String)
    If Value <> mOficina Then
        mIsDirty = True
    End If
    mOficina = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DomicilioCalleCompleto() As String
    Dim DomicilioCompleto As String
    
    DomicilioCompleto = mCalle
    If mCalle <> "" Then
        If mNumero <> "" Then
            If Left(UCase(LTrim(mCalle)), 5) = "RUTA " Then
                DomicilioCompleto = DomicilioCompleto & " Km. " & Trim(mNumero)
            ElseIf Left(UCase(LTrim(mCalle)), 5) = ("CALLE ") Then
                DomicilioCompleto = DomicilioCompleto & " N° " & Trim(mNumero)
            ElseIf IsNumeric(Trim(mCalle)) Then
                DomicilioCompleto = "Calle " & Trim(mCalle) & " N° " & Trim(mNumero)
            Else
                DomicilioCompleto = DomicilioCompleto & " " & Trim(mNumero)
            End If
        End If

        If Trim(mPiso) <> "" Then
            If IsNumeric(mPiso) Then
                DomicilioCompleto = DomicilioCompleto & " P." & Trim(mPiso) & "°"
            Else
                DomicilioCompleto = DomicilioCompleto & " " & Trim(mPiso)
            End If
        End If

        If Trim(mOficina) <> "" Then
            DomicilioCompleto = DomicilioCompleto & " Dto. """ & Trim(mOficina) & """"
        End If

'        If Trim(mCalle2)<> "" Then
'            If Trim(mCalle3) <> "" Then
'                DomicilioCompleto = DomicilioCompleto & " entre " & mCalle2 & " y " & mCalle3
'            Else
'                DomicilioCompleto = DomicilioCompleto & " esq. " & mCalle2
'            End If
'        End If
    End If

    DomicilioCalleCompleto = DomicilioCompleto
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get CodigoPostal() As String
    CodigoPostal = mCodigoPostal
End Property

Public Property Let CodigoPostal(ByVal Value As String)
    If Value <> mCodigoPostal Then
        mIsDirty = True
    End If
    mCodigoPostal = Value
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

Public Property Get Localidad() As Localidad
    Static oLocalidad As Localidad
    
    If oLocalidad Is Nothing Then
        Set oLocalidad = New Localidad
    End If
    If oLocalidad.IDLocalidad <> mIDLocalidad Then
        If mIDLocalidad = 0 Then
            Set oLocalidad = New Localidad
        Else
            oLocalidad.IDLocalidad = mIDLocalidad
            Call oLocalidad.Load
        End If
    End If
    Set Localidad = oLocalidad
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
    'RefreshList_Module.Entidad_Domicilio IDEntidad
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
    mrecData.Source = "SELECT * FROM Entidad_Domicilio"
    mrecData.Open , , , , adCmdText
    mrecData.Properties("Update Criteria").Value = adCriteriaKey

    Screen.MousePointer = vbDefault
    OpenRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Domicilio.OpenRecordset", "Error al abrir la tabla de Domicilios de Entidades."
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
    
        mTipo = Val(mrecData("Tipo").Value & "")
        mCalle = mrecData("Calle").Value & ""
        mNumero = mrecData("Numero").Value & ""
        mPiso = mrecData("Piso").Value & ""
        mOficina = mrecData("Oficina").Value & ""
        mCodigoPostal = mrecData("CodigoPostal").Value & ""
        mIDLocalidad = Val(mrecData("IDLocalidad").Value & "")
    End If
    
    Screen.MousePointer = vbDefault
    Load = True
    Exit Function
    
ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Domicilio.Load", "Error al obtener los datos del Domicilio de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad
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

    mrecData("Tipo").Value = IIf(Tipo = 0, Null, Tipo)
    mrecData("Calle").Value = IIf(Trim(mCalle) = "", Null, Trim(mCalle))
    mrecData("Numero").Value = IIf(Trim(mNumero) = "", Null, Trim(mNumero))
    mrecData("Piso").Value = IIf(Trim(mPiso) = "", Null, Trim(mPiso))
    mrecData("Oficina").Value = IIf(Trim(mOficina) = "", Null, Trim(mOficina))
    mrecData("CodigoPostal").Value = IIf(Trim(mCodigoPostal) = "", Null, Trim(mCodigoPostal))
    mrecData("IDLocalidad").Value = IIf(IDLocalidad = 0, Null, IDLocalidad)
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
    pDatabase.ShowUpdateErrorMessage "Classes.Entidad_Domicilio.Update", "Error al actualizar el Domicilio de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad
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
            MsgBox "No se puede eliminar el Domicilio de la Entidad debido a que tiene datos relacionados.", vbExclamation, App.Title
        Else
            ShowErrorMessage "Classes.Entidad.Delete", "Error al eliminar el Domicilio de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad
        End If
        If mrecData.EditMode = adEditDelete Then
            mrecData.CancelUpdate
        End If
    Else
        ShowErrorMessage "Classes.Entidad.Delete", "Error al eliminar el Domicilio de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad
    End If
End Function

Private Sub InitializeValues()
    Tipo = 0
    mCalle = ""
    mNumero = ""
    mPiso = ""
    mOficina = ""
    mCodigoPostal = ""
    mIDLocalidad = 0

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
