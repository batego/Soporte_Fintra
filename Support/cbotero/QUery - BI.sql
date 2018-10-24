select sc.id_solicitud, 
	oc.cod_ocs,
	db.num_os,
	oc.responsable,
    oc.direccion_entrega,
	oc.responsable,
	oc.id_solicitud,
	oc.cod_proveedor,
	prov.payment_name as proveedor,
	ocd.codigo_insumo,
	ocd.descripcion_insumo,
	ocd.referencia_externa,
	ocd.nombre_unidad_insumo,
	ocd.cantidad_solicitada,
	ocd.costo_unitario_compra,
	ocd.costo_total_compra,
    oc.creation_date::date as fecha,
	oc.direccion_entrega,
	cont.descripcion AS contratista
from opav.sl_orden_compra_servicio oc
inner join  opav.sl_ocs_detalle   	as ocd  on (oc.id = ocd.id_ocs)
inner join opav.sl_solicitud_ocs  	as sc	on (ocd.cod_solicitud = sc.cod_solicitud)
LEFT JOIN (SELECT a.id_solicitud, a.descripcion
		   FROM dblink('dbname=selectrik port=5432 host=localhost user=postgres password=bdversion17'::text,'
					    select ac.id_solicitud, co.descripcion
					    from opav.acciones ac 
					    INNER JOIN opav.app_contratistas co ON (ac.contratista = co.id_contratista)
					    WHERE co.id_contratista not in(''CC011'',''CC012'',''CC761'',''CC751'',''CC009'',''CC752'')
						and ac.reg_status != ''A'';
			'::text) as a(id_solicitud character varying, descripcion character varying )) AS cont ON (sc.id_solicitud = cont.id_solicitud)
--LEFT join opav.acciones 			AS acc 	ON (oc.id_solicitud = acc.id_solicitud)
LEFT JOIN OPAV.ofertas_view_dblink  AS DB   ON (sc.id_solicitud = db.id_solicitud)
left join 
(
SELECT payment_name, nit
			FROM dblink('dbname=fintra port=5432 host=localhost user=postgres password=bdversion17'::text, '
					select 
						payment_name, 
						nit 
					from proveedor;
			'::text) as a(payment_name character varying, nit character varying ) ) as prov on (oc.cod_proveedor = prov.nit )
where cantidad_solicitada > 0
AND oc.cod_ocs NOT ILIKE '%-%';
and oc.pasar_apoteosys = 'S';
 