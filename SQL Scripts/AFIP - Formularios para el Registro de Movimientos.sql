USE CSMovimientoGranos
GO


SELECT Formulario1116A_Cabecera.Fecha, 'CD-' + Formulario1116A_Cabecera.FormularioNumero, Formulario1116A_Cabecera.PesoBruto, Formulario1116A_Cabecera.MermaTotal
	FROM Formulario1116A_Cabecera
	WHERE Formulario1116A_Cabecera.DepositarioIDPlanta = 1
		AND Formulario1116A_Cabecera.IDCosecha = 16
		AND Formulario1116A_Cabecera.IDCereal = 2
	ORDER BY Formulario1116A_Cabecera.FormularioNumero