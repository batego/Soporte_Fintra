
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC13126')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC13126')

77741

---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',77741 , 'DES', 'BTERRAZA', NOW(),  'MC07043', 'Cliente no retiró los recursos y estos fueron reintegrados por el Banco de Occidente.');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC13126_CXP AS					-- SELECT * FROM TEM.MC13126_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC13126')

CREATE TABLE TEM.MC13126_ITEMS_CXP AS				-- SELECT * FROM TEM.MC13126_ITEMS_CXP
select * from fin.cxp_items_doc 
--delete from fin.cxp_items_doc
where documento in ('MP11353','FZT04780')

CREATE TABLE TEM.MC13126_FAC AS					-- SELECT * FROM TEM.MC13126_FAC
select * from con.factura 
--delete from con.factura
where negasoc in ('MC13126')

select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC13126'))

select * from egreso
--delete from egreso
where document_no in ('MC13126')

select * from egresodet
--delete from egresodet
where document_no in ('EG54902')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)
CREATE TABLE TEM.MC13126_COMP AS			-- SELECT * FROM TEM.MC13126_COMP
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC13126')

CREATE TABLE TEM.MC13126_COMPDET AS			-- SELECT * FROM TEM.MC13126_COMPDET
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC13126')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)

CREATE TABLE TEM.MC13126_INGFEN AS			-- SELECT * FROM TEM.MC13126_INGFEN
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC13126')





