﻿select * from solicitud_aval where numero_solicitud = '123786'


---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('FE00169')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('FE00169')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',123786 , 'DES', 'BTERRAZA', NOW(),  'MC12094', 'sE INGRESO POR ERROR EL NEGOCIO, segun lo informado por PRECIOSA OSPINO');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('FE00169')

select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in ('FE00169')

select * from con.factura 
--delete from con.factura
where negasoc in ('FE00169')

select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('FE00169'))

select * from egreso
--delete from egreso
where document_no in ('FE00169')

select * from egresodet
--delete from egresodet
where document_no in ('FE00169')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

select * from con.comprobante
--delete from con.comprobante
where numdoc in ('FE00169')

select * from con.comprodet
--delete from con.comprodet
where numdoc in ('FE00169')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('FE00169')





