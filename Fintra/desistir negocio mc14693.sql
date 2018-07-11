
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC14693')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC14693')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',122757 , 'DES', 'BTERRAZA', NOW(),  'MC14693', 'Cliente desistio, segun lo informado por   Miguel Lengua ');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC14693_CXP AS				--SELECT * FROM TEM.MC14693_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC14693')		--egreso 'EG59806' 'BC7630'


CREATE TABLE TEM.MC14693_CXP_IT AS
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in ('MC14693')


CREATE TABLE TEM.MC14693_fac AS
select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('MC14693')

CREATE TABLE TEM.MC14693_fac_det AS
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC14693'))

CREATE TABLE TEM.MC14693_egr AS
select * from egreso
--delete from egreso
where document_no in ('EG59806')

CREATE TABLE TEM.MC14693_egr_det AS
select * from egresodet
--delete from egresodet
where document_no in ('EG59806')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

create table tem.MC14693_comp as
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC14693')

create table tem.MC14693_comp_det as
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC14693')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('EG59806')





