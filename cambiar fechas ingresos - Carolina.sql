IC079670



select * from INGRESO where NUM_INGRESO in ('IC079670');
--update  INGRESO set  FECHA_INGRESO = '18/02/17', CREATION_DATE = '18/02/17' where NUM_INGRESO in ('IC079670');
select CREATION_DATE, periodo from comprobante where numdoc in ('IC079670');
--update comprobante set CREATION_DATE = '15/02/17 07:51:06,000000000 AM', periodo = '201702' where numdoc in ('IC079670');
select CREATION_DATE, periodo from comprodet where numdoc in ('IC079670');
--update comprodet set CREATION_DATE = '15/02/17 07:51:06,000000000 AM', periodo = '201702'  where numdoc in ('IC079670');

--update INGRESO set codcli = 'CL02772' where NUM_INGRESO in ('IC079670');

--select * from INGRESO_DETALLE where NUM_INGRESO in ('');


select * from comprobante where numdoc in ('');
--update COMPROBANTE set tercero = '3210526' where numdoc in ('');
select * from COMPRODET where numdoc in ('');
--UPDATE COMPRODET SET tercero = '3210526' where numdoc in ('');
