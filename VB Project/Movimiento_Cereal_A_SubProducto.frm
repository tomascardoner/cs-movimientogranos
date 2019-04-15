VERSION 5.00
Object = "{562E3E04-2C31-4ECE-83F4-4017EEE51D40}#8.0#0"; "todg8.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "msdatlst.ocx"
Begin VB.Form frmMovimiento_Cereal_A_SubProducto 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Conversión de Cereal a SubProducto"
   ClientHeight    =   4545
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5640
   Icon            =   "Movimiento_Cereal_A_SubProducto.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   5640
   Begin VB.TextBox txtTotalKilogramo 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   4380
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   3420
      Width           =   1095
   End
   Begin VB.TextBox txtTotalPorcentaje 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      ForeColor       =   &H8000000D&
      Height          =   315
      Left            =   2400
      Locked          =   -1  'True
      TabIndex        =   11
      Top             =   3420
      Width           =   855
   End
   Begin VB.CommandButton cmdConvertir 
      Caption         =   "Convertir"
      Default         =   -1  'True
      Height          =   375
      Left            =   3540
      TabIndex        =   9
      Top             =   4020
      Width           =   915
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4560
      TabIndex        =   10
      Top             =   4020
      Width           =   915
   End
   Begin TrueOleDBGrid80.TDBGrid tdbgrdData 
      Height          =   1335
      Left            =   120
      TabIndex        =   8
      Top             =   1980
      Width           =   5355
      _ExtentX        =   9446
      _ExtentY        =   2355
      _LayoutType     =   4
      _RowHeight      =   -2147483647
      _WasPersistedAsPixels=   0
      Columns(0)._VlistStyle=   0
      Columns(0)._MaxComboItems=   5
      Columns(0).Caption=   "IDSubProducto"
      Columns(0).DataField=   "IDSubProducto"
      Columns(0)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(1)._VlistStyle=   0
      Columns(1)._MaxComboItems=   5
      Columns(1).Caption=   "SubProducto"
      Columns(1).DataField=   "SubProductoNombre"
      Columns(1)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(2)._VlistStyle=   0
      Columns(2)._MaxComboItems=   5
      Columns(2).Caption=   "Porcentaje"
      Columns(2).DataField=   "Porcentaje"
      Columns(2).NumberFormat=   "##0.00"
      Columns(2)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns(3)._VlistStyle=   0
      Columns(3)._MaxComboItems=   5
      Columns(3).Caption=   "Kilogramos"
      Columns(3).DataField=   "Kilogramos"
      Columns(3).NumberFormat=   "#,##0"
      Columns(3)._PropDict=   "_MaxComboItems,516,2;_VlistStyle,514,3"
      Columns.Count   =   4
      Splits(0)._UserFlags=   0
      Splits(0).AllowRowSizing=   0   'False
      Splits(0).RecordSelectors=   0   'False
      Splits(0).RecordSelectorWidth=   953
      Splits(0)._SavedRecordSelectors=   0   'False
      Splits(0).AlternatingRowStyle=   -1  'True
      Splits(0).DividerColor=   15790320
      Splits(0).SpringMode=   0   'False
      Splits(0)._PropDict=   "_ColumnProps,515,0;_UserFlags,518,3"
      Splits(0)._ColumnProps(0)=   "Columns.Count=4"
      Splits(0)._ColumnProps(1)=   "Column(0).Width=2725"
      Splits(0)._ColumnProps(2)=   "Column(0).DividerColor=0"
      Splits(0)._ColumnProps(3)=   "Column(0)._WidthInPix=2646"
      Splits(0)._ColumnProps(4)=   "Column(0).AllowSizing=0"
      Splits(0)._ColumnProps(5)=   "Column(0)._ColStyle=8196"
      Splits(0)._ColumnProps(6)=   "Column(0).Visible=0"
      Splits(0)._ColumnProps(7)=   "Column(0).AllowFocus=0"
      Splits(0)._ColumnProps(8)=   "Column(0).Order=1"
      Splits(0)._ColumnProps(9)=   "Column(1).Width=5292"
      Splits(0)._ColumnProps(10)=   "Column(1).DividerColor=0"
      Splits(0)._ColumnProps(11)=   "Column(1)._WidthInPix=5212"
      Splits(0)._ColumnProps(12)=   "Column(1)._ColStyle=8704"
      Splits(0)._ColumnProps(13)=   "Column(1).AllowFocus=0"
      Splits(0)._ColumnProps(14)=   "Column(1).Order=2"
      Splits(0)._ColumnProps(15)=   "Column(2).Width=1773"
      Splits(0)._ColumnProps(16)=   "Column(2).DividerColor=0"
      Splits(0)._ColumnProps(17)=   "Column(2)._WidthInPix=1693"
      Splits(0)._ColumnProps(18)=   "Column(2)._ColStyle=514"
      Splits(0)._ColumnProps(19)=   "Column(2).Order=3"
      Splits(0)._ColumnProps(20)=   "Column(3).Width=1773"
      Splits(0)._ColumnProps(21)=   "Column(3).DividerColor=0"
      Splits(0)._ColumnProps(22)=   "Column(3)._WidthInPix=1693"
      Splits(0)._ColumnProps(23)=   "Column(3)._ColStyle=514"
      Splits(0)._ColumnProps(24)=   "Column(3).Order=4"
      Splits.Count    =   1
      PrintInfos(0)._StateFlags=   3
      PrintInfos(0).Name=   "piInternal 0"
      PrintInfos(0).PageHeaderFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageFooterFont=   "Size=8.25,Charset=0,Weight=400,Underline=0,Italic=0,Strikethrough=0,Name=MS Sans Serif"
      PrintInfos(0).PageHeaderHeight=   0
      PrintInfos(0).PageFooterHeight=   0
      PrintInfos.Count=   1
      DataMode        =   4
      DefColWidth     =   0
      HeadLines       =   1
      FootLines       =   1
      TabAction       =   1
      MultipleLines   =   0
      CellTipsWidth   =   0
      DeadAreaBackColor=   15790320
      RowDividerColor =   15790320
      RowSubDividerColor=   15790320
      DirectionAfterEnter=   1
      MaxRows         =   250000
      ViewColumnCaptionWidth=   0
      ViewColumnWidth =   0
      _PropDict       =   "_ExtentX,2003,3;_ExtentY,2004,3;_LayoutType,512,2;_RowHeight,16,3;_StyleDefs,513,0;_WasPersistedAsPixels,516,2"
      _StyleDefs(0)   =   "_StyleRoot:id=0,.parent=-1,.alignment=3,.valignment=0,.bgcolor=&H80000005&"
      _StyleDefs(1)   =   ":id=0,.fgcolor=&H80000008&,.wraptext=0,.locked=0,.transparentBmp=0"
      _StyleDefs(2)   =   ":id=0,.fgpicPosition=0,.bgpicMode=0,.appearance=0,.borderSize=0,.ellipsis=0"
      _StyleDefs(3)   =   ":id=0,.borderColor=&H80000005&,.borderType=0,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(4)   =   ":id=0,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(5)   =   ":id=0,.fontname=MS Sans Serif"
      _StyleDefs(6)   =   "Style:id=1,.parent=0,.namedParent=33,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(7)   =   ":id=1,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(8)   =   ":id=1,.fontname=MS Sans Serif"
      _StyleDefs(9)   =   "CaptionStyle:id=4,.parent=2,.namedParent=37"
      _StyleDefs(10)  =   "HeadingStyle:id=2,.parent=1,.namedParent=34,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(11)  =   ":id=2,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(12)  =   ":id=2,.fontname=MS Sans Serif"
      _StyleDefs(13)  =   "FooterStyle:id=3,.parent=1,.namedParent=35,.bold=0,.fontsize=825,.italic=0"
      _StyleDefs(14)  =   ":id=3,.underline=0,.strikethrough=0,.charset=0"
      _StyleDefs(15)  =   ":id=3,.fontname=MS Sans Serif"
      _StyleDefs(16)  =   "InactiveStyle:id=5,.parent=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(17)  =   "SelectedStyle:id=6,.parent=1,.namedParent=36"
      _StyleDefs(18)  =   "EditorStyle:id=7,.parent=1"
      _StyleDefs(19)  =   "HighlightRowStyle:id=8,.parent=1,.namedParent=38"
      _StyleDefs(20)  =   "EvenRowStyle:id=9,.parent=1,.namedParent=39"
      _StyleDefs(21)  =   "OddRowStyle:id=10,.parent=1,.namedParent=40"
      _StyleDefs(22)  =   "RecordSelectorStyle:id=11,.parent=2,.namedParent=41"
      _StyleDefs(23)  =   "FilterBarStyle:id=12,.parent=1,.namedParent=42"
      _StyleDefs(24)  =   "Splits(0).Style:id=13,.parent=1"
      _StyleDefs(25)  =   "Splits(0).CaptionStyle:id=22,.parent=4"
      _StyleDefs(26)  =   "Splits(0).HeadingStyle:id=14,.parent=2"
      _StyleDefs(27)  =   "Splits(0).FooterStyle:id=15,.parent=3"
      _StyleDefs(28)  =   "Splits(0).InactiveStyle:id=16,.parent=5"
      _StyleDefs(29)  =   "Splits(0).SelectedStyle:id=18,.parent=6"
      _StyleDefs(30)  =   "Splits(0).EditorStyle:id=17,.parent=7"
      _StyleDefs(31)  =   "Splits(0).HighlightRowStyle:id=19,.parent=8"
      _StyleDefs(32)  =   "Splits(0).EvenRowStyle:id=20,.parent=9"
      _StyleDefs(33)  =   "Splits(0).OddRowStyle:id=21,.parent=10"
      _StyleDefs(34)  =   "Splits(0).RecordSelectorStyle:id=23,.parent=11"
      _StyleDefs(35)  =   "Splits(0).FilterBarStyle:id=24,.parent=12"
      _StyleDefs(36)  =   "Splits(0).Columns(0).Style:id=50,.parent=13,.locked=-1"
      _StyleDefs(37)  =   "Splits(0).Columns(0).HeadingStyle:id=47,.parent=14"
      _StyleDefs(38)  =   "Splits(0).Columns(0).FooterStyle:id=48,.parent=15"
      _StyleDefs(39)  =   "Splits(0).Columns(0).EditorStyle:id=49,.parent=17"
      _StyleDefs(40)  =   "Splits(0).Columns(1).Style:id=28,.parent=13,.alignment=0,.locked=-1"
      _StyleDefs(41)  =   "Splits(0).Columns(1).HeadingStyle:id=25,.parent=14,.alignment=2"
      _StyleDefs(42)  =   "Splits(0).Columns(1).FooterStyle:id=26,.parent=15"
      _StyleDefs(43)  =   "Splits(0).Columns(1).EditorStyle:id=27,.parent=17"
      _StyleDefs(44)  =   "Splits(0).Columns(2).Style:id=32,.parent=13,.alignment=1"
      _StyleDefs(45)  =   "Splits(0).Columns(2).HeadingStyle:id=29,.parent=14,.alignment=2"
      _StyleDefs(46)  =   "Splits(0).Columns(2).FooterStyle:id=30,.parent=15"
      _StyleDefs(47)  =   "Splits(0).Columns(2).EditorStyle:id=31,.parent=17"
      _StyleDefs(48)  =   "Splits(0).Columns(3).Style:id=46,.parent=13,.alignment=1"
      _StyleDefs(49)  =   "Splits(0).Columns(3).HeadingStyle:id=43,.parent=14,.alignment=2"
      _StyleDefs(50)  =   "Splits(0).Columns(3).FooterStyle:id=44,.parent=15"
      _StyleDefs(51)  =   "Splits(0).Columns(3).EditorStyle:id=45,.parent=17"
      _StyleDefs(52)  =   "Named:id=33:Normal"
      _StyleDefs(53)  =   ":id=33,.parent=0"
      _StyleDefs(54)  =   "Named:id=34:Heading"
      _StyleDefs(55)  =   ":id=34,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(56)  =   ":id=34,.wraptext=-1"
      _StyleDefs(57)  =   "Named:id=35:Footing"
      _StyleDefs(58)  =   ":id=35,.parent=33,.valignment=2,.bgcolor=&H8000000F&,.fgcolor=&H80000012&"
      _StyleDefs(59)  =   "Named:id=36:Selected"
      _StyleDefs(60)  =   ":id=36,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(61)  =   "Named:id=37:Caption"
      _StyleDefs(62)  =   ":id=37,.parent=34,.alignment=2"
      _StyleDefs(63)  =   "Named:id=38:HighlightRow"
      _StyleDefs(64)  =   ":id=38,.parent=33,.bgcolor=&H8000000D&,.fgcolor=&H8000000E&"
      _StyleDefs(65)  =   "Named:id=39:EvenRow"
      _StyleDefs(66)  =   ":id=39,.parent=33,.bgcolor=&HFFFF00&"
      _StyleDefs(67)  =   "Named:id=40:OddRow"
      _StyleDefs(68)  =   ":id=40,.parent=33"
      _StyleDefs(69)  =   "Named:id=41:RecordSelector"
      _StyleDefs(70)  =   ":id=41,.parent=34"
      _StyleDefs(71)  =   "Named:id=42:FilterBar"
      _StyleDefs(72)  =   ":id=42,.parent=33"
   End
   Begin VB.TextBox txtPesoNeto 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1260
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   960
      Width           =   1095
   End
   Begin VB.TextBox txtFecha 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1260
      Locked          =   -1  'True
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   540
      Width           =   1755
   End
   Begin VB.TextBox txtComprobanteNumero 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1260
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   1755
   End
   Begin MSDataListLib.DataCombo datcboSubProducto 
      Height          =   315
      Left            =   2040
      TabIndex        =   7
      Top             =   1500
      Width           =   3435
      _ExtentX        =   6059
      _ExtentY        =   556
      _Version        =   393216
      MatchEntry      =   -1  'True
      Style           =   2
      Text            =   ""
   End
   Begin VB.Label lblTotalKilogramo 
      Caption         =   "Total Kgs.:"
      Height          =   195
      Left            =   3420
      TabIndex        =   14
      Top             =   3480
      Width           =   855
   End
   Begin VB.Label lblTotalPorcentaje 
      Caption         =   "Total %:"
      Height          =   195
      Left            =   1620
      TabIndex        =   12
      Top             =   3480
      Width           =   675
   End
   Begin VB.Label lblSubProducto_Grupo 
      AutoSize        =   -1  'True
      Caption         =   "Grupo de SubProductos:"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Top             =   1560
      Width           =   1755
   End
   Begin VB.Label lblPesoNeto 
      AutoSize        =   -1  'True
      Caption         =   "Peso Neto:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1020
      Width           =   795
   End
   Begin VB.Label lblFecha 
      AutoSize        =   -1  'True
      Caption         =   "Fecha:"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   495
   End
   Begin VB.Label lblComprobanteNumero 
      AutoSize        =   -1  'True
      Caption         =   "Comprobante:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   1005
   End
