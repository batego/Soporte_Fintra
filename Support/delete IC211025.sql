CREATE TABLE tem.del_IC211025 AS 
select * from con.ingreso where num_ingreso = 'IC211025';
--delete from con.ingreso where num_ingreso = 'IC211025';
-- update con.ingreso set reg_status = 'A' where num_ingreso = 'IC211025'

CREATE TABLE tem.del_IC211025_det AS 
select * from con.ingreso_detalle where num_ingreso = 'IC211025'; --and documento = 'R0035337'		--'R0035336','R0035337'		select 31918380.00 - 1377185.00 = 30541195.00
--delete from con.ingreso_detalle where num_ingreso = 'IC211025';
-- update con.ingreso_detalle set reg_status = 'A' where num_ingreso = 'IC211025'

select * from con.comprobante  where numdoc = 'IC211025';
-- update con.comprobante set reg_status = 'A' where numdoc = 'IC283373'
select * from con.comprodet where numdoc = 'IC211025'; 
-- update con.comprodet set reg_status = 'A' where numdoc = 'IC283373' 

select * from con.factura where documento = 'R0035336'
-- update con.factura set valor_abono = 8291431.00, valor_saldo = 1826923.00 ,valor_abonome = 8291431.00, valor_saldome = 1826923.00 where documento = 'R0035336'  

select * from con.factura_detalle  where documento = 'R0035336'  