select * from opav.sl_solicitud_ocs where id_solicitud in ('OC00195','OC00196') 
delete from opav.sl_orden_compra_servicio where cod_ocs in ('OC00196','OC00195')
delete from opav.sl_ocs_detalle  where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs in ('OC00196','OC00195'))

delete from opav.sl_preocs where orden_cs in ('OC00196','OC00195')

select * from opav.sl_solicitud_ocs where cod_solicitud = 'SC06476'
select * from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs in (select id from opav.sl_solicitud_ocs where cod_solicitud = 'SC06476')
update opav.sl_solicitud_ocs_detalle  set total_comprado = 0, total_saldo = total_pedido, estado_item = 'N' where id_solicitud_ocs in (select id from opav.sl_solicitud_ocs where cod_solicitud = 'SC06476')