End
Attribute VB_Name = "frmMovimiento_Cereal_A_SubProducto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mColumnsResized As Boolean

Private mKeyDecimal As Boolean

Private maDataTypes() As ADODB.DataTypeEnum
Private mOrderColumn As Long
Private mOrderAscending As Boolean

Private mLoading As Boolean

Private mMovimiento_Cereal As Movimiento_Cereal

Private Const GRID_COLUMN_IDSUBPRODUCTO As Integer = 0
Private Const GRID_COLUMN_SUBPRODUCTONOMBRE As Integer = 1
Private Const GRID_COLUMN_PORCENTAJE As Integer = 2
Private Const GRID_COLUMN_KILOGRAMO As Integer = 3

Public Function Startup(ByRef Movimiento_Cereal As Movimiento_Cereal) As Boolean
    Set mMovimiento_Cereal = Movimiento_Cereal
    
    mLoading = True
    
    Load Me
    
    txtComprobanteNumero.Text = mMovimiento_Cereal.ComprobanteNumero
    txtFecha.Text = mMovimiento_Cereal.FechaCarga_Formatted
    txtPesoNeto.Text = mMovimiento_Cereal.PesoNeto_Formatted
    
    Call CSM_Control_DataCombo.FillFromSQL(datcboSubProducto, "usp_SubProducto_Grupo_List NULL", "IDSubProducto_Grupo", "Nombre", "Grupos de SubProductos", cscpFirstIfUnique)
    
    'CALCULO CON LOS PORCENTAJES PREDETERMINADOS
    tdbgrdData.Visible = False
    tdbgrdData.MoveFirst
    Do While Not tdbgrdData.EOF
        Call tdbgrdData_AfterColUpdate(GRID_COLUMN_PORCENTAJE)
        tdbgrdData.MoveNext
    Loop
    tdbgrdData.MoveFirst
    tdbgrdData.Visible = True
    
    Startup = True
    mLoading = False
