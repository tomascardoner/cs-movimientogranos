USE CSMovimientoGranos
GO

SELECT SUM(ROUND(ToneladaTrigo * dbo.ObtenerPrecioPromedio(Dia1PrecioTrigo, Dia2PrecioTrigo, Dia3PrecioTrigo), 2) +
		ROUND(ToneladaMaiz * dbo.ObtenerPrecioPromedio(Dia1PrecioMaiz, Dia2PrecioMaiz, Dia3PrecioMaiz), 2) +
		ROUND(ToneladaSoja * dbo.ObtenerPrecioPromedio(Dia1PrecioSoja, Dia2PrecioSoja, Dia3PrecioSoja), 2)) AS SubTotal
	FROM Almacenaje
	WHERE Anio = 2024