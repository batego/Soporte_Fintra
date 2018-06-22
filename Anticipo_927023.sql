-- favor habilitar boton de anticipo solicitud 927023
-- 
-- Valor anticipo: 3565677 
-- Cod Anticipo: 'ANP00062'
-- 'FPA00062'

select valor_anticipo from opav.sl_anticipos where id_solicitud = '927023' and cod_anticipo = 'ANP00062'
-- update opav.sl_anticipos set valor_anticipo = '3565677' where cod_anticipo = 'ANP00062'


select valor_factura, valor_saldo,valor_facturame,valor_saldome   from con.factura where documento = 'FPA00062'
-- update con.factura set valor_factura = 3565677, valor_saldo = 3565677, valor_facturame = 3565677, valor_saldome = '3565677' where documento = 'FPA00062'

select * from con.factura_detalle  where documento = 'FPA00062'
update con.factura_detalle set valor_itemme = 3565677 where documento = 'FPA00062'

select * from con.comprobante where numdoc = 'FPA00062'
-- update con.comprobante set total_debito = 3565677, total_credito = 3565677 where numdoc = 'FPA00062'
-- 
select * from con.comprodet  where  numdoc = 'FPA00062' 
-- update con.comprodet  set valor_credito = 3565677 where  numdoc = 'FPA00062' and cuenta = '13309521'