End Function

Private Sub cmdCancelar_Click()
    Unload frmMovimiento_Cereal_A_SubProducto
End Sub

Private Sub cmdConvertir_Click()
    Dim IDSubProductoPorcentajeAndKilogramo_StringList As String
    
    If datcboSubProducto.BoundText = "" Then
        MsgBox "Debe seleccionar el Grupo de SubProductos.", vbInformation, App.Title
        datcboSubProducto.SetFocus
        Exit Sub
    End If
    
    Call CalculateAndRefreshTotals
    
    'VERIFICO EL PORCENTAJE
    If CCur(txtTotalPorcentaje.Text) <= 0 Then
        MsgBox "El Porcentaje Total debe ser mayor a cero.", vbInformation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    If CCur(txtTotalPorcentaje.Text) > 100 Then
        MsgBox "El Porcentaje Total debe ser menor o igual a cien.", vbInformation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    
    'VERIFICO LOS KILOGRAMOS
    If CLng(txtTotalKilogramo.Text) <= 0 Then
        MsgBox "Los Kilogramos Totales deben ser mayores a cero.", vbInformation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
    If CLng(txtTotalKilogramo.Text) > CLng(txtPesoNeto.Text) Then
        MsgBox "Los Kilogramos Totales deben ser iguales o menores al Peso Neto.", vbInformation, App.Title
        tdbgrdData.SetFocus
        Exit Sub
    End If
        
    'VERIFICO Y AGREGO LOS VALORES DE LA GRILLA
    tdbgrdData.Visible = False
    tdbgrdData.MoveFirst
    Do While Not tdbgrdData.EOF
        If IsNull(tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value) Then
            MsgBox "Debe ingresar el Porcentaje de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & ".", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        ElseIf tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value = "" Then
            MsgBox "Debe ingresar El Porcentaje de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " .", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        ElseIf CCur(tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value) <= 0 Then
            MsgBox "El Porcentaje de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " debe ser mayor a cero.", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        ElseIf CCur(tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value) > 100 Then
            MsgBox "El Porcentaje de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " debe ser menor a cien.", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        End If
        
        If IsNull(tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value) Then
            MsgBox "Debe ingresar los Kilogramos de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " resultantes.", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        ElseIf tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value = "" Then
            MsgBox "Debe ingresar los Kilogramos de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " resultantes.", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        ElseIf CLng(tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value) <= 0 Then
            MsgBox "Los Kilogramos de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " deben ser mayores a cero.", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        ElseIf CLng(tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value) > CLng(txtPesoNeto.Text) Then
            MsgBox "Los Kilogramos de " & tdbgrdData.Columns(GRID_COLUMN_SUBPRODUCTONOMBRE).Value & " deben ser menores al Peso Neto.", vbInformation, App.Title
            tdbgrdData.Visible = True
            tdbgrdData.SetFocus
            Exit Sub
        End If
        
        IDSubProductoPorcentajeAndKilogramo_StringList = IDSubProductoPorcentajeAndKilogramo_StringList & CStr(tdbgrdData.Columns(GRID_COLUMN_IDSUBPRODUCTO).Value) & STRING_LIST_DELIMITER & CSM_String.FormatDecimalToSQL(tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value) & STRING_LIST_DELIMITER & CStr(tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value) & STRING_LIST_SEPARATOR
        
        tdbgrdData.MoveNext
    Loop
    tdbgrdData.MoveFirst
    tdbgrdData.Visible = True
    tdbgrdData.ReBind
    
    If mMovimiento_Cereal.ConvertirASubProducto(IDSubProductoPorcentajeAndKilogramo_StringList) Then
        MsgBox "Se ha generado la Conversión a SubProducto.", vbInformation, App.Title
        Unload Me
        Exit Sub
    End If
