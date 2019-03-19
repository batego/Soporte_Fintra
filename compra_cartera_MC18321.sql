--VOLVER A FORMALIZAR MICRO
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'MC18321';--DEC	V

--se eliminan las cxp asociadas al negocio
CREATE TABLE TEM.CXP_MC18321 AS    				select * from TEM.CXP_MC18321 where column='value';
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC18321';

CREATE TABLE TEM.CXP_ITEM_MC18321 AS 
SELECT * FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MC18321');

--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC18321';
--se actuaiza con el numero de la solicitud el campo de negocio
CREATE TABLE TEM.POLIZAM_MC18321 AS 
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = 'MC18321';--146566

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza  WHERE  documento_cxp  = 'MP15598';

CREATE TABLE tem.compra_cartera_MC18321 AS ;
SELECT * FROM solicitud_obligaciones_comprar WHERE numero_solicitud = '146566';

SELECT * FROM proveedor WHERE nit ='9011285358';

SELECT * FROM solicitud_obligaciones_comprar