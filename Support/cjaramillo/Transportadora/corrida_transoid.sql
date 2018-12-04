select  * from etes.manifiesto_carga where planilla IN ('0237565','0237570','0237567'); --R0036940
-- cxc que estaba asociada a las planillas '0237565','0237570','0237567' y se desmarcaron
R0036949

SELECT * FROM etes.manifiesto_carga  
WHERE fecha_corrida::date='2018-11-05'::DATE;