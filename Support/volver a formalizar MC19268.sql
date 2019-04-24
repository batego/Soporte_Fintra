select estado_neg, actividad,* from negocios where cod_neg='MC19268';
select estado_sol,* from solicitud_aval where cod_neg='MC19268';
select * from con.factura where negasoc='MC19268';
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC19268';


--VOLVER A FORMALIZAR MICRO
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'MC19268';--DEC	V

--se eliminan las cxp asociadas al negocio
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC19268';
SELECT * FROM fin.cxp_items_doc WHERE creation_date::date = '2019-04-12'::date AND creation_user = 'JPASTORL' AND proveedor = '1042457957';
--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC19268';
--se actuaiza con el numero de la solicitud el campo de negocio
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = '150543';--141696
CREATE TABLE tem.MC19268 AS;

select * from negocios_trazabilidad where cod_neg ='MC19268';

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza WHERE creation_user = 'JPASTORL' AND creation_date::date = '2019-04-12'::date;





 
 