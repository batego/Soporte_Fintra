select * from egreso where document_no = 'EG59369'
update egreso set reg_status = 'A' where document_no = 'EG59369'

select * from egresodet  where document_no = 'EG59369'
update egresodet  set reg_status = 'A' where document_no = 'EG59369'

select * from con.comprobante where numdoc = 'EG59369'