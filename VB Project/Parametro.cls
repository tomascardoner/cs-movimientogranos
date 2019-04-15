VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Parametro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'/////////////////////////////////////////////////////////////
'DATABASE PARAMETERS
'/////////////////////////////////////////////////////////////
Private mCompanyName As String

'FOR COMPATIBILITY
Public Database_CommandTimeout As Long
Public Database_Database As String

Private mDatabaseDescription As String

Private mCosecha_IDDefault As Byte
Private mFleteTabla_IDDefault As Long
Private mPlanta_IDDefault As Long

Private mMoneda_Default_ID As Integer
Private mMoneda_Dolar_ID As Integer
Private mMoneda_Euro_ID As Integer

Private mLibroMovimiento_Folios As Long
Private mLibroMovimiento_Lineas As Long

Private mGridEvenRowBackColor As Long
Private mGridEvenRowForeColor As Long
Private mGridOddRowBackColor As Long
Private mGridOddRowForeColor As Long
Private mGridHighlightRowBackColor As Long
Private mGridHighlightRowForeColor As Long

Private mMovimiento_Cereal_PermiteBrutoMayor45000 As Boolean
Private mMovimiento_Cereal_PermiteEntradaConDestinatarioDiferente As Boolean

Private mMovimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar As Boolean

Private mLocalidad_VerificarPartido As Boolean

Private mFormulario1116A_RemesasMaximo As Long
Private mFormulario1116A_RemesasDias As Byte
Private mFormulario1116RT_RemesasMaximo As Long

Private mPlanta_MostrarNombreEmpresa As Boolean

Private mAFIP_ConstanciaInscripcion_Link As String

Private mAFIP_ConsultaReFOG_Link As String
Private mAFIP_ConsultaReFOG_POST_Link As String
Private mAFIP_ConsultaReFOG_POST_Headers As String
Private mAFIP_ConsultaReFOG_POST_PostData As String

Public Refresh As Boolean

'/////////////////////////////////////////////////////////////

Public Function LoadParametersRegistry() As Boolean
    WriteLogEvent "Load Parameters From Registry: INIT", vbLogEventTypeInformation
    
    mGridEvenRowBackColor = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface", "GridEvenRowBackColor", &HFFC0C0, csrdtNumberInteger)
    mGridEvenRowForeColor = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface", "GridEvenRowForeColor", vbWindowText, csrdtNumberInteger)
    mGridOddRowBackColor = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface", "GridOddRowBackColor", vbWindowBackground, csrdtNumberInteger)
    mGridOddRowForeColor = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface", "GridOddRowForeColor", vbWindowText, csrdtNumberInteger)
    mGridHighlightRowBackColor = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface", "GridHighlightRowBackColor", vbHighlight, csrdtNumberInteger)
    mGridHighlightRowForeColor = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface", "GridHighlightRowForeColor", vbWindowBackground, csrdtNumberInteger)
    
    mMovimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar = CSM_Registry.GetValue_FromApplication_LocalMachine("Interface\Movimiento_Cereal_Lista", "Grid_Column_KilogramoFinal_Visible", False, csrdtBoolean)
    
    LoadParametersRegistry = True
    WriteLogEvent "Load Parameters From Registry: DONE", vbLogEventTypeInformation
End Function

