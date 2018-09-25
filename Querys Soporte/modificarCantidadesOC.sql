select * from opav.sl_orden_compra_servicio where cod_ocs = 'OC01450'

--SOlicitud de orden de compra
select * from opav.sl_solicitud_ocs where cod_solicitud = 'SC01503'
--Presolicitud de orden de compra
select * from opav.sl_preocs where orden_cs = 'SC01503' 

--Detalle Solicitud
select * from opav.sl_solicitud_ocs_detalle where id_solicitud = '925034';

MA00057	CABLE COBRE XLPE 2/0 AWG 133% P.CINTA 15 KV 

SELECT * FROM opav.sl_insumo WHERE descripcion ilike '%CABLE COBRE XLPE 2/0 AWG 133% P.CINTA 35 KV%'; CABLE COBRE XLPE 2/0 AWG 133% P.CINTA 35 KV ...	MA06956

select * from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC02391');-- and codigo_insumo ='MA05303'

SELECT * FROM opav.sl_solicitud_ocs a
INNER JOIN opav.sl_solicitud_ocs_detalle o ON (a.id = o.id_solicitud_ocs)
WHERE a.cod_solicitud = 'SC01980';

--CABLE COBRE XLPE 4/0 AWG 133% P.CINTA 15 KV 	--MA05193

/*
update opav.sl_ocs_detalle set cantidad_solicitada = 1000, costo_total_compra = 30000  where id_ocs in (select id from opav.sl_orden_compra_servicio 
where cod_ocs = 'OC01747') and codigo_insumo ='MA05303' 
*/ 
codigo_insumo ='MA06087' and cantidad_solicitada > 0

update opav.sl_ocs_detalle set cantidad_solicitada = 20, costo_total_compra = 2222240 where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01511') and codigo_insumo ='MA00534'

-- update opav.sl_ocs_detalle set reg_status = 'A' 
 where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01587') and codigo_insumo ='MA00410'

--Nit viejo -'8110044866 - OC00143
--Nit Nuevo - 9005494678 - OC00143


select * from opav.sl_ocs_detalle where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC00143')
order by descripcion_insumo

/*
update opav.sl_ocs_detalle
set cantidad_solicitada = 18,
costo_total_compra =18*costo_unitario_compra
where id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC01424') and codigo_insumo ='MA04676' and cantidad_solicitada > 0
*/

select * from opav.sl_preocs where orden_cs = 'OC01635' and codigo_insumo = 'MA04676'
/*
update opav.sl_preocs
set cantidad_total =18,
cantidad_disponible =18
where orden_cs = 'OC01424' and codigo_insumo = 'MA04676'
/*
*/


select * from opav.sl_solicitud_ocs_detalle where id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs WHERE cod_solicitud in (select cod_solicitud from opav.sl_preocs where orden_cs = 'OC01424' and codigo_insumo = 'MA04676')) 
and codigo_insumo = 'MA04676'

/*
update opav.sl_solicitud_ocs_detalle
set total_pedido = 18, 
total_saldo = 0, total_comprado = 18
where id_solicitud_ocs in (SELECT id FROM opav.sl_solicitud_ocs WHERE cod_solicitud in (select cod_solicitud from opav.sl_preocs where orden_cs = 'OC01424' and codigo_insumo = 'MA04676')) 
and codigo_insumo = 'MA04676'

*/



----MOdificar valor

select * from opav.sl_ocs_detalle  
--update opav.sl_ocs_detalle  set costo_unitario_compra =  28831, costo_total_compra = 115324 
where id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='OC01360') and descripcion_insumo like '%CONECTOR AMOVIBLE PARA ESTRIBO 4 AWG-1/0 AWG-2/0-4/0 AWG AL - AL%' and referencia_externa = '9340030'--and codigo_insumo = 'OT00024'


CONECTOR AMOVIBLE PARA ESTRIBO 4 AWG-1/0 AWG 2/0-4/0 AWG AL-AL, son 4 no dos.


select * from opav.sl_ocs_detalle  
--update opav.sl_ocs_detalle  set costo_unitario_compra =  22800000, costo_total_compra = 22800000 
where id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='OC00143') and codigo_insumo ='PR053773';


--tabla maestra de paso a apoteosys
select * from opav.sl_apoteosys_tabla_maestra where ord_orden_interna = 'OC01450'


select * from opav.ofertas where id_solicitud = '926866'

select * from opav.tipo_distribucion_eca  where nombre_distribucion ilike '%agregado%'



/**************************
*****Tablas de Backup******
***************************/
select * from crstina_OC01450
