SELECT * from con.ingreso where num_ingreso = 'IC310335'; --357910.00
-- update con.ingreso set reg_status = 'A' where num_ingreso = 'IC310335'
select * from con.ingreso_detalle where num_ingreso = 'IC310335'; 
-- update con.ingreso_detalle set reg_status = 'A' where num_ingreso = 'IC310335'


select * from con.comprobante  where numdoc = 'IC310335';
-- update con.comprobante set reg_status = 'A' where numdoc = 'IC310335'
select * from con.comprodet where numdoc = 'IC310335'; 
-- update con.comprodet set reg_status = 'A' where numdoc = 'IC310335' 



select * from con.factura where documento = 'PM14107_1';
-- update con.factura set valor_abono = 41201186.00, valor_saldo = 550669.00 ,valor_abonome = 41201186.00, valor_saldome = 550669.00 where documento = 'R0035512'  



 