-- Verificar si la orden de compra tiene despacho
SELECT * FROM opav.sl_orden_compra_servicio WHERE cod_ocs ilike 'OC02527%';

-- Si no tiene despacho proceder directamente en los sgtes querys
SELECT * FROM opav.sl_ocs_detalle WHERE id_ocs in (select id from opav.sl_orden_compra_servicio where cod_ocs = 'OC02527');

SELECT * FROM opav.sl_solicitud_ocs a
INNER JOIN opav.sl_solicitud_ocs_detalle o ON (a.id = o.id_solicitud_ocs)
WHERE a.cod_solicitud = 'SC02109';


-- si tiene despacho preguntar en cual despacho se va hacer la modificacion 
SELECT * FROM opav.sl_orden_compra_servicio WHERE cod_ocs ilike 'OC02527%';

SELECT * FROM opav.sl_despacho_ocs WHERE cod_despacho = 'DP03390';