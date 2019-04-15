VERSION 5.00
Begin VB.Form frmMonedaCotizacion_Cargador 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cargador de Cotizaciones de Monedas"
   ClientHeight    =   7755
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   6150
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "MonedaCotizacion_Cargador.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7755
   ScaleWidth      =   6150
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   390
      Left            =   4980
      TabIndex        =   3
      Top             =   7260
      Width           =   1035
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "Aceptar"
      Height          =   390
      Left            =   3780
      TabIndex        =   2
      Top             =   7260
      Width           =   1035
   End
   Begin VB.TextBox txtDatosACargar 
      Height          =   4575
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   2520
      Width           =   5895
   End
   Begin VB.TextBox txtInstrucciones 
      BackColor       =   &H8000000F&
      Height          =   2235
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      TabStop         =   0   'False
      Text            =   "MonedaCotizacion_Cargador.frx":000C
      Top             =   120
      Width           =   5895
   End
End
Attribute VB_Name = "frmMonedaCotizacion_Cargador"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAceptar_Click()
    Dim aLines() As String
    Dim LineIndex As Integer
    
    Dim aColumns() As String
    Dim ColumnIndex As Integer
    
    Dim MonedaCotizacion As MonedaCotizacion
    
    If Trim(txtDatosACargar.Text) = "" Then
        MsgBox "Debe ingresar los datos.", vbInformation, App.Title
        txtDatosACargar.SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    
    'Separo en líneas
    aLines = Split(Trim(txtDatosACargar.Text), vbCrLf)
    For LineIndex = 0 To UBound(aLines)
        'Separo en columnas
        aColumns = Split(aLines(LineIndex), vbTab)
        If UBound(aColumns) = 4 Then
            If IsDate(aColumns(0)) Then
                'DÓLAR
                If IsNumeric(aColumns(1)) And IsNumeric(aColumns(2)) Then
                    Set MonedaCotizacion = New MonedaCotizacion
                    With MonedaCotizacion
                        .IDMoneda = pParametro.Moneda_Dolar_ID
                        .Fecha = CDate(aColumns(0))
                        .CotizacionCompra = CCur(Replace(aColumns(1), ".", ","))
                        .CotizacionVenta = CCur(Replace(aColumns(2), ".", ","))
                        If Not .Update Then
                            Screen.MousePointer = vbDefault
                            Exit Sub
                        End If
                    End With
                End If
                'EURO
                If IsNumeric(aColumns(3)) And IsNumeric(aColumns(4)) Then
                    Set MonedaCotizacion = New MonedaCotizacion
                    With MonedaCotizacion
                        .IDMoneda = pParametro.Moneda_Euro_ID
                        .Fecha = CDate(aColumns(0))
                        .CotizacionCompra = CCur(Replace(aColumns(3), ".", ","))
                        .CotizacionVenta = CCur(Replace(aColumns(4), ".", ","))
                        If Not .Update Then
                            Screen.MousePointer = vbDefault
                            Exit Sub
                        End If
                    End With
                End If
            End If
        End If
    Next LineIndex
    
    Screen.MousePointer = vbDefault
    
    MsgBox "Se han cargado las cotizaciones.", vbInformation, App.Title
End Sub

Private Sub cmdCancelar_Click()
    Unload Me
    Set frmMonedaCotizacion_Cargador = Nothing
End Sub
