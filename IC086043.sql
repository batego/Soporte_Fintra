select * from INGRESO where NUM_INGRESO = 'IC086043';
select * from INGRESO_DETALLE where NUM_INGRESO = 'IC086043';

--create table bterraza.IC086043 as    
delete from COMPROBANTE where numdoc = 'IC086043' and GRUPO_TRANSACCION = '423301';
select * from COMPROBANTE where numdoc = 'IC086043' and GRUPO_TRANSACCION = '423301';

--create table bterraza.IC086043_comprodet as0 
select * from COMPRODET where numdoc = 'IC086043' and GRUPO_TRANSACCION = '423301';
--delete from COMPRODET where numdoc = 'IC086043' and GRUPO_TRANSACCION = '423301';