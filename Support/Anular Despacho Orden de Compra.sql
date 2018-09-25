--ANULAR DESPACHO OC
-- se eliminan primero las detalles

SELECT * FROM opav.sl_orden_compra_servicio WHERE cod_ocs IN ('OC02164-1','OC02164-2');
--DELETE FROM opav.sl_orden_compra_servicio WHERE cod_ocs IN ('OC02164-1','OC02164-2');

SELECT * FROM opav.sl_ocs_detalle WHERE id_ocs IN (7688,7848);
--DELETE FROM opav.sl_ocs_detalle WHERE id_ocs IN (7688,7848);

SELECT * FROM OPAV.sl_despacho_ocs WHERE cod_ocs ILIKE '%OC02164%';
--DELETE FROM OPAV.sl_despacho_ocs WHERE cod_ocs ILIKE '%OC02164%';


SELECT * FROM OPAV.sl_despacho_detalle WHERE id_despacho IN (SELECT id FROM OPAV.sl_despacho_ocs WHERE cod_ocs ILIKE '%OC02164%');
--delete FROM OPAV.sl_despacho_detalle WHERE id_despacho IN (SELECT id FROM OPAV.sl_despacho_ocs WHERE cod_ocs ILIKE '%OC02164%');