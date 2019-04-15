VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SubProducto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'PROPERTIES VARIABLES
Private mIDSubProducto As Byte
Private mNombre As String
Private mUtilizaPrecioDolar As Boolean
Private mONCCA_Codigo As Integer
Private mCOT_Codigo As Long
Private mActivo As Boolean

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

Public Property Get IDSubProducto() As Byte
    IDSubProducto = mIDSubProducto
End Property

Public Property Let IDSubProducto(ByVal Value As Byte)
    If Value <> mIDSubProducto Then
        mIsDirty = True
    End If
    mIDSubProducto = Value
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

Public Property Get UtilizaPrecioDolar() As Boolean
    UtilizaPrecioDolar = mUtilizaPrecioDolar
End Property

Public Property Let UtilizaPrecioDolar(ByVal Value As Boolean)
    If Value <> mUtilizaPrecioDolar Then
        mIsDirty = True
    End If
    mUtilizaPrecioDolar = Value
End Property
'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get ONCCA_Codigo() As Integer
    ONCCA_Codigo = mONCCA_Codigo
End Property

Public Property Let ONCCA_Codigo(ByVal Value As Integer)
    If Value <> mONCCA_Codigo Then
        mIsDirty = True
    End If
    mONCCA_Codigo = Value
End Property
'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get COT_Codigo() As Long
    COT_Codigo = mCOT_Codigo
End Property

Public Property Let COT_Codigo(ByVal Value As Long)
    If Value <> mCOT_Codigo Then
        mIsDirty = True
    End If
    mCOT_Codigo = Value
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Activo() As Boolean
    Activo = mActivo
End Property

Public Property Let Activo(ByVal Value As Boolean)
    If Value <> mActivo Then
        mIsDirty = True
    End If
    mActivo = Value
End Property

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
    'RefreshList_Module.SubProducto IDSubProducto
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
        .CommandText = "usp_SubProducto_Get"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDSubProducto", adTinyInt, adParamInput, 16, mIDSubProducto)
    End With

    Set recData = New ADODB.Recordset
    recData.Open cmdSP, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc

    Screen.MousePointer = vbHourglass

    Load = GetDataFromRecordset(recData)

    recData.Close
    Set recData = Nothing
    Set cmdSP = Nothing
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.SubProducto.Load", "Error al obtener los datos del SubProducto." & vbCr & vbCr & "IDSubProducto: " & IDSubProducto
End Function

Private Function GetDataFromRecordset(ByRef recData As ADODB.Recordset) As Boolean

    If (Not mNoMatchRaiseError) And recData.EOF Then
        mNoMatch = True
    Else
        mNoMatch = False
        mIsNew = False

        mNombre = recData("Nombre").Value
        mUtilizaPrecioDolar = recData("UtilizaPrecioDolar").Value
        mONCCA_Codigo = recData("ONCCA_Codigo").Value
        mCOT_Codigo = Val(recData("COT_Codigo").Value & "")
        mActivo = recData("Activo").Value
    End If

    Screen.MousePointer = vbDefault
    GetDataFromRecordset = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.SubProducto.GetDataFromRecordset", "Error al obtener los datos del SubProducto." & vbCr & vbCr & "IDSubProducto: " & IDSubProducto
End Function

Public Function Copy() As Boolean
    If Load() Then
        Copy = True

        mIDSubProducto = 0

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
            .CommandText = "usp_SubProducto_Add"
        Else
            .CommandText = "usp_SubProducto_Update"
        End If
        .CommandType = adCmdStoredProc

        If mIsNew Then
            .Parameters.Append .CreateParameter("IDSubProducto", adTinyInt, adParamOutput)
        Else
            .Parameters.Append .CreateParameter("IDSubProducto", adTinyInt, adParamInput, 16, mIDSubProducto)
        End If
        .Parameters.Append .CreateParameter("Nombre", adVarChar, adParamInput, 50, mNombre)
        .Parameters.Append .CreateParameter("UtilizaPrecioDolar", adBoolean, adParamInput, , mUtilizaPrecioDolar)
        .Parameters.Append .CreateParameter("ONCCA_Codigo", adSmallInt, adParamInput, , mONCCA_Codigo)
        .Parameters.Append .CreateParameter("COT_Codigo", adInteger, adParamInput, , IIf(mCOT_Codigo = 0, Null, mCOT_Codigo))
        .Parameters.Append .CreateParameter("Activo", adBoolean, adParamInput, , mActivo)

        .Execute

        If mIsNew Then
            mIDSubProducto = .Parameters("IDSubProducto").Value
        End If
    End With

    mIsCopy = False
    mIsDirty = False

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Update = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.SubProducto.Update", "Error al actualizar el SubProducto." & vbCr & vbCr & "IDSubProducto: " & IDSubProducto
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
        .CommandText = "usp_SubProducto_Delete"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDSubProducto", adTinyInt, adParamInput, 16, mIDSubProducto)

        .Execute
    End With

    If Not mRefreshListSkip Then
        Call RefreshList
    End If

    Screen.MousePointer = vbDefault
    Delete = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.SubProducto.Delete", "Error al eliminar el SubProducto." & vbCr & vbCr & "IDSubProducto: " & IDSubProducto
End Function

Private Sub InitializeValues()
    Nombre = ""
    UtilizaPrecioDolar = False
    ONCCA_Codigo = 0
    COT_Codigo = 0
    Activo = True

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
