SELECT * FROM etes.manifiesto_carga WHERE planilla = '0240517'; -- 356346.00
SELECT * FROM etes.manifiesto_descuentos WHERE planilla = '0240517';--12635

CREATE TABLE tem.planilla_0240517 AS ;
SELECT * FROM etes.ventas_eds  WHERE id_manifiesto_carga = '13552' AND id IN ('2458','2459');
