VERSION 5.00
Begin VB.Form frmSplash 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   ClientHeight    =   5625
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7500
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Splash.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   Picture         =   "Splash.frx":08CA
   ScaleHeight     =   5625
   ScaleWidth      =   7500
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label lblCompanyName 
      BackStyle       =   0  'Transparent
      Caption         =   "CompanyName"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1620
      TabIndex        =   4
      Top             =   180
      Width           =   5640
   End
   Begin VB.Label lblCopyright 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Copyright"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   60
      TabIndex        =   3
      Top             =   5340
      Width           =   7395
   End
   Begin VB.Label lblLicenseCompany 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "LicenseCompany"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   525
      Left            =   240
      TabIndex        =   2
      Top             =   3780
      Width           =   6990
   End
   Begin VB.Label lblVersion 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Version"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   1620
      TabIndex        =   1
      Top             =   1140
      Width           =   5640
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Title"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   1620
      TabIndex        =   0
      Top             =   600
      Width           =   5640
   End
   Begin VB.Image imgApp 
      Height          =   1020
      Left            =   120
      Picture         =   "Splash.frx":9698
      Stretch         =   -1  'True
      Top             =   180
      Width           =   1020
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Caption = App.Title
    lblCompanyName.Caption = App.CompanyName
    lblTitle.Caption = App.Title
    lblVersion.Caption = "Versión " & App.Major & "." & App.Minor & "     Revisión: " & App.Revision
    lblLicenseCompany.Caption = ""
    lblCopyright.Caption = App.LegalCopyright
End Sub
