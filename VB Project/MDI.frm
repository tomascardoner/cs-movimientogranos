VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.MDIForm frmMDI 
   BackColor       =   &H8000000C&
   Caption         =   "App.Title"
   ClientHeight    =   5670
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   11625
   Icon            =   "MDI.frx":0000
   LinkTopic       =   "MDIForm1"
   LockControls    =   -1  'True
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   5295
      Width           =   11625
      _ExtentX        =   20505
      _ExtentY        =   661
      ShowTips        =   0   'False
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   8
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   14543
            MinWidth        =   1764
            Key             =   "STATUS"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   159
            MinWidth        =   2
            Key             =   "COMPANY_NAME"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   159
            MinWidth        =   2
            Key             =   "USERNAME"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
            Alignment       =   1
            AutoSize        =   2
            Enabled         =   0   'False
            Object.Width           =   900
            MinWidth        =   2
            TextSave        =   "CAPS"
            Key             =   "CAPS"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   2
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   820
            MinWidth        =   2
            TextSave        =   "NUM"
            Key             =   "NUM"
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   3
            Alignment       =   1
            AutoSize        =   2
            Enabled         =   0   'False
            Object.Width           =   635
            MinWidth        =   2
            TextSave        =   "INS"
            Key             =   "INS"
         EndProperty
         BeginProperty Panel7 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   1693
            MinWidth        =   2
            TextSave        =   "15/04/2019"
            Key             =   "DATE"
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   873
            MinWidth        =   2
            TextSave        =   "16:41"
            Key             =   "TIME"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ilsToolbar 
      Left            =   4020
      Top             =   2400
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":08CA
            Key             =   "TABLAS"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":15A4
            Key             =   "CONTRATOS"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":1E7E
            Key             =   "MOVIMIENTOS"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":2B58
            Key             =   "FORMULARIOS"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":3832
            Key             =   "INFORMES"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ilsFormToolbarHot 
      Left            =   4620
      Top             =   2400
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   20
      ImageHeight     =   20
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   11
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":450C
            Key             =   "NEW"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":4A68
            Key             =   "PROPERTIES"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":4FC4
            Key             =   "DELETE"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":5520
            Key             =   "COPY"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":5A7A
            Key             =   "SELECT"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":60B6
            Key             =   "PRINT"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":66F0
            Key             =   "FILTER"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":6FCA
            Key             =   "FILTER_CLEAR"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":78A4
            Key             =   "CONTACTS"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":817E
            Key             =   "TASKS"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":87B8
            Key             =   "FORMULARIOS"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ilsFormToolbar 
      Left            =   5220
      Top             =   2400
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   20
      ImageHeight     =   20
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   11
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":8DF2
            Key             =   "NEW"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":934E
            Key             =   "PROPERTIES"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":98AA
            Key             =   "DELETE"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":9E06
            Key             =   "COPY"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":A360
            Key             =   "SELECT"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":A99C
            Key             =   "PRINT"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":AFD6
            Key             =   "FILTER"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":B8B0
            Key             =   "FILTER_CLEAR"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":C18A
            Key             =   "CONTACTS"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":CA64
            Key             =   "TASKS"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":D09E
            Key             =   "FORMULARIOS"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ilsFormSortColumn 
      Left            =   5820
      Top             =   2400
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   8
      ImageHeight     =   7
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":D6D8
            Key             =   "ASC"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDI.frx":D7AA
            Key             =   "DESC"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlbMain 
      Align           =   1  'Align Top
      Height          =   600
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11625
      _ExtentX        =   20505
      _ExtentY        =   1058
      ButtonWidth     =   2037
      ButtonHeight    =   1005
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   5
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Tablas"
            Key             =   "TABLAS"
            Object.ToolTipText     =   "Tablas de Entidades, Cartas de Porte, etc."
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   6
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "ENTIDAD"
                  Text            =   "Entidades"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "ENTIDAD_ORIGENDESTINO"
                  Text            =   "Orígenes / Destinos de Entidades"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "CARTAPORTE_TALONARIO"
                  Text            =   "Talonarios Carta De Porte"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "LOCALIDAD"
                  Text            =   "Localidades"
               EndProperty
               BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu6 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "MONEDA_COTIZACION"
                  Text            =   "Cotización de Monedas"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Contratos"
            Key             =   "CONTRATOS"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Movimientos"
            Key             =   "MOVIMIENTOS"
            Object.ToolTipText     =   "Movimientos de Cereales y de SubProductos"
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   4
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "CEREAL"
                  Text            =   "Cereales"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "SUBPRODUCTO"
                  Text            =   "SubProductos"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "EXPORT"
                  Text            =   "Exportar Cartas de Porte y Análisis (BolsaTech)"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Certificados"
            Key             =   "FORMULARIOS"
            Object.ToolTipText     =   "Certificados de depósito, Certificados RT y Liquidaciones"
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   7
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "1116A"
                  Text            =   "Certificados de Depósito"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "1116RT"
                  Text            =   "Certificados de Retiro / Transferencia"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "1116B"
                  Text            =   "Liquidaciones"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "ANULADOS"
                  Text            =   "Anulados"
               EndProperty
               BeginProperty ButtonMenu6 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu7 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "EXPORTAR"
                  Text            =   "Exportar"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Informes"
            Key             =   "INFORMES"
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   5
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "LIBRO_MOVIMIENTOS_CEREAL"
                  Text            =   "Libro de Movimientos de Cereales"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "CONSULTA_STOCK_CEREAL"
                  Text            =   "Consultar Stock de Cereales"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "LIBRO_MOVIMIENTOS_SUBPRODUCTO"
                  Text            =   "Libro de Movimientos de SubProductos"
               EndProperty
               BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "RESUMEN_FASON"
                  Text            =   "Resumen de Fasón"
               EndProperty
            EndProperty
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&Archivo"
      Begin VB.Menu mnuFileOption 
         Caption         =   "Opciones"
         Begin VB.Menu mnuFileOptionApplication 
            Caption         =   "Aplicación"
         End
         Begin VB.Menu mnuFileOptionDatabase 
            Caption         =   "Base de Datos"
         End
      End
      Begin VB.Menu mnuFileCloseSessionSeparator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileCloseSession 
         Caption         =   "Cerrar sesión del Usuario"
      End
      Begin VB.Menu mnuFileSeparatorExit 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "&Salir"
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Ventana"
      WindowList      =   -1  'True
      Begin VB.Menu mnuWindowTileHorizontally 
         Caption         =   "Mosaico &Horizontal"
      End
      Begin VB.Menu mnuWindowTileVertically 
         Caption         =   "Mosaico &Vertical"
      End
      Begin VB.Menu mnuWindowCascade 
         Caption         =   "&Cascada"
      End
      Begin VB.Menu mnuWindowArrangeIcons 
         Caption         =   "&Organizar Iconos"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "A&yuda"
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&Acerca de..."
      End
   End
