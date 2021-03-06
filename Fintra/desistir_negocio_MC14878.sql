﻿select numero_solicitud from solicitud_aval where cod_neg = 'MC14878'
select * from solicitud_persona where numero_solicitud = '124652'

---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC14878')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC14878')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',124652 , 'DES', 'BTERRAZA', NOW(),  'MC14878', 'Cliente desistio, segun lo informado por Miguel Lengua');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC14878_CXP AS		--select * from  TEM.MC14878_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC14878')

CREATE TABLE TEM.MC14878_CXP_ITMS AS 
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in ('MC14878')

CREATE TABLE TEM.MC14878_FACT AS
select * from con.factura 
--delete from con.factura
where negasoc in ('MC14878')

CREATE TABLE TEM.MC14878_FACDET AS
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC14878'))

CREATE TABLE TEM.MC14878_EGR AS
select * from egreso
--delete from egreso
where document_no in ('EG54902')

CREATE TABLE TEM.MC14878_EGREDET AS
select * from egresodet
--delete from egresodet
where document_no in ('EG54902')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC14878_COMPR AS 
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC14878')

CREATE TABLE TEM.MC14878_COMPRODET AS
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC14878')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
CREATE TABLE TEM.MC14878_FENALCO
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC14878')





