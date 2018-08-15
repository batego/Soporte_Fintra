﻿
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('FE00910')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('FE00910')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',126949, 'DES', 'BTERRAZA', NOW(),  'FE00910', 'Cliente desistio, segun lo informado por  Tesillo Luisa ');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.FE00910_CXP AS				--SELECT * FROM TEM.FE00910_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('FE00910')

CREATE TABLE TEM.FE00910_CXP_IT AS
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in ('FE00910')

select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('FE00910')

select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('FE00910'))

select * from egreso
--delete from egreso
where document_no in ('EG54902')

select * from egresodet
--delete from egresodet
where document_no in ('EG54902')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

select * from con.comprobante
--delete from con.comprobante
where numdoc in ('FE00910')

select * from con.comprodet
--delete from con.comprodet
where numdoc in ('FE00910')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('EG54902')




