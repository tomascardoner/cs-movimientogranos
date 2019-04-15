-- CONTROL DE FORMULARIOS A

-- KILOGRAMOS FINALES
SELECT        Formulario1116A_Cabecera.IDFormulario1116A, Formulario1116A_Cabecera.FormularioNumero, Formulario1116A_Cabecera.PesoNeto AS Formulario_PesoNeto, SUM(Movimiento_Cereal.PesoFinal) AS CPs_PesoNeto
	FROM            Formulario1116A_Cabecera INNER JOIN
                         Formulario1116A_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario1116A_Detalle.IDFormulario1116A INNER JOIN
                         Movimiento_Cereal ON Formulario1116A_Detalle.IDMovimiento_Cereal = Movimiento_Cereal.IDMovimiento_Cereal
	WHERE Formulario1116A_Cabecera.IDCosecha = 16 AND Formulario1116A_Cabecera.IDCereal = 3
	GROUP BY Formulario1116A_Cabecera.IDFormulario1116A, Formulario1116A_Cabecera.FormularioNumero, Formulario1116A_Cabecera.PesoNeto
	HAVING Formulario1116A_Cabecera.PesoNeto <> SUM(Movimiento_Cereal.PesoFinal)


-- KILOGRAMOS VOLÁTIL
SELECT        Formulario1116A_Cabecera.IDFormulario1116A, Formulario1116A_Cabecera.FormularioNumero, Formulario1116A_Cabecera.MermaVolatilKilogramo AS Formulario_Volatil, SUM(Movimiento_Cereal.MermaVolatilKilogramo) AS CPs_Volatil
	FROM            Formulario1116A_Cabecera INNER JOIN
                         Formulario1116A_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario1116A_Detalle.IDFormulario1116A INNER JOIN
                         Movimiento_Cereal ON Formulario1116A_Detalle.IDMovimiento_Cereal = Movimiento_Cereal.IDMovimiento_Cereal
	WHERE Formulario1116A_Cabecera.IDCosecha = 16 AND Formulario1116A_Cabecera.IDCereal = 3
	GROUP BY Formulario1116A_Cabecera.IDFormulario1116A, Formulario1116A_Cabecera.FormularioNumero, Formulario1116A_Cabecera.MermaVolatilKilogramo
	HAVING Formulario1116A_Cabecera.MermaVolatilKilogramo <> SUM(Movimiento_Cereal.MermaVolatilKilogramo)