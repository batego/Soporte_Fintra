---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC16572');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC16572');


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',134288 , 'DES', 'BTERRAZA', NOW(),  'MC16572', 'Cliente desistio, segun lo informado por  HFERRER ');

-- select * from negocios where cod_neg = 'MC16572'
---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC16572_CXP AS				
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC16572') ;

CREATE TABLE TEM.MC16572_CXP_IT AS			
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC16572'));