End Sub

Private Sub Form_Load()
    Call CSM_Forms.CenterToParent(frmMDI, Me)
    
    Call SetTrueDBGridAppearance
    
    mOrderColumn = GRID_COLUMN_SUBPRODUCTONOMBRE
    mOrderAscending = True
    
    Call CSM_Control_TextBox.PrepareAll(Me)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    mKeyDecimal = CSM_Control_TextBox.CheckKeyDown(ActiveControl, KeyCode)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Call CSM_Control_TextBox.CheckKeyPress(ActiveControl, KeyAscii, mKeyDecimal)
End Sub

Private Sub CalculateAndRefreshTotals()
    Dim XArrayDB As XArrayDBObject.XArrayDB
    Dim ArrayIndex As Byte
    Dim TotalPorcentaje As Currency
    Dim TotalKilogramo As Long

    Set XArrayDB = tdbgrdData.Array
    If Not XArrayDB Is Nothing Then
        For ArrayIndex = 0 To XArrayDB.Count(1) - 1
            If Not IsNull(XArrayDB(ArrayIndex, GRID_COLUMN_PORCENTAJE)) Then
                If IsNumeric(XArrayDB(ArrayIndex, GRID_COLUMN_PORCENTAJE)) Then
                    TotalPorcentaje = TotalPorcentaje + XArrayDB(ArrayIndex, GRID_COLUMN_PORCENTAJE)
                End If
            End If
            If Not IsNull(XArrayDB(ArrayIndex, GRID_COLUMN_KILOGRAMO)) Then
                If IsNumeric(XArrayDB(ArrayIndex, GRID_COLUMN_KILOGRAMO)) Then
                    TotalKilogramo = TotalKilogramo + XArrayDB(ArrayIndex, GRID_COLUMN_KILOGRAMO)
                End If
            End If
        Next ArrayIndex
    End If

    txtTotalPorcentaje.Text = Format(TotalPorcentaje, "##0.00")
    txtTotalKilogramo.Text = Format(TotalKilogramo, "#,##0")
