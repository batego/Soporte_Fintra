--Desistir LB01262

﻿﻿
--1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('LB01262');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('LB01262')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',131856, 'DES', 'BTERRAZA', NOW(),  'LB01262', 'Cliente desistio, segun lo informado por  HENRRY FERRER ');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.LB01262_CXP AS				--SELECT * FROM TEM.LB01262_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('LB01262') 


CREATE TABLE TEM.LB01262_CXP_IT AS
select * from fin.cxp_items_doc 
--delete from fin.cxp_items_doc
where documento in ('LB01262')

CREATE TABLE TEM.LB01262_FAC AS						--SELECT * FROM TEM.LB01262_FAC
select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('LB01262')


CREATE TABLE TEM.LB01262_FAC_DET AS
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('LB01262'))

CREATE TABLE TEM.LB01262_EGRE AS
select * from egreso
--delete from egreso
where document_no in ('EG60158')

CREATE TABLE TEM.LB01262_EGREDET AS
select * from egresodet
--delete from egresodet
where document_no in ('EG60158')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.LB01262_COMPR AS
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('LB01262')


CREATE TABLE TEM.LB01262_COMPRODET AS
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('LB01262')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('EG60158')

