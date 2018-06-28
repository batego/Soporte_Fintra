SOLICITUD CAMBIO DE FECHAS NOTAS EN GEOTECH
Buenos días,
Boris solicito el favor de cambiar la fecha de creacion de las siguientes notas para que contabilicen y cambiar periodo hoy:



NC038050 a 21/04/2017
NC038052 a 04/07/2017
NC038053 a 31/07/2017

SELECT CREATION_DATE, PERIODO FROM INGRESO where num_ingreso = 'NC038050';
-- update ingreso set CREATION_DATE = '21/04/2017' where num_ingreso = 'NC038050';
-- update ingreso set CREATION_DATE = '04/07/2017' where num_ingreso = 'NC038052';
-- update ingreso set CREATION_DATE = '31/07/2017' where num_ingreso = 'NC038053';


SELECT * FROM con.ingreso_detalle where num_ingreso = 'NC038050'; --27/06/18
SELECT * FROM con.ingreso_detalle where num_ingreso = 'NC038052'; --27/06/18
SELECT * FROM con.ingreso_detalle where num_ingreso = 'NC038053'; --27/06/18

-- update con.ingreso_detalle set CREATION_DATE = '21/04/2017' where num_ingreso = 'NC038050';
-- update con.ingreso_detalle set CREATION_DATE = '04/07/2017' where num_ingreso = 'NC038052';
-- update con.ingreso_detalle set CREATION_DATE = '31/07/2017' where num_ingreso = 'NC038053';


select * from comprobante where  numdoc = 'NC037736';
select * from comprodet where  numdoc = 'NC037736';


