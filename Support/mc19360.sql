select estado_neg, actividad,* from negocios where cod_neg='MC19360';
select estado_sol,* from solicitud_aval where cod_neg='MC19360';
select * from con.factura where negasoc='MC19360';
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC19360';


--VOLVER A FORMALIZAR MICRO
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'MC19360';--DEC	V

--se eliminan las cxp asociadas al negocio
create table tem.MC19360_cxp AS;
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC19360';

create table tem.MC19360_cxp_item AS;
SELECT * FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MC19360');
--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC19360';--MC19360
--se actuaiza con el numero de la solicitud el campo de negocio
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = 'MC19360';--141696

CREATE TABLE tem.MC19360 AS
select * from negocios_trazabilidad where cod_neg ='MC19360';

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza WHERE creation_user = 'JPASTORL' AND creation_date::date = '2019-04-12'::date;


