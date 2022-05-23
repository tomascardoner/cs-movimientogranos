VERSION 5.00
Begin VB.Form frmMovimiento_Cereal_ObtenerPesadas 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Obtener pesadas"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4965
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4965
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   435
      Left            =   2580
      TabIndex        =   4
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "Aceptar"
      Height          =   435
      Left            =   1320
      TabIndex        =   3
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CheckBox chkMostrarAdvertenciasIndividuales 
      Caption         =   "Mostrar advertencias o errores al procesar cada carta de porte. Si no selecciona esta opción, se mostrará un resumen general."
      Height          =   690
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   4695
   End
   Begin VB.CheckBox chkSobrescribirDatos 
      Caption         =   $"Movimiento_Cereal_ObtenerPesadas.frx":0000
      Height          =   690
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4695
   End
   Begin VB.Label lblMensaje 
      Alignment       =   2  'Center
      Caption         =   "Se obtendra la información de las pesadas correspondientes a las cartas de porte de entrada mostradas. ¿Desea continuar?"
      Height          =   435
      Left            =   120
      TabIndex        =   1
      Top             =   1920
      Width           =   4695
   End
End
Attribute VB_Name = "frmMovimiento_Cereal_ObtenerPesadas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAceptar_Click()
    Me.Tag = "OK"
    Me.Hide
End Sub

Private Sub cmdCancelar_Click()
    Me.Tag = "CANCEL"
    Me.Hide
End Sub

