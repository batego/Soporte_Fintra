SELECT cxc_corrida, * FROM etes.manifiesto_carga 
WHERE planilla IN ('0239141');    

SELECT * FROM etes.manifiesto_descuentos WHERE planilla IN ('0239141');

SELECT * FROM etes.ventas_eds WHERE id_manifiesto_carga IN (13005);