End
Attribute VB_Name = "frmMDI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_Load()
    Caption = App.Title
    
    mnuHelpAbout.Caption = "&Acerca de " & App.Title & "..."

    '//////////////////////////////////////////////////////////
    'ASIGNO LOS ICONOS AL TOOLBAR
    Set tlbMain.ImageList = ilsToolbar
    tlbMain.buttons("TABLAS").Image = "TABLAS"
    tlbMain.buttons("CONTRATOS").Image = "CONTRATOS"
    tlbMain.buttons("MOVIMIENTOS").Image = "MOVIMIENTOS"
    tlbMain.buttons("FORMULARIOS").Image = "FORMULARIOS"
    tlbMain.buttons("INFORMES").Image = "INFORMES"
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    TerminateApplication
End Sub

Private Sub mnuFileOptionApplication_Click()
    frmOptionApplication.Show vbModal, frmMDI
End Sub

Private Sub mnuFileCloseSession_Click()
    Dim Usuario As Usuario
    
    If MsgBox("¿Desea cerrar la sesión del Usuario?", vbQuestion + vbYesNo, App.Title) = vbYes Then
        Set Usuario = New Usuario
        Load frmLogin
        frmLogin.LoadData Usuario
        frmLogin.Show vbModal, frmMDI
        If Usuario.IDUsuario = 0 Then
            Unload Me
            Exit Sub
        End If
        If Not Usuario.LogIn() Then
            Unload Me
            Exit Sub
        End If
        pIDUsuario = Usuario.IDUsuario
    End If
End Sub

Private Sub mnuFileExit_Click()
    Unload frmMDI
    Set frmMDI = Nothing
End Sub

Private Sub mnuWindowTileHorizontally_Click()
    frmMDI.Arrange vbTileHorizontal
End Sub

Private Sub mnuWindowTileVertically_Click()
    frmMDI.Arrange vbTileVertical
End Sub

Private Sub mnuWindowCascade_Click()
    frmMDI.Arrange vbCascade
End Sub

Private Sub mnuWindowArrangeIcons_Click()
    frmMDI.Arrange vbArrangeIcons
