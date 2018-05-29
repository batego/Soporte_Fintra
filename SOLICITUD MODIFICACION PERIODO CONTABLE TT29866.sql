SELECT creation_date, fecha_ingreso, periodo ,fecha_contabilizacion, * FROM con.ingreso where num_ingreso like 'IC080859' 

SELECT creation_date, fecha_factura, periodo,cuenta,fecha_contabilizacion, * FROM con.ingreso_detalle  where num_ingreso = 'IC080859' 

select * from con.comprobante where numdoc = 'IC080859' 
select * from con.comprodet where numdoc = 'IC080859' 



-- update con.comprobante set periodo = '201101', creation_date = '2011-01-06 00:06:54' where numdoc = 'IC080859' 
-- 
-- update con.comprodet set periodo = '201101', creation_date = '2011-01-06 00:06:54' where numdoc = 'IC080859' 
-- 
-- update con.ingreso set periodo = '201101', fecha_contabilizacion = '2011-01-06 00:06:54' where num_ingreso like 'IC080859' 


select * from opav.sl_orden_compra_servicio where cod_ocs = 'OC00114'    limit 100
select * from opav.sl_ocs_detalle limit 100 where id_ocs like 'OC00114%';

select * from proveedor where payment_name like 'ELECTRICOS E ILUMINACION%'
'9001395684'


select * from opav.sl_orden_compra_servicio where cod_ocs = 'OC00114'
select * from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC00114') and descripcion_insumo like 'Fusibles tipo HH, de la serie 24 kv, 16 Amperios'

select * from opav.sl_despacho_ocs where cod_ocs = 'OC00114'
select * from opav.sl_despacho_detalle limit 100 where id in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC00114')

