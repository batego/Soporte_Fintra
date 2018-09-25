--SOLICITUD
SELECT * FROM opav.sl_solicitud_ocs where cod_solicitud in ('OC00114')
select * from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('OC00114')) and codigo_insumo in ('PR049488')
--delete from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('SC00870')) and codigo_insumo in ('MA01918','MA00654')


--PRE-SOLICITUD
SELECT * FROM opav.sl_solicitud_ocs where cod_solicitud in ('OC00114')---Para encontrar la id_solicitud
select * from opav.sl_presolicitud_ocs where id_solicitud = 'OC00114' and id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('OC00114') and codigo_insumo in ('PR049488')
--delete from opav.sl_presolicitud_ocs where id_solicitud = '923443' and id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('SC00870')) and codigo_insumo in ('MA01918','MA00654')
'MA05388','MA05379'

--PREOCS
SELECT * FROM opav.sl_preocs WHERE cod_solicitud in ('SC06433') AND orden_cs = 'OC00114' AND codigo_insumo in ('PR049488')
--delete FROM opav.sl_preocs WHERE cod_solicitud in ('SC06433') AND orden_cs = 'OC00114' AND codigo_insumo in ('PR049488')
--SELECT * FROM opav.sl_preocs where orden_cs = 'OC00114' AND codigo_insumo in ('PR049488')

'MA06082','MA06189','MA05496'
--ORDEN DE COMPRA
select * from opav.sl_orden_compra_servicio where cod_ocs = 'OC01495'
--update opav.sl_orden_compra_servicio set cod_proveedor = '8002442235' where cod_ocs = 'OC00681'
select * from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01495') and cantidad_solicitada = 20 and codigo_insumo in ('MA00497')
--delete from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC00114') and cantidad_solicitada > 0 and codigo_insumo in ('PR049488')


select * from fin.cxp_doc where documento = '206080027478'				2914417379.00
select * from egreso where document_no = 'BC1006' and nit = '8600345941' limit 100      2.914.417.379.00


-- update opav.sl_ocs_detalle set cantidad_solicitada = 20 where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01495') and cantidad_solicitada = 18 and codigo_insumo in ('MA00497')


select * from con.factura where documento = 'R0035463'