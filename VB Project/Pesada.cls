VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Pesada"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private mIDPesada As Long
Private mIDProducto As Byte
Private mKilogramoNeto As Long
Private mHumedad As Single
Private mZaranda As Single

Private mIsDirty As Boolean

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDPesada() As Long
    IDPesada = mIDPesada
End Property

Public Property Get IDPesada_Formatted() As String
    IDPesada_Formatted = Format(mIDPesada, "#,###")
End Property

Public Property Let IDPesada(ByVal value As Long)
    If value <> mIDPesada Then
        mIsDirty = True
        mIDPesada = value
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get IDProducto() As Byte
    IDProducto = mIDProducto
End Property

Public Property Let IDProducto(ByVal value As Byte)
    If value <> mIDProducto Then
        mIsDirty = True
        mIDProducto = value
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get KilogramoNeto() As Long
    KilogramoNeto = mKilogramoNeto
End Property

Public Property Get KilogramoNeto_Formatted() As String
    KilogramoNeto_Formatted = Format(mKilogramoNeto, "#,###")
End Property

Public Property Get KilogramoNeto_FormattedForSQL() As String
    KilogramoNeto_FormattedForSQL = IIf(mKilogramoNeto = 0, "NULL", mKilogramoNeto)
End Property

Public Property Let KilogramoNeto(ByVal value As Long)
    If value <> mKilogramoNeto Then
        mIsDirty = True
        mKilogramoNeto = value
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Humedad() As Single
    Humedad = mHumedad
End Property

Public Property Get Humedad_FormattedForSQL() As String
    Humedad_FormattedForSQL = IIf(mHumedad = -1, "NULL", CSM_String.FormatDecimalToSQL(mHumedad))
End Property

Public Property Let Humedad(ByVal value As Single)
    If value <> mHumedad Then
        mIsDirty = True
        mHumedad = value
    End If
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get Zaranda() As Single
    Zaranda = mZaranda
End Property

Public Property Get Zaranda_FormattedForSQL() As String
    Zaranda_FormattedForSQL = IIf(mZaranda = -1, "NULL", CSM_String.FormatDecimalToSQL(mZaranda))
End Property

Public Property Let Zaranda(ByVal value As Single)
    If value <> mZaranda Then
        mIsDirty = True
        mZaranda = value
    End If
End Property
