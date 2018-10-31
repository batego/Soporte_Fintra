﻿﻿
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC14303')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC14303')

SELECT * FROM NEGOCIOS WHERE COD_NEG = 'MC14303' 

---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',121280, 'DES', 'BTERRAZA', NOW(),  'MC14303', 'Cliente desistio, segun lo informado por  HENRRY FERRER ');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC14303_CXP AS					--SELECT * FROM TEM.MC14303_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC14303') and descripcion != 'CXP A EFECTY EFECTY'


CREATE TABLE TEM.MC14303_CXP_IT AS				--select * from TEM.MC14303_CXP_IT
select * from fin.cxp_items_doc limit 5
--delete from fin.cxp_items_doc
where documento in ('MC14303')

CREATE TABLE TEM.MC14303_FAC AS					--SELECT * FROM TEM.MC14303_FAC
select * from con.factura 
--delete from con.factura
where negasoc in ('MC14303')


CREATE TABLE TEM.MC14303_FAC_DET AS				--select * from TEM.MC14303_FAC_DET
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC14303'))

CREATE TABLE TEM.MC14303_EGRE AS				-- select * from TEM.MC14303_EGRE
select * from egreso
--delete from egreso
where document_no in ('EG59289')

CREATE TABLE TEM.MC14303_EGREDET AS				--select * from TEM.MC14303_COMPR
select * from egresodet
--delete from egresodet
where document_no in ('EG59289')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC14303_COMPR AS				--select * from TEM.MC14303_COMPR 
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC14303')


CREATE TABLE TEM.MC14303_COMPRODET AS				--select * from TEM.MC14303_COMPRODET 
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC14303')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC14303')