Public Function LoadParametersDatabase() As Boolean
    Dim DES As CSC_Encryption_DES
    
    WriteLogEvent "Load Parameters From Database: INIT", vbLogEventTypeInformation
    
    'COMPANY NAME
    Set DES = New CSC_Encryption_DES
    mCompanyName = DES.DecryptString(pCSC_Parameter.GetParameterText("CompanyName", ""), DES.PASSWORD_ENCRYPTION_KEY)
    Set DES = Nothing
    
    'DATABASE DESCRIPTION
    mDatabaseDescription = pCSC_Parameter.GetParameterText("DatabaseDescription", "")
    
    'LIBRO DE MOVIENTOS
    mLibroMovimiento_Folios = pCSC_Parameter.GetParameterNumberInteger("LibroMovimiento_Folios")
    mLibroMovimiento_Lineas = pCSC_Parameter.GetParameterNumberInteger("LibroMovimiento_Lineas")
    
    'FORMULARIOS F1116
    mFormulario1116A_RemesasMaximo = pCSC_Parameter.GetParameterNumberInteger("Formulario1116A_RemesasMaximo", 0)
    mFormulario1116A_RemesasDias = pCSC_Parameter.GetParameterNumberInteger("Formulario1116A_RemesasDias", 15)
    mFormulario1116RT_RemesasMaximo = pCSC_Parameter.GetParameterNumberInteger("Formulario1116RT_RemesasMaximo", 6)
    
    mPlanta_MostrarNombreEmpresa = pCSC_Parameter.GetParameterBoolean("Planta_MostrarNombreEmpresa", False)
    
    mCosecha_IDDefault = pCSC_Parameter.GetParameterNumberInteger("Cosecha_IDDefault")
    mFleteTabla_IDDefault = pCSC_Parameter.GetParameterNumberInteger("FleteTabla_IDDefault")
    mPlanta_IDDefault = pCSC_Parameter.GetParameterNumberInteger("Planta_IDDefault")
    
    'MONEDAS
    mMoneda_Default_ID = pCSC_Parameter.GetParameterNumberInteger("Moneda_Default_ID")
    mMoneda_Dolar_ID = pCSC_Parameter.GetParameterNumberInteger("Moneda_Dolar_ID")
    mMoneda_Euro_ID = pCSC_Parameter.GetParameterNumberInteger("Moneda_Euro_ID")
    
    mMovimiento_Cereal_PermiteBrutoMayor45000 = pCSC_Parameter.GetParameterBoolean("Movimiento_Cereal_PermiteBrutoMayor45000", False)
    mMovimiento_Cereal_PermiteEntradaConDestinatarioDiferente = pCSC_Parameter.GetParameterBoolean("Movimiento_Cereal_PermiteEntradaConDestinatarioDiferente", False)
    
    mLocalidad_VerificarPartido = pCSC_Parameter.GetParameterBoolean("Localidad_VerificarPartido", True)
    
    'AFIP
    mAFIP_ConstanciaInscripcion_Link = pCSC_Parameter.GetParameterText("AFIP_ConstanciaInscripcion_Link", "")
    mAFIP_ConsultaReFOG_Link = pCSC_Parameter.GetParameterText("AFIP_ConsultaReFOG_Link", "")
    
    mAFIP_ConsultaReFOG_POST_Link = pCSC_Parameter.GetParameterText("AFIP_ConsultaReFOG_POST_Link", "")
    mAFIP_ConsultaReFOG_POST_Headers = pCSC_Parameter.GetParameterText("AFIP_ConsultaReFOG_POST_Headers", "")
    mAFIP_ConsultaReFOG_POST_PostData = pCSC_Parameter.GetParameterText("AFIP_ConsultaReFOG_POST_PostData", "")
    
    LoadParametersDatabase = True
    WriteLogEvent "Load Parameters From Database: DONE", vbLogEventTypeInformation
End Function

'/////////////////////////////////////////////////////////////////////////////
' COMPANY DATA
Public Property Get CompanyName() As String
    CompanyName = mCompanyName
End Property

'////////////////////////////////////////////////////////////////////////
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Public Property Get DatabaseDescription() As String
    DatabaseDescription = mDatabaseDescription
End Property

Public Property Let DatabaseDescription(ByVal Value As String)
    mDatabaseDescription = Value
    Call pCSC_Parameter.SetParameterText("DatabaseDescription", mDatabaseDescription)
End Property

Public Property Get Cosecha_IDDefault() As Byte
    Cosecha_IDDefault = mCosecha_IDDefault
End Property

Public Property Let Cosecha_IDDefault(ByVal Value As Byte)
    mCosecha_IDDefault = Value
