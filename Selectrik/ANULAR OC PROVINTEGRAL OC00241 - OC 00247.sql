-- Anular Oc provintegral
select * from tem.copia_ocs_detalle_SC06477

select * from opav.sl_solicitud_ocs where cod_solicitud = 'SC06477'
update opav.sl_solicitud_ocs set estado_solicitud = '1' where cod_solicitud = 'SC06477'
union all
select * from opav.sl_solicitud_ocs where cod_solicitud = 'SC06498'

select * from opav.sl_solicitud_ocs_detalle where  

create table tem.copia_ocs_detalle_SC06477 as
select count(id_ocs) from opav.sl_ocs_detalle where cod_solicitud = 'SC06477' group by id_ocs    id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='OC00247')
-- delete from opav.sl_ocs_detalle where id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='OC00247')
-- delete from opav.sl_orden_compra_servicio where cod_ocs ='OC00247'

create table tem.copia_ocs as
select * from opav.sl_orden_compra_servicio where cod_ocs ='OC00247'

create table tem.copia_SC06477 as
select * from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs = (select id from opav.sl_solicitud_ocs where cod_solicitud ='SC06477') and codigo_insumo in ('PR053154','PR053154') and id = '46891'
update opav.sl_solicitud_ocs_detalle set total_pedido = 3, total_comprado = 3 where id_solicitud_ocs = (select id from opav.sl_solicitud_ocs where cod_solicitud ='SC06477') and codigo_insumo in ('PR053154','PR053154') and id = '46866'

--select * from opav.sl_insert_cotizacion_orden_compra('926574');
-------------------------------------------------------------------------------------------------------------


create table tem.copia_ocs_detalle_OC00241 as				-- select * from tem.copia_ocs_detalle_OC00241
select * from opav.sl_ocs_detalle where id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='OC00241')
-- delete from opav.sl_ocs_detalle where id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='OC00241')
-- delete from opav.sl_orden_compra_servicio where cod_ocs ='OC00241'

create table tem.copia_ocs_OC00241 as
select * from opav.sl_orden_compra_servicio where cod_ocs ='OC00241'

create table tem.copia_SC06477 as
select * from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs = (select id from opav.sl_solicitud_ocs where cod_solicitud ='SC06477')
