--VOLVER A FORMALIZAR MICRO
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'MC18067';--DEC	V

--se eliminan las cxp asociadas al negocio
SELECT * FROM tem.MC18067;

CREATE TABLE tem.MC18067 as
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC18067';
--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg= 'MC18067';
--se actuaiza con el numero de la solicitud el campo de negocio Y SE COLICA EN VACIO CAMPO cXP_GENERADA
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = '145027';--141696


SELECT * FROM fin.cxp_items_doc WHERE documento IN ('MP15356-FZ1','MP15356-FZ2','MP15356-1');
 