End Sub

Public Sub SetTrueDBGridAppearance()
    With tdbgrdData
        .EvenRowStyle.BackColor = pParametro.GridEvenRowBackColor
        .EvenRowStyle.ForeColor = pParametro.GridEvenRowForeColor
        .OddRowStyle.BackColor = pParametro.GridOddRowBackColor
        .OddRowStyle.ForeColor = pParametro.GridOddRowForeColor
        .HighlightRowStyle.BackColor = pParametro.GridHighlightRowBackColor
        .HighlightRowStyle.ForeColor = pParametro.GridHighlightRowForeColor
        
        '.MultipleLines = IIf(pParametro.GridMultipleLines, TrueOleDBGrid80.MultipleLinesConstants.dbgMultipleVariable, TrueOleDBGrid80.MultipleLinesConstants.dbgDisabled)
        
        '.Columns("KilogramoFinal").Visible = pParametro.Movimiento_Lista_Columna_KilogramoFinal_Mostrar
    End With
End Sub

Private Sub datcboSubProducto_Change()
    Call tdbgrdData_Fill
End Sub

Private Sub tdbgrdData_Fill()
    Dim cmdData As ADODB.command
    Dim recData As ADODB.Recordset
    Dim XArrayDB As XArrayDBObject.XArrayDB
    
    Set XArrayDB = New XArrayDBObject.XArrayDB
    
    If Val(datcboSubProducto.BoundText) = 0 Then
        Set tdbgrdData.Array = XArrayDB
        tdbgrdData.ReBind
        
        Call CalculateAndRefreshTotals
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    
    If pIsCompiled Then
        On Error GoTo ErrorHandler
    End If
    
    Set cmdData = New ADODB.command
    With cmdData
        Set .ActiveConnection = pDatabase.Connection
        .CommandText = "usp_SubProducto_Grupo_Detalle_List"
        .CommandType = adCmdStoredProc

        .Parameters.Append .CreateParameter("IDSubProducto_Grupo", adTinyInt, adParamInput, , Val(datcboSubProducto.BoundText))
    End With
    Set recData = New ADODB.Recordset
    recData.Open cmdData, , adOpenForwardOnly, adLockReadOnly, adCmdStoredProc
    
    If Not recData.EOF Then
        Call XArrayDB.LoadRows(recData.GetRows())
    End If
    Set tdbgrdData.Array = XArrayDB
    tdbgrdData.ReBind
    
    Call CalculateAndRefreshTotals
    
    maDataTypes = pDatabase.GetDataTypeArrayFromRecordset(recData)
    
    If Not recData.EOF Then
        Call tdbgrdData_SortColumn(mOrderColumn)
    End If
    
    recData.Close
    Set recData = Nothing
    
    Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
    Call CSM_Error.ShowErrorMessage("Forms.Movimiento_Cereal_A_SubProducto.tdbgrdData_Fill", "Error al listar los SubProductos.")
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mMovimiento_Cereal = Nothing
    Set frmMovimiento_Cereal_A_SubProducto = Nothing