End Sub

Private Sub mnuHelpAbout_Click()
    frmAbout.Show vbModal, frmMDI
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
    Select Case Button.Key
        Case "CONTRATOS"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmContrato_Lista.Startup Then
                If frmContrato_Lista.LoadData(0) Then
                    frmContrato_Lista.Show
                    frmContrato_Lista.SetFocus
                Else
                    Unload frmContrato_Lista
                    Set frmContrato_Lista = Nothing
                End If
            Else
                Unload frmContrato_Lista
                Set frmContrato_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault

        Case "MOVIMIENTOS"
            Call tlbMain_ButtonMenuClick(tlbMain.buttons("MOVIMIENTOS").ButtonMenus("CEREAL"))
    End Select
End Sub

Private Sub tlbMain_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Select Case ButtonMenu.Parent.Key & "_" & ButtonMenu.Key
    
        '/////////////////////////////////////////////////////////
        'TABLAS
        Case "TABLAS_ENTIDAD"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmEntidad_Lista.Startup() Then
                If frmEntidad_Lista.LoadData(0) Then
                    frmEntidad_Lista.Show
                    frmEntidad_Lista.SetFocus
                Else
                    Unload frmEntidad_Lista
                    Set frmEntidad_Lista = Nothing
                End If
            Else
                Unload frmEntidad_Lista
                Set frmEntidad_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
                    
        Case "TABLAS_ENTIDAD_ORIGENDESTINO"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmEntidad_OrigenDestino_Lista.Startup() Then
                If frmEntidad_OrigenDestino_Lista.LoadData(0, 0) Then
                    frmEntidad_OrigenDestino_Lista.Show
                    frmEntidad_OrigenDestino_Lista.SetFocus
                Else
                    Unload frmEntidad_OrigenDestino_Lista
                    Set frmEntidad_OrigenDestino_Lista = Nothing
                End If
            Else
                Unload frmEntidad_OrigenDestino_Lista
                Set frmEntidad_OrigenDestino_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
                    
        Case "TABLAS_CARTAPORTE_TALONARIO"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmCartaPorte_Talonario_Lista.Startup() Then
                If frmCartaPorte_Talonario_Lista.LoadData(0) Then
                    frmCartaPorte_Talonario_Lista.Show
                    frmCartaPorte_Talonario_Lista.SetFocus
                Else
                    Unload frmCartaPorte_Talonario_Lista
                    Set frmCartaPorte_Talonario_Lista = Nothing
                End If
            Else
                Unload frmCartaPorte_Talonario_Lista
                Set frmCartaPorte_Talonario_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
        
        Case "TABLAS_LOCALIDAD"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmLocalidad_Lista.Startup() Then
                If frmLocalidad_Lista.LoadData(0) Then
                    frmLocalidad_Lista.Show
                    frmLocalidad_Lista.SetFocus
                Else
                    Unload frmLocalidad_Lista
                    Set frmLocalidad_Lista = Nothing
                End If
            Else
                Unload frmLocalidad_Lista
                Set frmLocalidad_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
            
        Case "TABLAS_MONEDA_COTIZACION"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmMonedaCotizacion_Lista.Startup() Then
                If frmMonedaCotizacion_Lista.LoadData(0, DATE_TIME_FIELD_NULL_VALUE) Then
                    frmMonedaCotizacion_Lista.Show
                    frmMonedaCotizacion_Lista.SetFocus
                Else
                    Unload frmMonedaCotizacion_Lista
                    Set frmMonedaCotizacion_Lista = Nothing
                End If
            Else
                Unload frmMonedaCotizacion_Lista
                Set frmMonedaCotizacion_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
            
        '/////////////////////////////////////////////////////////
        'MOVIMIENTOS
        Case "MOVIMIENTOS_CEREAL"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmMovimiento_Cereal_Lista.Startup Then
                If frmMovimiento_Cereal_Lista.LoadData(0) Then
                    frmMovimiento_Cereal_Lista.Show
                    frmMovimiento_Cereal_Lista.SetFocus
                Else
                    Unload frmMovimiento_Cereal_Lista
                    Set frmMovimiento_Cereal_Lista = Nothing
                End If
            Else
                Unload frmMovimiento_Cereal_Lista
                Set frmMovimiento_Cereal_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
        
        Case "MOVIMIENTOS_SUBPRODUCTO"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmMovimiento_SubProducto_Lista.Startup Then
                If frmMovimiento_SubProducto_Lista.LoadData(0) Then
                    frmMovimiento_SubProducto_Lista.Show
                    frmMovimiento_SubProducto_Lista.SetFocus
                Else
                    Unload frmMovimiento_SubProducto_Lista
                    Set frmMovimiento_SubProducto_Lista = Nothing
                End If
            Else
                Unload frmMovimiento_SubProducto_Lista
                Set frmMovimiento_SubProducto_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
        
        Case "MOVIMIENTOS_EXPORT"
            Screen.MousePointer = vbHourglass
            DoEvents
            frmMovimiento_Cereal_Exportar.Show
            Screen.MousePointer = vbDefault
        
        '/////////////////////////////////////////////////////////
        'FORMULARIOS
        Case "FORMULARIOS_1116A"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmFormularioA_Lista.Startup Then
                If frmFormularioA_Lista.LoadData(0) Then
                    frmFormularioA_Lista.Show
                    frmFormularioA_Lista.SetFocus
                Else
                    Unload frmFormularioA_Lista
                    Set frmFormularioA_Lista = Nothing
                End If
            Else
                Unload frmFormularioA_Lista
                Set frmFormularioA_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
            
        Case "FORMULARIOS_1116B"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmFormularioB_Lista.Startup Then
                If frmFormularioB_Lista.LoadData(0) Then
                    frmFormularioB_Lista.Show
                    frmFormularioB_Lista.SetFocus
                Else
                    Unload frmFormularioB_Lista
                    Set frmFormularioB_Lista = Nothing
                End If
            Else
                Unload frmFormularioB_Lista
                Set frmFormularioB_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
            
        Case "FORMULARIOS_1116RT"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmFormularioRT_Lista.Startup Then
                If frmFormularioRT_Lista.LoadData(0) Then
                    frmFormularioRT_Lista.Show
                    frmFormularioRT_Lista.SetFocus
                Else
                    Unload frmFormularioRT_Lista
                    Set frmFormularioRT_Lista = Nothing
                End If
            Else
                Unload frmFormularioRT_Lista
                Set frmFormularioRT_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
    
        Case "FORMULARIOS_ANULADOS"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmFormulario_Anulado_Lista.Startup Then
                If frmFormulario_Anulado_Lista.LoadData(0) Then
                    frmFormulario_Anulado_Lista.Show
                    frmFormulario_Anulado_Lista.SetFocus
                Else
                    Unload frmFormulario_Anulado_Lista
                    Set frmFormulario_Anulado_Lista = Nothing
                End If
            Else
                Unload frmFormulario_Anulado_Lista
                Set frmFormulario_Anulado_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
    
        Case "FORMULARIOS_EXPORTAR"
            Screen.MousePointer = vbHourglass
            DoEvents
            frmFormulario_Exportar.Show
            Screen.MousePointer = vbDefault
            
        '/////////////////////////////////////////////////////////
        'INFORMES
        Case "INFORMES_LIBRO_MOVIMIENTOS_CEREAL"
            Screen.MousePointer = vbHourglass
            DoEvents
            If frmLibroMovimiento_Lista.Startup Then
                If frmLibroMovimiento_Lista.LoadData(0, 0, 0) Then
                    frmLibroMovimiento_Lista.Show
                    frmLibroMovimiento_Lista.SetFocus
                Else
                    Unload frmLibroMovimiento_Lista
                    Set frmLibroMovimiento_Lista = Nothing
                End If
            Else
                Unload frmLibroMovimiento_Lista
                Set frmLibroMovimiento_Lista = Nothing
            End If
            Screen.MousePointer = vbDefault
            
        Case "INFORMES_CONSULTA_STOCK_CEREAL"
            Screen.MousePointer = vbHourglass
            DoEvents
            frmConsulta_Cereal.Show
            frmConsulta_Cereal.SetFocus
            Screen.MousePointer = vbDefault
            
        Case "INFORMES_LIBRO_MOVIMIENTOS_SUBPRODUCTO"
            Screen.MousePointer = vbHourglass
            DoEvents
            frmConsulta_LibroSubproducto.Show
            frmConsulta_LibroSubproducto.SetFocus
            Screen.MousePointer = vbDefault
            
        Case "INFORMES_RESUMEN_FASON"
            Screen.MousePointer = vbHourglass
            DoEvents
            frmConsulta_Fason.Show
            frmConsulta_Fason.SetFocus
            Screen.MousePointer = vbDefault
    End Select
End Sub

Private Sub stbMain_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
    Select Case Panel.Key
        Case "USERNAME"
            mnuFileCloseSession_Click
    End Select
End Sub