End Property

Public Property Get FleteTabla_IDDefault() As Long
    FleteTabla_IDDefault = mFleteTabla_IDDefault
End Property

Public Property Let FleteTabla_IDDefault(ByVal Value As Long)
    mFleteTabla_IDDefault = Value
End Property

Public Property Get Planta_IDDefault() As Long
    Planta_IDDefault = mPlanta_IDDefault
End Property

Public Property Let Planta_IDDefault(ByVal Value As Long)
    mPlanta_IDDefault = Value
End Property

'/////////////////////////////////////////////////////////////////////////////
' MONEDAS
Public Property Get Moneda_Default_ID() As Long
    Moneda_Default_ID = mMoneda_Default_ID
End Property

Public Property Get Moneda_Dolar_ID() As Long
    Moneda_Dolar_ID = mMoneda_Dolar_ID
End Property

Public Property Get Moneda_Euro_ID() As Long
    Moneda_Euro_ID = mMoneda_Euro_ID
End Property

'/////////////////////////////////////////////////////////////////////////////
' LIBRO DE MOVIMIENTOS
Public Property Get LibroMovimiento_Folios() As Long
    LibroMovimiento_Folios = mLibroMovimiento_Folios
End Property

Public Property Let LibroMovimiento_Folios(ByVal Value As Long)
    mLibroMovimiento_Folios = Value
End Property

Public Property Get LibroMovimiento_Lineas() As Long
    LibroMovimiento_Lineas = mLibroMovimiento_Lineas
End Property

Public Property Let LibroMovimiento_Lineas(ByVal Value As Long)
    mLibroMovimiento_Lineas = Value
End Property

Public Property Get Formulario1116A_RemesasMaximo() As Long
    Formulario1116A_RemesasMaximo = mFormulario1116A_RemesasMaximo
End Property

Public Property Let Formulario1116A_RemesasMaximo(ByVal Value As Long)
    mFormulario1116A_RemesasMaximo = Value
End Property

Public Property Get Formulario1116A_RemesasDias() As Byte
    Formulario1116A_RemesasDias = mFormulario1116A_RemesasDias
End Property

Public Property Let Formulario1116A_RemesasDias(ByVal Value As Byte)
    mFormulario1116A_RemesasDias = Value
End Property

Public Property Get Formulario1116RT_RemesasMaximo() As Long
    Formulario1116RT_RemesasMaximo = mFormulario1116RT_RemesasMaximo
End Property

Public Property Let Formulario1116RT_RemesasMaximo(ByVal Value As Long)
    mFormulario1116RT_RemesasMaximo = Value
End Property

'/////////////////////////////////////////////////////////////////////////////

Public Property Get Planta_MostrarNombreEmpresa() As Boolean
    Planta_MostrarNombreEmpresa = mPlanta_MostrarNombreEmpresa
End Property

Public Property Let Planta_MostrarNombreEmpresa(ByVal Value As Boolean)
    mPlanta_MostrarNombreEmpresa = Value
End Property

'/////////////////////////////////////////////////////////////////////////////
'AFIP

Public Property Get AFIP_ConstanciaInscripcion_Link() As String
    AFIP_ConstanciaInscripcion_Link = mAFIP_ConstanciaInscripcion_Link
End Property

Public Property Get AFIP_ConsultaReFOG_Link() As String
    AFIP_ConsultaReFOG_Link = mAFIP_ConsultaReFOG_Link
End Property

Public Property Get AFIP_ConsultaReFOG_POST_Link() As String
    AFIP_ConsultaReFOG_POST_Link = mAFIP_ConsultaReFOG_POST_Link
End Property

Public Property Get AFIP_ConsultaReFOG_POST_Headers() As String
    AFIP_ConsultaReFOG_POST_Headers = mAFIP_ConsultaReFOG_POST_Headers
End Property

