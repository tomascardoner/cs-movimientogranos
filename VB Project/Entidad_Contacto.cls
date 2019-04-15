VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Entidad_Contacto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDEntidad As Long
Private mIDContacto As Byte
Private mCargo As String
Private mNombre As String
Private mTelefono1Nombre As String
Private mTelefono1Numero As String
Private mTelefono2Nombre As String
Private mTelefono2Numero As String
Private mEmail1 As String
Private mEmail2 As String
Private mNotas As String

'STATE VARIABLES
Private mIsNew As Boolean
Private mIsCopy As Boolean
Private mIsDirty As Boolean
Private mNoMatch As Boolean

'BEHAVIOR VARIABLES
Private mNoMatchRaiseError As Boolean
Private mRefreshListSkip As Boolean

'INTERNAL VARIABLES

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

Public Property Get IDContacto() As Byte
    IDContacto = mIDContacto
End Property

Public Property Get IDContacto_Formatted() As String
    IDContacto = Format(mIDContacto, "#,###")
End Property

Public Property Let IDContacto(ByVal Value As Byte)
    If Value <> mIDContacto Then
        mIsDirty = True
    End If
    mIDContacto = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Cargo() As String
    Cargo = mCargo
End Property

Public Property Let Cargo(ByVal Value As String)
    If Value <> mCargo Then
        mIsDirty = True
    End If
    mCargo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Nombre() As String
    Nombre = mNombre
End Property

Public Property Let Nombre(ByVal Value As String)
    If Value <> mNombre Then
        mIsDirty = True
    End If
    mNombre = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Telefono1Nombre() As String
    Telefono1Nombre = mTelefono1Nombre
End Property

Public Property Let Telefono1Nombre(ByVal Value As String)
    If Value <> mTelefono1Nombre Then
        mIsDirty = True
    End If
    mTelefono1Nombre = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Telefono1Numero() As String
    Telefono1Numero = mTelefono1Numero
End Property

Public Property Let Telefono1Numero(ByVal Value As String)
    If Value <> mTelefono1Numero Then
        mIsDirty = True
    End If
    mTelefono1Numero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Telefono2Nombre() As String
    Telefono2Nombre = mTelefono2Nombre
End Property

Public Property Let Telefono2Nombre(ByVal Value As String)
    If Value <> mTelefono2Nombre Then
        mIsDirty = True
    End If
    mTelefono2Nombre = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Telefono2Numero() As String
    Telefono2Numero = mTelefono2Numero
End Property

Public Property Let Telefono2Numero(ByVal Value As String)
    If Value <> mTelefono2Numero Then
        mIsDirty = True
    End If
    mTelefono2Numero = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Email1() As String
    Email1 = mEmail1
End Property

Public Property Let Email1(ByVal Value As String)
    If Value <> mEmail1 Then
        mIsDirty = True
    End If
    mEmail1 = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Email2() As String
    Email2 = mEmail2
End Property

Public Property Let Email2(ByVal Value As String)
    If Value <> mEmail2 Then
        mIsDirty = True
    End If
    mEmail2 = Value
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
    RefreshList_Module.Entidad_Contacto IDEntidad, IDContacto
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
        .CommandText = "usp_Entidad_Contacto_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        .Parameters.Append .CreateParameter("IDContacto", adTinyInt, adParamInput, , mIDContacto)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Contacto.Load", "Error al obtener los datos del Contacto de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDContacto: " & IDContacto
    Set recData = Nothing
    Set cmdSP = Nothing
End Function

Public Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mIDEntidad = recData("IDEntidad").Value
        mIDContacto = recData("IDContacto").Value
        mCargo = recData("Cargo").Value & ""
        mNombre = recData("Nombre").Value
        mTelefono1Nombre = recData("Telefono1Nombre").Value & ""
        mTelefono1Numero = recData("Telefono1Numero").Value & ""
        mTelefono2Nombre = recData("Telefono2Nombre").Value & ""
        mTelefono2Numero = recData("Telefono2Numero").Value & ""
        mEmail1 = recData("Email1").Value & ""
        mEmail2 = recData("Email2").Value & ""
        mNotas = recData("Notas").Value & ""
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Entidad_Contacto.GetDataFromRecordset", "Error al obtener los datos del Contacto de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDContacto: " & IDContacto
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDEntidad = 0
        mIDContacto = 0

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
            .CommandText = "usp_Entidad_Contacto_Add"
        Else
            .CommandText = "usp_Entidad_Contacto_Update"
        End If
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        If mIsNew Then
            .Parameters.Append .CreateParameter("IDContacto", adTinyInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDContacto", adTinyInt, adParamInput, , mIDContacto)
        End If
        .Parameters.Append .CreateParameter("Cargo", adVarChar, adParamInput, 20, CSM_Function.IfIsZeroLenghtString_Null(mCargo))
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("Telefono1Nombre", adVarChar, adParamInput, 20, CSM_Function.IfIsZeroLenghtString_Null(mTelefono1Nombre))
        .Parameters.Append .CreateParameter("Telefono1Numero", adVarChar, adParamInput, 20, CSM_Function.IfIsZeroLenghtString_Null(mTelefono1Numero))
        .Parameters.Append .CreateParameter("Telefono2Nombre", adVarChar, adParamInput, 20, CSM_Function.IfIsZeroLenghtString_Null(mTelefono2Nombre))
        .Parameters.Append .CreateParameter("Telefono2Numero", adVarChar, adParamInput, 20, CSM_Function.IfIsZeroLenghtString_Null(mTelefono2Numero))
        .Parameters.Append .CreateParameter("Email1", adVarChar, adParamInput, 30, CSM_Function.IfIsZeroLenghtString_Null(mEmail1))
        .Parameters.Append .CreateParameter("Email2", adVarChar, adParamInput, 30, CSM_Function.IfIsZeroLenghtString_Null(mEmail2))
        .Parameters.Append .CreateParameter("Notas", adVarChar, adParamInput, 8000, CSM_Function.IfIsZeroLenghtString_Null(mNotas))

        .Execute

        If mIsNew Then
            mIDContacto = .Parameters("IDContacto").Value
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
    ShowErrorMessage "Classes.Entidad_Contacto.Update", "Error al actualizar el Contacto de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDContacto: " & IDContacto
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
        .CommandText = "usp_Entidad_Contacto_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDEntidad", adInteger, adParamInput, , mIDEntidad)
        .Parameters.Append .CreateParameter("IDContacto", adTinyInt, adParamInput, , mIDContacto)

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
    ShowErrorMessage "Classes.Entidad_Contacto.Delete", "Error al eliminar el Contacto de la Entidad." & vbCr & vbCr & "IDEntidad: " & IDEntidad & vbCr & "IDContacto: " & IDContacto
    Set cmdSP = Nothing
End Function

Private Sub InitializeValues()
    mCargo = ""
    mNombre = ""
    mTelefono1Nombre = ""
    mTelefono1Numero = ""
    mTelefono2Nombre = ""
    mTelefono2Numero = ""
    mEmail1 = ""
    mEmail2 = ""
    mNotas = ""

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
