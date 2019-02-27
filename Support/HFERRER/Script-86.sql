Solicito su colaboración eliminando los siguientes documentos (CxP), ya que los negocios se perfeccionaron erradamente:

COD NEG	COD CLI	 CLIENTE	 CXP	 VALOR CXP
LB01365	72229881	DAVILA GUZMAN EDINSON	LP0001483	 $293.126 
LB01371	72245152	SOTO VEGA OSCAR DAVID	LP0001487	 $688.226 
LB01379	22514308	TORRES YEPES MARJORIS	LP0001503	 $8.541.278 

--Deben estan en estado: legalizar.
SELECT estado_neg, actividad, * from negocios WHERE  cod_neg='LB01379';--L	PFCC
SELECT estado_sol, * from solicitud_aval WHERE  cod_neg='LB01379';

CREATE TABLE tem.traza_LB01379 AS;
select * FROM negocios_trazabilidad	 where cod_neg ='LB01379' ORDER BY fecha;


SELECT estado_neg, actividad, * from negocios WHERE  cod_neg='MC18395';--L	PFCC
SELECT estado_sol, * from solicitud_aval WHERE  cod_neg='MC18395';
select * FROM negocios_trazabilidad	 where cod_neg ='MC18395' ORDER BY fecha;