---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC16345');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC16345');


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',134050 , 'DES', 'BTERRAZA', NOW(),  'MC16345', 'Cliente desistio, segun lo informado por  HFERRER ');

-- select * from negocios where cod_neg = 'MC16345'
---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC16345_CXP AS				--SELECT * FROM TEM.MC16345_CXP 
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC16345') AND documento !='CXP000005329';

CREATE TABLE TEM.MC16345_CXP_IT AS			
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC16345')) AND documento !='CXP000005329';

CREATE TABLE TEM.MC16345_FAC_IT AS
select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('MC16345');

CREATE TABLE TEM.MC16345_FACDET_IT AS
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC16345'));

CREATE TABLE TEM.MC16345_EGR_EG63062_IT AS
select * from egreso
--delete from egreso
where document_no in ('EG63062');

CREATE TABLE TEM.MC16345_EGRDET_EG63062_IT AS
select * from egresodet
--delete from egresodet
where document_no in ('EG63062');


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC16345_COMPRO_IT AS
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC16345');

CREATE TABLE TEM.MC16345_COMPRODET_IT AS
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC16345');


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
CREATE TABLE TEM.MC16345_diferidos AS			--select * from TEM.MC16345_diferidos
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC16345');






