MC19315

--VOLVER A FORMALIZAR MICRO
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'MC19315';--DEC	V

--se eliminan las cxp asociadas al negocio
CREATE TABLE TEM.MC19315 AS;
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC19315';

CREATE TABLE TEM.MC19315_DET AS;
SELECT * FROM FIN.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MC19315');

--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC19315';
--se actuaiza con el numero de la solicitud el campo de negocio
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = '150485';--141696

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza 



 