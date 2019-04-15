VERSION 5.00
Begin VB.Form frmCOTInfo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Información para la optención del C.O.T."
   ClientHeight    =   6060
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4920
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "COTInfo.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6060
   ScaleWidth      =   4920
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraDocumentacion 
      Caption         =   "Documentación:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   60
      TabIndex        =   25
      Top             =   4380
      Width           =   4755
      Begin VB.TextBox txtDocumentacionNumero 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   28
         Top             =   300
         Width           =   1395
      End
      Begin VB.TextBox txtDocumentacionFecha 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   27
         Top             =   720
         Width           =   1155
      End
      Begin VB.TextBox txtDocumentacionImporte 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   26
         Top             =   1140
         Width           =   1155
      End
      Begin VB.Label lblDocumentacionNumero 
         Caption         =   "Número:"
         Height          =   195
         Left            =   120
         TabIndex        =   31
         Top             =   360
         Width           =   795
      End
      Begin VB.Label lblDocumentacionFecha 
         Caption         =   "Fecha:"
         Height          =   195
         Left            =   120
         TabIndex        =   30
         Top             =   780
         Width           =   795
      End
      Begin VB.Label lblDocumentacionImporte 
         Caption         =   "Importe:"
         Height          =   195
         Left            =   120
         TabIndex        =   29
         Top             =   1200
         Width           =   795
      End
   End
   Begin VB.Frame fraProducto 
      Caption         =   "Producto:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   60
      TabIndex        =   20
      Top             =   3540
      Width           =   4755
      Begin VB.TextBox txtProductoCodigo 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   22
         Top             =   300
         Width           =   915
      End
      Begin VB.TextBox txtProductoKilogramo 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2700
         Locked          =   -1  'True
         TabIndex        =   21
         Top             =   300
         Width           =   915
      End
      Begin VB.Label lblProductoCodigo 
         Caption         =   "Código:"
         Height          =   195
         Left            =   120
         TabIndex        =   24
         Top             =   360
         Width           =   795
      End
      Begin VB.Label lblProductoKilogramo 
         Caption         =   "Kgs.:"
         Height          =   195
         Left            =   2160
         TabIndex        =   23
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Frame fraDestinatario 
      Caption         =   "Destinatario y Destino:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2115
      Left            =   60
      TabIndex        =   7
      Top             =   1320
      Width           =   4755
      Begin VB.TextBox txtDestinoDomicilioLocalidad 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   375
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   18
         Top             =   1620
         Width           =   3615
      End
      Begin VB.TextBox txtDestinoDomicilioOficina 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3780
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   1200
         Width           =   795
      End
      Begin VB.TextBox txtDestinoDomicilioPiso 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2340
         Locked          =   -1  'True
         TabIndex        =   14
         Top             =   1200
         Width           =   795
      End
      Begin VB.TextBox txtDestinoDomicilioNumero 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   12
         Top             =   1200
         Width           =   795
      End
      Begin VB.TextBox txtDestinoDomicilioCalle 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   375
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   720
         Width           =   3615
      End
      Begin VB.TextBox txtDestinatarioCUIT 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   8
         Top             =   300
         Width           =   1335
      End
      Begin VB.Label lblDestinoDomicilioLocalidad 
         Caption         =   "Localidad:"
         Height          =   195
         Left            =   120
         TabIndex        =   19
         Top             =   1680
         Width           =   795
      End
      Begin VB.Label lblDestinoDomicilioOficina 
         Caption         =   "Ofic.:"
         Height          =   195
         Left            =   3300
         TabIndex        =   17
         Top             =   1260
         Width           =   435
      End
      Begin VB.Label lblDestinoDomicilioPiso 
         Caption         =   "Piso:"
         Height          =   195
         Left            =   1920
         TabIndex        =   15
         Top             =   1260
         Width           =   435
      End
      Begin VB.Label lblDestinoDomicilioNumero 
         Caption         =   "Número:"
         Height          =   195
         Left            =   120
         TabIndex        =   13
         Top             =   1260
         Width           =   795
      End
      Begin VB.Label lblDestinoDomicilioCalle 
         Caption         =   "Calle:"
         Height          =   195
         Left            =   120
         TabIndex        =   11
         Top             =   780
         Width           =   795
      End
      Begin VB.Label lblDestinatarioCUIT 
         Caption         =   "CUIT:"
         Height          =   195
         Left            =   120
         TabIndex        =   9
         Top             =   360
         Width           =   795
      End
   End
   Begin VB.Frame fraTransportista 
      Caption         =   "Transportista:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1155
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4755
      Begin VB.TextBox txtTransportistaDominioAcoplado 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3240
         Locked          =   -1  'True
         TabIndex        =   5
         Top             =   720
         Width           =   915
      End
      Begin VB.TextBox txtTransportistaDominioChasis 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   720
         Width           =   915
      End
      Begin VB.TextBox txtTransportistaCUIT 
         Alignment       =   2  'Center
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   300
         Width           =   1335
      End
      Begin VB.Label lblTransportistaDominioAcoplado 
         Caption         =   "Acoplado:"
         Height          =   195
         Left            =   2400
         TabIndex        =   6
         Top             =   780
         Width           =   795
      End
      Begin VB.Label lblTransportistaDominioChasis 
         Caption         =   "Chasis:"
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   780
         Width           =   795
      End
      Begin VB.Label lblTransportistaCUIT 
         Caption         =   "CUIT:"
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   795
      End
   End
End
Attribute VB_Name = "frmCOTInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub txtTransportistaCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransportistaCUIT)
End Sub

Private Sub txtTransportistaDominioChasis_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransportistaDominioChasis)
End Sub

Private Sub txtTransportistaDominioAcoplado_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtTransportistaDominioAcoplado)
End Sub

Private Sub txtDestinatarioCUIT_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinatarioCUIT)
End Sub

Private Sub txtDestinoDomicilioCalle_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinoDomicilioCalle)
End Sub

Private Sub txtDestinoDomicilioNumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinoDomicilioNumero)
End Sub

Private Sub txtDestinoDomicilioPiso_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinoDomicilioPiso)
End Sub

Private Sub txtDestinoDomicilioOficina_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinoDomicilioOficina)
End Sub

Private Sub txtDestinoDomicilioLocalidad_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDestinoDomicilioLocalidad)
End Sub

Private Sub txtProductoCodigo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtProductoCodigo)
End Sub

Private Sub txtProductoKilogramo_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtProductoKilogramo)
End Sub

Private Sub txtDocumentacionNumero_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDocumentacionNumero)
End Sub

Private Sub txtDocumentacionFecha_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDocumentacionFecha)
End Sub

Private Sub txtDocumentacionImporte_GotFocus()
    Call CSM_Control_TextBox.SelAllText(txtDocumentacionImporte)
End Sub
