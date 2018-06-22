select valor_anticipo, * from opav.sl_anticipos where cod_anticipo = 'ANP00053'
-- update opav.sl_anticipos set valor_anticipo = '47042121' where cod_anticipo = 'ANP00053'




select * from con.factura where documento = 'FPA00053'
-- update con.factura set valor_factura = 47042121, valor_saldo = 47042121, valor_facturame = 47042121, valor_saldome = '47042121' where documento = 'FPA00053'

select * from con.factura_detalle  where documento = 'FPA00053'
update con.factura_detalle set valor_unitario = 47042121 where documento = 'FPA00053'

select * from con.comprobante where numdoc = 'FPA00053'
-- update con.comprobante set total_debito = 47042121, total_credito = 47042121 where numdoc = 'FPA00053'
-- 
select * from con.comprodet  where  numdoc = 'FPA00053' 
-- update con.comprodet  set valor_debito = 47042121 where  numdoc = 'FPA00053' and cuenta = '13309520'
