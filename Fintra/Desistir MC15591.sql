--Desistir MC15591

﻿﻿
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC15591')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC15591')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',130932, 'DES', 'BTERRAZA', NOW(),  'MC15591', 'Cliente desistio, segun lo informado por  HENRRY FERRER ');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC15591_CXP AS				--SELECT * FROM TEM.MC15591_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC15591') and descripcion != 'CXP A EFECTY EFECTY'


CREATE TABLE TEM.MC15591_CXP_IT AS
select * from fin.cxp_items_doc 
--delete from fin.cxp_items_doc
where documento in ('MC15591')

CREATE TABLE TEM.MC15591_FAC AS						--SELECT * FROM TEM.MC15591_FAC
select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('MC15591')


CREATE TABLE TEM.MC15591_FAC_DET AS
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from TEM.MC15591_FAC where negasoc in ('MC15591'))

CREATE TABLE TEM.MC15591_EGRE AS
select * from egreso
--delete from egreso
where document_no in ('EG60158')

CREATE TABLE TEM.MC15591_EGREDET AS
select * from egresodet
--delete from egresodet
where document_no in ('EG60158')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC15591_COMPR AS
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC15591')


CREATE TABLE TEM.MC15591_COMPRODET AS
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC15591')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('EG60158')



