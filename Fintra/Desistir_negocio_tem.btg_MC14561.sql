
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC14561')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC14561')


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',122900 , 'DES', 'BTERRAZA', NOW(),  'MC14561', 'Cliente desistio, segun lo informado por Miguel Lengua');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

create table tem.btg_MC14561_cxp_doc as 
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC14561')

create table tem.btg_MC14561_cxp_items_doc as 
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in ('MC14561')

create table tem.btg_MC14561_factura  as 
select * from con.factura 
--delete from con.factura
where negasoc in ('MC14561')

create table tem.btg_MC14561_factura_detalle as     
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC14561'))

create table tem.btg_MC14561_egreso as 
select * from egreso --LIMIT 10
--delete from egreso
where document_no in ('EG59616')

create table tem.btg_MC14561_egresodet as 
select * from egresodet
--delete from egresodet
where document_no in ('EG59616')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

create table tem.btg_MC14561_comprobante as 		
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC14561')

create table tem.btg_MC14561_comprodet as 
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC14561')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
create table tem.btg_MC14561_ing_fenalco as 	
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC14561')