End Sub

Private Sub tdbgrdData_SelChange(Cancel As Integer)
    Dim OldOrderColumn As Long
    
    If tdbgrdData.SelStartCol <> tdbgrdData.SelEndCol Then
        tdbgrdData.SelEndCol = tdbgrdData.SelStartCol
    End If
    If tdbgrdData.SelStartCol + 1 = mOrderColumn Then
        mOrderAscending = Not mOrderAscending
    Else
        mOrderAscending = True
    End If
    OldOrderColumn = mOrderColumn
    mOrderColumn = tdbgrdData.SelStartCol + 1
    tdbgrdData.SelStartCol = -1
    tdbgrdData.SelEndCol = -1
    
    Call tdbgrdData_SortColumn(OldOrderColumn)
End Sub

Private Sub tdbgrdData_ColResize(ByVal ColIndex As Integer, Cancel As Integer)
    mColumnsResized = True
End Sub

Private Sub tdbgrdData_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case vbKeyHome
            tdbgrdData.MoveFirst
        Case vbKeyEnd
            tdbgrdData.MoveLast
    End Select
End Sub

Private Sub tdbgrdData_DblClick()
    'tlbMain_ButtonClick tlbMain.Buttons("PROPERTIES")
End Sub

Private Sub tdbgrdData_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
    Dim OldValueNumeric As Currency
    
    If IsNumeric(OldValue) Then
        OldValueNumeric = CCur(OldValue)
    Else
        OldValueNumeric = 0
    End If
    
    If ColIndex = GRID_COLUMN_PORCENTAJE Or ColIndex = GRID_COLUMN_KILOGRAMO Then
        If tdbgrdData.Columns(ColIndex).Value <> "" Then
            If IsNumeric(tdbgrdData.Columns(ColIndex).Value) Then
                Select Case CCur(tdbgrdData.Columns(ColIndex).Value)
                    Case 0  'INGRESÓ CERO, CALCULO EN EL AFTERUPDATE
                    
                    Case Is < 0
                        'EL VALOR INGRESADO ES MENOR A CERO, RESTAURO EL VALOR ORIGINAL
                        tdbgrdData.Columns(ColIndex).Value = OldValue
                        Cancel = True
                    
                    Case CCur(tdbgrdData.Columns(ColIndex).Value) > 100 And ColIndex = GRID_COLUMN_PORCENTAJE
                        'EL VALOR DEL PORCENTAJE ES MAYOR A 100, RESTAURO EL VALOR ORIGINAL
                        tdbgrdData.Columns(ColIndex).Value = OldValue
                        Cancel = True
                    
                    Case CCur(tdbgrdData.Columns(ColIndex).Value) > CLng(txtPesoNeto.Text) And ColIndex = GRID_COLUMN_KILOGRAMO
                        'EL VALOR DE LOS KILOGRAMOS ES MAYOR AL PESO TOTAL, RESTAURO EL VALOR ORIGINAL
                        tdbgrdData.Columns(ColIndex).Value = OldValue
                        Cancel = True
                        
                    Case Else
                        'EL VALOR INGRESADO ES CORRECTO, CALCULO EN EL AFTERUPDATE
                End Select
            Else
                'EL VALOR NO ES NUMÉRICO, RESTAURO EL VALOR ORIGINAL
                tdbgrdData.Columns(ColIndex).Value = OldValue
                Cancel = True
            End If
        Else
            'SE ELIMINÓ EL VALOR, CALCULO EN EL AFTERUPDATE
        End If
    End If
