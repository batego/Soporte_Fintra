--SOLICITUD
SELECT * FROM opav.sl_solicitud_ocs where cod_solicitud in ('SC01089')
select * from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('SC01276')) and codigo_insumo in ('MA00620','MA03495')
--delete from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('SC01276')) and codigo_insumo in ('MA00620','MA03495')

/*
LO ACTUALIZO
update opav.sl_solicitud_ocs_detalle 
set
total_comprado = 0,
total_saldo = 16,
estado_item = 'N'
where id_solicitud_ocs = (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud = 'SC00691') and codigo_insumo = 'MA05159'
*/

--PRE-SOLICITUD
SELECT * FROM opav.sl_solicitud_ocs where cod_solicitud in ('SC01276')---Para encontrar la id_solicitud
select * from opav.sl_presolicitud_ocs where id_solicitud = '926347' and id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('OC01511')) and codigo_insumo in  ('MA00620','MA03495')
--delete from opav.sl_presolicitud_ocs where id_solicitud = '925409' and id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs where cod_solicitud in ('OC01511')) and codigo_insumo in  ('MA00620','MA03495')

select * from opav.sl_presolicitud_ocs where id_solicitud = '925030'    and codigo_insumo in  ('MA04713','MA05344')
select * from opav.sl_solicitud_ocs where id in (151860,153746)
--PREOCS
SELECT * FROM opav.sl_preocs WHERE cod_solicitud in ('SC01276') AND orden_cs = 'OC01511' AND codigo_insumo in  ('MA00620','MA03495')
--delete FROM opav.sl_preocs WHERE cod_solicitud in ('SC01276') AND orden_cs = 'OC01511' AND codigo_insumo in  ('MA00620','MA03495')


--ORDEN DE COMPRA
select * from opav.sl_orden_compra_servicio where cod_ocs = 'OC01511'
--update opav.sl_orden_compra_servicio set cod_proveedor = '8002442235' where cod_ocs = 'OC00681'
select * from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01511') and cantidad_solicitada > 0 and codigo_insumo in ('MA00620','MA03495')
--delete from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01511') and cantidad_solicitada > 0 and codigo_insumo in ('MA00620','MA03495')


