VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Pesadas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private mPesadas As Collection

Private Sub Class_Initialize()
    Set mPesadas = New Collection
End Sub

Public Sub Add(ByRef value As Pesada)
    mPesadas.Add value, CSM_Constant.KEY_STRINGER & value.IDPesada
End Sub

Public Sub Remove(ByRef value As Pesada)
    mPesadas.Remove CSM_Constant.KEY_STRINGER & value.IDPesada
End Sub

Public Sub RemoveByIDPesada(ByVal value As Long)
    mPesadas.Remove CSM_Constant.KEY_STRINGER & value
End Sub

Public Property Get Item(IndexKey As Variant) As Pesada
Attribute Item.VB_UserMemId = 0
Attribute Item.VB_MemberFlags = "200"
    Set Item = mPesadas(IndexKey)
End Property

Public Property Get Count() As Long
    Count = mPesadas.Count
End Property

Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mPesadas.[_NewEnum]
End Property

Public Function ObtenerPesadas(ByRef database As CSC_Database_ADO_SQL, Ctg As String) As Boolean
    Dim command As ADODB.command
    Dim recordset As ADODB.recordset
    
    If pTrapErrors Then
        On Error GoTo ErrorHandler
    End If
        
    Screen.MousePointer = vbHourglass
    
    Set command = New ADODB.command
    Set command.ActiveConnection = database.Connection
    command.CommandType = adCmdStoredProc
    command.CommandText = "ObtenerPesadasDeCtg"
    command.Parameters.Append command.CreateParameter("Ctg", adBigInt, adParamInput, , Ctg)
    
    Set recordset = New ADODB.recordset
    recordset.Open command, , adOpenForwardOnly, adLockReadOnly
    Set command = Nothing
    
    Do While Not recordset.EOF
        Dim Pesada As New Pesada
        
        Pesada.IDPesada = recordset("IDPesada").value
        Pesada.IDProducto = recordset("IDProducto").value
        Pesada.KilogramoNeto = CSM_Function.IfIsNull_Zero(recordset("KilogramoNeto").value)
        Pesada.Humedad = CSM_Function.IfIsNull(recordset("Humedad").value, -1)
        Pesada.Zaranda = CSM_Function.IfIsNull(recordset("Zaranda").value, -1)
        mPesadas.Add Pesada
        
        Set Pesada = Nothing
        
        recordset.MoveNext
    Loop
    recordset.Close
    Set recordset = Nothing
    
    Screen.MousePointer = vbDefault
    ObtenerPesadas = True
    Exit Function

ErrorHandler:
    ShowErrorMessage "Classes.Pesadas.ObtenerPesadas", "Error al obtener la lista de pesadas del C.T.G. " & Ctg
    If Not recordset Is Nothing Then
        Set recordset = Nothing
    End If
End Function

Private Sub Class_Terminate()
    Set mPesadas = Nothing
End Sub
