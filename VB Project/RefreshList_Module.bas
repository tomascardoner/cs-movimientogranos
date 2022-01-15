Attribute VB_Name = "RefreshList_Module"
Option Explicit

Public Function Entidad(ByVal IDEntidad As Long) As Boolean
    If CSM_Forms.IsLoaded("frmEntidad_Lista") Then
        frmEntidad_Lista.LoadData IDEntidad
    End If
    If CSM_Forms.IsLoaded("frmCartaPorte_Talonario_Lista") Then
        frmCartaPorte_Talonario_Lista.FillComboBox_Entidad
    End If
    If CSM_Forms.IsLoaded("frmCartaPorte_Talonario_Detalle") Then
        frmCartaPorte_Talonario_Detalle.FillComboBox_Entidad
    End If
    If CSM_Forms.IsLoaded("frmEntidad_OrigenDestino_Lista") Then
        frmEntidad_OrigenDestino_Lista.FillComboBox_Entidad
    End If
    If CSM_Forms.IsLoaded("frmEntidad_OrigenDestino_Detalle") Then
        frmEntidad_OrigenDestino_Detalle.FillComboBox_Entidad
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        frmMovimiento_Cereal_Lista.FillComboBox_Entidad_Remitente
        frmMovimiento_Cereal_Lista.FillComboBox_Entidad_Destinatario
        frmMovimiento_Cereal_Lista.FillComboBox_Entidad_Transportista
        frmMovimiento_Cereal_Lista.FillComboBox_Planta
        frmMovimiento_Cereal_Lista.LoadData 0
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Detalle") Then
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Titular
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Intermediario
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_RemitenteComercial
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Corredor
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Entregador
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Destinatario
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Destino
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Transportista
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Chofer
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Lista") Then
        frmMovimiento_SubProducto_Lista.FillComboBox_Entidad_Destinatario
        frmMovimiento_SubProducto_Lista.FillComboBox_Entidad_Transportista
        frmMovimiento_SubProducto_Lista.FillComboBox_Planta
        frmMovimiento_SubProducto_Lista.LoadData 0
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Detalle") Then
        frmMovimiento_SubProducto_Detalle.FillComboBox_Entidad_Titular
        frmMovimiento_SubProducto_Detalle.FillComboBox_Entidad_Destino
        frmMovimiento_SubProducto_Detalle.FillComboBox_Entidad_Transportista
        frmMovimiento_SubProducto_Detalle.FillComboBox_SubProducto
    End If
End Function

Public Function Entidad_Chofer(ByVal IDEntidad As Long) As Boolean
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Detalle") Then
        frmMovimiento_Cereal_Detalle.FillComboBox_Entidad_Chofer
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Detalle") Then
        frmMovimiento_SubProducto_Detalle.FillComboBox_Entidad_Chofer
    End If
End Function

Public Function Entidad_OrigDest(ByVal IDEntidad As Long, ByVal IDOrigenDestion As Long) As Boolean
    If CSM_Forms.IsLoaded("frmEntidad_OrigenDestino_Lista") Then
        frmEntidad_OrigenDestino_Lista.LoadData IDEntidad, IDOrigenDestion
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Detalle") Then
        frmMovimiento_Cereal_Detalle.FillComboBox_Procedencia
        frmMovimiento_Cereal_Detalle.FillComboBox_Destino
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Detalle") Then
        frmMovimiento_SubProducto_Detalle.FillComboBox_Destino
    End If
End Function

Public Function Entidad_Contacto(ByVal IDEntidad As Long, ByVal IDContacto As Byte) As Boolean
    If CSM_Forms.IsLoaded("frmEntidad_Contacto") Then
        frmEntidad_Contacto.LoadData IDEntidad, IDContacto
    End If
End Function

Public Function Cereal(ByVal IDCereal As Byte) As Boolean
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Detalle") Then
        frmMovimiento_Cereal_Detalle.FillComboBox_Cereal
    End If
End Function

Public Function SubProducto(ByVal IDSubProducto As Byte) As Boolean
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Detalle") Then
        frmMovimiento_SubProducto_Detalle.FillComboBox_SubProducto
        frmMovimiento_SubProducto_Detalle_Item.FillComboBox_SubProducto
    End If
End Function

Public Function Movimiento_Cereal(ByVal IDMovimiento_Cereal As Long) As Boolean
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        frmMovimiento_Cereal_Lista.LoadData IDMovimiento_Cereal
    End If
    If CSM_Forms.IsLoaded("frmContrato_Lista") Then
        frmContrato_Lista.LoadData 0
    End If
End Function

Public Function Movimiento_SubProducto(ByVal IDMovimiento_SubProducto As Long) As Boolean
    If CSM_Forms.IsLoaded("frmMovimiento_SubProducto_Lista") Then
        frmMovimiento_SubProducto_Lista.LoadData IDMovimiento_SubProducto
    End If
End Function

Public Function Formulario1116A(ByVal IDFormulario1116A As Long) As Boolean
    If CSM_Forms.IsLoaded("frmFormularioA_Lista") Then
        frmFormularioA_Lista.LoadData IDFormulario1116A
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        frmMovimiento_Cereal_Lista.LoadData 0
    End If
End Function

Public Function Formulario1116B(ByVal IDFormulario1116B As Long) As Boolean
    If CSM_Forms.IsLoaded("frmFormularioB_Lista") Then
        frmFormularioB_Lista.LoadData IDFormulario1116B
    End If
End Function

Public Function Formulario1116RT(ByVal IDFormulario1116RT As Long) As Boolean
    If CSM_Forms.IsLoaded("frmFormularioRT_Lista") Then
        frmFormularioRT_Lista.LoadData IDFormulario1116RT
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Lista") Then
        frmMovimiento_Cereal_Lista.LoadData 0
    End If
End Function

Public Function Formulario_Anulado(ByVal IDFormulario_Anulado As Long) As Boolean
    If CSM_Forms.IsLoaded("frmFormulario_Anulado_Lista") Then
        frmFormulario_Anulado_Lista.LoadData IDFormulario_Anulado
    End If
End Function

Public Function Localidad(ByVal IDLocalidad As Long) As Boolean
    If CSM_Forms.IsLoaded("frmLocalidad_Lista") Then
        frmLocalidad_Lista.LoadData IDLocalidad
    End If
End Function

Public Function Contrato(ByVal IDContrato As Long) As Boolean
    If CSM_Forms.IsLoaded("frmContrato_Lista") Then
        frmContrato_Lista.LoadData IDContrato
    End If
    If CSM_Forms.IsLoaded("frmMovimiento_Cereal_Detalle") Then
        frmMovimiento_Cereal_Detalle.FillComboBox_Contrato
    End If
End Function

Public Function ContratoLiquidacion(ByVal IDContrato As Long, ByVal IDLiquidacion As Byte) As Boolean
    If CSM_Forms.IsLoaded("frmContrato_Liquidacion") Then
        frmContrato_Liquidacion.LoadData IDContrato, IDLiquidacion
    End If
    If CSM_Forms.IsLoaded("frmContrato_Lista") Then
        frmContrato_Lista.LoadData IDContrato
    End If
End Function

Public Function MonedaCotizacion(ByVal IDMoneda As Integer, ByVal Fecha As Date) As Boolean
    If CSM_Forms.IsLoaded("frmMonedaCotizacion_Lista") Then
        frmMonedaCotizacion_Lista.LoadData IDMoneda, Fecha
    End If
End Function
