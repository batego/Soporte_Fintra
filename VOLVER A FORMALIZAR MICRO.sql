--VOLVER A FORMALIZAR MICRO
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'FE03306';--DEC	V

--se eliminan las cxp asociadas al negocio
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC17812';
--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC17812';
--se actuaiza con el numero de la solicitud el campo de negocio
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = 'MC17812';--141696



 
 