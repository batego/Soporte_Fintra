-- Ticket# 3126 
-- SOLICITUD - ANULAR OPERATIVAMENTE EL SIGUIENTE IC SELECTRIK COR
-- Buenos Días,
-- Por favor anular el siguiente IC210914 en Cor Selectrik.


select * from con.ingreso where num_ingreso = 'IC210914' 
--update con.ingreso set reg_status = 'A' where num_ingreso = 'IC210914'

select * from con.ingreso_detalle where num_ingreso = 'IC210914' 
--update con.ingreso_detalle set reg_status = 'A' where num_ingreso = 'IC210914'

select * from con.factura where documento = 'IC210914' limit 10
select * from con.factura_detalle where documento = 'IC210914' limit 10

select * from fin.cxp_doc where documento = 'IC210914' limit 10
select * from fin.cxp_items_doc where documento = 'IC210914' limit 10