Public Property Get AFIP_ConsultaReFOG_POST_PostData() As String
    AFIP_ConsultaReFOG_POST_PostData = mAFIP_ConsultaReFOG_POST_PostData
End Property

'/////////////////////////////////////////////////////////////////////////////
'RESTRICCIONES
Public Property Get Movimiento_Cereal_PermiteBrutoMayor45000() As Boolean
    Movimiento_Cereal_PermiteBrutoMayor45000 = mMovimiento_Cereal_PermiteBrutoMayor45000
End Property

Public Property Let Movimiento_Cereal_PermiteBrutoMayor45000(ByVal Value As Boolean)
    mMovimiento_Cereal_PermiteBrutoMayor45000 = Value
End Property

Public Property Get Movimiento_Cereal_PermiteEntradaConDestinatarioDiferente() As Boolean
    Movimiento_Cereal_PermiteEntradaConDestinatarioDiferente = mMovimiento_Cereal_PermiteEntradaConDestinatarioDiferente
End Property

Public Property Let Movimiento_Cereal_PermiteEntradaConDestinatarioDiferente(ByVal Value As Boolean)
    mMovimiento_Cereal_PermiteEntradaConDestinatarioDiferente = Value
End Property

Public Property Get Localidad_VerificarPartido() As Boolean
    Localidad_VerificarPartido = mLocalidad_VerificarPartido
End Property

Public Property Let Localidad_VerificarPartido(ByVal Value As Boolean)
    mLocalidad_VerificarPartido = Value
End Property

'/////////////////////////////////////////////////////////////////////////////
' GRID ROWS COLOR
Public Property Get GridEvenRowBackColor() As Long
    GridEvenRowBackColor = mGridEvenRowBackColor
End Property

Public Property Let GridEvenRowBackColor(ByVal Value As Long)
    mGridEvenRowBackColor = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface", "GridEvenRowBackColor", mGridEvenRowBackColor)
End Property

Public Property Get GridEvenRowForeColor() As Long
    GridEvenRowForeColor = mGridEvenRowForeColor
End Property

Public Property Let GridEvenRowForeColor(ByVal Value As Long)
    mGridEvenRowForeColor = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface", "GridEvenRowForeColor", mGridEvenRowForeColor)
End Property

Public Property Get GridOddRowBackColor() As Long
    GridOddRowBackColor = mGridOddRowBackColor
End Property

Public Property Let GridOddRowBackColor(ByVal Value As Long)
    mGridOddRowBackColor = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface", "GridOddRowBackColor", mGridOddRowBackColor)
End Property

Public Property Get GridOddRowForeColor() As Long
    GridOddRowForeColor = mGridOddRowForeColor
End Property

Public Property Let GridOddRowForeColor(ByVal Value As Long)
    mGridOddRowForeColor = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface", "GridOddRowForeColor", mGridOddRowForeColor)
End Property

Public Property Get GridHighlightRowBackColor() As Long
    GridHighlightRowBackColor = mGridHighlightRowBackColor
End Property

Public Property Let GridHighlightRowBackColor(ByVal Value As Long)
    mGridHighlightRowBackColor = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface", "GridHighlightRowBackColor", mGridHighlightRowBackColor)
End Property

Public Property Get GridHighlightRowForeColor() As Long
    GridHighlightRowForeColor = mGridHighlightRowForeColor
End Property

Public Property Let GridHighlightRowForeColor(ByVal Value As Long)
    mGridHighlightRowForeColor = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface", "GridHighlightRowForeColor", mGridHighlightRowForeColor)
End Property

Public Property Get Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar() As Boolean
    Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar = mMovimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar
End Property

Public Property Let Movimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar(ByVal Value As Boolean)
    mMovimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar = Value
    Call CSM_Registry.SetValue_ToApplication_LocalMachine("Interface\Movimiento_Cereal_Lista", "Grid_Column_KilogramoFinal_Visible", mMovimiento_Cereal_Lista_Columna_KilogramoFinal_Mostrar)
End Property

