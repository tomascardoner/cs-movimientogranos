USE CSMovimientoGranos
GO

SELECT FechaCarga AS Fecha, CASE mc.Tipo WHEN 'E' THEN 'Ingreso' ELSE 'Egreso' END AS Tipo, ComprobanteNumeroConFormato AS NumeroCP, CTGNumero AS CTG, PesoFinal
	FROM Movimiento_Cereal AS mc
	WHERE mc.IDCartaPorte_MotivoAnulacion IS NULL
		AND mc.IDCereal = 3
		AND ((mc.Tipo = 'E' AND mc.IDEntidad_Titular = 2)
			OR (mc.Tipo = 'S'
				AND ((ISNULL(mc.IDEntidad_Intermediario, 0) <> 0 AND mc.IDEntidad_Intermediario = 2)
					OR mc.IDEntidad_RemitenteComercial = 2)))
		AND mc.FechaCarga BETWEEN '2022-07-01' AND '2023-06-30'
	ORDER BY Fecha, NumeroCP