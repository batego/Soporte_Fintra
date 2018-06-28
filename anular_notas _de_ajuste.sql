-- ANULAR NOTAS DE AJUSTE CLIENTE CENTRO DE EVENTOS
-- Buen dia 
-- 
-- Por favor su colaboracion anulando contable y operativamente en FITRA las siguientes notas de ajuste:
-- 
-- IA529138 $1.377.864
-- IA529139 $57.457 	
-- IA527704 $102.405 	
-- IA527705 $4.270 



create table tem.btg_nota_ajus_evega as
SELECT * FROM con.ingreso where num_ingreso in ('IA529138','IA529139','IA527704','IA527705');
-- update con.ingreso set reg_status = 'A' where num_ingreso in ('IA527705');
-- delete FROM con.ingreso where num_ingreso in ('IA529138','IA529139','IA527704','IA527705');

create table tem.btg_nota_ajus_evega_ing_det as
SELECT * FROM con.ingreso_detalle  where num_ingreso in ('IA529138','IA529139','IA527704','IA527705');
-- update con.ingreso_detalle set reg_status = 'A' where num_ingreso in ('IA527705');
-- delete FROM con.ingreso_detalle  where num_ingreso in ('IA529138','IA529139','IA527704','IA527705');

'PM13663_1' - 1377864.00
'PM13663_1' - 57457.00
'PM13554_1' - 102405.00
'PM13554_1' - 4270.00

select 30939.00 - 4270.00 = 26669.00
select 3142639.20 + 4270.00  = 3146909.20

select * from con.factura where documento in ('PM13554_1')
-- update con.factura set valor_abono = 26669.00, valor_saldo = 3146909.20, valor_abonome = 26669.00, valor_saldome =  3146909.20 where documento in ('PM13554_1')

select * from con.factura_detalle where documento in ('R0035897')


create table tem.btg_nota_ajus_evega_comp_cab as
select * from con.comprobante where  numdoc in ('IA529138','IA529139','IA527704','IA527705');
-- update con.comprobante set reg_status = 'A' where  numdoc in ('IA529138','IA529139','IA527704','IA527705');
-- delete from con.comprobante where  numdoc in ('IA529138','IA529139','IA527704','IA527705');

create table tem.btg_nota_ajus_evega_comp_det as
select * from con.comprodet where numdoc in ('IA529138','IA529139','IA527704','IA527705');
-- update con.comprodet set reg_status = 'A'  where numdoc in ('IA529138','IA529139','IA527704','IA527705');
delete from con.comprodet where numdoc in ('IA529138','IA529139','IA527704','IA527705');


