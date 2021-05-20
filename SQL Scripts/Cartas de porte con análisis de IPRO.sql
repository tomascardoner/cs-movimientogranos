SELECT mc.IDMovimiento_Cereal, mc.ComprobanteNumero, mc.FechaCarga, et.Nombre, mc.DeclaraIPRO, mca.Fecha AS FechaAnalisis, mca.MuestraNumero, mca.ResultadoIPRO
	FROM Movimiento_Cereal AS mc LEFT JOIN Movimiento_Cereal_Analisis AS mca ON mc.IDMovimiento_Cereal = mca.IDMovimiento_Cereal
		INNER JOIN Entidad AS et ON mc.IDEntidad_Titular = et.IDEntidad
	WHERE mc.IDCereal = 3 AND mc.IDCosecha = 20 AND mc.Tipo = 'E' AND mc.IDOrigenDestino_Destino = 1
	ORDER BY mc.ComprobanteNumero