End Sub

Private Sub tdbgrdData_AfterColUpdate(ByVal ColIndex As Integer)
    'CALCULO EL PORCENTAJE O LOS KILOGRAMOS, SEGUN CORRESPONDA
    Select Case ColIndex
        Case GRID_COLUMN_PORCENTAJE
            If tdbgrdData.Columns(ColIndex).Value = "" Then
                tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value = ""
            Else
                tdbgrdData.Columns(GRID_COLUMN_KILOGRAMO).Value = Round(CLng(txtPesoNeto.Text) * CCur(tdbgrdData.Columns(ColIndex).Value) / 100, 0)
            End If
        Case GRID_COLUMN_KILOGRAMO
            If tdbgrdData.Columns(ColIndex).Value = "" Then
                tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value = ""
            Else
                tdbgrdData.Columns(GRID_COLUMN_PORCENTAJE).Value = Round(CLng(tdbgrdData.Columns(ColIndex).Value) / CLng(txtPesoNeto.Text) * 100, 1)
            End If
    End Select
    tdbgrdData.Update
    
    Call CalculateAndRefreshTotals
End Sub

Private Sub tdbgrdData_SortColumn(ByVal OldOrderColumn As Long)
    Dim XArrayDB As XArrayDBObject.XArrayDB

    Set XArrayDB = tdbgrdData.Array
    If Not XArrayDB Is Nothing Then
        Call XArrayDB.QuickSort(0, XArrayDB.UpperBound(1), mOrderColumn - 1, IIf(mOrderAscending, XORDER_ASCEND, XORDER_DESCEND), CSM_XArrayDB.ConvertADOTypeToXTYPE(maDataTypes(mOrderColumn - 1)))
        tdbgrdData.ReBind
    End If

    'ICONOS
    tdbgrdData.Columns(OldOrderColumn - 1).HeadingStyle.ForegroundPicture = 0
    tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicturePosition = dbgFPRightOfText
    tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.TransparentForegroundPicture = True
    If mOrderAscending Then
        Set tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_ASC", vbResBitmap)
    Else
        Set tdbgrdData.Columns(mOrderColumn - 1).HeadingStyle.ForegroundPicture = LoadResPicture("SORT_DESC", vbResBitmap)
    End If
End Sub

Private Sub tdbgrdData_LostFocus()
    tdbgrdData.Update
End Sub
