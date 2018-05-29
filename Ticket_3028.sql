-- ticket _3028
-- OC01135 ANULAR DESPACHO
-- Buenas tardes, 
-- 
-- favor anular el despacho de la OC01135-1 
-- necesito hacerlo otra vez


select * from opav.sl_orden_compra_servicio where cod_ocs = 'OC01135-1'
-- update opav.sl_orden_compra_servicio set reg_status = 'A' where cod_ocs = 'OC01135-1'
-- select * from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01135-1') and codigo_insumo ='PR028179' 


create table tem.despacho_detalle_1926 as
select * from opav.sl_despacho_detalle  where id_despacho = 1926
--delete  from opav.sl_despacho_detalle  where id_despacho = 1926

--Inser de la tabla de auditoria
--insert into opav.sl_despacho_detalle select * from tem.despacho_detalle_1926

create table tem.despacho_detalle_OC01135 as
select * from opav.sl_despacho_ocs  where cod_ocs = 'OC01135'
--delete from opav.sl_despacho_ocs  where cod_ocs = 'OC01135'

-- insert into opav.sl_despacho_ocs select * from tem.despacho_detalle_OC01135


--tabla de apoteosys
select * from opav.sl_apoteosys_tabla_maestra where ord_orden_interna = 'OC01567'